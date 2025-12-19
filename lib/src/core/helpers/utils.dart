import 'package:taraz_package_sample/src/core/models/response_message_model.dart';

class AppUtils {
  AppUtils._();

  static void checkMessage({required ResponseMessage message}) {
    if ((message.text ?? '').isNotEmpty) {
      switch (message.type ?? 'none') {
        case 'snack':
          // ShowMessage.getSnackBar(
          //   message: message.text ?? '',
          //   messageType:
          //   message.code == 1
          //       ? MessageType.success
          //       : message.code == 2
          //       ? MessageType.warning
          //       : MessageType.error,
          // );
          break;
        case 'dialog':
          // BaseDialog(
          //   description: message.text ?? '',
          //   btnOkText: 'باشه',
          //   messageType:
          //   message.code == 1
          //       ? MessageType.success
          //       : message.code == 2
          //       ? MessageType.warning
          //       : MessageType.error,
          // ).showBaseDialog();
          break;
        default:
          break;
      }
    }
  }
}
