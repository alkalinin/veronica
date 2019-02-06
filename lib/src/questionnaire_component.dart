import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'user_service.dart';
import 'questionnaire_service.dart';

@Component(
  selector: 'roma-questionnaire',
  templateUrl: 'questionnaire_component.html',
  styleUrls: ['questionnaire_component.css'],
  directives: [coreDirectives, formDirectives],
  providers: [ClassProvider(QuestionnaireService)]
)
class QuestionnaireComponent implements OnInit {
  final Router _router;
  final QuestionnaireService _questionnaireService;
  final UserService _userService;

  int page = 0;
  Map questions;
  List<String> answers;
  String name;
  String email;
  String question;
  List<String> currentAnswers = [];

  QuestionnaireComponent(this._router, this._userService, this._questionnaireService);

  void _init() {
    questions = _questionnaireService.getQuestions();
    answers = _questionnaireService.getAnswers();
    currentAnswers.length = questions.length;
  }

  void ngOnInit() => _init();

  void onNext() => ++page;
  
  void onPrev() => --page;

  void onSelect(String answer) {
    currentAnswers[page - 1] = answer;
    _userService.saveAnswers();
  }

  Future<NavigationResult> gotoResults() => _router.navigate(RoutePaths.results.toUrl()); 
}