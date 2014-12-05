import mx.events.*;

class com.Wyeth.Torisel.ToriselAccordion extends MovieClip {
	public var _currentLeaf:Object;
	private var displayList:Array;
	public static var spacer:Number=5;
	public static var _instance;
	
	public function ToriselAccordion() {
		trace("MAKE ACCORDION");
		_instance=this;
		displayList=new Array();
		var j:Number = 0-1;
		/////////////////////////////////////////////////////////////
		// Get number of leaves in Accordion
		/////////////////////////////////////////////////////////////
		for (var i:String in this){
			if (typeof (this[i]) == "movieclip") {
				j++;
				trace(i);
				// arrange position of leaf clips
				this[i]._y = (this[i].bar._height+spacer)*j;
				// store leaf clips
				displayList.push(this[i]);
				
				this[i].bar.onRelease = function() {
					this._parent.ro._visible=false;
					if(this._parent._parent._currentLeaf != undefined && this._parent != this._parent._parent._currentLeaf){
						// close a leaf that is already open
						this._parent._parent._currentLeaf.deselectLeaf();
					}
					this._parent._parent._currentLeaf=this._parent;
					this._parent.selectLeaf();
					this._parent._parent.updateDisplay();
				};
				
			}
		}
	}
	public static function get instance():ToriselAccordion{
		return _instance;
	}
	/*
	public static function get currentLeaf():Object{
		return _currentLeaf;
	}
	*/
	public function updateDisplay(){
		/////////////////////////////////////////////////////////////
		// Update position of leaves
		/////////////////////////////////////////////////////////////
		for(var obj:String in displayList){
			trace(displayList[obj]);
			displayList[obj].resetPosition(_currentLeaf);
		}
	}
}