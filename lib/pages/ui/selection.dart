import 'package:flutter/material.dart';
import 'package:sehatdok/models/product.dart';
import 'package:sehatdok/pages/ui/item.dart';
import 'package:sehatdok/shared/shared.dart';

class BMIPage extends StatefulWidget {
  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  List<Product> pickItem = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Multi'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 130,
          
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...List.generate(
                    productList.length,
                    (index) => Item(
                      product: productList[index],
                      onSelected: (bool value) {
                        if (value) {
                          pickItem.where((e)=>e == productList).toList();
                        } else {
                          pickItem.map((e) => productList).toList();
                        }
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              height: 100,
              width: double.infinity,
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  ...List.generate(pickItem.length, (index) => PickItemTitle(title: pickItem[index].title,),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PickItemTitle extends StatelessWidget {
  final String title;
  const PickItemTitle({
    Key key,this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(
      this.title,
      style: blackTextStyle,
    ),
    padding: EdgeInsets.all(8),
    backgroundColor: Colors.orange[200],
    );
  }
}
