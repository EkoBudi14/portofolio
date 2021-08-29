part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  // membuat sign up
  static Future<SignInSignUpResult> signUp(String email, String password,
      String name, List<String> selectedGenres, String selectedLanguage) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // mengkonvert dari firebaseUser ke user
      User user = result.user.convertToUser(
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

      // setelah menjadi user kemudian dikirim ke firestore ( maka dari itu kita membuat methode ke firestorenya) dibuatnya di user services .dart
      // yang ini untuk ngeshare ke firestore
      await UserServices.updateUser(user);
      return SignInSignUpResult(user: user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString().split(',')[1].trim());
    }
  }

  // membuat sign in
  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      User user = await result.user.fromFireStore();
      return SignInSignUpResult(user: user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString().split(',')[1].trim());
    }
  }

  // membuat sign out
  static Future<void> signOut() async {
    await _auth.signOut();
  }

  // ! UNTUK RESET PASWORD
  static Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  // membuat stream ke firebase untuk mengetahui apakah pengguna
  // melakukan sign in/ sign out/ atau sign up
  static Stream<FirebaseUser> get userStream => _auth.onAuthStateChanged;
}

// dibuat untuk mengembalikan jika pesan error dan tidak

class SignInSignUpResult {
  final User user;
  final String message;

  SignInSignUpResult({this.user, this.message});
}
