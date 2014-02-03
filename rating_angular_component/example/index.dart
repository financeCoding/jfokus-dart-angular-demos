import 'package:angular/angular.dart';
import 'package:ng_rating/rating.dart';

@MirrorsUsed(override: '*')
import 'dart:mirrors';

class ThisIsWhyYoureFat {
  String url;
  String title;
  int rating;
}

@NgController(
    selector: '[delicious]',
    publishAs: 'ctrl'
)
class Delicious {
  final List<ThisIsWhyYoureFat> menu = [
    new ThisIsWhyYoureFat()
      ..url = 'http://img.gawkerassets.com/img/18z0na9j7bvckjpg/ku-medium.jpg'
      ..title = "KFC's Deep Fried Soup",

    new ThisIsWhyYoureFat()
      ..url = 'http://img.gawkerassets.com/img/18etz6bz6933ajpg/ku-medium.jpg'
      ..title = 'Hot Beef Sundae',

    new ThisIsWhyYoureFat()
      ..url = 'http://img.gawkerassets.com/img/18exofhthngfljpg/ku-medium.jpg'
      ..title = 'Nacho Lasagna'
  ];
}

main() {
  ngBootstrap(module: new AngularModule()
    ..type(Delicious)
    ..type(RatingComponent)
  );
}