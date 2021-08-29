import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutix/models/models.dart';
import 'package:flutix/services/services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  @override
  UserState get initialState => UserInitial();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoadUser) {
      // jika load user maka mengambil data dari load user
      User user = await UserServices.getUser(event.id);
      yield UserLoaded(user);
    } else if (event is SignOut) {
      yield UserInitial();
      // untuk perubahan profile dan nama
    } else if (event is UpdateData) {
      User updatedUser = (state as UserLoaded)
          .user
          .copyWith(name: event.name, profilePicture: event.profileImage);

      // update ke database, supaya gambarnya keluar saat sign in
      await UserServices.updateUser(updatedUser);

      yield UserLoaded(updatedUser);
    } else if (event is TopUp) {
      try {
        User updatedUser = (state as UserLoaded).user.copyWith(
            balance: (state as UserLoaded).user.balance + event.amount);

        await UserServices.updateUser(updatedUser);

        yield UserLoaded(updatedUser);
      } catch (e) {
        print(e);
      }
    } else if (event is Purchase) {
      try {
        User updatedUser = (state as UserLoaded).user.copyWith(
            balance: (state as UserLoaded).user.balance - event.amount);

        await UserServices.updateUser(updatedUser);

        yield UserLoaded(updatedUser);
      } catch (e) {
        print(e);
      }
    }
  }
}
