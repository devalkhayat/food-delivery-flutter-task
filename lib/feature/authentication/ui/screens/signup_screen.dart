import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/core/widgets/app_input_field.dart';
import 'package:food_delivery_app/feature/authentication/ui/authentication_strings.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/feature/home/ui/screens/home_screen.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/general.dart';
import '../../../../navigation_holder.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  Widget form(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          CustomInput(
              label: AuthenticationStrings.nameInputLabel,
              hint: AuthenticationStrings.nameInputPlaceHolder),
          SizedBox(
            height: 30,
          ),
          CustomInput(
            label: AuthenticationStrings.emailInputLabel,
            hint: AuthenticationStrings.emailInputPlaceHolder,
          ),
          SizedBox(
            height: 30,
          ),
          CustomInput(
            label: AuthenticationStrings.passwordInputLabel,
            hint: AuthenticationStrings.passwordInputPlaceHolder,
            isSecureField: true,
          ),
          SizedBox(
            height: 30,
          ),
          CustomInput(
            label: AuthenticationStrings.confirmPasswordInputLabel,
            hint: AuthenticationStrings.confirmPasswordInputPlaceHolder,
            isSecureField: true,
          ),
        ],
      ),
    );
  }

  Widget socialMediaLogin(BuildContext context) {
    return Column(
      children: [
        const Row(children: <Widget>[
          Expanded(child: Divider()),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(AuthenticationStrings.otherSignIn),
          ),
          Expanded(child: Divider()),
        ]),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () => {},
                icon: SvgPicture.asset("assets/images/ic_facebook.svg")),
            IconButton(
                onPressed: () => {},
                icon: SvgPicture.asset("assets/images/ic_google.svg")),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: getAppBar(context),
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              pageHeader(context: context,title:  AuthenticationStrings.signUpTitle),
              form(context),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    Appbutton(
                      title: AuthenticationStrings.signUp,
                      action: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const navigation_holder()));
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    socialMediaLogin(context)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  getAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: SvgPicture.asset("assets/images/ic_back.svg")),
    );
  }
}
