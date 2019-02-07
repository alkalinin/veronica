import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fs;

class UserService {
  bool isInitialized = false;
  bool showLoginForm = false;

  fb.Auth auth;
  fb.UserCredential credential;
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
        print(isAuthorized());
    } on fb.FirebaseJsNotLoadedException catch (e) {
      print(e);
    }
  }

  void signInAnonymously() async {
    try {
      credential = await auth.signInAnonymously();
    } catch (e) {
      rethrow;
    }
  }

  void signInWithEmailAndPassword(String email, String password) async {
    try {
      credential = await auth.signInWithEmailAndPassword(email, password);
    } catch (e) {
      rethrow;
    }
  }

  void signOut() {
    credential = null;
  }

  void saveAnswers() async {
    if (! isAuthorized()) {
      await signInAnonymously();
    }
  }

  bool isAuthorized() => credential != null;
}