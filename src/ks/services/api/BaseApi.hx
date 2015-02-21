package ks.services.api;

typedef BaseResponse = {
    status: String,
    message: String,
    data: Dynamic
}

class BaseApi {

    #if DEPLOY
    var base_resouce_path = "/knockout-haxe-sample/api";
    #else
    var base_resouce_path = "/api";
    #end

    function baseDoneCallBack(response: BaseResponse): Void {
        trace(response);
    }

    function baseFailCallBack(err: Dynamic): Void {
        trace(err);
    }

    function baseAlwaysCallBack(): Void {
    }

}
