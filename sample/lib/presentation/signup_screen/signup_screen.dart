import 'controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:sandwech/core/app_export.dart';
import 'package:sandwech/core/utils/validation_functions.dart';
import 'package:sandwech/widgets/app_bar/appbar_title.dart';
import 'package:sandwech/widgets/app_bar/custom_app_bar.dart';
import 'package:sandwech/widgets/custom_button.dart';
import 'package:sandwech/widgets/custom_text_form_field.dart';

class SignupScreen extends GetWidget<SignupController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(
            96.00,
          ),
          title: AppbarTitle(
            text: "msg_crea_il_tuo_account".tr,
            margin: getMargin(
              left: 22,
              top: 69,
            ),
          ),
          actions: [
            Padding(
              padding: getPadding(
                left: 16,
                right: 16,
                bottom: 12,
              ),
              child: CommonImageView(
                svgPath: ImageConstant.imgSignal,
                height: getVerticalSize(
                  84.00,
                ),
                width: getHorizontalSize(
                  53.00,
                ),
              ),
            ),
          ],
        ),
        body: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: getVerticalSize(
                      2.00,
                    ),
                    width: getHorizontalSize(
                      352.00,
                    ),
                    margin: getMargin(
                      left: 16,
                      top: 1,
                      right: 16,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstant.bluegray100,
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          1.00,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: getPadding(
                        left: 25,
                        top: 25,
                        right: 25,
                      ),
                      child: Text(
                        "lbl_nome".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterBold20,
                      ),
                    ),
                  ),
                  CustomTextFormField(
                    width: 358,
                    focusNode: FocusNode(),
                    controller: controller.nameController,
                    hintText: "lbl_mario".tr,
                    margin: getMargin(
                      left: 16,
                      top: 1,
                      right: 16,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Il nome è obbligatorio";
                      }
                      return null;
                    },
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: getPadding(
                        left: 25,
                        top: 26,
                        right: 25,
                      ),
                      child: Text(
                        "lbl_cognome".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterBold20RedA400,
                      ),
                    ),
                  ),
                  CustomTextFormField(
                    width: 358,
                    focusNode: FocusNode(),
                    controller: controller.surnameController,
                    hintText: "lbl_rossi".tr,
                    margin: getMargin(
                      left: 16,
                      top: 1,
                      right: 16,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Il cognome è obbligatorio";
                      }
                      return null;
                    },
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: getPadding(
                        left: 25,
                        top: 23,
                        right: 25,
                      ),
                      child: Text(
                        "lbl_mail".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterBold20,
                      ),
                    ),
                  ),
                  CustomTextFormField(
                    width: 358,
                    focusNode: FocusNode(),
                    controller: controller.emailController,
                    hintText: "msg_mariorossi_gmail_com".tr,
                    margin: getMargin(
                      left: 16,
                      top: 1,
                      right: 16,
                    ),
                    validator: (value) {
                      if (value == null ||
                          (!isValidEmail(value, isRequired: true))) {
                        return "Questa non è un email valida";
                      }
                      return null;
                    },
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: getPadding(
                        left: 22,
                        top: 24,
                        right: 22,
                      ),
                      child: Text(
                        "lbl_password".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterBold20RedA400,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: getMargin(
                      left: 16,
                      top: 1,
                      right: 16,
                    ),
                    decoration: AppDecoration.fillGray200.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder15,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(
                          () => CustomTextFormField(
                            width: 358,
                            focusNode: FocusNode(),
                            controller: controller.passwordController,
                            hintText: "lbl".tr,
                            textInputAction: TextInputAction.done,
                            alignment: Alignment.centerLeft,
                            suffix: InkWell(
                              onTap: () {
                                controller.isShowPassword.value =
                                    !controller.isShowPassword.value;
                              },
                              child: Container(
                                margin: getMargin(
                                  left: 169,
                                  top: 17,
                                  right: 20,
                                  bottom: 17,
                                ),
                                child: CommonImageView(
                                  svgPath: controller.isShowPassword.value
                                      ? ImageConstant.imgEye
                                      : ImageConstant.imgEye,
                                ),
                              ),
                            ),
                            suffixConstraints: BoxConstraints(
                              minWidth: getHorizontalSize(
                                22.00,
                              ),
                              minHeight: getVerticalSize(
                                22.00,
                              ),
                            ),
                            validator: (value) {
                              if (value == null ||
                                  (!isValidPassword(value, isRequired: true))) {
                                return "Questa password non è valida";
                              }
                              return null;
                            },
                            isObscureText: !controller.isShowPassword.value,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: getPadding(
                        left: 22,
                        top: 23,
                        right: 22,
                      ),
                      child: Text(
                        "msg_conferma_password".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterBold20,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: getMargin(
                      left: 16,
                      top: 1,
                      right: 16,
                    ),
                    decoration: AppDecoration.fillGray200.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder15,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(
                          () => CustomTextFormField(
                            width: 358,
                            focusNode: FocusNode(),
                            controller: controller.confirmPasswordController,
                            hintText: "lbl".tr,
                            textInputAction: TextInputAction.done,
                            alignment: Alignment.centerLeft,
                            suffix: InkWell(
                              onTap: () {
                                controller.isShowPasswordConfirm.value =
                                    !controller.isShowPasswordConfirm.value;
                              },
                              child: Container(
                                margin: getMargin(
                                  left: 169,
                                  top: 17,
                                  right: 20,
                                  bottom: 17,
                                ),
                                child: CommonImageView(
                                  svgPath:
                                      controller.isShowPasswordConfirm.value
                                          ? ImageConstant.imgEye
                                          : ImageConstant.imgEye,
                                ),
                              ),
                            ),
                            suffixConstraints: BoxConstraints(
                              minWidth: getHorizontalSize(
                                22.00,
                              ),
                              minHeight: getVerticalSize(
                                22.00,
                              ),
                            ),
                            validator: (value) {
                              if (value == null ||
                                  (!isValidPassword(value, isRequired: true))) {
                                return "Questa password non è valida";
                              }
                              return null;
                            },
                            isObscureText:
                                !controller.isShowPasswordConfirm.value,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: getMargin(
                      left: 16,
                      top: 13,
                      right: 16,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "msg_cliccando_sul_tasto2".tr,
                            style: TextStyle(
                              color: ColorConstant.gray800,
                              fontSize: getFontSize(
                                9,
                              ),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: "msg_termini_di_servizio".tr,
                            style: TextStyle(
                              color: ColorConstant.orange400,
                              fontSize: getFontSize(
                                9,
                              ),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: "lbl2".tr,
                            style: TextStyle(
                              color: ColorConstant.gray800,
                              fontSize: getFontSize(
                                9,
                              ),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  CustomButton(
                    onTap: () => {controller.PostSignUp(context)},
                    width: 338,
                    text: "lbl_registrati".tr,
                    margin: getMargin(
                      left: 16,
                      top: 56,
                      right: 16,
                      bottom: 5,
                    ),
                    variant: ButtonVariant.OutlineDeeporangeA700bc,
                    shape: ButtonShape.CircleBorder30,
                    fontStyle: ButtonFontStyle.InterBold35,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
