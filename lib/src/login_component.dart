import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:firebase/firebase.dart' as fb;

import "nav_info.dart";
import "user_service.dart";

@Component(
  selector: 'roma-login',
  templateUrl: 'login_component.html',
  styleUrls: ['login_component.css'],
  directives: [coreDirectives, formDirectives],
)
class LoginComponent {
  @Input()
  NavInfo navInfo;
  UserService _userService;

  String email;
  String password;

  LoginComponent(this._userService);

  void login() async {
    print(email);
    print(password);

    final fb.Auth auth = fb.auth();

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        await auth.signInWithEmailAndPassword(email, password);
      } catch (e) {
        print(e.toString());
      }
    }
  }
}