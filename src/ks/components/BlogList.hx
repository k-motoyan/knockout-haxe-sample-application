package ks.components;

import ks.enums.EnumResource;
import ks.enums.EnumResource.RESOURCE;
import knockout.Knockout;
import ks.data.BlogItems.BlogListItem;
import ks.view_models.BlogListViewModel;

class BlogList {

    public function new(writer_id: Int, data: Array<BlogListItem>) {
        Knockout.components.register("blog-list", {
            viewModel: { instance: new BlogListViewModel(writer_id, data) },
            template: EnumResource.toTemplate( RESOURCE.BLOG_LIST )
        });
    }

}
