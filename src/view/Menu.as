package view 
{
	import flash.display.MovieClip
	import controller.Singleton;
	import flash.events.*;
	import caurina.transitions.Tweener;
	
	/**
	 * ...
	 * @author KiKe, Adela & Marc
	 */
	public class Menu extends MovieClip
	{
		private var esc:Escenari;
		
		private var tutorial:Tutorial;
		private var game:Game;
		
		private var playBtn:MovieClip;
		private var tutorialBtn:MovieClip;
		
		private var logo:MovieClip;
		private var production:MovieClip;
		private var flamenco:MovieClip;
		
		private var configEvents:Singleton;
		
		public function Menu(_esc:Escenari) 
		{
			esc = _esc;
			configEvents = Singleton.getInstance();
			
			playBtn = new BtnPlay();
			tutorialBtn = new BtnTutorial();
			
			playBtn.x = 150;
			playBtn.y = 500;
			tutorialBtn.x = 425;
			tutorialBtn.y = 500;
			
			logo = new Logo();
			logo.x = 375;
			logo.y = 225;
			addChild(logo);
			
			production = new byCCC();
			production.x = 280;
			production.y = 620;
			addChild(production);
			
			flamenco = new FlamencoIni();
			flamenco.x = 825;
			flamenco.y = 375;
			addChild(flamenco);
			
			configEvents.setEventMouseClick(playBtn, this);
			configEvents.setEventMouseClick(tutorialBtn, this);
			
			addChild(playBtn);
			addChild(tutorialBtn);
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
						case playBtn: 
							trace("Click play");
							esc.removeChild(this);
							game = new Game(esc);
							esc.addChild(game);
							break;
						case tutorialBtn: 
							trace("Click tuto");
							esc.removeChild(this);
							tutorial = new Tutorial(esc);
							esc.addChild(tutorial);
							break;
					}
					break;
				case MouseEvent.ROLL_OVER:
					switch(eEvent.currentTarget)
					{
						case playBtn: 
							if (Tweener.isTweening(tutorialBtn))
							{
								Tweener.pauseTweens(tutorialBtn);
								tutorialBtn.x = 425;
								tutorialBtn.y = 500;
								Tweener.addTween(playBtn, { y:playBtn.y - 10, time:0.5, transition:"easeOutElastic" });
							}
							else	Tweener.addTween(playBtn, { y:playBtn.y - 10, time:0.5, transition:"easeOutElastic" });
							break;
						case tutorialBtn: 
							if (Tweener.isTweening(playBtn))
							{
								Tweener.pauseTweens(playBtn);
								playBtn.x = 150;
								playBtn.y = 500;
								Tweener.addTween(tutorialBtn, { y:tutorialBtn.y - 10, time:0.5, transition:"easeOutElastic" });
							}
							else	Tweener.addTween(tutorialBtn, { y:tutorialBtn.y - 10, time:0.5, transition:"easeOutElastic" });
							break;
					}
					break;
				case MouseEvent.ROLL_OUT:
					switch(eEvent.currentTarget)
					{
						case playBtn:
							if (Tweener.isTweening(playBtn))
							{
								Tweener.pauseTweens(playBtn);
								playBtn.x = 150;
								playBtn.y = 500;
							}
							else	Tweener.addTween(playBtn, { y:playBtn.y + 10, time:0.5, transition:"easeOutElastic" } );
							break;
						case tutorialBtn:
							if (Tweener.isTweening(tutorialBtn))
							{
								Tweener.pauseTweens(tutorialBtn);
								tutorialBtn.x = 425;
								tutorialBtn.y = 500;
							}
							else Tweener.addTween(tutorialBtn, { y:tutorialBtn.y + 10, time:0.5, transition:"easeOutElastic" });
							break;
					}
					break;
			}
		}
	}

}