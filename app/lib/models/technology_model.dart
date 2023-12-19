import 'package:equatable/equatable.dart';

class Technology extends Equatable {

  final int id;
  final String string;

  const Technology({required this.id, required this.string});

  @override
  List<Object?> get props => [id, string];

  static List<Technology> technologies = [
    const Technology(id: 1, string: 'Python'),
    const Technology(id: 2, string: 'Java'),
    const Technology(id: 3, string: 'JavaScript'),
    const Technology(id: 4, string: 'SQL'),
  ];
}
