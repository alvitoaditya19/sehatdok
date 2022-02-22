import 'package:flutter/material.dart';
import 'package:sehatdok/shared/shared.dart';

class TipsKes extends StatelessWidget {
  TipsKes({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    'Tips Kesehatan',
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'Jagalah Tubuhmu Setiap Harinya',
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    height: 230,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/image_sehat.png'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 24,
                    ),
                    child: Text(
                      'Ada banyak cara untuk menjaga pola hidup sehat. Salah satu hal paling penting yaitu untuk tidak melewatkan sarapan.',
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 14,
                    ),
                    child: Text(
                      'Penelitian yang dikutip oleh Livescience.com menyebutkan bahwa orang yang melewatkan sarapan cenderung mengalami peningkatan berat badan dibanding dengan yang tidak melewatkannya karena orang cenderung merasa lapar pada siang hari. Saat menahan lapar, hormon leptin akan dikeluarkan dan menyebabkan meningkatnya nafsuk makan tanpa terkendali.',
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
