import 'package:equatable/equatable.dart';

class AttendanceRequest extends Equatable {
  final int id;
  final bool status;

  const AttendanceRequest({
    required this.id,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "status": status,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => <Object?>[
        id,
        status,
      ];
}
