package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Charcoal
	 */
	public class Player extends Monster 
	{
		
		public function Player() 
		{
			super();
		}
		
		override public function update():void 
		{
			super.update();
			
			angle = 0;
			if (FlxG.mouse.pressed())
			{
				x = x + (FlxG.mouse.x - x) * FlxG.elapsed;
				y = y + (FlxG.mouse.y - y) * FlxG.elapsed;
			}
			
			if (PlayState.singleton.m.activityLevel > 40)
			{
				scale.x *= 1 + (PlayState.singleton.m.activityLevel / 100);
				scale.y *= 1 + (PlayState.singleton.m.activityLevel / 100);
				angle = (FlxU.random() * 2 - 1) * (PlayState.singleton.m.activityLevel / 2);
			}
		}
		
		public function hit(Contact:FlxObject):void
		{
			FlxG.log("ping" + Contact.health.toString());
			Contact.kill();
			PlayState.singleton.score++;
			//add effects and score
		}
		
		//override public function hitBottom(Contact:FlxObject, Velocity:Number):void 
		//{
			//hit(Contact);
		//}
		//override public function hitLeft(Contact:FlxObject, Velocity:Number):void 
		//{
			//hit(Contact);
		//}
		//override public function hitRight(Contact:FlxObject, Velocity:Number):void 
		//{
			//hit(Contact);
		//}
		//override public function hitTop(Contact:FlxObject, Velocity:Number):void 
		//{
			//hit(Contact);
		//}
	}

}