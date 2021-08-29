part of 'models.dart';

// class equatable untuk theater

class Theater extends Equatable {
  final String name;

  Theater(this.name);

  @override
  List<Object> get props => [name];
}

List<Theater> dummyTheaters = [
  Theater("CGV Gajah Mada"),
  Theater("XXI Mall Of Indonesia"),
  Theater("XXI Grand Paragon"),
  Theater("XXI Mall Atrium"),
];
