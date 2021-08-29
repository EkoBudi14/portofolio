part of 'shared.dart';

//  satu buah fungsi untuk untuk mengambil image
// digunakan di sign up dan upload
Future<File> getImage() async {
  // ignore: deprecated_member_use
  var image = await ImagePicker.pickImage(source: ImageSource.gallery);
  return image;
}

// buat untuk upload image
// setelah di download maka akan di kembalikan file gambarnya

Future<String> uploadImage(File image) async {
  // mengambil gambar dari namanya saja
  String fileName = basename(image.path);

  // mengarahkan object yang ada di firebase storage
  // dengan nama filename tersebut
  StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
  // menugaskan si ref untuk mengupload filenya
  StorageUploadTask task = ref.putFile(image);
  // setelah melakukan tugasnya maka akan meminta kembaliannya
  // jika komplit maka akan mengembalikan storage task snapshot
  StorageTaskSnapshot snapshot = await task.onComplete;
  // setelah mendapatkan snapshotnya hasil dari tasknya maka yang di return itu download urlnya
  // untuk mendapatkan urlnya cara nya seperti ini
  return await snapshot.ref.getDownloadURL();
}
