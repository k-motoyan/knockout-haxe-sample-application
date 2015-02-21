package ks.components;

import knockout.Knockout;
import ks.enums.EnumResource;
import ks.enums.EnumResource.RESOURCE;
import ks.view_models.LoginFormViewModel;

class LoginForm {

    public function new() {
        Knockout.components.register("login-form", {
            viewModel: { instance: new LoginFormViewModel() },
            template: EnumResource.toTemplate( RESOURCE.LOGIN_FORM )
        });
    }

}
