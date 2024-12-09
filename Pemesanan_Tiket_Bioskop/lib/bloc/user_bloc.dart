import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/models.dart';
import '../services/services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserServices userServices;

  UserBloc({required this.userServices}) : super(UserInitial()) {
    on<LoadUser>(_onLoadUser);
    on<SignOut>(_onSignOut);
    on<UpdateData>(_onUpdateData);
    on<TopUp>(_onTopUp);
    on<Purchase>(_onPurchase);
  }

  Future<void> _onLoadUser(LoadUser event, Emitter<UserState> emit) async {
    try {
      User user = await UserServices.getUser(event.id);
      emit(UserLoaded(user));
    } catch (e) {
      emit(UserError(message: 'Failed to load user'));
    }
  }

  void _onSignOut(SignOut event, Emitter<UserState> emit) {
    emit(UserInitial());
  }

  Future<void> _onUpdateData(UpdateData event, Emitter<UserState> emit) async {
    if (state is UserLoaded) {
      try {
        User updatedUser = (state as UserLoaded).user.copyWith(
              name: event.name ?? (state as UserLoaded).user.name, 
              profilePicture: event.profileImage ?? (state as UserLoaded).user.profilePicture
            );
        await UserServices.updateUser(updatedUser);
        emit(UserLoaded(updatedUser));
      } catch (e) {
        emit(UserError(message: 'Failed to update user data'));
      }
    }
  }

  Future<void> _onTopUp(TopUp event, Emitter<UserState> emit) async {
    if (state is UserLoaded) {
      try {
        User updatedUser = (state as UserLoaded).user.copyWith(
          balance: (state as UserLoaded).user.balance + event.amount
        );
        await UserServices.updateUser(updatedUser);
        emit(UserLoaded(updatedUser));
      } catch (e) {
        emit(UserError(message: 'Failed to top up balance'));
      }
    }
  }

  Future<void> _onPurchase(Purchase event, Emitter<UserState> emit) async {
    if (state is UserLoaded) {
      try {
        User updatedUser = (state as UserLoaded).user.copyWith(
          balance: (state as UserLoaded).user.balance - event.amount
        );
        await UserServices.updateUser(updatedUser);
        emit(UserLoaded(updatedUser));
      } catch (e) {
        emit(UserError(message: 'Failed to process purchase'));
      }
    }
  }
}