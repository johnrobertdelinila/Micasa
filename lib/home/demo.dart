import 'dart:math';

import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:referral_app/authentication/auth3.dart';
import 'package:referral_app/business_profile/demo.dart';
import 'package:referral_app/places/demo.dart';
import 'package:referral_app/profile/profile2.dart';
import 'package:referral_app/profile/profile8.dart';
import 'package:referral_app/reward_list/demo.dart';

import 'content/camera_page.dart';
import 'content/likes_page.dart';
import 'navbar.dart';

class BubbleTabBarDemo extends StatefulWidget {
  @override
  _BubbleTabBarDemoState createState() => _BubbleTabBarDemoState();
}

class _BubbleTabBarDemoState extends State<BubbleTabBarDemo> {
  List<NavBarItemData> _navBarItems;
  int _selectedNavIndex = 0;

  List<Widget> _viewsByIndex;

  @override
  void initState() {
    //Declare some buttons for our tab bar
    _navBarItems = [
      NavBarItemData("Home", OMIcons.home, 110, Color(0xff01b87d)),
      NavBarItemData("Reward", OMIcons.starBorder, 110, Color(0xfff2873f)),
      NavBarItemData("QR Scan", OMIcons.camera, 115, Color(0xff09a8d9)),
      NavBarItemData("Likes", OMIcons.favoriteBorder, 100, Color(0xffcf4c7a)),
      NavBarItemData("Profile", OMIcons.person, 105, Color(0xff594ccf)),
    ];

    //Create the views which will be mapped to the indices for our nav btns
    _viewsByIndex = <Widget>[
      TravelCardDemo(),
      // HomePage(),
      // GalleryPage(),
      DrinkRewardsListDemo(),
      CameraPage(),
      LikesPage(),
      profilePage()
    ];
    super.initState();
  }

  Widget profilePage() {
    if(SignupFormState.character == SingingCharacter.business) {
      return SpendingTrackerDemo();
    }else if(SignupFormState.character == SingingCharacter.citizen) {
      return ProfileEightPage();
    }else {
      return ProfileTwoPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    var accentColor = _navBarItems[_selectedNavIndex].selectedColor;

    //Create custom navBar, pass in a list of buttons, and listen for tap event
    var navBar = NavBar(
      items: _navBarItems,
      itemTapped: _handleNavBtnTapped,
      currentIndex: _selectedNavIndex,
    );
    //Display the correct child view for the current index
    var contentView = _viewsByIndex[min(_selectedNavIndex, _viewsByIndex.length - 1)];
    //Wrap our custom navbar + contentView with the app Scaffold
    return Scaffold(
      backgroundColor: Color(0xffE6E6E6),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          //Wrap the current page in an AnimatedSwitcher for an easy cross-fade effect
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 350),
            //Pass the current accent color down as a theme, so our overscroll indicator matches the btn color
            child: Theme(
              data: ThemeData(accentColor: accentColor),
              child: contentView,
            ),
          ),
        ),
      ),
      bottomNavigationBar: navBar, //Pass our custom navBar into the scaffold
    );
  }

  void _handleNavBtnTapped(int index) {
    //Save the new index and trigger a rebuild
    setState(() {
      //This will be passed into the NavBar and change it's selected state, also controls the active content page
      _selectedNavIndex = index;
    });
  }
}
