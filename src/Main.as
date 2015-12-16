package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import view.Escenari;
	
	/**
	 * ...
	 * @author KiKe, Adela & Marc
	 */
	public class Main extends Sprite 
	{
		private var escenari:Escenari;
		
		public function Main():void 
		{
			escenari = new Escenari();
			addChild(escenari);
		}		
	}
	
}