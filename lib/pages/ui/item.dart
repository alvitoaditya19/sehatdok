import 'package:flutter/material.dart';
import 'package:sehatdok/models/product.dart';
import 'package:sehatdok/shared/shared.dart';


class Item extends StatefulWidget {
  final Product product;

  final ValueChanged<bool> onSelected;
  Item({
    Key key,
    this.product,
    this.onSelected,
  }) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;

          widget.onSelected(_isSelected);
        });
      },
      child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 400),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: _isSelected
                    ? Border.all(
                        width: 2.0,
                        color: Colors.orange[100],
                      )
                    : null,
              ),
              child: Icon(
                widget.product.iconData,
                size: 32.0,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              widget.product.title,
              style: blackTextStyle.copyWith(fontWeight: bold),
            )
          ],
        ),
      ),
    );
  }
}
