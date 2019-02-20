import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';

import 'user_data.dart';

class QuestionnaireService {
  var _questions = {
    1 : 'The only time I’m certain my child loves me is when he or she is smiling at me.',
    2 : 'I always know what my child wants.',
    3 : 'I like to think about the reasons behind the way my child behaves and feels.',
    4 : 'My child cries around strangers to embarrass me.',
    5 : 'I can completely read my child’s mind.',
    6 : 'I wonder a lot about what my child is thinking and feeling.',
    7 : 'I find it hard to actively participate in make believe play with my child.',
    8 : 'I can always predict what my child will do.',
    9 : 'I am often curious to find out how my child feels.',
    10: 'My child sometimes gets sick to keep me from doing what I want to do.',
    11: 'I can sometimes misunderstand the reactions of my child.',
    12: 'I try to see situations through the eyes of my child.',
    13: 'When my child is fussy he or she does that just to annoy me.',
    14: 'I always know why I do what I do to my child.',
    15: 'I try to understand the reasons why my child misbehaves.',
    16: 'Often, my child’s behavior is too confusing to bother figuring out.',
    17: 'I always know why my child acts the way he or she does.',
    18: 'I believe there is no point in trying to guess what my child feels.'
  };

  var _choices = ['-3', '-2', '-1', '0', '+1', '+2', '+3'];

  Map<int, String> getQuestions() {
    return _questions;
  }

  List<String> getChoices() {
    return _choices;
  }

  void saveAnswers(UserData userData) async {
    var uid = auth().currentUser.uid;
    if (uid == null) {
      return;
    }
    await firestore().collection('users').doc(uid).set(userData.toMap());
  }

  Future<List<UserData>> getAllAnswers() async {
    List<UserData> allAnswers = List<UserData>();

    var uid = auth().currentUser.uid;
    if (uid == null) {
      return allAnswers;
    }
    
    var snapshot = await firestore().collection('users').get();
    for (var doc in snapshot.docs) {
      var data = doc.data();
      allAnswers.add(UserData(data['name'], data['email'], data['answers'].cast<String>()));
    }
    return allAnswers;
  }
}
