import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pemesanan_tiket_bisokop/models/models.dart';
import 'package:pemesanan_tiket_bisokop/services/services.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieServices movieServices;

  MovieBloc({required this.movieServices}) : super(MovieInitial()) {
    on<FetchMovies>(_onFetchMovies);
  }

  Future<void> _onFetchMovies(FetchMovies event, Emitter<MovieState> emit) async {
    try {
      List<Movie> movies = await MovieServices.getMovies(1);
      emit(MovieLoaded(movies: movies));
    } catch (e) {
      emit(MovieError() as MovieState);
    }
  }
}

class MovieError {
}