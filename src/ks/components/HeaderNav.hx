package ks.components;

import knockout.Knockout;
import ks.enums.EnumResource;
import ks.enums.EnumResource.RESOURCE;
import ks.view_models.HeaderNavViewModel;

class HeaderNav {

    public function new() {
        Knockout.components.register("header-nav", {
            viewModel: { instance: new HeaderNavViewModel() },
            template: EnumResource.toTemplate( RESOURCE.HEADER_NAV )
        });
    }

}
