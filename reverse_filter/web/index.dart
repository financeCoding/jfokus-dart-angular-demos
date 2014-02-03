import 'package:angular/angular.dart';

@NgFilter(name: 'reverse')
class Reverser {
  String call(String input) {
    if (input == null) return '';
    return input.split('').reversed.join('');
  }
}

main() {
  ngBootstrap(module: new AngularModule()
    ..type(Reverser)
  );
}