package ks.view_models;

import knockout.Knockout;
import knockout.ObservableArray;
import ks.data.Blog;
import ks.data.BlogItems.BlogListItem;
import ks.Service;
import ks.services.api.BaseApi.BaseResponse;
import js.html.Event;

typedef BloglistItemViewModel = {>BlogListItem,
    move: BloglistItemViewModel -> Event -> Void
}

class BlogListViewModel {

    var writer_id: Int;

    var titles: ObservableArray<BloglistItemViewModel>;

    public function new(writer_id: Int, items: Array<BlogListItem>) {
        var child_view_models = [];
        for (item in items) {
            var view_model: BloglistItemViewModel = {
                id: item.id,
                title: item.title,
                move: pageChange
            };

            child_view_models.push(view_model);
        }

        this.writer_id = writer_id;
        titles = Knockout.observableArray(child_view_models);
    }

    inline function pageChange(self: BloglistItemViewModel, e: Event): Void {
        Service.getApi(SERVICE_API.BLOG).get({ writer_id: 1, blog_id: self.id }, function(res: BaseResponse) {
            Service.getEvent(SERVICE_EVENT.BLOG_SWITCH_CONTENT).dispatch(new Blog(res.data));
        });
    }

}
