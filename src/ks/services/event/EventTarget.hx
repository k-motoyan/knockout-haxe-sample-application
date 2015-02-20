package ks.services.event;

import js.html.Event;

interface EventTarget {

    public function dispatch(?data: Dynamic): Void;

    public function on(listener: (Void -> Dynamic) -> Event -> Void, ?useCaputur: Bool): Void;

    public function off(listener: Dynamic -> Void): Void;

}
