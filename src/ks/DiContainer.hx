package ks;

class DiContainer {

    var container: Map<String, Void -> Dynamic>;

    var shared_objects: Map<String, Dynamic>;

    function new() {
        container = new Map();
        shared_objects = new Map();
    }

    public function register(key: String, cb: Void -> Dynamic): Void {
        if (container.exists(key)) {
            throw "Already exists key in container.";
        }
        container.set(key, cb);
    }

    public function make(key: String): Dynamic {
        if (!container.exists(key)) {
            throw "Not found key in container.";
        }
        return container.get(key)();
    }

    public function share(key: String): Dynamic {
        if (!shared_objects.exists(key)) {
            shared_objects.set(key, make(key));
        }
        return shared_objects.get(key);
    }

    static var instance: DiContainer;

    public static function getInstance(): DiContainer {
        if (Type.typeof(instance) == TNull) {
            instance = new DiContainer();
        }
        return instance;
    }

}
