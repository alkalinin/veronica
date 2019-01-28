import 'package:angular/angular.dart';

import 'src/questionnaire_component.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  styleUrls: ['app_component.css'],
  directives: [coreDirectives, QuestionnaireComponent]
)
class AppComponent {
  final title = 'Veronica Romanesco Project';
}
