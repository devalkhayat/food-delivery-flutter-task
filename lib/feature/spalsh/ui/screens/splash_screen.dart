import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/theme/util/colors.dart' as colors;
import 'package:food_delivery_app/feature/spalsh/ui/splash_strings.dart';

import '../../../../core/widgets/general.dart';
import '../../../authentication/ui/screens/login_screen.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});


  @override
  Widget build(BuildContext context) {



    return Container(
      color: colors.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "assets/images/launch_background.png",
              fit: BoxFit.fill,
            ),
            splashHeader(context:context,title:SplashStrings.headLine)
            ,
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, top: 30.0, right: 30.0, bottom: 30.0),
              child: Text(
                SplashStrings.subTitle,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 60.0,
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()))
                },
                style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                    backgroundColor:
                        const WidgetStatePropertyAll<Color>(colors.white),
                    foregroundColor:
                    const WidgetStatePropertyAll<Color>(colors.primaryColor)),
                child: const Text(SplashStrings.getStarted),
              ),
            )
          ],
        ),
      ),
    );
  }
}
