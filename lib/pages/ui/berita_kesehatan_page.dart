import 'package:flutter/material.dart';
import 'package:sehatdok/shared/shared.dart';

class BeritaKes extends StatefulWidget {
  @override
  _BeritaKesState createState() => _BeritaKesState();
}

class _BeritaKesState extends State<BeritaKes> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(child: SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
                vertical: 18,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/btn_back.png',
                      width: 46,
                      height: 40,
                    ),
                  ),
                  // Image.asset(
                  //   'assets/btn_wishlist.png',
                  //   width: 40,
                  // ),
                ],
              ),
            ),
         
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Berita Kesehatan',
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'Info Seputar Dunia Kesehatan Untukmu',
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
        ],
      ),),),
    
    );
  }
}