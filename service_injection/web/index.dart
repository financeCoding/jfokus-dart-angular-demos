import 'package:angular/angular.dart';
import 'dart:async';

@MirrorsUsed(override:'*')
import 'dart:mirrors';

@NgInjectableService()
class Users {
  List<String> users = ['Bob', 'Alice'];

  Future<List<String>> getUsers() {
    // pretend it's a network request
    return new Future.value(users);
  }
}

@NgController(
    selector: '[login]',
    publishAs: 'login'
)
class Login {
  Users users;
  String username = '';
  bool isAuthenticated = false;
  bool checked = false;

  Login(this.users);

  void check() {
    users.getUsers().then((usernames) {
      checked = true;
      isAuthenticated = usernames.contains(username);
    });
  }
}

main() {
  ngBootstrap(module: new AngularModule()
    ..type(Login)
    ..type(Users)
  );
}