package ks;

import ks.services.api.RestApi;
import ks.services.event.EventTarget;

enum SERVICE_EVENT {
    BLOG_INIT_MENU;
    BLOG_SWITCH_MENU;
    BLOG_SWITCH_CONTENT;
}

enum SERVICE_API {
    BLOG;
    WRITER;
}

class Service {

    public static function getEvent(service_key: SERVICE_EVENT, ?share: Bool = true): EventTarget {
        return get(event_to_s(service_key), share);
    }

    public static function registerEvent(service_key: SERVICE_EVENT, cb: Void -> EventTarget): Void {
        register(event_to_s(service_key), cb);
    }

    public static function getApi(service_key: SERVICE_API, ?share: Bool = true): RestApi {
        return get(api_to_s(service_key), share);
    }

    public static function registerApi(service_key: SERVICE_API, cb: Void -> RestApi): Void {
        register(api_to_s(service_key), cb);
    }

    static function get(key: String, share: Bool): Dynamic {
        var di = DiContainer.getInstance();
        return if (share) di.share(key) else di.make(key);
    }

    static function register(key: String, cb: Void -> Dynamic): Void {
        DiContainer.getInstance().register(key, cb);
    }

    static function event_to_s(event: SERVICE_EVENT): String {
        return switch(event) {
            case SERVICE_EVENT.BLOG_INIT_MENU: 'blog-initialize-menu-event';
            case SERVICE_EVENT.BLOG_SWITCH_MENU: 'blog-switch-menu-event';
            case SERVICE_EVENT.BLOG_SWITCH_CONTENT: 'blog-switch-content-event';
        }
    }

    static function api_to_s(api: SERVICE_API): String {
        return switch(api) {
            case SERVICE_API.BLOG: 'blog-api';
            case SERVICE_API.WRITER: 'writer-api';
        }
    }

}
