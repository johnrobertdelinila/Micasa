import 'package:flutter/material.dart';

class City {
  final String name;
  final String title;
  final String description;
  final Color color;
  final List<Hotel> hotels;

  City({
    this.title,
    this.name,
    this.description,
    this.color,
    this.hotels,
  });
}

class Hotel {
  final String name;
  double rate;
  final int reviews;
  final int price;

  Hotel(this.name, {this.reviews, this.price}) : rate = 5.0;
}

class DemoData {
  List<City> _cities = [
    City(
        name: 'London',
        title: 'Luna Church and Baluarte',
        description: 'Visit some of Luna’s remaining heritage sites. The St. Catherine of Alexandria Parish',
        color: Color(0xffdaf3f7),
        hotels: [
          Hotel('Food and Goodies', reviews: 762, price: 87),
          Hotel('Lorem Ipsum', reviews: 3122, price: 196),
          Hotel('Ride', reviews: 213, price: 217),
        ]),
    City(
        name: 'Pisa',
        title: 'La Union sunset',
        description: 'La Union’s coastline is blessed with glorious sunset views including Urbiztondo Beach.',
        color: Color(0xffdee5cf),
        hotels: [
          Hotel('Lorem Ipsum', reviews: 201, price: 120),
          Hotel('Dolor Sete', reviews: 85, price: 98),
          Hotel('Dummy Data', reviews: 128, price: 119),
        ]),
    City(
        name: 'Budapest',
        title: 'Bahay Na Bato',
        description: 'Built from stones found along Luna’s rare pebbled beaches, the rest house sits on a peaceful property owned by Dr. Edison and Dr. Purita Chan-Noble.',
        color: Color(0xfff9d9e2),
        hotels: [
          Hotel('Suman', reviews: 1624, price: 418),
          Hotel('Massage', reviews: 101, price: 101),
          Hotel('Service 101', reviews: 161, price: 128),
        ]),
  ];

  List<City> getCities() => _cities;
  List<Hotel> getHotels(City city) => city.hotels;
}
