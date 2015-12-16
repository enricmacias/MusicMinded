package view 
{
	import controller.Singleton;
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.media.Sound;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author KiKe, Adela & Marc
	 */
	public class NotaTuto extends MovieClip
	{		
		const OUT = 0;
		const OVER = 1;
		const STAYOVER = 2;
		
		private var configEvents:Singleton;
		
		public var estado:Number;
		private var nombre:String;
		private var nota:MovieClip;
		private var so:Sound;
		
		public function NotaTuto(_name:String, _x:Number, _y:Number) 
		{
			configEvents = Singleton.getInstance();
			
			estado = OUT;
			
			so = new Sound();
			
			//Init nota
			switch(_name)
			{
				case "DO":	
					nota = new NotaDo();	
					nombre = "D0";
					so.load(new URLRequest("./sound/Do.mp3"));
					break;
				case "RE":	
					nota = new NotaRe();	
					nombre = "RE";
					so.load(new URLRequest("./sound/Re.mp3"));
					break;
				case "MI":	
					nota = new NotaMi();	
					nombre = "MI";
					so.load(new URLRequest("./sound/Mi.mp3"));
					break;
				case "FA":	
					nota = new NotaFa();	
					nombre = "FA";
					so.load(new URLRequest("./sound/Fa.mp3"));
					break;
				case "SOL":	
					nota = new NotaSol();	
					nombre = "SOL";
					so.load(new URLRequest("./sound/Sol.mp3"));
					break;
				case "LA":	
					nota = new NotaLa();	
					nombre = "LA";
					so.load(new URLRequest("./sound/La.mp3"));
					break;
				case "SI":	
					nota = new NotaSi(); 	
					nombre = "SI";
					so.load(new URLRequest("./sound/Si.mp3"));
					break;
				case "DO@":	
					nota = new NotaDoA(); 	
					nombre = "DO@";
					so.load(new URLRequest("./sound/Do@.mp3"));
					break;
				default: 	trace("Escriu una nota musical, així: DO, RE, MI, FA, SOL, LA, SI");
			}
			
			nota.x = _x;
			nota.y = _y;
			
			//Add Event Mouse
			configEvents.setEventMouseClick(nota, this);
			
			addChild(nota);
		}
		
		//-------------------------------------------------------------------------
		//------------------------------- HANDLER ---------------------------------
		//-------------------------------------------------------------------------
		public function mouseEventHandler(eEvent:Event):void
		{	
			switch(eEvent.type)
			{
				case MouseEvent.CLICK:
					so.play();
					break;
				case MouseEvent.ROLL_OUT:
					estado = OUT;
					break;
				case MouseEvent.ROLL_OVER:
					estado = OVER;
					break;
			}
		}
	}

}