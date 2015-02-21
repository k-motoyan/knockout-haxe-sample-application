package ks.view_models;

import ks.Service.SERVICE_EVENT;
import knockout.Knockout;
import knockout.Observable;
import js.html.Event;

class HeaderNavViewModel {

    var identity: Observable<Bool>;

    var logout: HeaderNavViewModel -> Event -> Void;

    public function new() {
        identity = Knockout.observable(false);
        logout = dispatchLogout;
        onLogined();
    }

    inline function dispatchLogout(self: HeaderNavViewModel, e: Event): Void {
        identity.set(false);
        Service.getEvent(SERVICE_EVENT.LOGOUTED).dispatch();
    }

    inline function onLogined() {
        Service.getEvent(SERVICE_EVENT.LOGINED).on(function(cb, e: Event) {
            identity.set(true);
        });
    }

}
