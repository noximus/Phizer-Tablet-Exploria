import com.mosesSupposes.fuse.*;
import flash.display.*;
import flash.text.*;
import ChartTab;

class ReactionBtn extends MovieClip {

	public var text:String;
	public var index:Number;
	private var reaction_text:TextField;
	private var bg:MovieClip;
	private static var lastClicked:MovieClip=null;
	private static var _current:Object;

	public function ReactionBtn() {

		reaction_text.reaction.text = text;
		this.onRelease = function() {
			showData();
		};
	}
	public function showData() {
		enabled = false;
		trace("LAST CLICKED: "+lastClicked);
		if (lastClicked) {
			
			lastClicked.gotoAndPlay("yellow");
			lastClicked.enabled = true;
		}

		var p:MovieClip = _parent.attachMovie("page_"+index, "page_"+index, _parent.getNextHighestDepth(), {_x:326, _y:77, _alpha:0});
		_current = p;
		//p.c_34._alpha=0;
		switch (ChartTab.whatIs){
			case "btn_34":
			p.c_all._alpha=0;
			break;
			
			default:
			p.c_34._alpha=0;
		}
		
		if (lastClicked) {
			ZigoEngine.doTween(p,"_alpha",100,1,null,0,{scope:_parent["page_"+lastClicked.index], func:"removeMovieClip"});
		} else {
			ZigoEngine.doTween(p,"_alpha",100,1);
		}

		gotoAndPlay("blue");

		lastClicked = this;

	}
	public static function get currentClip():Object{
		return _current;
	}


}