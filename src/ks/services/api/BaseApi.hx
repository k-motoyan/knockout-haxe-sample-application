package ks.services.api;

typedef BaseResponse = {
    status: String,
    message: String,
    data: Dynamic
}

class BaseApi {

    function baseDoneCallBack(response: BaseResponse): Void {
        trace(response);
    }

    function baseFailCallBack(err: Dynamic): Void {
        trace(err);
    }

    function baseAlwaysCallBack(): Void {
    }

}
