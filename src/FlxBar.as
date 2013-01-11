package 
{
	import flash.display.BitmapData;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author ...
	 */
	public class FlxBar extends FlxObject
	{
		private var border:FlxSprite;
		private var fill:FlxSprite;
		
		private var val:Number = 0;
		private var maxVal:Number = 100;
		
		private var hide:Boolean = false;
		
		public function FlxBar(X:Number = 0, Y:Number = 0, Width:Number = 100, Height:Number = 20) 
		{
			super(X,Y,Width,Height);
			
			border = new FlxSprite(X, Y);
			fill = new FlxSprite(X + 1, Y + 1);
		}
		
		public function create(fillColor:uint, borderColor:uint):void
		{
			var bd:BitmapData = new BitmapData(width, height, true, borderColor);
			for (var xPos:int = 1; xPos < width - 1; ++xPos)
			{
				for (var yPos:int = 1; yPos < height - 1; ++yPos)
				{
					bd.setPixel32(xPos, yPos, 0x00000000);
				}	
			}
			border.createGraphic(width, height);
			border.pixels = bd;
			
			fill.createGraphic(width - 2, height - 2, fillColor);
			fill.width = 0;
		}
		
		private function adjustBar():void
		{
			fill.origin = new FlxPoint(0, 0.5);
			if (val <= 0)
				val = 0;
			else if (val > maxVal)
				val = maxVal;

			fill.scale.x = val / maxVal;
		}
		
		public function set value(inValue:Number):void {
			val = inValue;
			adjustBar();
		}
		public function get value():Number {
			return val;
		}
		
		public function adjustValue(inValue:Number):void
		{
			val += inValue;
			adjustBar();
		}
		
		public function check():int
		{
			var returnVal:int = 0;
			if (val <= 0)
				returnVal = -1;
			else if (val >= maxVal)
				returnVal = 1;
			
			return returnVal;
		}
		
		public function set maxValue(inValue:Number):void {
			maxVal = inValue;
			adjustBar();
		}
		
		public function at(Object:FlxObject, xOffset:Number = 0, yOffset:Number = 0):void
		{
			border.x = Object.x + xOffset;
			border.y = Object.y + yOffset;
			fill.x = Object.x + xOffset + 1;
			fill.y = Object.y + yOffset + 1;
		}
		
		
		override public function update():void 
		{
			border.update();
			fill.update();
		}
		
		override public function render():void 
		{
			if (visible)
			{
				border.render();
				fill.render();
			}
		}
		
	}

}