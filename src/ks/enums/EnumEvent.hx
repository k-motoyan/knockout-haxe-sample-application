package ks.enums;

enum EVENT_KEY {
    INIT_BLOG_MENU;
    SWITCH_BLOG_MENU;
    SWITCH_BLOG_CONTENT;
    LOGINED;
    LOGOUTED;
}

class EnumEvent {

    public static function to_s(key: EVENT_KEY): String {
        return switch(key) {
            case EVENT_KEY.INIT_BLOG_MENU: "initialize-blog-menu";
            case EVENT_KEY.SWITCH_BLOG_MENU: "switch-blog-menu";
            case EVENT_KEY.SWITCH_BLOG_CONTENT: "switch-blog-content";
            case EVENT_KEY.LOGINED: "logined";
            case EVENT_KEY.LOGOUTED: "logouted";
        }
    }

}
