import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../shared/constants/ghaps.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              prefixIcon: SvgPicture.asset(
                'assets/icons/mail_light.svg',
                height: 16,
                width: 20,
                fit: BoxFit.none,
              ),
              hintText: 'Your email',
            ),
          ),
          gapH16,

          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: SvgPicture.asset(
                'assets/icons/lock_light.svg',
                height: 16,
                width: 20,
                fit: BoxFit.none,
              ),
              hintText: 'Password',
            ),
          ),
          gapH16,

          /// SIGN IN BUTTON
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 56),
            ),
            child: const Text('Sign in'),
          ),
        ],
      ),
    );
  }
}
