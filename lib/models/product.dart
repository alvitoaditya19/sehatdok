import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Product{
  final int id;
  final String title;
  final IconData iconData;

  Product(this.id,this.title, this.iconData);
}


List<Product> productList = [
  Product(1, 'hifispeker', CupertinoIcons.hifispeaker),
  Product(2, 'tv', CupertinoIcons.tv),
  Product(3, 'umbrella', CupertinoIcons.umbrella),
  Product(4, 'rocket', CupertinoIcons.rocket),
  Product(5, 'car', CupertinoIcons.car),

];