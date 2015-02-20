package ks.view_models;

import knockout.Knockout;
import knockout.Observable;
import ks.data.Blog;
import ks.Service.SERVICE_EVENT;
import js.html.Event;

class BlogHeaderViewModel {

    var title: Observable<String>;

    var date: Observable<String>;

    public function new(data: Blog) {
        title = Knockout.observable(data.title);
        date = Knockout.observable(data.date);
        onPageChange();
    }

    inline function onPageChange(): Void {
        Service.getEvent(SERVICE_EVENT.BLOG_SWITCH_CONTENT).on(function(cb: Void -> Blog, e: Event) {
            var blog = cb();
            title.set(blog.title);
            date.set(blog.date);
        });
    }

}
