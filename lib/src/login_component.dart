import 'package:angular/angular.dart';

import "nav_flags.dart";

@Component(
  selector: 'roma-login',
  templateUrl: 'login_component.html',
  styleUrls: ['login_component.css'],
  directives: [coreDirectives],
)
class LoginComponent {
  @Input()
  NavFlags navFlags;
}