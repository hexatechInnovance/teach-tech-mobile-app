import 'package:get/get.dart';
import 'package:teach_tech_mobile/app/data/data_source/attendance/attendance_data_source.dart';
import 'package:teach_tech_mobile/app/data/data_source/attendance/attendance_data_source_impl.dart';
import 'package:teach_tech_mobile/app/data/repository/attendance/attendance_repository.dart';
import 'package:teach_tech_mobile/app/data/repository/attendance/attendance_repository_impl.dart';

import '../controllers/attendance_controller.dart';

class AttendanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendanceDataSource>(
          () => AttendanceDataSourceImpl(),
    );
    Get.lazyPut<AttendanceRepository>(
          () => AttendanceRepositoryImpl(),
    );
    Get.lazyPut<AttendanceController>(
      () => AttendanceController(),
    );
  }
}
