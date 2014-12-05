import mx.events.*;

class com.Wyeth.Torisel.DrawLine extends MovieClip {
	private var lc:MovieClip;
	private var startHeight:Number;
	private var startWidth:Number;

	public function DrawLine() {
		startHeight = this._height;
		startWidth = this._width;

		_xscale = 100;
		_yscale = 100;


		onMouseDown = function () {
			if (_xmouse<=this.startWidth && _xmouse>0 && _ymouse>0 && _ymouse<=this.startHeight) {
				trace("INBOUNDS");
				this._parent.createEmptyMovieClip("lc",3000);
				this._parent.lc.lineStyle(3,0xFF9900);
				this._parent.lc.moveTo(this._parent._xmouse,this._parent._ymouse);
				this.onMouseMove = function () {
					if (_xmouse>this.startWidth || _xmouse<0 || _ymouse<0 || _ymouse>this.startHeight) {
						delete onMouseMove;
					} else {
						this._parent.lc.lineTo(this._parent._xmouse,this._parent._ymouse);
					}
				};
				this.onMouseUp = function() {
					trace("DELETE MOUSE MOVE");
					delete onMouseMove;
				};
			}else{
				delete this.onMouseUp;
			}
		};
	}
	public function reset() {
		trace("RESET NOW");
		this._parent.lc.clear();
	}
}