import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sehatdok/shared/shared.dart';
import 'package:sehatdok/pages/ui/tips_kesehatan_page.dart';

class BMIPage extends StatefulWidget {
  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  double bmi = 0.0, num1 = 0, num2 = 0, res = 0, num2bagi;
  String kategori = 'None';
  Color color;

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
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Perhitungan BMI',
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'Berat Badan Ideal',
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Berat Badan (Kg)",
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    "Tinggi Badan (cm)",
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 20,
                ),
                new Flexible(
                  child: new TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintStyle: blackTextStyle,
                      labelStyle: blackTextStyle,
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: weightController,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                new Flexible(
                  child: new TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintStyle: blackTextStyle,
                      labelStyle: blackTextStyle,
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: heightController,
                  ),
                ),
                SizedBox(
                  width: 20,
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  ),
                  onPressed: () {
                    hitungBMI();
                    kategoriBMI();
                  },
                  child: Text(
                    'Hitung',
                    style: whiteTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Total BMI",
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      res.toStringAsFixed(2),
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Kategori",
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      kategori,
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold, color: color),
                    ),
                  ],
                ),
              ],
            ),
            Center(
              child: Container(
                color: Colors.white,
                child: new Image.asset('assets/bmi.png'),
                alignment: Alignment.center,
              ),
            ),
            Center(
              child: ElevatedButton(
                child: Text(
                  'Tips Kesehatan',
                  style: whiteTextStyle.copyWith(
                      fontSize: 18, fontWeight: semiBold),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TipsKes()));
                },
              ),
            ),
            SizedBox(
              height: 20,
            )
          ]),
        ),
      ),
    );
  }

  hitungBMI() {
    setState(() {
      num1 = double.parse(weightController.text);
      num2 = double.parse(heightController.text);
      num2bagi = num2 / 100;
      res = num1 / (num2bagi * num2bagi);
    });
  }

  kategoriBMI() {
    if (res < 18.5) {
      setState(() {
        kategori = 'Kurus';
        color = Colors.blueAccent;
      });
    } else if (res <= 24.9 && res >= 18.5) {
      setState(() {
        kategori = 'Ideal';
        color = Colors.green[300];
      });
    } else if (res <= 29.9 && res > 24.9) {
      setState(() {
        kategori = 'Kelebihan BB';
        color = Colors.orange;
      });
    } else if (res >= 30) {
      setState(() {
        kategori = 'Obesitas';
        color = Colors.red;
      });
    }
  }
}
