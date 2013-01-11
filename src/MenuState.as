package
{

	import org.flixel.*;

	public class MenuState extends FlxState
	{
		
		public function MenuState():void
		{
			var title:FlxText = new FlxText(0, FlxG.height / 3.5, FlxG.width, "Hungry Monsters");
			title.setFormat(null, 32, 0xFFFFFFFF, "center", 0xFF884444);
			add(title);
			
			title = new FlxText(0, FlxG.height / 2, FlxG.width, "Press to Start");
			title.setFormat(null, 24, 0xFFFFFFFF, "center", 0xFF884444);
			add(title);
			
			
			title = new FlxText(0, FlxG.height / 2 + 64, FlxG.width, "Press to move your character.");
			title.setFormat(null, 16, 0xFFFFFFFF, "center", 0xFF884444);
			add(title);
			title = new FlxText(0, FlxG.height / 2 + 90, FlxG.width, "Collect the apples.");
			title.setFormat(null, 16, 0xFFFFFFFF, "center", 0xFF884444);
			add(title);
			title = new FlxText(0, FlxG.height / 2 + 116, FlxG.width, "Yell to scare the other monsters.");
			title.setFormat(null, 16, 0xFFFFFFFF, "center", 0xFF884444);
			add(title);
			
			title = new FlxText(0, FlxG.height - 128, FlxG.width, "0.6");
			title.setFormat(null, 8, 0xFFFFFFFF, "center", 0xFF884444);
			add(title);
		}
		
		override public function update():void
		{
			super.update();	
			
			if (FlxG.mouse.justPressed())
			{
				FlxG.state = new PlayState();
			}
		}
		
	}
}

