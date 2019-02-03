import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';

@Component(
  selector: 'roma-welcome',
  templateUrl: 'welcome_component.html',
  styleUrls: ['welcome_component.css'],
  directives: [coreDirectives],
)
class WelcomeComponent {
  final Router _router;

  WelcomeComponent(this._router);

  Future<NavigationResult> gotoQuestionnaire() => _router.navigate(RoutePaths.questionnaire.toUrl()); 
}