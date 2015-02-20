package ks.services.api;

interface RestApi {

    public function get(params: Dynamic, ?done_cb: Dynamic -> Void, ?fail_cb: Dynamic -> Void, ?always_cb: Void -> Void): Void;

    public function post(params: Dynamic, ?done_cb: Dynamic -> Void, ?fail_cb: Dynamic -> Void, ?always_cb: Void -> Void): Void;

    public function patch(params: Dynamic, ?done_cb: Dynamic -> Void, ?fail_cb: Dynamic -> Void, ?always_cb: Void -> Void): Void;

    public function delete(params: Dynamic, ?done_cb: Dynamic -> Void, ?fail_cb: Dynamic -> Void, ?always_cb: Void -> Void): Void;

}