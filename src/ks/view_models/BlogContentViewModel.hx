package ks.view_models;

import ks.data.Blog;
import ks.Service.SERVICE_API;
import ks.Service.SERVICE_EVENT;
import knockout.Knockout;
import knockout.Observable;
import js.html.Event;

class BlogContentViewModel {

    var id: Int;

    var content: Observable<String>;

    var editable: Observable<Bool>;

    var focused: Observable<Bool>;

    public function new(data: Blog) {
        id = data.id;
        content = Knockout.observable(data.content);
        editable = Knockout.observable(false);
        focused = Knockout.observable(false);
        onBlogMenuSwitched();
        onPageChange();

        content.subscribe(save);
    }

    inline function onBlogMenuSwitched() {
        Service.getEvent(SERVICE_EVENT.BLOG_SWITCH_MENU).on(function(data, event) {
            editable.set( !editable.get() );
            focused.set( !focused.get() );
        });
    }

    inline function onPageChange(): Void {
        Service.getEvent(SERVICE_EVENT.BLOG_SWITCH_CONTENT).on(function(cb: Void -> Blog, e: Event) {
            var blog = cb();
            Service.getEvent(SERVICE_EVENT.BLOG_INIT_MENU).dispatch();
            content.set(blog.content);
            editable.set(false);
            focused.set(false);
        });
    }

    inline function save(changedContent: String) {
        Service.getApi(SERVICE_API.BLOG).patch({ id: id, content: content.get() });
    }

}
