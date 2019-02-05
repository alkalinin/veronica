import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'welcome_component.template.dart' as welcome_template;
import 'questionnaire_component.template.dart' as questionnaire_template;
import 'results_component.template.dart' as results_template;

class Routes {
  static final welcome = RouteDefinition(
    routePath: RoutePaths.welcome,
    component: welcome_template.WelcomeComponentNgFactory,
  );
  static final questionnaire = RouteDefinition(
    routePath: RoutePaths.questionnaire,
    component: questionnaire_template.QuestionnaireComponentNgFactory,
  );
  static final results = RouteDefinition(
    routePath: RoutePaths.results,
    component: results_template.ResultsComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    welcome,
    questionnaire,
    results,
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.welcome.toUrl(),
    )
  ];
}