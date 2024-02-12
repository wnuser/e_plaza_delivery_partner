import 'package:e_plaza_delivery_partner/utils/helper.dart';
import 'package:e_plaza_delivery_partner/values/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/toasty.dart';
import '../values/dimen.dart';
import '../values/theme_colors.dart';
import '../widgets/normal_text_field.dart';
import '../widgets/primary_button.dart';
import '../widgets/widgets.dart';

class CancellationReasonDialog {
  final Set<String> reasons;
  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _customReasonController = TextEditingController();

  final void Function(String reason) onSubmit;

  CancellationReasonDialog({required this.reasons, required this.onSubmit}) {
    _show();
  }

  void _show() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          width: 100.w,
          padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: StatefulBuilder(builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        'Rejection Reason',
                        style: const MyTextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    smallIcon(Icons.close_rounded, Get.back, color: Colors.white, imageColor: Colors.black, iconSize: 22)
                  ],
                ),
                Helper.spaceVertical(20),
                // label('Reason'),
                NormalTextField<String>.dropdown(
                  label: 'Reason',
                  controller: _reasonController,
                  dropdownList: reasons.toList(),
                  onSelected: (String reason) {
                    _reasonController.text = reason;
                    state(() {});
                    return reason;
                  },
                ),
                if (_reasonController.text.toLowerCase() == 'other') Helper.spaceVertical(10),
                if (_reasonController.text.toLowerCase() == 'other')
                  NormalTextField(
                    label: 'Custom Reason',
                    controller: _customReasonController,
                    minLines: 3,
                  ),
                Helper.spaceVertical(30),
                OutlinedButton(
                  onPressed: () {
                    if (_reasonController.text.toLowerCase() == 'other') {
                      if (_customReasonController.text.empty) {
                        Toasty.failed('Please enter reason');
                      } else {
                        onSubmit(_customReasonController.text);
                      }
                    } else {
                      if (_reasonController.text.empty) {
                        Toasty.failed('Please select reason');
                      } else {
                        onSubmit(_reasonController.text);
                      }
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size(100.w, 40),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    minimumSize: Size.zero,
                  ),
                  child: Text(
                    'Submit',
                    style: MyTextStyle(fontSize: fontSizeSmall),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}