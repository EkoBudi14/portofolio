part of 'services.dart';

// MENGAMBIL DATA dari website the movie
class MovieServices {
  static Future<List<Movie>> getMovies(int page, {http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=$page";

    // clientnya di cek

    client ??= http.Client();

    var response = await client.get(url);

    // jika tidak berhasil
    if (response.statusCode != 200) {
      return [];
    }
    // jika berhasil
    var data = json.decode(response.body);

    // mengambil data dengan result
    List result = data['results'];

    // dengan json

    return result.map((e) => Movie.fromJson(e)).toList();
  }

  // masih bagian dari movie detail
  // ini cara mendapatkan movie detail
  static Future<MovieDetail> getDetails(Movie movie,
      {int movieID, http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/movie/${movieID ?? movie.id}?api_key=$apiKey&language=en-US";

    client ??= http.Client();

    var response = await client.get(url);
    var data = json.decode(response.body);

    // mengambil data genrenya saja dari the movie db
    // list ini masih ada id dan genrenya
    List genres = (data as Map<String, dynamic>)['genres'];
    String language;

    // mengambil data language
    switch ((data as Map<String, dynamic>)['original_language'].toString()) {
      case 'ja':
        language = "Japanese";
        break;
      case 'id':
        language = "Indonesian";
        break;
      case 'ko':
        language = "Korean";
        break;
      case 'en':
        language = "English";
        break;
    }
    // kita return
    return movieID != null
        ? MovieDetail(Movie.fromJson(data),
            language: language,
            // genrenya kita mengambil nama
            genres: genres
                .map((e) => (e as Map<String, dynamic>)['name'].toString())
                .toList())
        : MovieDetail(movie,
            language: language,
            // genrenya kita mengambil nama
            genres: genres
                .map((e) => (e as Map<String, dynamic>)['name'].toString())
                .toList());
  }

  // untuk get credit
  static Future<List<Credit>> getCredits(int movieID,
      {http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/movie/$movieID/credits?api_key=$apiKey";

    client ??= http.Client();

    var response = await client.get(url);
    var data = json.decode(response.body);

    //mengambil data dari the movie db , yang di ambil adalah nama dan gambarnya
    return ((data as Map<String, dynamic>)['cast'] as List)
        .map((e) => Credit(
            name: (e as Map<String, dynamic>)['name'],
            profilePath: (e as Map<String, dynamic>)['profile_path']))
        // ngambil data hanya 8 saja
        .take(8)
        .toList();
  }
}
