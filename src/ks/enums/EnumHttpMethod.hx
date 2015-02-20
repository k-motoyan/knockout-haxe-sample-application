package ks.enums;

enum HTTP_METHOD {
    GET;
    POST;
    PATCH;
    DELETE;
}

class EnumHttpMethod {

    public static function to_s(http_method: HTTP_METHOD): String {
        return switch(http_method) {
            case HTTP_METHOD.GET: "GET";
            case HTTP_METHOD.POST: "POST";
            case HTTP_METHOD.PATCH: "PATCH";
            case HTTP_METHOD.DELETE: "DELETE";
        }
    }

}
