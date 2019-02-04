import 'package:angular/angular.dart';

import "nav_info.dart";

@Component(
  selector: 'roma-login',
  templateUrl: 'login_component.html',
  styleUrls: ['login_component.css'],
  directives: [coreDirectives],
)
class LoginComponent {
  @Input()
  NavInfo navInfo;
}