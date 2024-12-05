import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/core/widgets/app_button.dart';
import 'package:food_delivery_app/core/widgets/app_input_field.dart';
import 'package:food_delivery_app/core/widgets/general.dart';
import 'package:food_delivery_app/feature/authentication/ui/authentication_strings.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/feature/authentication/ui/screens/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});



  Widget form(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          CustomInput(
              label: AuthenticationStrings.emailInputLabel,
              hint: AuthenticationStrings.emailInputPlaceHolder),
          SizedBox(
            height: 30,
          ),
          CustomInput(
              label: AuthenticationStrings.passwordInputLabel,
              hint: AuthenticationStrings.passwordInputPlaceHolder,
              isSecureField: true),
        ],
      ),
    );
  }

  Widget normalLogin(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextButton(
            onPressed: () => {},
            child: const Text(AuthenticationStrings.forgetPassword)),
        const SizedBox(
          height: 15,
        ),

         Appbutton(title: AuthenticationStrings.login,action: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const SignUpScreen()));
        },)
       ,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(AuthenticationStrings.signupAsk),
            TextButton(
                onPressed: () => {},
                child: const Text(AuthenticationStrings.signUp))
          ],
        )
      ],
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
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 100),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              pageHeader(context: context,title:AuthenticationStrings.loginTitle),
              form(context),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                child: Column(
                  children: [
                    normalLogin(context),
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
}
