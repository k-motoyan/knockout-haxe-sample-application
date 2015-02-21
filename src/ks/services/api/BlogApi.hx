package ks.services.api;

import ks.services.api.BaseApi.BaseResponse;
import jQuery.JQueryStatic;

typedef BlogApiGetParam = {
    writer_id: Int,
    ?blog_id: Int
}

class BlogApi extends BaseApi implements RestApi {

    var resouce: String;

    public function new() {
        resouce = '$base_resouce_path/writer/:writer_id/blog';
    }

    public function get(params    : BlogApiGetParam,
                        ?done_cb  : BaseResponse -> Void = null,
                        ?fail_cb  : Dynamic      -> Void = null,
                        ?always_cb: Void         -> Void = null): Void {
        var done   = if (done_cb   != null) done_cb   else baseDoneCallBack;
        var fail   = if (fail_cb   != null) fail_cb   else baseFailCallBack;
        var always = if (always_cb != null) always_cb else baseAlwaysCallBack;

        JQueryStatic.getJSON(makeResouceUrl(params), {}).done(done).fail(fail).always(always);
    }

    public function post(params   : Dynamic,
                        ?done_cb  : Dynamic -> Void = null,
                        ?fail_cb  : Dynamic -> Void = null,
                        ?always_cb: Void    -> Void = null): Void {
        #if DEBUG
        trace("This method is imcompatible.");
        #end
    }

    public function patch(params   : Dynamic,
                         ?done_cb  : Dynamic -> Void = null,
                         ?fail_cb  : Dynamic -> Void = null,
                         ?always_cb: Void    -> Void = null): Void {
        #if DEBUG
        trace("This method is imcompatible.");
        #end
    }

    public function delete(params   : Dynamic,
                          ?done_cb  : Dynamic -> Void = null,
                          ?fail_cb  : Dynamic -> Void = null,
                          ?always_cb: Void    -> Void = null): Void {
        #if DEBUG
        trace("This method is imcompatible.");
        #end
    }

    inline function makeResouceUrl(?params: BlogApiGetParam): String {
        var url = StringTools.replace(resouce, ":writer_id", Std.string(params.writer_id));

        // When list access.
        if (Type.typeof(params.blog_id) == TNull) {
            return url + ".json";
        }

        // When single item access.
        var id = Std.string(params.blog_id);
        return url + '/${id}.json';
    }

}
