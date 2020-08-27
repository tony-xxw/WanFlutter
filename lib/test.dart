import 'package:common_utils/common_utils.dart';

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

  print(
      "-------------------------------------width--------------------------------------------------");

  G g = G();
  g.a();
  g.b();
  g.c();
  print(
      "-------------------------------------width--------------------------------------------------");
}

abstract class Base {
  a() {
    print("base a()");
  }

  b() {
    print("base b()");
  }

  c() {
    print("base c()");
  }
}

class A extends Base {
  a() {
//    logutil.v("a.a()", tag: "wynne");
    print("a.a()");
    super.a();
  }

  b() {
//    logutil.v("a.b()", tag: "wynne");
    print("a.b()");
    super.b();
  }
}

class B extends Base {
  b() {
//    LogUtil.v("B.b()", tag: "Wynne");
    print("B.b()");
    super.b();
  }
}

class C extends Base {
  a() {
//    LogUtil.v("C.a()", tag: "Wynne");
    print("C.a()");
    super.a();
  }

  b() {
//    LogUtil.v("C.b()", tag: "Wynne");
    print("C.b()");
    super.b();
  }

  c() {
//    LogUtil.v("C.c()", tag: "Wynne");
    print("C.c()");
    super.c();
  }
}

class G extends B {}

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
