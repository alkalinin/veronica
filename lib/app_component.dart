import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/firebase_service.dart';
import 'src/user_service.dart';
import 'src/questionnaire_service.dart';
import 'src/nav_component.dart';
import 'src/aside_component.dart';
import 'src/login_component.dart';
import 'src/route_paths.dart';
import 'src/routes.dart';

@Component(
  selector: 'roma-app',
  templateUrl: 'app_component.html',
  styleUrls: ['app_component.css'],
  directives: [coreDirectives, routerDirectives, NavComponent, AsideComponent, LoginComponent],
  exports: [RoutePaths, Routes],
  providers: [ClassProvider(FirebaseService), ClassProvider(UserService), ClassProvider(QuestionnaireService)]
)
class AppComponent {
  final title = 'Veronica Romanesco Project';

  final FirebaseService _firebaseService;

  AppComponent(this._firebaseService);
}
