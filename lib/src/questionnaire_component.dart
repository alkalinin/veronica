import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import 'user_data.dart';
import 'user_service.dart';
import 'questionnaire_service.dart';
import 'route_paths.dart';
import 'routes.dart';

@Component(
  selector: 'roma-questionnaire',
  templateUrl: 'questionnaire_component.html',
  styleUrls: ['questionnaire_component.css'],
  directives: [coreDirectives, formDirectives, routerDirectives],
  exports: [RoutePaths, Routes]
)
class QuestionnaireComponent implements OnInit {
  final QuestionnaireService _questionnaireService;
  final UserService _userService;

  Map<int, String> questions;
  List<String> choices;

  int page = 0;
  UserData userData = UserData.empty();

  bool isCompleted = false;

  QuestionnaireComponent(this._questionnaireService, this._userService);

  void _init() {
    questions = _questionnaireService.getQuestions();
    choices = _questionnaireService.getChoices();
    userData.answers = List(questions.length);
  }

  void ngOnInit() => _init();

  void onNext() => ++page;
  
  void onPrev() => --page;

  void onAnswer(String answer) {
    userData.answers[page - 1] = answer;
  }

  void onResults() async {
    isCompleted = true;

    await _userService.signInAnonymously();
    await _questionnaireService.saveAnswers(userData);
    await _userService.signOut();
  }

  bool isPrevDisabled() {
    return page == 0;
  }

  bool isNextDisabled() {
    return (page == questions.length) || ((page > 0) && (userData.answers[page - 1] == null));
  }

  bool isResultsButtonVisible() {
    return ! userData.answers.contains(null);
  }

  bool isQuestionnareVisible() {
    return (! isCompleted) && (! _userService.isAuthorizedAdmin());
  }

  bool isResultsVisible() {
    return isCompleted && (! _userService.isAuthorizedAdmin());
  }

  bool isAdminLinkVisible() {
    return _userService.isAuthorizedAdmin();
  }
}