package
{
	import org.flixel.*;

	[SWF(width="800", height="600", backgroundColor="#FFFFFF")]
	[Frame(factoryClass="Preloader")]

	public class Main extends FlxGame
	{
		
		public function Main()
		{
			super(800, 600, MenuState, 1);
			
		}

	}

}

