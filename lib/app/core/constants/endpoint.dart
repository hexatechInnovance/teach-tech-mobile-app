abstract class Endpoint {
  Endpoint._();

  static const localHostBaseUrl = "http://127.0.0.1:8000";

  static const attendanceList = "$localHostBaseUrl/attendance";
}