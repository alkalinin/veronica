import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import "user_service.dart";

@Component(
  selector: 'roma-login',
  templateUrl: 'login_component.html',
  styleUrls: ['login_component.css'],
  directives: [coreDirectives, formDirectives],
)
class LoginComponent {
  UserService _userService;

  String email;
  String password;
  String error;

  LoginComponent(this._userService);

  void login() async {
    try {
      await _userService.signInWithEmailAndPassword(email, password);
      _userService.showLoginForm = false;
      error = null;
    } catch (e) {
      error = e.toString();
    }
  }

  bool isActive() => _userService.showLoginForm;

  void onClose() => _userService.showLoginForm = false;
}