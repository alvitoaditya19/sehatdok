part of 'pages.dart';

class DetailPage extends StatefulWidget {
  final String imageUrl;
  final String name;
  final double rating;
  final double price;
  final String address;
  final String gmaps;
  final String spesialis;
  final String userId;

  DetailPage(
      {this.imageUrl,
      this.name,
      this.rating,
      this.address,
      this.price,
      this.gmaps,
      this.spesialis,
      this.userId});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  void customLaunch(command) async {
    await launch(command);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        bottom: true,
        child: Stack(
          children: [
            Image.asset(
              widget.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(28),
                    ),
                    color: kBackgroundColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: defaultMargin,
                          right: defaultMargin,
                          top: 30,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.name,
                                    style: blackTextStyle.copyWith(
                                      fontSize: 24,
                                      fontWeight: medium,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    widget.spesialis,
                                    style: greyTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: light,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 28,
                                  width: 28,
                                  margin: EdgeInsets.only(
                                    right: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/icon_star.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 2,
                                  ),
                                  child: Text(
                                    widget.rating.toString(),
                                    style: blackTextStyle.copyWith(
                                      fontWeight: medium,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                          top: 18,
                          left: defaultMargin,
                          right: defaultMargin,
                        ),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: kGrey2Color,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Harga mulai dari',
                              style: blackTextStyle,
                            ),
                            Text(
                              '\Rp. ' + widget.price.toString(),
                              style: blueTextStyle.copyWith(
                                  fontSize: 16, fontWeight: semiBold),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: defaultMargin),
                        child: Text(
                          'Fasilitas',
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: defaultMargin,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItem(
                              name: 'Konsultasi',
                              imageUrl: 'assets/icon_chat2.png',
                            ),
                            FacilityItem(
                              name: '10 Jam Kerja',
                              imageUrl: 'assets/icon_alarm.png',
                            ),
                            FacilityItem(
                              name: 'Resep Terbaik',
                              imageUrl: 'assets/icon_drug.png',
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 18,
                          left: defaultMargin,
                          right: defaultMargin,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dokter Terkait',
                              style: blackTextStyle.copyWith(
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  PopularSpot(
                                    imageUrl: 'assets/image_doctor1.jpg',
                                  ),
                                  PopularSpot(
                                    imageUrl: 'assets/image_doctor2.jpg',
                                  ),
                                  PopularSpot(
                                    imageUrl: 'assets/image_doctor3.jpg',
                                  ),
                                  PopularSpot(
                                    imageUrl: 'assets/image_doctor4.jpg',
                                  ),
                                  PopularSpot(
                                    imageUrl: 'assets/image_doctor5.jpg',
                                  ),
                                  PopularSpot(
                                    imageUrl: 'assets/image_doctor6.jpeg',
                                  ),
                                  PopularSpot(
                                    imageUrl: 'assets/image_doctor7.png',
                                  ),
                                  PopularSpot(
                                    imageUrl: 'assets/image_doctor8.png',
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 18,
                          left: defaultMargin,
                          right: defaultMargin,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.all(defaultMargin),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GuideTourPage(),
                                  ),
                                );
                              },
                              child: Container(
                                width: 54,
                                height: 54,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/button_chat.png'))),
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Container(
                                height: 54,
                                child: BlocBuilder<UserBloc, UserState>(
                                  builder: (_, userState) {
                                    if (userState is UserLoaded) {
                                      if (imageFileToUpload != null) {
                                        uploadImage(imageFileToUpload)
                                            .then((downloadURL) {
                                          imageFileToUpload = null;
                                          context.bloc<UserBloc>().add(
                                              UpdateData(
                                                  profileImage: downloadURL));
                                        });
                                      }
                                      return TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => BookingPage(
                                                  detailPage: DetailPage(
                                                userId: userState.user.id,
                                                imageUrl: widget.imageUrl,
                                                name: widget.name,
                                                spesialis: widget.spesialis,
                                                price: widget.price,
                                                rating: widget.rating,
                                              )),
                                            ),
                                          );
                                        },
                                        style: TextButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          backgroundColor: kBlueColor,
                                        ),
                                        child: Text(
                                          'Lanjut Pemesanan',
                                          style: whiteTextStyle.copyWith(
                                            fontSize: 16,
                                            fontWeight: semiBold,
                                          ),
                                        ),
                                      );
                                    } else {
                                      return SpinKitFadingCircle(
                                        color: kBlueColor,
                                        size: 50,
                                      );
                                    }
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
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
          ],
        ),
      ),
    );
  }
}
