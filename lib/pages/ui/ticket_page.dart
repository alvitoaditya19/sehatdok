part of 'pages.dart';

class TicketPage extends StatefulWidget {
  // const TicketPage({ Key? key }) : super(key: key);

  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/ticket.png"))),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pesanan Saya",
                      style: blackTextStyle.copyWith(
                        fontSize: 26,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      "Pesan layanan Dokter ahli!",
                      style: greyTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              color: kBlackColor,
              height: 20,
              thickness: 3,
              indent: 20,
              endIndent: 20,
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
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
                    return MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      removeBottom: true,
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("dataTiket")
                            .where('user_id', isEqualTo: userState.user.id)
                            .snapshots(),
                    builder: (_, snapshot) {
                      if (!snapshot.hasData)
                        return SpinKitCircle(color: kBlueColor, size: 100);
                      return TicketList(ticketInfo: snapshot.data.docs);
                    }
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
            )
          ],
        ),
      ),
    );
  }
}

class TicketList extends StatelessWidget {
  // const TicketList({ Key? key }) : super(key: key);
  final List<DocumentSnapshot> ticketInfo;

  TicketList({
    Key key,
    this.ticketInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(bottom: 60),
        shrinkWrap: true,
        itemCount: ticketInfo.length,
        itemBuilder: (_, index) {
          return Column(
            children: [
              TicketPass(
                  height: 350,
                  alignment: Alignment.centerLeft,
                  ticketTitle: Text('Lunas',
                      style: whiteTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      )),
                  titleHeight: 50,
                  titleColor: kGreenColor,
                  expandIcon:
                      Icon(Icons.check_circle_rounded, color: Colors.white),
                  shouldExpand: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.keyboard_arrow_down_rounded),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Pesanan Anda",
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.keyboard_arrow_down_rounded),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Container(
                          width: 230,
                          height: 230,
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Nama Dokter",
                                      style: blackTextStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                  Text("Tanggal",
                                      style: blackTextStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      ticketInfo[index]
                                          .data()["Place"]
                                          .toString(),
                                      style: greyTextStyle.copyWith(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                      ticketInfo[index]
                                          .data()["Date"]
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: greyTextStyle.copyWith(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14))
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text("Metode Pembayaran :",
                                        style: blackTextStyle.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14)),
                                  ),
                                  Text(
                                    ticketInfo[index]
                                        .data()["Payment"]
                                        .toString(),
                                    style: greyTextStyle.copyWith(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Total Harga",
                                      style: blackTextStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                ],
                              ),
                              Text(
                                  r"$ " +
                                      ticketInfo[index]
                                          .data()["Price"]
                                          .toString(),
                                  style: greyTextStyle.copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16)),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                  height: 50,
                                  child: SfBarcodeGenerator(
                                      value: 'anjaymabar',
                                      symbology: Code128(),
                                      showValue: false))
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
              SizedBox(
                height: 24,
              )
            ],
          );
        });
  }
}
