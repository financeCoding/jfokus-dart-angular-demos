import 'package:angular/angular.dart';

class Person {
  String name;
}

@NgController(
    selector: '[person]',
    publishAs: 'ctrl'
)
class Controller {
  Person person = new Person();

  Controller() {
    person.name = 'Bob';
  }
}

main() {
  ngBootstrap(module: new AngularModule()
    ..type(Controller)
  );
}