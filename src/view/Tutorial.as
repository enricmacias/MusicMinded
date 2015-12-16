package view 
{
	import controller.Singleton;
	import flash.display.MovieClip
	import flash.sampler.NewObjectSample;
	import view.NotaTuto;
	import flash.events.*;
	import caurina.transitions.Tweener;
	
	/**
	 * ...
	 * @author KiKe, Adela & Marc
	 */
	public class Tutorial extends MovieClip
	{
		const OUT = 0;
		const OVER = 1;
		const STAYOVER = 2;
		
		private var esc:Escenari;
		private var configEvents:Singleton;
		
		private var pentagrama:Pentagrama;
		private var claveSol:MovieClip;
		private var volverBtn:MovieClip;
		private var bocadillo:MovieClip;
		
		private var flamenco:MovieClip;
		
		private var notaDo;
		private var notaRe;
		private var notaMi;
		private var notaFa;
		private var notaSol;
		private var notaLa;
		private var notaSi;
		private var notaDoAgut;
		
		public function Tutorial(_esc:Escenari) 
		{
			esc = _esc;
			configEvents = Singleton.getInstance();
			configEvents.setEventEnterFrame(this);
			
			volverBtn = new BtnVolver();
			volverBtn.x = 65;
			volverBtn.y = 680;
			addChild(volverBtn);
			configEvents.setEventMouseClick(volverBtn, this);
			
			pentagrama = new Pentagrama();
			pentagrama.x = 512;
			pentagrama.y = 237;
			addChild(pentagrama);
			
			claveSol = new ClaveSol();
			claveSol.x = 100;
			claveSol.y = 220;
			addChild(claveSol);
			
			notaDo = new NotaTuto("DO", 200, 414);
			notaRe = new NotaTuto("RE", 290, 380);
			notaMi = new NotaTuto("MI", 380, 350);
			notaFa = new NotaTuto("FA", 470, 318);
			notaSol = new NotaTuto("SOL", 560, 288);
			notaLa = new NotaTuto("LA", 650, 255);
			notaSi = new NotaTuto("SI", 740, 225);
			notaDoAgut = new NotaTuto("DO@", 830, 193);
			
			addChild(notaDo);
			addChild(notaRe);
			addChild(notaMi);
			addChild(notaFa);
			addChild(notaSol);
			addChild(notaLa);
			addChild(notaSi);
			addChild(notaDoAgut);
			
			flamenco = new Flamingo();
			flamenco.x = 930;
			flamenco.y = 435;
			addChild(flamenco);
			
			bocadillo = new Boc_Tutorial_Init();
			bocadillo.x = 700;
			bocadillo.y = 475;
			bocadillo.width = 0;
			bocadillo.height = 0;
			addChild(bocadillo);
			Tweener.addTween(bocadillo,{width:378, height:321, time:0.25, transition:"linear" } );
		}
		
		private function entraBocata():void
		{
			bocadillo.x = 700;
			bocadillo.y = 475;
			bocadillo.width = 0;
			bocadillo.height = 0;
			addChild(bocadillo);
			Tweener.addTween(bocadillo,{width:324, height:202, time:0.25, transition:"linear" } );
		}
		
		//-------------------------------------------------------------------------
		//------------------------------- HANDLERS --------------------------------
		//-------------------------------------------------------------------------
		public function mouseEventHandler(eEvent:Event):void
		{	
			switch(eEvent.type)
			{
				case MouseEvent.CLICK:
					switch(eEvent.currentTarget)
					{
						case volverBtn: 
							trace("Click volver");
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
						case volverBtn: trace("Roll over volver"); break;
					}
					break;
				case MouseEvent.ROLL_OUT:
					switch(eEvent.currentTarget)
					{
						case volverBtn: trace("Roll out volver"); break;
					}
					break;
			}
		}
		
		public function enterFrameHandler(eEvent:Event):void
		{
			if (notaDo.estado == OVER)
			{
				removeChild(bocadillo);
				bocadillo = new Boc_Do();
				entraBocata();
				notaDo.estado = STAYOVER;
			}
			if (notaRe.estado == OVER)
			{
				removeChild(bocadillo);
				bocadillo = new Boc_Re();
				entraBocata();
				notaRe.estado = STAYOVER;
			}
			if (notaMi.estado == OVER)
			{
				removeChild(bocadillo);
				bocadillo = new Boc_Mi();
				entraBocata();
				notaMi.estado = STAYOVER;
			}
			if (notaFa.estado == OVER)
			{
				removeChild(bocadillo);
				bocadillo = new Boc_Fa();
				entraBocata();
				notaFa.estado = STAYOVER;
			}
			if (notaSol.estado == OVER)
			{
				removeChild(bocadillo);
				bocadillo = new Boc_Sol();
				entraBocata();
				notaSol.estado = STAYOVER;
			}
			if (notaLa.estado == OVER)
			{
				removeChild(bocadillo);
				bocadillo = new Boc_La();
				entraBocata();
				notaLa.estado = STAYOVER;
			}
			if (notaSi.estado == OVER)
			{
				removeChild(bocadillo);
				bocadillo = new Boc_Si();
				entraBocata();
				notaSi.estado = STAYOVER;
			}
			if (notaDoAgut.estado == OVER)
			{
				removeChild(bocadillo);
				bocadillo = new Boc_Do();
				entraBocata();
				notaDoAgut.estado = STAYOVER;
			}
		}
	}

}