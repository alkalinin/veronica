import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'login_component.dart';
import 'nav_flags.dart';
import 'route_paths.dart';

@Component(
  selector: 'roma-nav',
  templateUrl: 'nav_component.html',
  styleUrls: ['nav_component.css'],
  directives: [coreDirectives, routerDirectives, LoginComponent],
  exports: [RoutePaths]
)
class NavComponent {
  NavFlags flags = NavFlags(false);

  void onLogin() {
    print('AAA');
    flags.isLoginActive = true;
  }
}