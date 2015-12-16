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
	public class Nota extends MovieClip
	{		
		const UNKNOWN = 0;
		const RIGHT = 1;
		const WRONG = 2;
		const DELETING = 3;
		
		private var configEvents:Singleton;
		private var game:Game;
		
		private var nombre:String;
		private var nota:MovieClip;
		
		public var estadoNota:Number = 0;
		
		private var sound:Sound;
		private var soundFinal:Sound;
		
		public function Nota(_x:Number, _y:Number, _game:Game, _sound:Sound) 
		{
			configEvents = Singleton.getInstance();
			game = _game;
			sound = _sound;
			
			nota = new NotaUnk();
			nota.x = _x;
			nota.y = _y;
			
			//Add Event Mouse
			configEvents.setEventMouseDrag_Drop(nota, this);
			
			addChild(nota);
		}
		
		private function sonaNota(_nota:String):void
		{
			soundFinal = new Sound();
			
			switch(_nota)
			{
				case "DO":	soundFinal.load(new URLRequest("./sound/Do.mp3"));		break;
				case "RE":	soundFinal.load(new URLRequest("./sound/Re.mp3"));		break;
				case "MI":	soundFinal.load(new URLRequest("./sound/Mi.mp3"));		break;
				case "FA":	soundFinal.load(new URLRequest("./sound/Fa.mp3"));		break;
				case "SOL":	soundFinal.load(new URLRequest("./sound/Sol.mp3"));		break;
				case "LA":	soundFinal.load(new URLRequest("./sound/La.mp3"));		break;
				case "SI":	soundFinal.load(new URLRequest("./sound/Si.mp3"));		break;
				case "DO@":	soundFinal.load(new URLRequest("./sound/Do@.mp3"));		break;
			}	
			soundFinal.play();
		}
		
		public function comprovaPosicio():void
		{
			var auxX:Number;
			
			if (nota.y >= 0 && nota.y <= 168)
			{
				trace("NONE");
				estadoNota = WRONG;
				nota.x = 348;
				nota.y = 548;
			}
			if (nota.y > 168 && nota.y <= 218)
			{
				trace("DO@");
				sonaNota("DO@");
				//nota.y = 193;
				nota.y = 548;
				if (game.notaActual == "DO@")
				{
					nombre = "DO@";
					removeChild(nota);
					auxX = nota.x;
					nota = new NotaDoA();
					nota.x = auxX;
					nota.y = 193;
					addChild(nota);
					trace("OLE!");
					estadoNota = RIGHT;
				}
				else 
				{
					estadoNota = WRONG;	
					nota.x = 348;
				}
			}
			if (nota.y > 200 && nota.y <= 250)
			{
				trace("SI");
				sonaNota("SI");
				//nota.y = 225;
				nota.y = 548;
				if (game.notaActual == "SI")
				{
					nombre = "SI";
					removeChild(nota);
					auxX = nota.x;
					nota = new NotaSi();
					nota.x = auxX;
					nota.y = 225;
					addChild(nota);
					trace("OLE!");
					estadoNota = RIGHT;
				}
				else 
				{
					estadoNota = WRONG;	
					nota.x = 348;
				}
			}
			if (nota.y > 230 && nota.y <= 280)
			{
				trace("LA");
				sonaNota("LA");
				//nota.y = 255;
				nota.y = 548;
				if (game.notaActual == "LA")
				{
					nombre = "LA";
					removeChild(nota);
					auxX = nota.x;
					nota = new NotaLa();
					nota.x = auxX;
					nota.y = 255;
					addChild(nota);
					trace("OLE!");
					estadoNota = RIGHT;
				}
				else 
				{
					estadoNota = WRONG;	
					nota.x = 348;
				}
			}
			if (nota.y > 263 && nota.y <= 313)
			{
				trace("SOL");
				sonaNota("SOL");
				//nota.y = 288;
				nota.y = 548;
				if (game.notaActual == "SOL")
				{
					nombre = "SOL";
					removeChild(nota);
					auxX = nota.x;
					nota = new NotaSol();
					nota.x = auxX;
					nota.y = 288;
					addChild(nota);
					trace("OLE!");
					estadoNota = RIGHT;
				}
				else 
				{
					estadoNota = WRONG;	
					nota.x = 348;
				}
			}
			if (nota.y > 293 && nota.y <= 345)
			{
				trace("FA");
				sonaNota("FA");
				//nota.y = 318;
				nota.y = 548;
				if (game.notaActual == "FA")	
				{
					nombre = "FA";
					removeChild(nota);
					auxX = nota.x;
					nota = new NotaFa();
					nota.x = auxX;
					nota.y = 318;
					addChild(nota);
					trace("OLE!");
					estadoNota = RIGHT;
				}
				else 
				{
					estadoNota = WRONG;	
					nota.x = 348;
				}
			}
			if (nota.y > 325 && nota.y <= 375)
			{
				trace("MI");
				sonaNota("MI");
				//nota.y = 350;
				nota.y = 548;
				if (game.notaActual == "MI")
				{
					nombre = "MI";
					removeChild(nota);
					auxX = nota.x;
					nota = new NotaMi();
					nota.x = auxX;
					nota.y = 350;
					addChild(nota);
					trace("OLE!");
					estadoNota = RIGHT;
				}
				else 
				{
					estadoNota = WRONG;	
					nota.x = 348;
				}
			}
			if (nota.y > 355 && nota.y <= 405)
			{
				trace("RE");
				sonaNota("RE");
				//nota.y = 380;
				nota.y = 548;
				if (game.notaActual == "RE")
				{
					nombre = "RE";
					removeChild(nota);
					auxX = nota.x;
					nota = new NotaRe();
					nota.x = auxX;
					nota.y = 380;
					addChild(nota);
					trace("OLE!");
					estadoNota = RIGHT;
				}
				else 
				{
					estadoNota = WRONG;	
					nota.x = 348;
				}
			}
			if (nota.y > 389 && nota.y <= 439)
			{
				trace("DO");
				sonaNota("DO");
				//nota.y = 414;
				nota.y = 548;
				if (game.notaActual == "DO")
				{
					nombre = "DO";
					removeChild(nota);
					auxX = nota.x;
					nota = new NotaDo();
					nota.x = auxX;
					nota.y = 414;
					addChild(nota);
					trace("OLE!");
					estadoNota = RIGHT;
				}
				else 
				{
					estadoNota = WRONG;	
					nota.x = 348;
				}
			}
			if (nota.y > 439 && nota.y <= 756)
			{
				trace("NONE");
				nota.x = 348;
				nota.y = 548;
			}
		}
		
		//-------------------------------------------------------------------------
		//------------------------------- HANDLER ---------------------------------
		//-------------------------------------------------------------------------
		public function mouseEventHandler(eEvent:Event):void
		{	
			switch(eEvent.type)
			{
				case MouseEvent.MOUSE_UP:
					nota.stopDrag();
					comprovaPosicio();
					break;
				case MouseEvent.MOUSE_DOWN:
					nota.startDrag();
					sound.play();
					break;
				case MouseEvent.ROLL_OUT:
					break;
				case MouseEvent.ROLL_OVER:
					break;
			}
		}
	}

}