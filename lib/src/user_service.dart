import 'dart:async';
import 'package:firebase/firebase.dart';

class UserService {
  bool isInitialized = false;
  bool isLoginFormVisible = false;

  User user;
  List<String> userRoles;

  UserService () {
    _init();
  }

  Future _init() async {
    user = auth().currentUser;
    if (user != null) {
      var snapshot = await firestore().collection('users-roles').doc(user.uid).get();
      userRoles = snapshot.data()['roles'].cast<String>();
    }
  }

  void signInAnonymously() async {
    var userCredential = await auth().signInAnonymously();
    user = userCredential.user;
  }

  void signInWithEmailAndPassword(String email, String password) async {
    var userCredential = await auth().signInWithEmailAndPassword(email, password);
    user = userCredential.user;
    
    var snapshot = await firestore().collection('users-roles').doc(user.uid).get();
    userRoles = snapshot.data()['roles'].cast<String>();
  }

  void signOut() {
    user = null;
    userRoles = null;
  }

  bool isAuthorized() {
    return user != null;
  }

  bool isAuthorizedAdmin() {
    return (userRoles != null) && userRoles.contains('admin');
  }
}