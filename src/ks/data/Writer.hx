package ks.data;

class Writer {

    @:isVar public var id(get, set): Int;
    function get_id() return id;
    function set_id(id) return this.id = id;

    @:isVar public var name(get, set): String;
    function get_name() return name;
    function set_name(name) return this.name = name;

    @:isVar public var profile(get, set): String;
    function get_profile() return profile;
    function set_profile(profile) return this.profile = profile;

    @:isVar public var top_blog_id(get, set): Int;
    function get_top_blog_id() return top_blog_id;
    function set_top_blog_id(top_blog_id) return this.top_blog_id = top_blog_id;

    @:isVar public var wiki_link(get, set): String;
    function get_wiki_link() return wiki_link;
    function set_wiki_link(wiki_link) return this.wiki_link = wiki_link;

    public function new(data: Dynamic) {
        id = data.id;
        name = data.name;
        profile = data.profile;
        top_blog_id = data.top_blog_id;
        wiki_link = data.wiki_link;
    }

}
