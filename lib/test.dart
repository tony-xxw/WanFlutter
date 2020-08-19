void main() {
  sayHello("嘿嘿");
  print("匿名闭包函数${makeAddre(3)(2).toString()}");
  var variable = 1;
  variable ??= 10;
  var variableObj;
  variableObj?.type = 10;
  print("测试?. ${variableObj}");
  print("测试??=语法糖${variable}");

  var logger = Logger("UI");
  logger.log("Button Clicked");

  List<String> list;

  print(list?.length ?? -1);
}

abstract class Parent {
  void action();
}

class Childen extends Parent {
  @override
  void action() {
    // TODO: implement action
  }
}

void sayHello(weight, [age, name = 'xxw']) {
  print("wynne ${weight} + name ${name}");
}

Function makeAddre(num age) {
  return (num i) => (age + i);
}

class Logger {
  final String name;
  bool mute = false;

  //字面量参数化
  static final Map<String, Logger> _cache = <String, Logger>{};
  static final List<String> _list = <String>["1"];
  static final Set<String> _set = <String>{"1"};

  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final logger = Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
    print(name);
  }
}
