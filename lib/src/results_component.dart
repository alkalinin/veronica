import 'dart:html';
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

  void onDownload() {
    String csv = Uri.encodeComponent(toCSV());
    AnchorElement(href: 'data:text/plain;charset=utf-8,${csv}')
      ..setAttribute('download', 'data.csv')
      ..click();
  }

  String toCSV() {
    var sb = StringBuffer();
    for (var userData in usersData) {
      sb.write('${userData.name},');
      sb.write('${userData.email},');
      for (var answer in userData.answers) {
        sb.write('${answer},');
      }
      sb.writeln();
    }

    return sb.toString();
  }
}