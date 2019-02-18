import 'package:firebase/firebase.dart';

class UserService {
  bool isInitialized = false;
  bool isLoginFormVisible = false;

  UserCredential userCredential;
  List<String> userRoles;

  void signInAnonymously() async {
    userCredential = await auth().signInAnonymously();
  }

  void signInWithEmailAndPassword(String email, String password) async {
    userCredential = await auth().signInWithEmailAndPassword(email, password);
    
    var snapshot = await firestore().collection('users-roles').doc(userCredential.user.uid).get();
    userRoles = snapshot.data()['roles'].cast<String>();
  }

  void signOut() {
    userCredential = null;
    userRoles = null;
  }

  bool isAuthorized() => userCredential != null;

  bool isAuthorizedAdmin() => (userRoles != null) && userRoles.contains('admin');
}