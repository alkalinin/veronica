import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'user_service.dart';
import 'route_paths.dart';
import 'routes.dart';

@Component(
  selector: 'roma-aside',
  templateUrl: 'aside_component.html',
  styleUrls: ['aside_component.css'],
  directives: [coreDirectives, routerDirectives],
  exports: [RoutePaths, Routes]

)
class AsideComponent {
  final UserService _userService;

  AsideComponent(this._userService);

  bool showAdminPanel() => _userService.isAuthorized();
}
