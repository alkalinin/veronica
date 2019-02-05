import 'package:firebase/firebase.dart' as fb;

class UserService {
  bool isAuthorized = false;

  UserService() {
    initialize();
  }

  void initialize() {
    try {
      fb.initializeApp(
        apiKey: 'AIzaSyCOjTrMcjI_0PVGlUtoFGOJ9qnDLgJGbDw',
        authDomain: 'veronica-roma.firebaseapp.com',
        databaseURL: 'https://veronica-roma.firebaseio.com',
        storageBucket: 'veronica-roma.appspot.com');

        print('Initialization OK');    
    } on fb.FirebaseJsNotLoadedException catch (e) {
      print(e);
    }
  }
}