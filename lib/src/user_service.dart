import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fs;

class UserService {
  bool isInitialized = false;
  bool isAuthorized = false;

  fb.Auth auth;
  fs.Firestore store;

  UserService()  {
    initialize();
  }

  void initialize() {
    try {
      fb.initializeApp(
        apiKey: 'AIzaSyCOjTrMcjI_0PVGlUtoFGOJ9qnDLgJGbDw',
        authDomain: 'veronica-roma.firebaseapp.com',
        databaseURL: 'https://veronica-roma.firebaseio.com',
        projectId: "veronica-roma",
        storageBucket: 'veronica-roma.appspot.com');

        isInitialized = true;

        auth = fb.auth();
        store = fb.firestore();

        print('Initialization OK');    
    } on fb.FirebaseJsNotLoadedException catch (e) {
      print(e);
    }
  }

  void authorize() async {
    await auth.signInAnonymously();
    isAuthorized = true;
    print("Authorized!!!");
  }

  void saveAnswers() async {
    if (! isAuthorized) {
      await authorize();
    }
  }
}