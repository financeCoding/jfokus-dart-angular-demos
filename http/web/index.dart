import 'package:angular/angular.dart';
import 'dart:async';

@MirrorsUsed(override:'*')
import 'dart:mirrors';

class User {
  String username;

  User.fromJson(Map json) {
    username = json['username'];
  }

  Map toJson() {
    return {'username' : username};
  }
}

@NgInjectableService()
class Users {
  Http http;
  List<User> users;

  Users(this.http);

  Future<List<User>> getUsers() {
    if (users != null) return new Future.value(users);

    return http.get('users.json').then((resp) {
      users = (resp.data as List).map((u) => new User.fromJson(u)).toList();
      return users;
    });
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

  Login(this.users);

  void check() {
    users.getUsers().then((users) {
      isAuthenticated = users.map((u) => u.username).contains(username);
    });
  }
}

main() {
  ngBootstrap(module: new AngularModule()
    ..type(Login)
    ..type(Users)
  );
}