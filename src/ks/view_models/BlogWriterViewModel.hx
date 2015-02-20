package ks.view_models;

import ks.data.Writer;

class BlogWriterViewModel {

    var id: Int;

    var name: String;

    var profile: String;

    var wiki_link: String;

    public function new(writer: Writer) {
        id = writer.id;
        name = writer.name;
        profile = writer.profile;
        wiki_link = writer.wiki_link;
    }

}
