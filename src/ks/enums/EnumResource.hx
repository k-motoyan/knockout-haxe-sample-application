package ks.enums;

import haxe.Resource;

enum RESOURCE {
    BLOG_HEADER;
    BLOG_CONTENT;
    BLOG_SWITCH_MENU;
    BLOG_WRITER;
    BLOG_LIST;
}

class EnumResource {

    public static function toTemplate(resouce: RESOURCE): String {
        return switch(resouce) {
            case RESOURCE.BLOG_HEADER: Resource.getString("blog-header");
            case RESOURCE.BLOG_CONTENT: Resource.getString("blog-content");
            case RESOURCE.BLOG_SWITCH_MENU: Resource.getString("blog-switch-menu");
            case RESOURCE.BLOG_WRITER: Resource.getString("blog-writer");
            case RESOURCE.BLOG_LIST: Resource.getString("blog-list");
        }
    }

}
