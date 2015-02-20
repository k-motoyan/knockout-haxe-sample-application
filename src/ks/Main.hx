package ks;

import ks.components.BlogList;
import ks.components.BlogWriter;
import ks.data.Blog;
import ks.data.BlogItems;
import ks.data.Writer;
import ks.components.BlogHeader;
import ks.components.BlogSwitchMenu;
import ks.components.BlogContent;
import ks.services.api.BaseApi.BaseResponse;
import ks.services.api.BlogApi;
import ks.services.api.WriterApi;
import ks.services.event.InitBlogMenuEvent;
import ks.services.event.SwitchBlogMenuEvent;
import ks.services.event.SwitchBlogContentEvent;
import ks.Service;
import knockout.Knockout;
import jQuery.JQuery;

class Main {

    inline static function registerServices(): Void {
        // register api services.
        Service.registerApi(SERVICE_API.BLOG, function() {
            return new BlogApi();
        });
        Service.registerApi(SERVICE_API.WRITER, function() {
            return new WriterApi();
        });

        // register event services.
        Service.registerEvent(SERVICE_EVENT.BLOG_INIT_MENU, function() {
            return new InitBlogMenuEvent();
        });
        Service.registerEvent(SERVICE_EVENT.BLOG_SWITCH_MENU, function() {
            return new SwitchBlogMenuEvent();
        });
        Service.registerEvent(SERVICE_EVENT.BLOG_SWITCH_CONTENT, function() {
            return new SwitchBlogContentEvent();
        });
    }

    inline static function boot(): Void {
        var writer_api = Service.getApi(SERVICE_API.WRITER);
        var blog_api = Service.getApi(SERVICE_API.BLOG);

        writer_api.get({ id: 1 }, function(res: BaseResponse) {
            var writer = new Writer(res.data);

            new BlogWriter(writer);

            blog_api.get({ writer_id: writer.id, blog_id: writer.top_blog_id }, function(res: BaseResponse) {
                var blog = new Blog(res.data);

                new BlogHeader(blog);
                new BlogSwitchMenu();
                new BlogContent(blog);

                blog_api.get({ writer_id: writer.id }, function(res: BaseResponse) {
                    var blog_list = new BlogItems(res.data);

                    new BlogList(writer.id, blog_list.items);

                    Knockout.applyBindings({});
                });
            });
        });
    }

    static function main() {
        new JQuery(function() {
            registerServices();
            boot();
        });
    }

}
