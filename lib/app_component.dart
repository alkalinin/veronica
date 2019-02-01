import 'package:angular/angular.dart';

import 'src/nav_component.dart';
import 'src/aside_component.dart';
import 'src/welcome_component.dart';
import 'src/questionnaire_component.dart';

@Component(
  selector: 'roma-app',
  templateUrl: 'app_component.html',
  styleUrls: ['app_component.css'],
  directives: [coreDirectives, NavComponent, AsideComponent, WelcomeComponent, QuestionnaireComponent]
)
class AppComponent {
  final title = 'Veronica Romanesco Project';
}
