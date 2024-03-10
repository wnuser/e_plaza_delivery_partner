import 'package:e_plaza_delivery_partner/utils/helper.dart';
import 'package:e_plaza_delivery_partner/utils/toasty.dart';
import 'package:e_plaza_delivery_partner/values/dimen.dart';
import 'package:e_plaza_delivery_partner/values/size_config.dart';
import 'package:e_plaza_delivery_partner/values/theme_colors.dart';
import 'package:e_plaza_delivery_partner/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../data_provider/repository.dart';
import '../modals/result.dart';
import '../utils/const.dart';
import '../utils/preference.dart';

class VerifyOtpDialog {
  final void Function() onDeliver;
  num? orderId;
  String sentOtp = '1234';
  String enteredOtp = '';
  String sentStatus = Status.PROGRESS;

  VerifyOtpDialog({
    required this.orderId,
    required this.onDeliver,
  }) {
    _show();
  }

  void _show() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: StatefulBuilder(
          builder: (context, setState) {
            sendOtp(setState);
            return Container(
              // width: 60.w,
              decoration: Helper.dialogBoxDecoration,
              padding: EdgeInsets.only(bottom: 20),
              child: ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            'Verify Otp',
                            style:
                                MyTextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: Get.back,
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.red.shade50,
                            shape: CircleBorder(),
                            padding: EdgeInsets.zero,
                          ),
                          child: Icon(Icons.close, color: Colors.red, size: 16),
                        ),
                      ),
                    ],
                  ),
                  Helper.spaceVertical(22),
                  if (sentStatus == Status.NORMAL) ...[
                    Text(
                      'Please enter otp sent to',
                      style: MyTextStyle(fontSize: fontSizeMedium, color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Buyer Number',
                      style: MyTextStyle(
                          fontSize: fontSizeMedium,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    Helper.spaceVertical(20),
                    Center(
                      child: OTPTextField(
                        length: 6,
                        width: 60.w,
                        fieldWidth: 8.w,
                        spaceBetween: 0,
                        style: const MyTextStyle(
                          fontSize: fontSizeSmall,
                          color: ThemeColors.colorPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                        textFieldAlignment: MainAxisAlignment.spaceEvenly,
                        fieldStyle: FieldStyle.underline,
                        otpFieldStyle: OtpFieldStyle(
                          borderColor: ThemeColors.colorPrimary,
                          backgroundColor: ThemeColors.whiteBlue,
                          // enabledBorderColor: ThemeColors.colorPrimary,
                          // focusBorderColor: ThemeColors.colorPrimary,
                        ),
                        outlineBorderRadius: 6,
                        onCompleted: (pin) => enteredOtp = pin,
                      ),
                    ),
                    Helper.spaceVertical(40)
                  ],
                  if (sentStatus == Status.PROGRESS) ...[
                    Center(
                        child: Text(
                      'Please wait...',
                      style: MyTextStyle(),
                    )),
                    Helper.spaceVertical(20),
                    Center(
                        child:
                            SizedBox(width: 20.w, child: LinearProgressIndicator(minHeight: 1.5))),
                    Helper.spaceVertical(40),
                  ],
                  Center(
                    child: TextButton(
                      onPressed: verify,
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                          backgroundColor: ThemeColors.colorPrimary,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                      child: Text(
                        'Verify',
                        style: MyTextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      // barrierDismissible: false,
    );
  }

  void sendOtp(setState) async {
    // sentStatus = Status.NORMAL;
    // return;

    if (sentStatus == Status.PROGRESS) {
      Result result = await Repository.instance.requestOtp(Preference.user.id.toString(), orderId);

      if (result.success) {
        sentStatus = Status.NORMAL;
        Toasty.success('Otp sent');
        setState(() {});
      }
    }
  }

  void verify() async {
    Result result =
        await Repository.instance.checkOtp(Preference.user.id.toString(), orderId, enteredOtp);

    if (result.success) {
      onDeliver.call();
    } else {
      Toasty.failed('Please enter valid OTP!');
    }
  }
}
