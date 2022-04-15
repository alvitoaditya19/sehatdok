part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int bottomNavBarIndex;
  final String title;
  final url;

  MainPage({this.bottomNavBarIndex = 0, this.title, this.url});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavBarIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();

    bottomNavBarIndex = widget.bottomNavBarIndex;
    pageController = PageController(initialPage: bottomNavBarIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: accentColor2,
          ),
          SafeArea(
              child: Container(
            color: Color(0xFFF6F7F9),
          )),
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                bottomNavBarIndex = index;
              });
            },
            children: <Widget>[MenuPage(), TicketPage()],
          ),
          createCustomBottomNavBar(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 70,
              width: 70,
              margin: EdgeInsets.only(bottom: 25),
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: Colors.yellow,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.asset("assets/icon_other.png"),
                  ),
                ),
                onPressed: () async {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.only(
                            right: 8,
                            left: 8,
                            bottom: 20,
                          ),
                          title: Text('Additional Menu',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              )),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          content: SingleChildScrollView(
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => TipsKes()));
                                  },
                                  child: ListTile(
                                    leading: Image.asset(
                                      'assets/icon_lamp.png',
                                      width: 44,
                                      height: 44,
                                    ),
                                    title: Text(
                                      'Tips Kesehatan',
                                      style: blackTextStyle.copyWith(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BeritaKes()));
                                  },
                                  child: ListTile(
                                    leading: Image.asset(
                                      'assets/icon_news.png',
                                      width: 44,
                                      height: 44,
                                    ),
                                    title: Text(
                                      'Berita Kesehatan',
                                      style: blackTextStyle.copyWith(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BMIPage()));
                                  },
                                  child: ListTile(
                                    leading: Image.asset(
                                      'assets/icon_cal.png',
                                      width: 44,
                                      height: 44,
                                    ),
                                    title: Text(
                                      'Perhitungan BMI',
                                      style: blackTextStyle.copyWith(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget createCustomBottomNavBar() => Align(
        alignment: Alignment.bottomCenter,
        child: ClipPath(
          clipper: BottomNavBarClipper(),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: BottomNavigationBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                selectedItemColor: Colors.black,
                unselectedItemColor: Color(0xFF999999),
                currentIndex: bottomNavBarIndex,
                onTap: (index) {
                  setState(() {
                    bottomNavBarIndex = index;
                    pageController.jumpToPage(index);
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    title: Text(
                      "Menu Utama",
                      style: (bottomNavBarIndex == 0)
                          ? blueTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: medium,
                            )
                          : greyTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: medium,
                            ),
                    ),
                    icon: Image.asset(
                      (bottomNavBarIndex == 0)
                          ? "assets/icon_dct1.png"
                          : "assets/icon_dct2.png",
                      height: 32,
                      width: 70,
                    ),
                  ),
                  BottomNavigationBarItem(
                      title: Text(
                        "Pesanan Saya",
                        style: (bottomNavBarIndex == 1)
                            ? blueTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: medium,
                              )
                            : greyTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: medium,
                              ),
                      ),
                      icon: Container(
                        height: 26,
                        margin: EdgeInsets.only(bottom: 5),
                        child: Image.asset((bottomNavBarIndex == 1)
                            ? "assets/icon_ticket1.png"
                            : "assets/icon_ticket2.png"),
                      ))
                ]),
          ),
        ),
      );
}

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
