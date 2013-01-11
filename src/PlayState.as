package
{

	import adobe.utils.CustomActions;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.ColorCorrectionSupport;
	import org.flixel.*;
	import flash.media.Microphone;
	
	import flash.media.Video;
	import flash.media.Camera;

	public class PlayState extends FlxState
	{
		public static var singleton:PlayState;
		public var player:Player;
		
		public var fruit:FlxGroup;
		private var fruitSpawnTimer:Number;
		
		private var enemies:FlxGroup;
		
		public var m:Microphone;
		public var mBar:FlxBar;
		
		public var score:int;
		private var scoreText:FlxText;
		
		public var timerBar:FlxBar;
		
		public var state:int;
		
		private var message:FlxText;
		
		private var cam:Camera;
		private var vid:Video;
		private var snap:Bitmap;
		private var snapshot:FlxSprite;
		
		public function PlayState():void 
		{
			super();
			singleton = this;
			snapshot = new FlxSprite();
			snapshot.alpha = 0;
			add(snapshot); 
			
			fruit = new FlxGroup();
			for (var i:int = 0; i < 12; i ++)
			{
				var f:food = new food();
				f.kill();
				fruit.add(f);
			}
			add(fruit);
			fruitSpawnTimer = 0;
			
			enemies = new FlxGroup();
			for (var i:int = 0; i < 4; i++)
			{
				var e:Enemy = new Enemy();
				e.kill();
				enemies.add(e);
			}
			add(enemies);
			
			player = new Player();
			player.reset(FlxG.width/2, FlxG.height/2);
			add(player);
			
			m = Microphone.getMicrophone();
			m.gain = 35;
			m.setLoopBack(true);
			
			score = 0;
			scoreText = new FlxText(8, 8, 128);
			scoreText.setFormat(null, 32);
			add(scoreText);
			
			timerBar = new FlxBar(FlxG.width / 2 - 50, 8);
			timerBar.create(0xFF40FF40, 0xFFFFFFFF);
			timerBar.maxValue = 60;
			timerBar.value = 60;
			add(timerBar);
			
			mBar = new FlxBar(FlxG.width / 2 - 50,28,100,10);
			mBar.create(0xFF4FF4040, 0xFFFFFFFF);
			mBar.maxValue = 100;
			add(mBar);
			
			message = new FlxText(0, FlxG.height / 2, FlxG.width);
			message.setFormat(null, 32, 0xFFFFFF, "center", 0x404040);
			add(message);
			
			state = 0;
			cam = Camera.getCamera();
			vid = new Video(512, 768 / 2);
			vid.attachCamera(cam);
			snap = new Bitmap();
			snap.bitmapData = new BitmapData(512, 768 / 2);
		}
		
		override public function update():void 
		{
			super.update();
			
			mBar.value = m.activityLevel;
			
			switch(state)
			{
				case 0:
					if (fruitSpawnTimer == 0)
					{
						message.text = "Press to start.";
					}
					fruitSpawnTimer += FlxG.elapsed;
					
					if (fruitSpawnTimer > 0.5 && FlxG.mouse.pressed())
					{
						fruitSpawnTimer = 0;
						state = 1;
						message.text = "";
						enemies.reset(0,0);
						for (var i:int = 0; i < 4; i++)
						{
							enemies.getFirstDead().reset((FlxU.random() * FlxG.width * 0.8) + FlxG.width * 0.1,
								(FlxU.random() * FlxG.height * 0.8) + FlxG.height * 0.1);
						}
					}
					break;
				case 1:
					
					fruitSpawnTimer += FlxG.elapsed;
					timerBar.adjustValue( -FlxG.elapsed);
					
					if (fruitSpawnTimer > fruit.countLiving()-3)
					{
						fruitSpawnTimer = 0;
						fruit.getFirstDead().reset((FlxU.random() * FlxG.width * 0.8) + FlxG.width * 0.1,
							(FlxU.random() * FlxG.height * 0.8) + FlxG.height * 0.1);
						
					}
					
					for (var i:int = 0; i < fruit.members.length; i++)
					{
						if (!fruit.members[i].dead)
						{
							if (player.overlaps(fruit.members[i]))
								player.hit(fruit.members[i]);
							
							for (var o:int = 0; o < enemies.members.length; o++)
							{
								if (enemies.members[o].overlaps(fruit.members[i]))
									enemies.members[o].hit(fruit.members[i]);
							}
						}
						
						if (timerBar.value <= 0)
						{
							state = 2;
							
							enemies.kill();
							
							fruitSpawnTimer = 0;
						}
						
						if (m.activityLevel > 40)
						{
							snap.bitmapData.draw(vid);
							snapshot.pixels = snap.bitmapData;
							snapshot.alpha = 0.5;
						}
					}
				break;
			case 2:
				if (fruitSpawnTimer == 0)
					{
						message.text = "Game Over!";
					}
					fruitSpawnTimer += FlxG.elapsed;
					
					if (fruitSpawnTimer > 7)
					{
						FlxG.state = new MenuState();
					}
				break;
			}
			
			scoreText.text = score.toString();
		}
		
		override public function render():void 
		{
			super.render();
		}
	}
}

