import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sehatdok/shared/shared.dart';
import 'package:url_launcher/url_launcher.dart';

class BeritaKes extends StatefulWidget {
  @override
  _BeritaKesState createState() => _BeritaKesState();
}

class _BeritaKesState extends State<BeritaKes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
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
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
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
                        Divider(
                          color: kBlackColor,
                          height: 20,
                          thickness: 1,
                          endIndent: 20,
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          removeBottom: true,
                          child: StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection("beritaKesehatan")
                                  .snapshots(),
                              builder: (_, snapshot) {
                                if (!snapshot.hasData)
                                  return SpinKitCircle(
                                      color: kBlueColor, size: 100);
                                return NewsList(newsInfo: snapshot.data.docs);
                              }),
                        ),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.transparent,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NewsList extends StatelessWidget {
  final List<DocumentSnapshot> newsInfo;

  NewsList({
    Key key,
    this.newsInfo,
  }) : super(key: key);

  void customLaunch(command) async {
    await launch(command);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(bottom: 60),
        shrinkWrap: true,
        itemCount: newsInfo.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              customLaunch(newsInfo[index].data()["link"].toString());
            },
            child: Column(
              children: [
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        child: Image.network(
                            newsInfo[index].data()["gambar"].toString()),
                      ),
                      ListTile(
                        title: Text(
                          newsInfo[index].data()["judul"].toString(),
                          style: blackTextStyle.copyWith(
                              fontWeight: FontWeight.w600, fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          "Tentang : " +
                              newsInfo[index].data()["tentang"].toString(),
                          style:
                              greyTextStyle.copyWith(
                                fontSize: 12
                              ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Flexible(
                            child: Text(
                              newsInfo[index].data()["deskripsi"].toString(),
                              style: greyTextStyle,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          );
        });
  }
}
