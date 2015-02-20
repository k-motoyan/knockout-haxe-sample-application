package ks.services.event;

import ks.enums.EnumEvent;
import ks.enums.EnumEvent.EVENT_KEY;
import js.Browser;
import js.html.Event;

class SwitchBlogContentEvent extends BaseEvent implements EventTarget {

    public function new() {
        super(EVENT_KEY.SWITCH_BLOG_CONTENT);
    }

    public function dispatch(?data: Null<Dynamic> = null): Void {
        this.data = if (data == null) {} else data;
        Browser.window.dispatchEvent(event);
    }

    public function on(listener: (Void -> Dynamic) -> Event -> Void, ?useCaputur = false): Void {
        Browser.window.addEventListener(EnumEvent.to_s(EVENT_KEY.SWITCH_BLOG_CONTENT), listener.bind(getBindData), useCaputur);
    }

    public function off(listener: Dynamic -> Void): Void {
        Browser.window.removeEventListener(EnumEvent.to_s(EVENT_KEY.SWITCH_BLOG_CONTENT), listener);
    }

}
