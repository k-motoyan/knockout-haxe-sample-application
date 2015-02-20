package ks.components;

import ks.data.Writer;
import ks.enums.EnumResource;
import ks.enums.EnumResource.RESOURCE;
import knockout.Knockout;
import ks.view_models.BlogWriterViewModel;

class BlogWriter {

    public function new(data: Writer) {
        Knockout.components.register("blog-writer", {
            viewModel: { instance: new BlogWriterViewModel(data) },
            template: EnumResource.toTemplate( RESOURCE.BLOG_WRITER )
        });
    }

}
