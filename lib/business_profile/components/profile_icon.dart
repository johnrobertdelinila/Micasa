import 'package:flutter/material.dart';
import 'package:referral_app/business_profile/main.dart';

class ProfileIcon extends StatelessWidget {
  @override
  Widget build(context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Image.asset('images/headshot.jpg', package: App.pkg),
    );
  }
}
