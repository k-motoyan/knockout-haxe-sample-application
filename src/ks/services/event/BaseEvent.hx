package ks.services.event;

import js.Browser;
import js.html.Event;
import ks.enums.EnumEvent;
import ks.enums.EnumEvent.EVENT_KEY;

class BaseEvent {

    var event: Event;

    var key: String;

    var data: Dynamic;

    public function new(e: EVENT_KEY, ?type: String = "CustomEvent", ?bubbles: Bool = false, ?cancelable: Bool = true) {
        key = EnumEvent.to_s(e);
        event = Browser.document.createEvent(type);
        event.initEvent(key, bubbles, cancelable);
    }

    function getBindData(): Dynamic {
        return data;
    }

}
