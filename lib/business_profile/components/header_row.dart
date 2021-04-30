import 'package:flutter/material.dart';

import '../app_colors.dart';

class HeaderRow extends StatelessWidget {
  @override
  Widget build(context) {
    return Container(
      width: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Business", style: TextStyle(color: Colors.white, fontSize: 17, fontFamily: 'TitilliumWeb')),
              Text(" Profile", style: TextStyle(color: AppColors.colorText3, fontSize: 17, fontFamily: 'TitilliumWeb')),
            ],
          ),
          TextButton(child: Text("https://businessprofilesite.com", style: TextStyle(color: Colors.blue),))
        ],
      ),
    );
  }
}
