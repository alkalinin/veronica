import 'package:firebase/firebase.dart' as fb;

class FirebaseService {
  FirebaseService() {
    fb.initializeApp(
      apiKey: 'AIzaSyCOjTrMcjI_0PVGlUtoFGOJ9qnDLgJGbDw',
      authDomain: 'veronica-roma.firebaseapp.com',
      databaseURL: 'https://veronica-roma.firebaseio.com',
      projectId: 'veronica-roma',
      storageBucket: 'veronica-roma.appspot.com');
  }
}
