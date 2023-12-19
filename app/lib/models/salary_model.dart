import 'package:dart_numerics/dart_numerics.dart';
import 'package:equatable/equatable.dart';

class Salary extends Equatable {
  final int id;
  final String name;
  final List<int> salaryRange; // size = 2 , ex: [5000, 10000] -> 5000 <= salaries < 10000

  const Salary({
    required this.id,
    required this.name,
    required this.salaryRange,
  });

  @override
  List<Object?> get props => [id, name, salaryRange];

  static List<Salary> salaries = [
    Salary(id: 1, name: '€5 000 - €10 000', salaryRange: const [5000, 10000]),
    Salary(id: 2, name: '€10 000 - €20 000', salaryRange: const [10000, 20000]),
    Salary(id: 3, name: '€20 000 - €40 000', salaryRange: const [20000, 40000]),
    Salary(id: 4, name: '€40 000 - €60 000', salaryRange: const [40000, 60000]),
    Salary(id: 5, name: '€60 000 - €80 000', salaryRange: const [60000, 80000]),
    Salary(id: 6, name: '€80 000+', salaryRange: const [80000, 99999999999]),
  ];

  static List<Salary> noFilterSalary = [
    Salary(id: 0, name: 'all', salaryRange: const [int64MinValue, int64MaxValue]),
  ];
}
