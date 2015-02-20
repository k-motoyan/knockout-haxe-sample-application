package ks.components;

import ks.enums.EnumResource;
import ks.enums.EnumResource.RESOURCE;
import knockout.Knockout;
import ks.view_models.BlogSwitchMenuViewModel;

class BlogSwitchMenu {

    public function new() {
        Knockout.components.register("blog-switch-menu", {
            viewModel: { instance: new BlogSwitchMenuViewModel() },
            template: EnumResource.toTemplate( RESOURCE.BLOG_SWITCH_MENU )
        });
    }

}
