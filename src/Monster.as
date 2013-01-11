package  
{
	import adobe.utils.CustomActions;
	import flash.display.BitmapData;
	import org.flixel.*;
	
	public class Monster extends FlxSprite 
	{
		private var cycle:Number;
		
		
		[Embed(source='data/small/IMG_0001.png')] private static var mon1:Class;
		[Embed(source='data/small/IMG_0002.png')] private static var mon2:Class;
		[Embed(source='data/small/IMG_0003.png')] private static var mon3:Class;
		[Embed(source='data/small/IMG_0004.png')] private static var mon4:Class;
		[Embed(source='data/small/IMG_0005.png')] private static var mon5:Class;
		[Embed(source='data/small/IMG_0006.png')] private static var mon6:Class;
		[Embed(source='data/small/IMG_0007.png')] private static var mon7:Class;
		[Embed(source='data/small/IMG_0009.png')] private static var mon9:Class;
		[Embed(source = 'data/small/IMG_0010.png')] private static var mon10:Class;
		
		[Embed(source='data/small/IMG_0012.png')] private static var mon12:Class;
		[Embed(source='data/small/IMG_0014.png')] private static var mon14:Class;
		[Embed(source='data/small/IMG_0016.png')] private static var mon16:Class;
		[Embed(source='data/small/IMG_0017.png')] private static var mon17:Class;
		[Embed(source='data/small/IMG_0018.png')] private static var mon18:Class;
		[Embed(source='data/small/IMG_0019.png')] private static var mon19:Class;
		[Embed(source='data/small/IMG_0020.png')] private static var mon20:Class;
		
		[Embed(source='data/small/IMG_0021.png')] private static var mon21:Class;
		[Embed(source='data/small/IMG_0023.png')] private static var mon23:Class;
		[Embed(source='data/small/IMG_0025.png')] private static var mon24:Class;
		[Embed(source='data/small/IMG_0026.png')] private static var mon26:Class;
		[Embed(source='data/small/IMG_0028.png')] private static var mon28:Class;
		[Embed(source='data/small/IMG_0029.png')] private static var mon29:Class;
		[Embed(source = 'data/small/IMG_0030.png')] private static var mon30:Class;
		
		
		[Embed(source='data/small/IMG_0036.png')] private static var mon36:Class;
		[Embed(source='data/small/IMG_0037.png')] private static var mon37:Class;
		[Embed(source='data/small/IMG_0038.png')] private static var mon38:Class;
		[Embed(source='data/small/IMG_0054.png')] private static var mon54:Class;
		[Embed(source='data/small/IMG_0057.png')] private static var mon57:Class;
		[Embed(source='data/small/IMG_0060.png')] private static var mon60:Class;
		[Embed(source = 'data/small/IMG_0063.png')] private static var mon63:Class;
		
		[Embed(source='data/small/IMG_0065.png')] private static var mon65:Class;
		[Embed(source='data/small/IMG_0066.png')] private static var mon66:Class;
		[Embed(source='data/small/IMG_0069.png')] private static var mon69:Class;
		[Embed(source='data/small/IMG_0070.png')] private static var mon70:Class;
		[Embed(source='data/small/IMG_0075.png')] private static var mon75:Class;
		[Embed(source='data/small/IMG_0076.png')] private static var mon76:Class;
		[Embed(source = 'data/small/IMG_0077.png')] private static var mon77:Class;
		
		[Embed(source='data/small/IMG_0079.png')] private static var mon79:Class;
		[Embed(source='data/small/IMG_0081.png')] private static var mon81:Class;
		[Embed(source='data/small/IMG_0082.png')] private static var mon82:Class;
		[Embed(source='data/small/IMG_0083.png')] private static var mon83:Class;
		[Embed(source='data/small/IMG_0085.png')] private static var mon85:Class;
		[Embed(source='data/small/IMG_0088.png')] private static var mon88:Class;
		
		public function Monster() 
		{
			super();
			
			var s:FlxSprite;
					//s = new FlxSprite(0, 0, mon0);
			
			switch (int(FlxU.random() * 44))
			{
				case 0:
					s = new FlxSprite(0, 0, mon1);
				break;
				case 1:
					s = new FlxSprite(0, 0, mon1);
				break;
				case 2:
					s = new FlxSprite(0, 0, mon2);
				break;
				case 3:
					s = new FlxSprite(0, 0, mon3);
				break;
				case 4:
					s = new FlxSprite(0, 0, mon4);
				break;
				case 5:
					s = new FlxSprite(0, 0, mon5);
				break;
				case 6:
					s = new FlxSprite(0, 0, mon6);
				break;
				case 7:
					s = new FlxSprite(0, 0, mon7);
				break;
				case 8:
					s = new FlxSprite(0, 0, mon9);
				case 9:
					s = new FlxSprite(0, 0, mon10);
				break;
				case 10:
					s = new FlxSprite(0, 0, mon12);
				break;
				case 11:
					s = new FlxSprite(0, 0, mon14);
				break;
				case 12:
					s = new FlxSprite(0, 0, mon16);
				break;
				case 13:
					s = new FlxSprite(0, 0, mon17);
				break;
				case 14:
					s = new FlxSprite(0, 0, mon18);
				break;
				case 15:
					s = new FlxSprite(0, 0, mon19);
				break;
				case 16:
					s = new FlxSprite(0, 0, mon20);
				break;
				case 17:
					s = new FlxSprite(0, 0, mon21);
				break;
				case 18:
					s = new FlxSprite(0, 0, mon23);
				break;
				case 19:
					s = new FlxSprite(0, 0, mon24);
				break;
				case 20:
					s = new FlxSprite(0, 0, mon26);
				break;
				case 21:
					s = new FlxSprite(0, 0, mon28);
				break;
				case 22:
					s = new FlxSprite(0, 0, mon29);
				break;
				case 23:
					s = new FlxSprite(0, 0, mon30);
				break;
				///////////////////////////////
				
				case 24:
					s = new FlxSprite(0, 0, mon36);
				break;
				case 25:
					s = new FlxSprite(0, 0, mon37);
				break;
				case 26:
					s = new FlxSprite(0, 0, mon38);
				break;
				case 27:
					s = new FlxSprite(0, 0, mon54);
				break;
				case 28:
					s = new FlxSprite(0, 0, mon57);
				break;
				case 29:
					s = new FlxSprite(0, 0, mon60);
				break;
				case 30:
					s = new FlxSprite(0, 0, mon63);
				break;
				case 31:
					s = new FlxSprite(0, 0, mon65);
				break;
				case 32:
					s = new FlxSprite(0, 0, mon66);
				break;
				case 33:
					s = new FlxSprite(0, 0, mon69);
				break;
				case 34:
					s = new FlxSprite(0, 0, mon70);
				break;
				case 35:
					s = new FlxSprite(0, 0, mon75);
				break;
				case 36:
					s = new FlxSprite(0, 0, mon76);
				break;
				case 37:
					s = new FlxSprite(0, 0, mon77);
				break;
				case 38:
					s = new FlxSprite(0, 0, mon79);
				break;
				case 39:
					s = new FlxSprite(0, 0, mon81);
				break;
				case 40:
					s = new FlxSprite(0, 0, mon82);
				break;
				case 41:
					s = new FlxSprite(0, 0, mon83);
				break;
				case 42:
					s = new FlxSprite(0, 0, mon85);
				break;
				case 43:
					s = new FlxSprite(0, 0, mon88);
				break;
			default:
					s = new FlxSprite(0, 0, mon1);
				break;
			}
			pixels = s.pixels;
			
			cycle = FlxU.random() * 100;
			
			kill();
		}
		
		override public function reset(X:Number, Y:Number):void 
		{
			super.reset(X, Y);
		}
		
		override public function update():void 
		{
			super.update();
			
			cycle += FlxG.elapsed * 7;
			
			scale.x = 0.95 + (0.05 * (Math.sin(cycle) * 2 - 1));
			scale.y = 0.97 + (0.03 * (Math.cos(cycle) * 2 - 1));
		}
		
	}

}