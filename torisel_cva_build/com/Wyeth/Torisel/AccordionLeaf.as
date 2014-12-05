import mx.events.*;
import gs.TweenLite;
import gs.easing.*;


class com.Wyeth.Torisel.AccordionLeaf extends MovieClip {
	public var _activated:Boolean;
	public var _clipheight:Number;

	private var bar:MovieClip;
	private var dd:MovieClip;
	private var aw:MovieClip;
	private var msk:MovieClip;
	private var startY:Number;
	private var ro:MovieClip;
	
	private var spacer:Number=5;

	public function AccordionLeaf() {

		_activated = false;
		_clipheight = msk._height-bar._height;
		msk._height = bar._height;
		startY = this._y;
		ro._visible = false;

		bar.onRollOver = function() {
			this._parent.ro._visible = true;
		};
		bar.onRollOut = function() {
			this._parent.ro._visible = false;
		};
		/*
		bar.onRelease = function() {
			this._parent.ro._visible=false;
			trace("CLICK: "+this._parent.ta.currentLeaf);
			if(this._parent.ta.currentLeaf != undefined && this._parent != this._parent.ta.currentLeaf){
				// close a leaf that is already open
				this._parent.deselectLeaf();
			}
			this._parent.ta._currentLeaf=this._parent;
			this._parent.selectLeaf();
			this._parent.ta.updateDisplay();
		//	ToriselAccordion.updateDisplay();
		};
		*/
	}
	public function get activated():Boolean {
		return _activated;
	}
	public function get clipHeight():Number {
		return _clipheight;
	}
	public function resetPosition(obj:Object) {
		if (this._y>obj._y && obj.activated) {
			TweenLite.to(this,.5,{_y:this.startY+obj.clipHeight-38+spacer, ease:Cubic.easeOut});
		} else {
			TweenLite.to(this,.5,{_y:this.startY, ease:Cubic.easeOut});
		}
	}
	public function selectLeaf() {
		if (this._activated) {
			deselectLeaf();
		} else {
			this._activated = true;
			TweenLite.to(this.aw,.3,{_rotation:90, ease:Cubic.easeOut});
			TweenLite.to(this.msk,.5,{_height:this._clipheight, ease:Cubic.easeOut});
			TweenLite.to(this.bar,.5,{tint:0xBCE4E5});
		}
	}
	public function deselectLeaf() {
		this._activated = false;
		TweenLite.to(this.aw,.3,{_rotation:0, ease:Cubic.easeOut});
		TweenLite.to(this.msk,.5,{_height:38, ease:Cubic.easeOut});
		TweenLite.to(this.bar,.5,{tint:null});
	}
}