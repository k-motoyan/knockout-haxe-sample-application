package ks.data;

typedef BlogListItem = {
    id: Int,
    title: String
}

class BlogItems {

    @:isVar public var items(get, null): Array<BlogListItem>;
    function get_items() return items;

    public function new(data: Dynamic) {
        items = data;
    }

}
