import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'user_service.dart';
import 'route_paths.dart';

@Component(
  selector: 'roma-nav',
  templateUrl: 'nav_component.html',
  styleUrls: ['nav_component.css'],
  directives: [coreDirectives, routerDirectives],
  exports: [RoutePaths]
)
class NavComponent {
  final UserService _userService;
  bool isBurgerMenuActive = false;

  NavComponent(this._userService);

  void onBurger() {
    isBurgerMenuActive = ! isBurgerMenuActive;
  }

  void onLogin() {
    _userService.showLoginForm = true;
  }
  
  void onLogout() {
    _userService.signOut();
  }

  bool isAuthorized() => _userService.isAuthorized();
}
