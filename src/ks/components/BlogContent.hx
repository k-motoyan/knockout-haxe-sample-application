package ks.components;

import ks.data.Blog;
import ks.enums.EnumResource;
import ks.enums.EnumResource.RESOURCE;
import knockout.Knockout;
import ks.view_models.BlogContentViewModel;

class BlogContent {

    public function new(data: Blog) {
        Knockout.components.register("blog-content", {
            viewModel: { instance: new BlogContentViewModel(data) },
            template: EnumResource.toTemplate( RESOURCE.BLOG_CONTENT )
        });
    }

}
