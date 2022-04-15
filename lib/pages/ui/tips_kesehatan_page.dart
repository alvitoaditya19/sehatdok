import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sehatdok/shared/shared.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

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
                    'Jagalah Tubuhmu Setiap Harinya. Berikut Tips Kesehatan hanya Untukmu!',
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("tipsKesehatan")
                          .snapshots(),
                      builder: (_, snapshot) {
                        if (!snapshot.hasData)
                          return SpinKitCircle(color: kBlueColor, size: 100);
                        return HealthList(healthInfo: snapshot.data.docs);
                      })
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class HealthList extends StatelessWidget {
  final List<DocumentSnapshot> healthInfo;
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();

  HealthList({
    Key key,
    this.healthInfo,
  }) : super(key: key);

  void customLaunch(command) async {
    await launch(command);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(bottom: 60),
        shrinkWrap: true,
        itemCount: healthInfo.length,
        itemBuilder: (_, index) {
          return ExpansionTileCard(
            baseColor: Colors.cyan[50],
            expandedColor: Colors.red[50],
            key: cardA,
            leading: CircleAvatar(
                child: Image.network(
                    healthInfo[index].data()["gambar"].toString())),
            title: Text(healthInfo[index].data()["judul"].toString(), style: blackTextStyle,),
            children: <Widget>[
              Divider(
                thickness: 1.0,
                height: 1.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Text(
                    healthInfo[index].data()["deskripsi"].toString(),
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                    )
                  ),
                ),
              ),
            ],
          );
        });
  }
}
