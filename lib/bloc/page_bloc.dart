import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pemesanan_tiket_bisokop/models/models.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(OnInitialPage()) {
    on<GoToSplashPage>(_onGoToSplashPage);
    on<GoToLoginPage>(_onGoToLoginPage);
    on<GoToMainPage>(_onGoToMainPage);
    on<GoToRegistrationPage>(_onGoToRegistrationPage);
    on<GoToPreferencePage>(_onGoToPreferencePage);
    on<GoToAccountConfirmationPage>(_onGoToAccountConfirmationPage);
    on<GoToMovieDetailPage>(_onGoToMovieDetailPage);
    on<GoToSelectSchedulePage>(_onGoToSelectSchedulePage);
    on<GoToSelectSeatPage>(_onGoToSelectSeatPage);
    on<GoToCheckoutPage>(_onGoToCheckoutPage);
    on<GoToSuccessPage>(_onGoToSuccessPage);
    on<GoToTicketDetailPage>(_onGoToTicketDetailPage);
    on<GoToProfilePage>(_onGoToProfilePage);
    on<GoToTopUpPage>(_onGoToTopUpPage);
    on<GoToWalletPage>(_onGoToWalletPage);
    on<GoToEditProfilePage>(_onGoToEditProfilePage);
  }

  void _onGoToSplashPage(GoToSplashPage event, Emitter<PageState> emit) {
    emit(OnSplashPage());
  }

  void _onGoToLoginPage(GoToLoginPage event, Emitter<PageState> emit) {
    emit(OnLoginPage());
  }

  void _onGoToMainPage(GoToMainPage event, Emitter<PageState> emit) {
    emit(OnMainPage(
      bottomNavBarIndex: event.bottomNavBarIndex,
      isExpired: event.isExpired,
    ));
  }

  void _onGoToRegistrationPage(GoToRegistrationPage event, Emitter<PageState> emit) {
    emit(OnRegistrationPage(event.registrationData));
  }

  void _onGoToPreferencePage(GoToPreferencePage event, Emitter<PageState> emit) {
    emit(OnPreferencePage(event.registrationData));
  }

  void _onGoToAccountConfirmationPage(GoToAccountConfirmationPage event, Emitter<PageState> emit) {
    emit(OnAccountConfirmationPage(event.registrationData));
  }

  void _onGoToMovieDetailPage(GoToMovieDetailPage event, Emitter<PageState> emit) {
    emit(OnMovieDetailPage(event.movie));
  }

  void _onGoToSelectSchedulePage(GoToSelectSchedulePage event, Emitter<PageState> emit) {
    emit(OnSelectSchedulePage(event.movieDetail));
  }

  void _onGoToSelectSeatPage(GoToSelectSeatPage event, Emitter<PageState> emit) {
    emit(OnSelectSeatPage(event.ticket));
  }

  void _onGoToCheckoutPage(GoToCheckoutPage event, Emitter<PageState> emit) {
    emit(OnCheckoutPage(event.ticket));
  }

  void _onGoToSuccessPage(GoToSuccessPage event, Emitter<PageState> emit) {
    emit(OnSuccessPage(event.ticket, event.transaction));
  }

  void _onGoToTicketDetailPage(GoToTicketDetailPage event, Emitter<PageState> emit) {
    emit(OnTicketDetailPage(event.ticket));
  }

  void _onGoToProfilePage(GoToProfilePage event, Emitter<PageState> emit) {
    emit(OnProfilePage());
  }

  void _onGoToTopUpPage(GoToTopUpPage event, Emitter<PageState> emit) {
    emit(OnTopUpPage(event.pageEvent));
  }

  void _onGoToWalletPage(GoToWalletPage event, Emitter<PageState> emit) {
    emit(OnWalletPage(event.pageEvent));
  }

  void _onGoToEditProfilePage(GoToEditProfilePage event, Emitter<PageState> emit) {
    emit(OnEditProfilePage(event.user));
  }
}