package view 
{
	import adobe.utils.CustomActions;
	import controller.Singleton;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundLoaderContext;
	import flash.net.URLRequest;
	import caurina.transitions.Tweener;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author KiKe, Adela & Marc
	 */
	public class Game extends MovieClip
	{
		const UNKNOWN = 0;
		const RIGHT = 1;
		const WRONG = 2;
		const DELETING = 3;
		
		private var esc:Escenari;
		private var configEvents:Singleton;
		
		private var soundDO:Sound;
		private var soundRE:Sound;
		private var soundMI:Sound;
		private var soundFA:Sound;
		private var soundSOL:Sound;
		private var soundLA:Sound;
		private var soundSI:Sound;
		private var soundDOA:Sound;
		private var soundOK:Sound;
		private var soundWrong:Sound;
		private var soundInit:Sound;
		private var soundGameOver:Sound;
		
		private var flamingo:MovieClip;
		private var flamingo2:MovieClip;
		private var pentagrama:MovieClip;
		private var claveSol:MovieClip;
		private var score:MovieClip;
		private var vidas:MovieClip;
		private var vidasCartel:MovieClip;
		private var numVidas:Number;
		private var backButton:MovieClip;
		private var puntuacionCartel:MovieClip;
		private var puntuacion:Number;
		private var tiempoCartel:MovieClip;
		private var bocadillo:MovieClip;
		private var bolas:MovieClip;
		
		private var barra_fondo:MovieClip;
		private var barra_verde:MovieClip;
		private var barra_amar:MovieClip;
		private var barra_roja:MovieClip;
		private var time:Number;
		
		private var nota;
		public var notaActual:String;
		
		public function Game(_esc:Escenari) 
		{
			esc = _esc;
			configEvents = Singleton.getInstance();
			
			initEscena();
			initSounds();
			initBocatas();
		}
		
		private function initEscena():void
		{
			pentagrama = new Pentagrama();
			pentagrama.x = 512;
			pentagrama.y = 237;
			addChild(pentagrama);
			
			flamingo = new Flamingo();
			flamingo.x = 875;
			flamingo.y = 435;
			addChild(flamingo);	
			
			flamingo2 = new Flamingo2();
			flamingo2.x = 875;
			flamingo2.y = 435;
			
			claveSol = new ClaveSol();
			claveSol.x = 100;
			claveSol.y = 220;
			addChild(claveSol);
			
			score = new Score();
			score.x = 55;
			score.y = 630;
			addChild(score);
			
			vidas = new Vidas();
			vidas.x = 60;
			vidas.y = 550;
			addChild(vidas);
			
			backButton = new BtnVolver();
			backButton.x = 60;
			backButton.y = 680;
			addChild(backButton);
			
			puntuacionCartel = new PuntuacionCartel();
			puntuacionCartel.x = 120;
			puntuacionCartel.y = 627;
			puntuacionCartel.texto.text = 0;
			addChild(puntuacionCartel);
			
			vidasCartel = new VidasCartel();
			vidasCartel.x = 130;
			vidasCartel.y = 540;
			vidasCartel.texto.text = 0;
			addChild(vidasCartel);
			
			tiempoCartel = new TiempoCartel();
			tiempoCartel.x = 800;
			tiempoCartel.y = 698;
			tiempoCartel.texto.text = 50;
			addChild(tiempoCartel);
			
			bolas = new Bolas();
			bolas.x = 350;
			bolas.y = 550;
			addChild(bolas);
			
			time = 0;
			
			barra_fondo = new Barra_fondo();
			barra_fondo.x  = 125;
			barra_fondo.y = 700;
			addChild(barra_fondo);
		}
		
		private function initSounds():void
		{
			soundDO = new Sound();
			soundRE = new Sound();
			soundMI = new Sound();
			soundFA = new Sound();
			soundSOL = new Sound();
			soundLA = new Sound();
			soundSI = new Sound();
			soundDOA = new Sound();
			soundOK = new Sound();
			soundWrong = new Sound();
			soundInit = new Sound();
			soundGameOver = new Sound();
			
			soundDO.load(new URLRequest("./sound/Do.mp3"));
			soundRE.load(new URLRequest("./sound/Re.mp3"));
			soundMI.load(new URLRequest("./sound/Mi.mp3"));
			soundFA.load(new URLRequest("./sound/Fa.mp3"));
			soundSOL.load(new URLRequest("./sound/Sol.mp3"));
			soundLA.load(new URLRequest("./sound/La.mp3"));
			soundSI.load(new URLRequest("./sound/Si.mp3"));
			soundDOA.load(new URLRequest("./sound/Do@.mp3"));
			soundOK.load(new URLRequest("./sound/OK.mp3"));
			soundWrong.load(new URLRequest("./sound/Wrong.mp3"));
			soundInit.load(new URLRequest("./sound/Init.mp3"));
			soundGameOver.load(new URLRequest("./sound/GameOver.mp3"));
		}
		
		private function addNotes():void 
		{
			switch(notaActual)
			{
				case "DO":	nota = new Nota(348, 548, this, soundDO);	break;
				case "RE":	nota = new Nota(348, 548, this, soundRE);	break;
				case "MI":	nota = new Nota(348, 548, this, soundMI);	break;
				case "FA":	nota = new Nota(348, 548, this, soundFA);	break;
				case "SOL":	nota = new Nota(348, 548, this, soundSOL);	break;
				case "LA":	nota = new Nota(348, 548, this, soundLA);	break;
				case "SI":	nota = new Nota(348, 548, this, soundSI);	break;
				case "DO@":	nota = new Nota(348, 548, this, soundDOA);	break;
			}
			
			addChild(nota);
		}
		
		private function initBocatas():void
		{
			soundWrong.play();
			bocadillo = new Boc_Init();
			entraBocata();
			levantaAlaFlamenco();
			Tweener.addTween(flamingo, { x:flamingo.x, time:3.5, transition:"linear", onComplete:initBocatas2 } );
			nota = new NotaUnk();
			nota.x = 348;
			nota.y = 548;
			addChild(nota);
			Tweener.addTween(nota, { y:nota.y - 50, time:2.5, transition:"easeOutElastic", onComplete:bolaVuelve } );
		}
		
		private function bolaVuelve():void
		{
			Tweener.addTween(nota, { y:nota.y + 50, time:0.5, transition:"linear" } );
		}
		
		private function initBocatas2():void
		{
			removeChild(nota);
			soundWrong.play();
			removeChild(bocadillo);
			bocadillo = new Boc_Init2();
			entraBocata();
			levantaAlaFlamenco();
			Tweener.addTween(flamingo, { x:flamingo.x, time:4, transition:"linear", onComplete:initBocatas3 } );
		}
		
		private function initBocatas3():void
		{
			soundWrong.play();
			removeChild(bocadillo);
			bocadillo = new Boc_Init3();
			entraBocata();
			levantaAlaFlamenco();
			Tweener.addTween(flamingo, { x:flamingo.x, time:4, transition:"linear", onComplete:initBocatas4 } );
		}
		
		private function initBocatas4():void
		{
			soundWrong.play();
			removeChild(bocadillo);
			bocadillo = new Boc_Start();
			entraBocata();
			levantaAlaFlamenco();
			Tweener.addTween(flamingo, { x:flamingo.x, time:2, transition:"linear", onComplete:continueInit } );
		}
		
		private function continueInit():void
		{
			startGame();
			addNotes();
			initTime();
		}
		
		private function startGame():void
		{
			newSound();
			puntuacion = 0;
			numVidas = 0;
		}
		
		private function initTime():void
		{			
			barra_verde = new Barra_verde();
			barra_verde.x = 525;
			barra_verde.y = 700;
			addChild(barra_verde);
			barra_verde.visible = false;
			
			barra_amar = new Barra_amar();
			barra_amar.x = 325;
			barra_amar.y = 700;
			addChild(barra_amar);
			barra_amar.visible = false;
			
			barra_roja = new Barra_roja();
			barra_roja.x = 125;
			barra_roja.y = 700;
			addChild(barra_roja);
			
			time = 50;
			
			configEvents.setEventEnterFrame(this);
			configEvents.setEventMouseClick(backButton, this);
		}
		
		private function newSound():void
		{
			var numRandom:Number = Math.round(Math.random() * 7);
		
			switch(numRandom)
			{
				case 0: notaActual = "DO";	break;
				case 1: notaActual = "RE";	break;
				case 2:	notaActual = "MI";	break;
				case 3: notaActual = "FA";	break;
				case 4: notaActual = "SOL";	break;
				case 5: notaActual = "LA";	break;
				case 6: notaActual = "SI";	break;
				case 7: notaActual = "DO@";	break;
			}
			trace(notaActual);
		}
		
		public function playSound():void
		{
			switch(notaActual)
			{
				case "DO":	soundDO.play();	break;
				case "RE":	soundRE.play();	break;
				case "MI":	soundMI.play();	break;
				case "FA":	soundFA.play();	break;
				case "SOL":	soundSOL.play();break;
				case "LA":	soundLA.play();	break;
				case "SI":	soundSI.play();	break;
				case "DO@":	soundDOA.play();break;
			}
		}
		
		private function canviaFlamenco():void
		{
			trace("canviaFlamenco");
			removeChild(flamingo2);
			addChild(flamingo);
		}
		
		private function levantaAlaFlamenco():void
		{
			removeChild(flamingo);
			addChild(flamingo2);
			Tweener.addTween(flamingo2, { x:flamingo2.x, time:2, transition:"linear", onComplete:canviaFlamenco } );
		}
		
		public function comprovaJoc():void
		{
			switch(nota.estadoNota)
			{
				case RIGHT:
					Tweener.addTween(nota, { x: -1000, time:1, transition:"easeInQuart", onComplete:nuevaNota } );
					nota.estadoNota = DELETING;
					//soundOK.play();
					removeChild(bocadillo);
					bocadillo = new Boc_Nice();
					entraBocata();
					levantaAlaFlamenco();
					break;
				case WRONG:
					restaTiempo();
					nota.estadoNota = UNKNOWN;
					//soundWrong.play();
					removeChild(bocadillo);
					bocadillo = new Boc_TryAgain();
					entraBocata();
					break;
			}			
			
			//Fin de juego
			if (time <= 0)
			{
				if ( numVidas == 0)
				{
					trace("GAME OVER");
					var gameover:GameOver = new GameOver(esc,puntuacion);
					configEvents.removeEventEnterFrame(this);
					esc.removeChild(this);
					esc.addChild(gameover);
					soundGameOver.play();
				}
				else 
				{
					numVidas--;
					vidasCartel.texto.text = numVidas;
					time += 50;
					Tweener.removeTweens(barra_roja);
					barra_roja.width = 50 * 4;
					barra_roja.visible = true;
				}
			}
		}

		private function nuevaNota():void
		{
			//Nuevo sonido de nota
			newSound();
			
			//Genera nueva nota
			removeChild(nota);
			nota = null;
			addNotes();
			
			//Assigna puntuacion
			puntuaNota();
		}
		
		private function puntuaNota():void
		{
			puntuacion += 100;
			puntuacionCartel.texto.text = puntuacion;
			time += 5;
			modificaBarraTiempo(time-10);
		}
		
		private function restaTiempo():void
		{
			time -= 3;
			modificaBarraTiempo(time+5);
		}
		
		public function puntuaItem(_time:Number, _punt:Number):void
		{
			//Vida
			if (_time == 0)
			{
				numVidas++;
				vidasCartel.texto.text = numVidas;
			}
			puntuacion += _punt;
			if (puntuacion < 0) puntuacion = 0;
			puntuacionCartel.texto.text = puntuacion;
			time += _time;
			modificaBarraTiempo(time-_time);
		}
		
		private function modificaBarraTiempo(pastValue:Number):void
		{
			configEvents.removeEventEnterFrame(this);
			if ( time < 0 )
			{
				time = 0;
				Tweener.removeTweens(barra_roja);
				barra_roja.width = time * 4;
				barra_roja.visible = true;
			}
			if (((time > 0) && (time <= 50)) && ((pastValue > 0) && (pastValue <= 50)))
			{
				Tweener.removeTweens(barra_roja);
				barra_roja.width = time * 4;
				barra_roja.visible = true;
			}
			if (((time > 0) && (time <= 50)) && ((pastValue > 50) && (pastValue <= 100)))
			{
				Tweener.removeTweens(barra_roja);
				Tweener.removeTweens(barra_amar);
				barra_amar.width = 0;
				barra_roja.width = time * 4;
				barra_roja.visible = true;
				barra_amar.visible = false;
			}
			if ((time > 50) && (time <= 100) && ((pastValue > 0) && (pastValue <= 50)))
			{
				Tweener.removeTweens(barra_roja);
				Tweener.removeTweens(barra_amar);
				barra_roja.width = 200;
				barra_amar.width = (time-50) * 4;
				barra_roja.visible = true;
				barra_amar.visible = true;
			}
			if ((time > 50) && (time <= 100) && ((pastValue > 50) && (pastValue <= 100)))
			{
				Tweener.removeTweens(barra_amar);
				barra_amar.width = (time-50) * 4;
				barra_amar.visible = true;
			}
			if ((time > 50) && (time <= 100) && ((pastValue > 100) && (pastValue <= 150)))
			{
				Tweener.removeTweens(barra_amar);
				Tweener.removeTweens(barra_verde);
				barra_verde.width = 0;
				barra_amar.width = (time-50) * 4;
				barra_amar.visible = true;
				barra_verde.visible = false;
			}
			if ((time > 100) && (time <= 150) && ((pastValue > 50) && (pastValue <= 100)))
			{
				Tweener.removeTweens(barra_amar);
				Tweener.removeTweens(barra_verde);
				barra_amar.width = 200;
				barra_verde.width = (time-100) * 4;
				barra_amar.visible = true;
				barra_verde.visible = true;
			}
			if ((time > 100) && (time <= 150) && ((pastValue > 100) && (pastValue <= 150)))
			{
				Tweener.removeTweens(barra_verde);
				barra_verde.width = (time-100) * 4;
				barra_verde.visible = true;
			}
			if (time > 150)
			{
				time = 150;
				Tweener.removeTweens(barra_verde);
				barra_verde.width = (time-100) * 4;
				barra_verde.visible = true;
			}
			configEvents.setEventEnterFrame(this);
		}
		
		private function entraBocata():void
		{
			bocadillo.x = 680;
			bocadillo.y = 475;
			bocadillo.width = 0;
			bocadillo.height = 0;
			addChild(bocadillo);
			Tweener.addTween(bocadillo,{width:324, height:202, time:0.25, transition:"linear" } );
		}
		
		//-------------------------------------------------------------------------
		//------------------------------- HANDLERS --------------------------------
		//-------------------------------------------------------------------------
		
		public function enterFrameHandler(eEvent:Event):void
		{
			//Barra temporal
			if ( !Tweener.isTweening(barra_roja) && !Tweener.isTweening(barra_amar) && !Tweener.isTweening(barra_verde) )
			{
				if ((time > 0) && (time <= 50))
				{
					Tweener.addTween(barra_roja, { width:barra_roja.width-4, time:1, transition:"linear" } );
				}
				if ((time > 50) && (time <= 100))
				{
					Tweener.addTween(barra_amar, { width:barra_amar.width-4, time:1, transition:"linear" } );
				}
				if ((time > 100) && (time <= 150))
				{
					Tweener.addTween(barra_verde, { width:barra_verde.width-4, time:1, transition:"linear" } );
				}
				time--;
			}
			
			//trace("Time:" + time + ", Roja:" + barra_roja.width/4 + " Amar:" + barra_amar.width/4 + " Verde:" + barra_verde.width/4);
			tiempoCartel.texto.text = time;
			comprovaJoc();
			
			//Items especiales
			var num:Number = Math.round((Math.random() * 3000));
			if ((num == 654) || (num == 2413) || (num == 1872))
			{
				num = Math.round((Math.random() * 1000));
				if (num < 500)	
				{
					var corchera:Item = new Item("CORCHERA", this);
					addChild(corchera);
				}
				else 			
				{
					var sil_corchera:Item = new Item("SIL_CORCHERA",this);
					addChild(sil_corchera);
				}
			}
			if ((num == 2472) || (num == 37))
			{
				num = Math.round((Math.random() * 1000));
				if (num < 500)
				{
					var negra:Item = new Item("NEGRA",this);
					addChild(negra);
				}
				else
				{
					var sil_negra:Item = new Item("SIL_NEGRA",this);
					addChild(sil_negra);
				}
			}
			if ((num == 1672)||(num == 2980))
			{
				num = Math.round((Math.random() * 1000));
				if (num < 500)
				{
					var blanca:Item = new Item("BLANCA",this);
					addChild(blanca);
				}
				else
				{
					var sil_blanca:Item = new Item("SIL_BLANCA",this);
					addChild(sil_blanca);
				}
			}
			
			//var num2:Number = Math.round((Math.random() * 2500));
			if ((num == 967))
			{
				num = Math.round((Math.random() * 1000));
				if (num < 500)
				{
					var redonda:Item = new Item("REDONDA",this);
					addChild(redonda);
				}
				else
				{
					var sil_redonda:Item = new Item("SIL_REDONDA",this);
					addChild(sil_redonda);
				}
			}
			
			//var num3:Number = Math.round((Math.random() * 3000));
			if ((num == 3000))
			{
				var vida:Item = new Item("VIDA", this);
				addChild(vida);
			}
		}
		
		public function mouseEventHandler(eEvent:Event):void
		{	
			switch(eEvent.type)
			{
				case MouseEvent.CLICK:
					switch(eEvent.currentTarget)
					{
						case backButton: 
							var menu:Menu = new Menu(esc);
							configEvents.removeEventEnterFrame(this);
							esc.removeChild(this);
							esc.addChild(menu);
							break;
					}
					break;
				case MouseEvent.ROLL_OVER:
					switch(eEvent.currentTarget)
					{
						case backButton: trace("Roll over repeat"); break;
					}
					break;
				case MouseEvent.ROLL_OUT:
					switch(eEvent.currentTarget)
					{
						case backButton: trace("Roll out repeat"); break;
					}
					break;
			}
		}
	}

}