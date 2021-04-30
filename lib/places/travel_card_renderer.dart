import 'package:flutter/material.dart';
import 'package:referral_app/favorite/city_details_page.dart';
import 'package:referral_app/favorite/components/white_page_route.dart';
import 'package:referral_app/favorite/demo_data.dart';
import 'demo_data.dart';
import 'main.dart';
import 'styles.dart';

class DemoData {
  CityData _city = CityData(
      name: 'Pisa',
      title: 'La Union sunset',
      description: 'Get ready to explore the city of love filled with romantic scenery and experiences.',
      information:
      'La Union’s coastline is blessed with glorious sunset views including Urbiztondo Beach.',
      color: Color(0xfffdeed5),
      hotels: [
        HotelData('Shangri-La Hotel Paris', reviews: 201, price: 593.0),
        HotelData('Hôtel Trinité Haussmann', reviews: 133, price: 391),
        HotelData('Maison Breguet', reviews: 128, price: 399),
      ]);

  CityData getCity() => _city;
}

class TravelCardRenderer extends StatelessWidget {

  final double offset;
  final double cardWidth;
  final double cardHeight;
  final City city;

  final CityData cityy = DemoData().getCity();

  TravelCardRenderer(this.offset, {Key key, this.cardWidth = 250, @required this.city, this.cardHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handlePressedBtn(context),
      child: Container(
        width: cardWidth,
        margin: EdgeInsets.only(top: 8),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.center,
          children: <Widget>[
            // Card background color & decoration
            Container(
              margin: EdgeInsets.only(top: 30, left: 12, right: 12, bottom: 12),
              decoration: BoxDecoration(
                color: city.color,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 4 * offset.abs()),
                  BoxShadow(color: Colors.black12, blurRadius: 10 + 6 * offset.abs()),
                ],
              ),
            ),
            // City image, out of card by 15px
            Positioned(top: -15, child: _buildCityImage()),
            // City information
            _buildCityData(context)
          ],
        ),
      ),
    );
  }

  Widget _buildCityImage() {
    double maxParallax = 30;
    double globalOffset = offset * maxParallax * 2;
    double cardPadding = 28;
    double containerWidth = cardWidth - cardPadding;
    return Container(
      height: cardHeight,
      width: containerWidth,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          // _buildPositionedLayer("images/${city.name}/${city.name}-Back.png", containerWidth * .8, maxParallax * .1, globalOffset),
          // _buildPositionedLayer("images/${city.name}/${city.name}-Middle.png", containerWidth * .9, maxParallax * .6, globalOffset),
          // _buildPositionedLayer("images/${city.name}/${city.name}-Front.png", containerWidth * .9, maxParallax, globalOffset),
          _buildPositionedLayer("images/${city.name}/${city.name}-Hehe.jpeg", containerWidth * .9, maxParallax, globalOffset),
        ],
      ),
  );
}

  Widget _buildCityData(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // The sized box mock the space of the city image
        SizedBox(width: double.infinity, height: cardHeight * .57),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(city.title, style: Styles.cardTitle, textAlign: TextAlign.center),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(city.description, style: Styles.cardSubtitle, textAlign: TextAlign.center),
        ),
        Expanded(child: SizedBox(),),
        FlatButton(
          disabledColor: Colors.transparent,
          color: Colors.transparent,
          child: Text('Learn More'.toUpperCase(), style: Styles.cardAction),
          onPressed: null,
        ),
        SizedBox(height: 8)
      ],
    );
  }

  void _handlePressedBtn(context) {
    var detailPage = CityDetailsPage(cityy);
    Navigator.push(context, WhitePageRoute(enterPage: detailPage));
  }

  Widget _buildPositionedLayer(String path, double width, double maxOffset, double globalOffset) {
    double cardPadding = 24;
    double layerWidth = cardWidth - cardPadding;
    return Positioned(
        left: ((layerWidth * .5) - (width / 2) - offset * maxOffset) + globalOffset,
        bottom: cardHeight * .45,
        child: Image.asset(
          path,
          width: width,
          package: App.pkg,
        ));
  }
}
