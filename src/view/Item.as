package view 
{
	import controller.Singleton;
	import flash.display.MovieClip;
	import flash.events.*;
	import caurina.transitions.Tweener;
	/**
	 * ...
	 * @author KiKe, Adela & Marc
	 */
	public class Item extends MovieClip
	{
		private var configEvents:Singleton;
		
		public var tipo:String;
		public var time:Number;
		public var puntuacion:Number;
		public var item:MovieClip;
		public var game:Game;
		
		public function Item(_tipo:String,_game:Game) 
		{
			configEvents = Singleton.getInstance();
			
			tipo = _tipo;
			trace(tipo);
			game = _game;
			
			switch(tipo)
			{
				case "CORCHERA": 		item = new Item_Corchera(); 	time = 5; 	puntuacion = 50; 	break;
				case "SIL_CORCHERA": 	item = new Item_Sil_Corchera(); time = -5;	puntuacion = -50;	break;
				case "NEGRA": 			item = new Item_Negra();		time = 10;	puntuacion = 100;	break;
				case "SIL_NEGRA":		item = new Item_Sil_Negra(); 	time = -10;	puntuacion = -100;	break;
				case "BLANCA":			item = new Item_Blanca();		time = 20;	puntuacion = 200;	break;
				case "SIL_BLANCA":		item = new Item_Sil_Blanca();	time = -20;	puntuacion = -200;	break;
				case "REDONDA":			item = new Item_Redonda();		time = 40;	puntuacion = 400;	break;
				case "SIL_REDONDA":		item = new Item_Sil_Redonda();	time = -40;	puntuacion = -400;	break;
				case "VIDA":			item = new Item_Vida();			time = 0;	puntuacion = 1000;	break;
			}
			
			var x:Number = Math.round((Math.random() * 624) + 200);
			var y:Number = Math.round((Math.random() * 350) + 100);			
			item.x = x;
			item.y = y;
			
			configEvents.setEventMouseClick(item, this);
			
			addChild(item);
			var auxX:Number = Math.round(Math.random() * 100) - 50;
			var auxY:Number = Math.round(Math.random() * 300) - 150;
			Tweener.addTween(item, { x:item.x + auxX, y:item.y + auxY, time:2, transition:"linear", onComplete:eliminaItem} );
		}
		
		private function eliminaItem():void
		{
			removeChild(item);
			visible = false;
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
						case item: game.puntuaItem(time, puntuacion);	
						Tweener.pauseTweens(item)
						eliminaItem();
						break;
					}
					break;
				case MouseEvent.ROLL_OVER:
					switch(eEvent.currentTarget)
					{
						case item: trace("Roll over item"); break;
					}
					break;
				case MouseEvent.ROLL_OUT:
					switch(eEvent.currentTarget)
					{
						case item: trace("Roll out item"); break;
					}
					break;
			}
		}
	}

}