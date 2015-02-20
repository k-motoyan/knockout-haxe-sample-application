package ks.components;

import ks.data.Blog;
import ks.enums.EnumResource;
import ks.enums.EnumResource.RESOURCE;
import knockout.Knockout;
import ks.view_models.BlogHeaderViewModel;

class BlogHeader {

    public function new(data: Blog) {
        Knockout.components.register("blog-header", {
            viewModel: { instance: new BlogHeaderViewModel(data) },
            template: EnumResource.toTemplate( RESOURCE.BLOG_HEADER )
        });
    }

}
