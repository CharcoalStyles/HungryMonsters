package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Charcoal
	 */
	public class Enemy extends Monster 
	{
		private var currentFruit:food;
		private var runawaytimer:Number;
		
		public function Enemy() 
		{
			super();
			color = 0xFF5030;
			
			currentFruit = null;
			runawaytimer = 0;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (currentFruit != null)
			{
				if (!currentFruit.dead)
				{
					x = x + (currentFruit.x - x) * FlxG.elapsed * 0.7;
					y = y + (currentFruit.y - y) * FlxG.elapsed * 0.7;
				}
				else 
				{
					currentFruit = PlayState.singleton.fruit.getRandom() as food;
				}
			}
			else
			{
					currentFruit = PlayState.singleton.fruit.getRandom() as food;
			}
			
			if (PlayState.singleton.m.activityLevel > 40) 
			{
					runawaytimer += PlayState.singleton.m.activityLevel / 200;
					runawaytimer = Math.min(runawaytimer, 2.5);
			}
			
			if (runawaytimer > 0)
			{
				runawaytimer -= FlxG.elapsed;
				
				x = x + (x - PlayState.singleton.player.x) * FlxG.elapsed * 0.75;
				y = y + (y - PlayState.singleton.player.y) * FlxG.elapsed * 0.75;
				color = 0x608040;
			}
			else 
			{
			color = 0xFF5030;
			}
			
			if (x < 5)
				x = 5;
			if (y < 5)
				y = 5;

			if (x > FlxG.width - width - 5)
				x = FlxG.width - width -5;
			if (y > FlxG.height - height - 5)
				y = FlxG.height - height - 5;
				
		}
		
		public function hit(Contact:FlxObject):void
		{
			FlxG.log("ping" + Contact.health.toString());
			Contact.kill();
			//add effects and score
		}
		
	}

}