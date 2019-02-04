import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'auth_service.dart';
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
  final AuthService _authService;

  AsideComponent(this._authService);

  bool get auth => _authService.auth;
}
