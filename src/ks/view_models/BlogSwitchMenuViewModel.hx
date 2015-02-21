package ks.view_models;

import knockout.Knockout;
import ks.Service.SERVICE_EVENT;
import knockout.Knockout;
import knockout.Observable;
import knockout.ObservableArray;
import js.html.Event;

class BlogSwitchMenuViewModel {

    var menu: ObservableArray<BlogSwitchMenuItem>;

    var visibility: Observable<Bool>;

    public function new() {
        menu = Knockout.observableArray([
            new BlogSwitchMenuItem("表示", true),
            new BlogSwitchMenuItem("編集", false)
        ]);
        visibility = Knockout.observable(false);

        onLogined();
        onLogouted();
    }

    inline function onLogined() {
        Service.getEvent(SERVICE_EVENT.LOGINED).on(function(cb: Void -> Dynamic, e: Event) {
            visibility.set(true);
        });
    }

    inline function onLogouted() {
        Service.getEvent(SERVICE_EVENT.LOGOUTED).on(function(cb: Void -> Dynamic, e: Event) {
            visibility.set(false);
        });
    }

}

class BlogSwitchMenuItem {

    var text: String;

    var is_active: Observable<Bool>;

    var switch_menu: BlogHeaderViewModel -> Event -> Void;

    public function new(text: String, active: Bool) {
        this.text = text;
        this.is_active = Knockout.observable(active);
        this.switch_menu = dispatchSwitch;

        onSwitchMenu();
        onInitMenu();
    }

    inline function onSwitchMenu() {
        Service.getEvent(SERVICE_EVENT.BLOG_SWITCH_MENU).on(function(cb, e) {
            is_active.set( !is_active.get() );
        });
    }

    inline function onInitMenu() {
        Service.getEvent(SERVICE_EVENT.BLOG_INIT_MENU).on(function(cb, e) {
            if (text == "表示") is_active.set(true);
            if (text == "編集") is_active.set(false);
        });
    }

    inline function dispatchSwitch(self: BlogHeaderViewModel, e: Event): Void {
        e.preventDefault();
        Service.getEvent(SERVICE_EVENT.BLOG_SWITCH_MENU).dispatch();
    }

}