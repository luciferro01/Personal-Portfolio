import 'package:flutter/material.dart';
import 'package:portfolio/constants/assets_path.dart';
import 'package:portfolio/utils/widgets/text_widget.dart';

import '../../constants/app_constants.dart';
import '../../constants/responsive.dart';
import '../../utils/widgets/buttons.dart';

class ContactMe extends StatelessWidget {
  ContactMe({required this.contactMe, super.key});
  final GlobalKey contactMe;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void validateForm() {
    final bool isValidate = formKey.currentState!.validate();
    if (isValidate) {
      debugPrint('Congratulations! You have successfully validated the form');
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);
    bool isTablet = Responsive.isTablet(context);

    double width = MediaQuery.of(context).size.width;
    return Padding(
      key: contactMe,
      padding: isMobile
          ? const EdgeInsets.all(30)
          : isTablet
              ? EdgeInsets.symmetric(
                  horizontal: width * 0.2, vertical: width * 0.1)
              : EdgeInsets.symmetric(
                  horizontal: width * 0.3, vertical: width * 0.1),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            FittedBox(
              child: Row(
                children: [
                  textWidget(
                      title: 'Interested In Working',
                      size: 30,
                      textColor: lineColor),
                  textWidget(
                      title: 'TOGETHER', size: 30, textColor: whiteColor),
                  textWidget(title: '?', size: 30, textColor: whiteColor),
                ],
              ),
            ),
            const SizedBox(height: 30),
            formField(
              isMessageBox: false,
              hintText: 'How Can I Call You ?',
              validatorfunction: (value) {
                if (value != null && value.length < 8) {
                  return 'Please Enter your Name';
                } else {
                  return null;
                }
              },
              keyBoardType: TextInputType.text,
              // icon: Icons.person,
            ),
            SizedBox(
              height: isTablet
                  ? 60
                  : isMobile
                      ? 40
                      : 80,
            ),
            formField(
              isMessageBox: false,
              hintText: 'Your Email Address ?',
              validatorfunction: (value) {
                if (value != null &&
                    !value.contains('@') &&
                    !value.contains('.com')) {
                  return 'Please Enter the correct Email Address ';
                } else {
                  return null;
                }
              },
              keyBoardType: TextInputType.emailAddress,
              // icon: Icons.mail_rounded,
            ),
            SizedBox(
              height: isTablet
                  ? 60
                  : isMobile
                      ? 40
                      : 80,
            ),
            formField(
              isMessageBox: true,
              hintText: 'Type Your Message Here ...',
              validatorfunction: (value) {
                if (value != null && value.isEmpty) {
                  return 'Please Type Your Message Here ...';
                } else {
                  return null;
                }
              },
              keyBoardType: TextInputType.multiline,
            ),
            const SizedBox(
              height: 50,
            ),
            IntrinsicWidth(
              child: clickButton(
                'Send Email',
                send,
                lineColor,
                whiteColor,
                validateForm,
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField formField({
    required bool isMessageBox,
    required String hintText,
    // IconData? icon,
    required String? Function(String?) validatorfunction,
    required TextInputType keyBoardType,
  }) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: keyBoardType,
      validator: validatorfunction,
      style: const TextStyle(
        color: whiteColor,
        fontSize: 26,
      ),
      minLines: isMessageBox ? 6 : 1,
      maxLines: isMessageBox ? null : 1,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 20,
        ),
        errorStyle: const TextStyle(
          fontSize: 20,
          color: lineColor,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
        enabledBorder: !isMessageBox
            ? UnderlineInputBorder(
                borderSide: const BorderSide(
                  width: 3,
                  color: headingTextColor,
                ),
                borderRadius: BorderRadius.circular(2),
              )
            : OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 3,
                  color: headingTextColor,
                ),
                borderRadius: BorderRadius.circular(2),
              ),
        errorBorder: !isMessageBox
            ? UnderlineInputBorder(
                borderSide: const BorderSide(
                  width: 5,
                  color: lineColor,
                ),
                borderRadius: BorderRadius.circular(2),
              )
            : OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 5,
                  color: lineColor,
                ),
                borderRadius: BorderRadius.circular(2),
              ),
        focusedBorder: !isMessageBox
            ? UnderlineInputBorder(
                borderSide: const BorderSide(
                  width: 5,
                  color: headingTextColor,
                ),
                borderRadius: BorderRadius.circular(2),
              )
            : OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 5,
                  color: headingTextColor,
                ),
                borderRadius: BorderRadius.circular(2),
              ),
        // prefixIcon: Icon(
        //   icon,
        //   color: whiteColor,
        //   size: 30,
        // ),
      ),
    );
  }
}
