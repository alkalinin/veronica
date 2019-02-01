import 'package:angular/angular.dart';

import 'questionnaire_service.dart';

@Component(
  selector: 'roma-questionnaire',
  templateUrl: 'questionnaire_component.html',
  styleUrls: ['questionnaire_component.css'],
  directives: [coreDirectives],
  providers: [ClassProvider(QuestionnaireService)]
)
class QuestionnaireComponent implements OnInit {
  final QuestionnaireService _questionnaireService;
  int page = 0;
  Map questions;
  List<String> answers;
  String question;
  List<String> currentAnswers = [];

  QuestionnaireComponent(this._questionnaireService);

  void _init() {
    questions = _questionnaireService.getQuestions();
    answers = _questionnaireService.getAnswers();
    currentAnswers.length = questions.length;
  }

  void ngOnInit() => _init();

  void onNext() => ++page;
  
  void onPrev() => --page;
}