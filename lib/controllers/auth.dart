import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService extends GetxController {
  final _auth = FirebaseAuth.instance;

  Stream<User?> get currentUser => _auth.authStateChanges();
  Future<UserCredential> signInWithCredentail(AuthCredential credential) =>
      _auth.signInWithCredential(credential);
  Future<void> logout() => _auth.signOut();
}
