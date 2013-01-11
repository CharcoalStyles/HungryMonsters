package  
{
	import org.flixel.*;
	public class food extends FlxSprite 
	{
		private var cycle:Number;
		public static const HEALTH_IDENT:int = 1;
		
		[Embed(source='data/fruit/apple.png')] private static var fruitBitmap:Class;
		
		
		public function food() 
		{
			super(0,0,fruitBitmap);
			cycle = FlxU.random() * 100;
			health = HEALTH_IDENT;
		}
		
		
		override public function update():void 
		{
			super.update();
			
			cycle += FlxG.elapsed * 4;
			
			scale.x = 0.95 + (0.05 * (Math.sin(cycle) * 2 - 1));
			scale.y = 0.97 + (0.03 * (Math.cos(cycle) * 2 - 1));
		}
	}

}