part of 'pages.dart';

class BookingPage extends StatefulWidget {
  // const BookingPage({ Key? key }) : super(key: key);

  final DetailPage detailPage;

  const BookingPage({
    this.detailPage,
  });

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int jml = 1;
  String time = 'Tap to Select the Date';
  bool dateService = true;
  DateTime _dateTime;
  String payment = 'Tap to Select\nPayment Method';

  void _simpanTiket() {
    FirebaseFirestore.instance.runTransaction((transaction) async {
      CollectionReference reference =
          FirebaseFirestore.instance.collection("dataTiket");
      await reference.add({
        "Place": widget.detailPage.name,
        "Date": time,
        "Price": "${jml * widget.detailPage.price}",
        "Traveler": jml,
        "Payment": payment
      });
    });
  }

  void _add() {
    setState(() {
      jml += 1;
    });
  }

  void _remove() {
    setState(() {
      jml -= 1;
    });
  }

  var whatsapp = "+6282297145285";

  void customLaunch(command) async {
    await launch(command);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text(
          "Book Ticket",
          style: whiteTextStyle,
        ),
        backgroundColor: kBlueColor,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(24),
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Your Balance",
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 10,
                    ),
                    child: BlocBuilder<UserBloc, UserState>(
                        builder: (_, userState) {
                      if (userState is UserLoaded) {
                        if (imageFileToUpload != null) {
                          uploadImage(imageFileToUpload).then((downloadURL) {
                            imageFileToUpload = null;
                            context
                                .bloc<UserBloc>()
                                .add(UpdateData(profileImage: downloadURL));
                          });
                        }
                        return Row(
                          children: <Widget>[
                            Container(
                              child: Stack(
                                children: <Widget>[
                                  SpinKitFadingCircle(
                                    color: kBlueColor,
                                    size: 50,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context.bloc<PageBloc>().add(
                                          GoToEditProfilePage(
                                              (userState as UserLoaded).user));
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: (userState
                                                        .user.profilePicture ==
                                                    ""
                                                ? AssetImage(
                                                    "assets/user_pic.png")
                                                : NetworkImage(userState
                                                    .user.profilePicture)),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    child: Text(
                                      r'$ ' + userState.user.balance.toString(),
                                      style: blackTextStyle.copyWith(
                                        fontSize: 18,
                                        fontWeight: medium,
                                      ),
                                      overflow: TextOverflow.clip,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    "Current Balance",
                                    style: greyTextStyle.copyWith(
                                      fontWeight: light,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      } else {
                        return SpinKitFadingCircle(
                          color: kBlueColor,
                          size: 50,
                        );
                      }
                    }),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'List Booking Item ',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                ),
                Icon(
                  Icons.fiber_manual_record,
                  size: 26,
                  color: kBlueColor,
                ),
                Icon(
                  Icons.fiber_manual_record,
                  size: 26,
                  color: kBlueColor,
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        widget.detailPage.imageUrl)))),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.detailPage.name,
                                style: blackTextStyle.copyWith(
                                  fontWeight: medium,
                                  fontSize: 18,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                'Bali',
                                style: greyTextStyle.copyWith(
                                  fontWeight: light,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              margin: EdgeInsets.only(
                                right: 2,
                              ),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/icon_star.png',
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              widget.detailPage.rating.toString(),
                              style: blackTextStyle.copyWith(
                                fontWeight: medium,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Booking Details',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RowDetails(
                      det1: "Refferal Code",
                      det2: randomAlphaNumeric(15),
                      clr: kBlueColor,
                      weight: semiBold,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/ceklis.png",
                              width: 30,
                              height: 30,
                            ),
                            Text("Traveler(s)", style: blackTextStyle),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 120,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(color: kBlueColor)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                      onTap: jml >= 2 ? _remove : null,
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: kBlueColor,
                                              border:
                                                  Border.all(color: kBlueColor),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Icon(Icons.remove,
                                              color: Colors.white))),
                                  Text(jml.toString()),
                                  GestureDetector(
                                      onTap: _add,
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: kBlueColor,
                                              border:
                                                  Border.all(color: kBlueColor),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Icon(Icons.add,
                                              color: Colors.white)))
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    GestureDetector(
                      onTap: () async {
                        _dateTime = await showDatePicker(
                            context: context,
                            initialDate:
                                _dateTime == null ? DateTime.now() : _dateTime,
                            firstDate: DateTime(2021, 9, 7),
                            lastDate: DateTime(2022));

                        if (_dateTime != null) {
                          setState(() {
                            time = DateFormat('dd-MM-yyyy').format(_dateTime);
                          });
                        } else {
                          time = time;
                        }
                      },
                      child: RowDetails(
                        det1: 'Date',
                        det2: time,
                        clr: (_dateTime != null) ? kBlackColor : kRedColor,
                        weight: semiBold,
                      ),
                    ),
                    RowDetails(
                      det1: 'Insurance',
                      det2: 'YES',
                      clr: kGreenColor,
                      weight: semiBold,
                    ),
                    RowDetails(
                      det1: 'Tax',
                      det2: 'NO',
                      clr: kBlackColor,
                      weight: semiBold,
                    ),
                    RowDetails(
                      det1: 'Vaccinated Covid-19',
                      det2: 'REQUIRE',
                      clr: kGreenColor,
                      weight: semiBold,
                    ),
                    RowDetails(
                      det1: 'Price (per Ticket)',
                      det2: r"$ " + widget.detailPage.price.toString(),
                      clr: kBlackColor,
                      weight: semiBold,
                    ),
                    RowDetails(
                      det1: 'Total Price',
                      det2: r"$ " + "${jml * widget.detailPage.price}",
                      clr: kBlueColor,
                      weight: semiBold,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => SimpleDialog(
                                  title: Text("Select Payment Method",
                                      style: blackTextStyle.copyWith(
                                        fontWeight: semiBold,
                                      )),
                                  children: [
                                    ListTile(
                                      leading: Image.asset(
                                          "assets/icon_balance.png",
                                          height: 45),
                                      title: Text("Account Balance",
                                          style: blackTextStyle),
                                      onTap: () {
                                        setState(() {
                                          payment = "Account Balance";
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      leading: Image.asset("assets/ovo.png"),
                                      title: Text("OVO", style: blackTextStyle),
                                      onTap: () {
                                        setState(() {
                                          payment = "OVO";
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      leading: Image.asset("assets/bca.png"),
                                      title: Text("Bank Central Asia",
                                          style: blackTextStyle),
                                      onTap: () {
                                        setState(() {
                                          payment = "Bank Central Asia";
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      leading: Image.asset("assets/jenius.png"),
                                      title:
                                          Text("Jenius", style: blackTextStyle),
                                      onTap: () {
                                        setState(() {
                                          payment = "Jenius";
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      leading: Image.asset("assets/paypal.png"),
                                      title:
                                          Text("PayPal", style: blackTextStyle),
                                      onTap: () {
                                        setState(() {
                                          payment = "PayPal";
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ));
                      },
                      child: RowDetails(
                        det1: 'Payment Method',
                        det2: payment,
                        clr: (payment == 'Tap to Select\nPayment Method')
                            ? kRedColor
                            : kBlackColor,
                        weight: semiBold,
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: 24,
            ),

            // ignore: missing_return
            BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
              if (userState is UserLoaded) {
                return Container(
                  height: 54,
                  child: TextButton(
                    onPressed: () {
                      if ((userState.user.balance >=
                              (jml * widget.detailPage.price)) &&
                          time != 'Tap to Select the Date' &&
                          payment == 'Account Balance') {
                        Alert(
                          context: context,
                          type: AlertType.warning,
                          title: "Book Now?",
                          desc: "Make Sure All of Your Data is Right!",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.pop(context),
                              color: kRedColor,
                            ),
                            DialogButton(
                              child: Text(
                                "Book!",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SuccessPage(),
                                  ),
                                );
                                _simpanTiket();
                              },
                              width: 180,
                            ),
                          ],
                        ).show();
                      } else if (time != 'Tap to Select the Date' &&
                          payment != 'Account Balance' &&
                          payment != 'Tap to Select Payment Method') {
                        Alert(
                          context: context,
                          type: AlertType.warning,
                          title: "Book Now?",
                          desc: "Make Sure All of Your Data is Right!",
                          style: AlertStyle(
                            titleStyle: blackTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                            descStyle: greyTextStyle,
                          ),
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Cancel",
                                style: GoogleFonts.poppins(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.pop(context),
                              color: kRedColor,
                            ),
                            DialogButton(
                              child: Text(
                                "Book!",
                                style: GoogleFonts.poppins(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SuccessPage(),
                                  ),
                                );
                                _simpanTiket();
                              },
                              width: 180,
                            ),
                          ],
                        ).show();
                      } else {
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "PAYMENT FAILED",
                          style: AlertStyle(
                            titleStyle: blackTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                            descStyle: greyTextStyle,
                          ),
                          desc: "Check your Date or Balance!",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Charge",
                                style: GoogleFonts.poppins(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => customLaunch(
                                  "https://wa.me/+62822-9714-5285?text=Hey,%20I%20Want%20to%20Refill%20my%20Vacation%20App%20Balance,%20Please"),
                              width: 120,
                            )
                          ],
                        ).show();
                      }
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: kBlueColor,
                    ),
                    child: Text(
                      'Pay Now',
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
