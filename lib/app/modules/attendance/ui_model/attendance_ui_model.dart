import 'package:equatable/equatable.dart';
import 'package:teach_tech_mobile/app/data/model/response/attendance.dart';

class AttendanceUiModel extends Equatable {
  final String name;

  const AttendanceUiModel({
    required this.name,
  });

  factory AttendanceUiModel.fromAttendance(Attendance model) {
    return AttendanceUiModel(name: model.name ?? "");
  }

  @override
  List<Object?> get props => <Object?>[
        name,
      ];
}
