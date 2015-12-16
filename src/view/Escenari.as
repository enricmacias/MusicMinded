package view 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author KiKe, Adela & Marc
	 */
	public class Escenari extends MovieClip
	{
		private var menu:Menu;
		
		public function Escenari() 
		{
			menu = new Menu(this);
			addChild(menu);
		}
		
	}

}