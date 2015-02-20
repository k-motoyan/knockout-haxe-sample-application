package ks.data;

class Blog {

    @:isVar public var id(get, set): Int;
    function get_id() return id;
    function set_id(id) return this.id = id;

    @:isVar public var title(get, set): String;
    function get_title() return title;
    function set_title(title) return this.title = title;

    @:isVar public var content(get, set): String;
    function get_content() return content;
    function set_content(content) return this.content = content;

    @:isVar public var date(get, set): String;
    function get_date() return date;
    function set_date(date) return this.date = date;

    public function new(data: Dynamic) {
        id = data.id;
        title = data.title;
        content = data.content;
        date = data.date;
    }

}
