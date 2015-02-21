package ks.view_models;

import js.html.Event;
import ks.Service.SERVICE_EVENT;
import jQuery.JQuery;

class LoginFormViewModel {

    var login: LoginFormViewModel -> Event -> Void;

    public function new() {
        login = dispatchLogined;

        untyped new JQuery("#login-modal").modal();
    }

    inline function dispatchLogined(self: LoginFormViewModel, e: Event) {
        untyped new JQuery("#login-modal").modal("hide");
        Service.getEvent(SERVICE_EVENT.LOGINED).dispatch();
    }

}
