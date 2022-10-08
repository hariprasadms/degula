import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import 'auth_util.dart';

class DegulaFirebaseUser {
  DegulaFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

DegulaFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<DegulaFirebaseUser> degulaFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<DegulaFirebaseUser>(
      (user) {
        currentUser = DegulaFirebaseUser(user);
        updateUserJwtTimer(user);
        return currentUser!;
      },
    );
