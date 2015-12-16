package controller 
{
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.*;
	
	/**
	 * ...
	 * @author KiKe, Adela & Marc
	 */
	public class Singleton extends Sprite
	{
		public var _stage:Stage;
		
		private static var instance:Singleton;
		private static var creatingSingleton:Boolean = false; 
		
		public function Singleton():void
		{
			if( !creatingSingleton ) throw new Error( "Singleton and can only be accessed through Singleton.getInstance()" );  
		}
		
        public static function getInstance():Singleton
		{
            if( !instance ){ 
				creatingSingleton = true; 
				instance = new Singleton(); 
				creatingSingleton = false; 
			} 
			return instance; 
        }
		
		//-------------------------------------------------------------------------
		//------------------------------ LISTENERS --------------------------------
		//-------------------------------------------------------------------------
		public function setEventEnterFrame(_myObject:Object):void
		{
			addEventListener(Event.ENTER_FRAME,_myObject.enterFrameHandler);
		}
		
		public function removeEventEnterFrame(_myObject:Object):void
		{
			removeEventListener(Event.ENTER_FRAME,_myObject.enterFrameHandler);
		}
		
		public function setEventMouseClick(_myButton:Object,_myObject:Object):void
		{
			_myButton.addEventListener(MouseEvent.CLICK, _myObject.mouseEventHandler);
			_myButton.addEventListener(MouseEvent.ROLL_OUT, _myObject.mouseEventHandler);
			_myButton.addEventListener(MouseEvent.ROLL_OVER, _myObject.mouseEventHandler);
			_myButton.buttonMode = true;
		}
		
		public function setEventMouseDrag_Drop(_myButton:Object,_myObject:Object):void
		{
			_myButton.addEventListener(MouseEvent.MOUSE_UP, _myObject.mouseEventHandler);
			_myButton.addEventListener(MouseEvent.MOUSE_DOWN, _myObject.mouseEventHandler);
			_myButton.addEventListener(MouseEvent.ROLL_OUT, _myObject.mouseEventHandler);
			_myButton.addEventListener(MouseEvent.ROLL_OVER, _myObject.mouseEventHandler);
			_myButton.buttonMode = true;
		}
	}

}