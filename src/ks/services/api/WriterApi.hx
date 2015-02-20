package ks.services.api;

import ks.services.api.BaseApi.BaseResponse;
import jQuery.JQueryStatic;

typedef WriterApiGetParam = {
    id: Int
}

class WriterApi extends BaseApi implements RestApi {

    var resouce: String = "/api/writer/";

    public function new() {
    }

    public function get(params    : WriterApiGetParam,
                        ?done_cb  : BaseResponse -> Void = null,
                        ?fail_cb  : Dynamic      -> Void = null,
                        ?always_cb: Void         -> Void = null): Void {
        var id = Std.string(params.id);
        var done   = if (done_cb   != null) done_cb   else baseDoneCallBack;
        var fail   = if (fail_cb   != null) fail_cb   else baseFailCallBack;
        var always = if (always_cb != null) always_cb else baseAlwaysCallBack;

        JQueryStatic.getJSON('${resouce}${id}.json', {}).done(done).fail(fail).always(always);
    }

    public function post(params   : Dynamic,
                        ?done_cb  : Dynamic -> Void = null,
                        ?fail_cb  : Dynamic -> Void = null,
                        ?always_cb: Void    -> Void = null): Void {
        trace("This method is imcompatible.");
    }

    public function patch(params   : Dynamic,
                         ?done_cb  : Dynamic -> Void = null,
                         ?fail_cb  : Dynamic -> Void = null,
                         ?always_cb: Void    -> Void = null): Void {
        trace("This method is imcompatible.");
    }

    public function delete(params   : Dynamic,
                          ?done_cb  : Dynamic -> Void = null,
                          ?fail_cb  : Dynamic -> Void = null,
                          ?always_cb: Void    -> Void = null): Void {
        trace("This method is imcompatible.");
    }

}
