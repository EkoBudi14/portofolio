part of 'shared.dart';

// untuk mengambil data key database dari themoviedb

String apiKey = '0fd33aa9b0714fcf52afefb7fa56e5b8';
String imageBaseURL = 'https://image.tmdb.org/t/p/';
// agar tidak melakukan perpindahan page yang sama sebanyak 2 kali
PageEvent prevPageEvent;

// digunakan untuk menitipkan profile picture pas sudah masuk ke confirmasi akun baru
File imageFileToUpload;
