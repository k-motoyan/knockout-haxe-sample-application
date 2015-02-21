package ks;

import ks.services.event.LogoutedEvent;
import ks.components.LoginForm;
import ks.components.HeaderNav;
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
import ks.services.event.LoginedEvent;
import ks.Service;
import knockout.Knockout;
import jQuery.JQuery;
import jQuery.JQueryStatic;
import jQuery.Promise;

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
        Service.registerEvent(SERVICE_EVENT.LOGINED, function() {
            return new LoginedEvent();
        });
        Service.registerEvent(SERVICE_EVENT.LOGOUTED, function() {
            return new LogoutedEvent();
        });
    }

    inline static function boot(): Void {
        var writer_api = Service.getApi(SERVICE_API.WRITER);
        var blog_api = Service.getApi(SERVICE_API.BLOG);

        new HeaderNav();
        new LoginForm();

        registeBlogrWriterComponent()
            .then(registerBlogMainComponent, deferredOnError)
            .then(registerBlogSubComponent, deferredOnError)
            .then(function() { Knockout.applyBindings({}); }, deferredOnError);
    }

    inline static function registeBlogrWriterComponent(): Promise {
        var d = JQueryStatic.Deferred();

        Service.getApi(SERVICE_API.WRITER).get({ id: 1 }, function(res: BaseResponse) {
            var writer = new Writer(res.data);

            new BlogWriter(writer);

            d.resolve( writer );
        }, function(e) { d.reject(e); });

        return d.promise();
    }

    inline static function registerBlogMainComponent(writer: Writer): Promise {
        var d = JQueryStatic.Deferred();

        var request_params = { writer_id: writer.id, blog_id: writer.top_blog_id };

        Service.getApi(SERVICE_API.BLOG).get(request_params, function(res: BaseResponse) {
            var blog = new Blog(res.data);

            new BlogHeader(blog);
            new BlogSwitchMenu();
            new BlogContent(blog);

            d.resolve( writer );
        }, function(e) { d.reject(e); });

        return d.promise();
    }

    inline static function registerBlogSubComponent(writer: Writer): Promise {
        var d = JQueryStatic.Deferred();

        Service.getApi(SERVICE_API.BLOG).get({ writer_id: writer.id }, function(res: BaseResponse) {
            var blog_items = new BlogItems(res.data);

            new BlogList(writer.id, blog_items.items);

            d.resolve();
        }, function(e) { d.reject(e); });

        return d.promise();
    }

    inline static function deferredOnError(e: Dynamic): Void {
        if (Type.typeof(e) != TNull) {
            trace(e);
        }
    }

    static function main() {
        new JQuery(function() {
            registerServices();
            boot();
        });
    }

}
