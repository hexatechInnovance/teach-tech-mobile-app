import 'package:get/get.dart';
import 'package:teach_tech_mobile/app/core/model/page_state.dart';
import 'package:teach_tech_mobile/app/core/model/snack_bar_message.dart';

class BaseController extends GetxController {

  final _pageSateController = PageState.DEFAULT.obs;
  PageState get pageState => _pageSateController.value;

  final Rx<SnackBarMessage> _snackBarMessage = SnackBarMessage().obs;
  SnackBarMessage get snackBarMessage => _snackBarMessage.value;
}