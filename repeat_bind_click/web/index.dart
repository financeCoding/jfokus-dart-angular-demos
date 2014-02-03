import 'package:angular/angular.dart';

@NgController(
    selector: '[cart]',
    publishAs: 'cart'
)
class Cart {
  List<String> items = [];
  String newItem = '';

  void add() {
    items.add(newItem);
    newItem = '';
  }

  void delete(int index) {
    items.removeAt(index);
  }
}

main() {
  ngBootstrap(module: new AngularModule()
    ..type(Cart)
  );
}