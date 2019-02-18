import 'package:angular/angular.dart';

import "user_data.dart";
import 'questionnaire_service.dart';

@Component(
  selector: 'roma-results',
  templateUrl: 'results_component.html',
  styleUrls: ['results_component.css'],
  directives: [coreDirectives]
)
class ResultsComponent implements OnInit {
  final QuestionnaireService _questionnaireService;
  List<UserData> usersData;

  ResultsComponent(this._questionnaireService);

  @override
  void ngOnInit() async {
    usersData = await _questionnaireService.getAllAnswers();
  }
}