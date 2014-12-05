import com.mosesSupposes.fuse.*;
import flash.display.*;
import ReactionBtn;

class ChartTab extends MovieClip {
	private var btn_all:MovieClip;
	private var btn_34:MovieClip;

	private var t_all:MovieClip;
	private var t_34:MovieClip;
	private var _inclip:MovieClip;
	private var _outclip:MovieClip;

	public static var _currentTab:String;

	public function ChartTab() {
		ZigoEngine.simpleSetup(Shortcuts,Fuse,FuseItem);
		btn_all.btn.enabled = false;

		btn_all.onRelease = function() {
			this._parent._inclip = this;
			this._parent._outclip = this._parent.btn_34;
			this.enabled = false;
			
			this._parent.btn_34.enabled = true;
			this._parent.swapTabs()

			this._parent.t_all.alphaTo(100,1);
			this._parent.t_34.alphaTo(0,1);
			ReactionBtn.currentClip.c_all.alphaTo(100,1);
			ReactionBtn.currentClip.c_34.alphaTo(0,1);
		};
		btn_34.onRelease = function() {
			this._parent._inclip = this;
			this._parent._outclip = this._parent.btn_all;
			this.enabled = false;
			
			this._parent.btn_all.enabled = true;
			this._parent.swapTabs();

			this._parent.t_all.alphaTo(0,1);
			this._parent.t_34.alphaTo(100,1);
			ReactionBtn.currentClip.c_all.alphaTo(0,1);
			ReactionBtn.currentClip.c_34.alphaTo(01001);

		};
	}

	private function swapTabs():Void {
		_currentTab = _inclip._name;
		var f:Fuse = new Fuse();
		f.push({target:_inclip, _y:0, seconds:.5});
		f.push({target:_outclip, _y:-btn_all._height, seconds:.5});
		//f.push({func:clearClips});
		f.start();
	}

	public static function reset():Void {
		//do nothing
	}
	public static function get whatIs():String {
		return _currentTab;
	}

	private function clearClips():Void {
		trace("CLEAR CLIPS NOW");
		//_inclip=undefined;
		//_outclip=undefined;
	}

}