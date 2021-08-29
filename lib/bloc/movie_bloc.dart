import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutix/models/models.dart';
import 'package:flutix/services/services.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  @override
  MovieState get initialState => MovieInitial();

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    // berisi kumpulan movie dari halaman satu sebanyak 20 di halaman 1
    if (event is FetchMovies) {
      List<Movie> movies = await MovieServices.getMovies(1);
      // yang di kembalikan movies
      yield MovieLoaded(movies: movies);
    }
  }
}
