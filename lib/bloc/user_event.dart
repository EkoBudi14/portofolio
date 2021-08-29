part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

// untuk load user
class LoadUser extends UserEvent {
  final String id;

  LoadUser(this.id);

  @override
  List<Object> get props => [id];
}

// untuk sign out
class SignOut extends UserEvent {
  @override
  List<Object> get props => [];
}

// digunakan untuk ubah nama dan profile image
class UpdateData extends UserEvent {
  final String name;
  final String profileImage;

  // yang menggunakaan tanda {} opsional bisa diubah ubah
  UpdateData({this.name, this.profileImage});

  @override
  List<Object> get props => [name, profileImage];
}

// * EVENT YANG DIGUNAKAN UNTUK TOP UP DAN PURCHASE

class TopUp extends UserEvent {
  final int amount;

  TopUp(this.amount);

  @override
  List<Object> get props => [amount];
}

class Purchase extends UserEvent {
  final int amount;

  Purchase(this.amount);

  @override
  List<Object> get props => [amount];
}
