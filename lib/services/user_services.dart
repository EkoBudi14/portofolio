part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      Firestore.instance.collection('users');

  // merubah yang tadinya genres dari ("drama","action") menjadi ("drama, action")
  static Future<void> updateUser(User user) async {
    // disave di firestore
    _userCollection.document(user.id).setData({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectedGenres': user.selectedGenres,
      // tanda
      'profilePicture': user.profilePicture,
      'selectedLanguage': user.selectedLanguage,
    });
  }

  // untuk mengambil data email dan password di firestorenya
  static Future<User> getUser(String id) async {
    // memanggil idnya

    DocumentSnapshot snapshot = await _userCollection.document(id).get();

    // data yang dikembalikan
    return User(id, snapshot.data['email'],
        balance: snapshot.data['balance'],
        profilePicture: snapshot.data['profilePicture'],
        selectedGenres: (snapshot.data['selectedGenres'] as List)
            .map((e) => e.toString())
            .toList(),
        selectedLanguage: snapshot.data['selectedLanguage'],
        name: snapshot.data['name']);
  }
}
