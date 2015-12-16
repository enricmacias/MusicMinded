package view 
{
	import controller.Singleton;
	import flash.display.MovieClip;
	import flash.events.*;
	/**
	 * ...
	 * @author KiKe
	 */
	public class GameOver extends MovieClip
	{
		private var esc:Escenari;
		private var configEvents:Singleton;
		
		private var puntuacion:Number;
		private var btntryagain:MovieClip;
		private var cartelPuntuacion:MovieClip;
		
		public function GameOver(_esc:Escenari,_punt:Number) 
		{
			esc = _esc;
			configEvents = Singleton.getInstance();
			puntuacion = _punt;
			
			var go = new GO();
			go.x = 512;
			go.y = 396;
			addChild(go);
			
			btntryagain = new ButtonTryAgain();
			btntryagain.x = 360;
			btntryagain.y = 320;
			configEvents.setEventMouseClick(btntryagain, this);
			addChild(btntryagain);
			
			cartelPuntuacion = new PuntuacionGameOver();
			cartelPuntuacion.x = 480;
			cartelPuntuacion.y = 166;
			cartelPuntuacion.texto.text = puntuacion;
			addChild(cartelPuntuacion);
		}
		
		//-------------------------------------------------------------------------
		//------------------------------- HANDLER ---------------------------------
		//-------------------------------------------------------------------------
		public function mouseEventHandler(eEvent:Event):void
		{	
			switch(eEvent.type)
			{
				case MouseEvent.CLICK:
					switch(eEvent.currentTarget)
					{
						case btntryagain: 
							var menu:Menu = new Menu(esc);
							esc.removeChild(this);
							esc.addChild(menu);
							break;
					}
					break;
				case MouseEvent.ROLL_OVER:
					switch(eEvent.currentTarget)
					{
						case btntryagain:
							break;
					}
					break;
				case MouseEvent.ROLL_OUT:
					switch(eEvent.currentTarget)
					{
						case btntryagain:
							break;
					}
					break;
			}
		}
	}

}