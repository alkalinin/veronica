import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

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
}
