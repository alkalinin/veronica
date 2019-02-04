import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/auth_service.dart';
import 'src/nav_component.dart';
import 'src/aside_component.dart';
import 'src/route_paths.dart';
import 'src/routes.dart';

@Component(
  selector: 'roma-app',
  templateUrl: 'app_component.html',
  styleUrls: ['app_component.css'],
  directives: [coreDirectives, routerDirectives, NavComponent, AsideComponent],
  exports: [RoutePaths, Routes],
  providers: [ClassProvider(AuthService)]
)
class AppComponent {
  final title = 'Veronica Romanesco Project';
}
