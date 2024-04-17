import 'package:equatable/equatable.dart';

class Attendance extends Equatable {
  final String? name;

  const Attendance({
    required this.name,
  });

  factory Attendance.fromJson(dynamic json) {
    return Attendance(
      name: json['name'],
    );
  }

  @override
  List<Object?> get props => <Object?>[
        name,
      ];
}
