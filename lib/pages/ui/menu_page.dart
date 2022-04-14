part of 'pages.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int selectedIndex = 0;

  // You can use data fetched from a database or a server as well
  final List<Map<String, dynamic>> _allUsers = [
    {
      "id": 1,
      "name": "dr. Adam",
      "spesialis": "Dokter Umum",
      "imageUrl": 'assets/image_doctor1.jpg',
      "rating": 4.9.toDouble(),
      "price": 27.toDouble(),
    },
    {
      "id": 2,
      "name": "dr. Albert Sp.PD",
      "spesialis": "Spesialis Penyakit Dalam",
      "imageUrl": 'assets/image_doctor2.jpg',
      "rating": 4.9.toDouble(),
      "price": 12.toDouble(),
    },
    {
      "id": 3,
      "name": "dr. Natasha Sp.THT",
      "spesialis": "Spesialis THT",
      "imageUrl": 'assets/image_doctor3.jpg',
      "rating": 4.8.toDouble(),
      "price": 17.toDouble(),
    },
    {
      "id": 4,
      "name": "dr. Indah Sp.U",
      "spesialis": "Spesialis Urologi",
      "imageUrl": 'assets/image_doctor4.jpg',
      "rating": 4.8.toDouble(),
      "price": 9.toDouble(),
    },
    {
      "id": 5,
      "name": "dr. Citra Sp.BF",
      "spesialis": "Spesialis Bedah Saraf",
      "imageUrl": 'assets/image_doctor5.jpg',
      "rating": 4.5.toDouble(),
      "price": 8.toDouble(),
    },
    {
      "id": 6,
      "name": "dr. Fajar Sp.B",
      "spesialis": "Spesialis Bedah",
      "imageUrl": 'assets/image_doctor6.jpeg',
      "rating": 4.4.toDouble(),
      "price": 21.toDouble(),
    },
    {
      "id": 7,
      "name": "dr. Marsya Sp.KJ",
      "spesialis": "Spesialis Kedokteran Jiwa",
      "imageUrl": 'assets/image_doctor7.png',
      "rating": 4.3.toDouble(),
      "price": 18.toDouble(),
    },
    {
      "id": 8,
      "name": "dr. Dinda Sp.M",
      "spesialis": "Spesialis Mata",
      "imageUrl": 'assets/image_doctor8.png',
      "rating": 4.4.toDouble(),
      "price": 7.toDouble(),
    },
  ];

  List<Map<String, dynamic>> _foundUsers = [];

  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else if (enteredKeyword == "All Doctor") {
      results = _allUsers.toList();
    } else {
      results = _allUsers
          .where((user) => user["spesialis"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: accentColor2)));

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: defaultMargin,
          bottom: 14,
        ),
        child: BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        child: Text(
                          "Hello, \n" + userState.user.name,
                          style: blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Stay Healthy with Our Spesialis Doctor',
                        style: greyTextStyle.copyWith(
                          fontWeight: light,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Stack(
                    children: <Widget>[
                      SpinKitFadingCircle(
                        color: kBlueColor,
                        size: 70,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.bloc<PageBloc>().add(GoToEditProfilePage(
                              (userState as UserLoaded).user));
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: kWhiteColor,
                              width: 4,
                            ),
                            image: DecorationImage(
                                image: (userState.user.profilePicture == ""
                                    ? AssetImage("assets/user_pic.png")
                                    : NetworkImage(
                                        userState.user.profilePicture)),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
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
      );
    }

    Widget listCategories() {
      Widget categories(int index, String title) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            _runFilter(title);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: selectedIndex == index ? kBlueColor : Colors.transparent,
              border: Border.all(
                color: selectedIndex == index ? kBlueColor : kGreyColor,
              ),
            ),
            child: Text(
              title,
              style: selectedIndex == index
                  ? whiteTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: medium,
                    )
                  : greyTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: medium,
                    ),
            ),
          ),
        );
      }

      ;
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ), //   Container(
              //     padding: EdgeInsets.symmetric(
              //       horizontal: 12,
              //       vertical: 10,
              //     ),
              //     margin: EdgeInsets.only(right: 16),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(12),
              //       color: kBlueColor,
              //     ),
              //     child: Text(
              //       'All Doctor',
              //       style: whiteTextStyle.copyWith(
              //         fontSize: 13,
              //         fontWeight: medium,
              //       ),
              //     ),
              //   ),
              //   Container(
              //     padding: EdgeInsets.symmetric(
              //       horizontal: 12,
              //       vertical: 10,
              //     ),
              //     margin: EdgeInsets.only(right: 16),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(12),
              //       border: Border.all(
              //         color: kGreyColor,
              //       ),
              //       color: transparentColor,
              //     ),
              //     child: Text(
              //       'THT',
              //       style: greyTextStyle.copyWith(
              //         fontSize: 13,
              //         fontWeight: medium,
              //       ),
              //     ),
              //   ),
              //   Container(
              //     padding: EdgeInsets.symmetric(
              //       horizontal: 12,
              //       vertical: 10,
              //     ),
              //     margin: EdgeInsets.only(right: 16),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(12),
              //       border: Border.all(
              //         color: kGreyColor,
              //       ),
              //       color: transparentColor,
              //     ),
              //     child: Text(
              //       'Kulit Kelamin',
              //       style: greyTextStyle.copyWith(
              //         fontSize: 13,
              //         fontWeight: medium,
              //       ),
              //     ),
              //   ),
              //   Container(
              //     padding: EdgeInsets.symmetric(
              //       horizontal: 12,
              //       vertical: 10,
              //     ),
              //     margin: EdgeInsets.only(right: 16),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(12),
              //       border: Border.all(
              //         color: kGreyColor,
              //       ),
              //       color: transparentColor,
              //     ),
              //     child: Text(
              //       'Penyakit Dalam',
              //       style: greyTextStyle.copyWith(
              //         fontSize: 13,
              //         fontWeight: medium,
              //       ),
              //     ),
              //   ),
              //   Container(
              //     padding: EdgeInsets.symmetric(
              //       horizontal: 12,
              //       vertical: 10,
              //     ),
              //     margin: EdgeInsets.only(right: 16),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(12),
              //       border: Border.all(
              //         color: kGreyColor,
              //       ),
              //       color: transparentColor,
              //     ),
              //     child: Text(
              //       'Gigi',
              //       style: greyTextStyle.copyWith(
              //         fontSize: 13,
              //         fontWeight: medium,
              //       ),
              //     ),
              //   ),
              // ],
              categories(0, 'All Doctor'),
              categories(1, 'Umum'),
              categories(2, 'THT'),
              categories(3, 'Penyakit Dalam'),
              categories(4, 'Urologi'),
              categories(5, 'Bedah'),
              categories(6, 'Bedah Saraf'),
              categories(7, 'Jiwa'),
              categories(8, 'Mata'),
            ],
          ),
        ),
      );
    }

    Widget searchDestination() {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchPage(),
            ),
          );
        },
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: kWhiteColor,
          ),
          child: Row(
            children: [
              Icon(
                Icons.search_rounded,
                color: kGreyColor,
                size: 36.0,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                'Find a Profesional Doctor',
                style: greyTextStyle,
              ),
            ],
          ),
        ),
      );
    }

    Widget recommendedTitle() {
      return Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 14, defaultMargin, 14),
        child: Text(
          'Recommended',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget recommendedDoctor() {
      return Container(
        margin: EdgeInsets.only(left: defaultMargin),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              RecommemdedTile(
                name: 'dr. Adam',
                imageUrl: 'assets/image_doctor1.jpg',
                rating: 4.9,
                price: 27,
                gmaps: 'https://goo.gl/maps/f39DqS5sBuGmkfUq6',
                spesialis: 'Dokter Umum',
              ),
              RecommemdedTile(
                name: 'dr. Albert Sp.PD',
                imageUrl: 'assets/image_doctor2.jpg',
                rating: 4.9,
                price: 12,
                gmaps: 'https://goo.gl/maps/tQNCxVocQA6T1kX26',
                spesialis: 'Spesialis Penyakit Dalam',
              ),
              RecommemdedTile(
                name: 'dr. Natasha Sp.THT',
                imageUrl: 'assets/image_doctor3.jpg',
                rating: 4.8,
                price: 17,
                gmaps: 'https://g.page/gwkbali?share',
                spesialis: 'Spesialis THT',
              ),
              RecommemdedTile(
                name: 'dr. Indah Sp.U',
                imageUrl: 'assets/image_doctor4.jpg',
                rating: 4.8,
                price: 9,
                gmaps: 'https://goo.gl/maps/hxNE2EkgBz65oboK6',
                spesialis: 'Spesialis Urologi',
              ),
            ],
          ),
        ),
      );
    }

    Widget doctorTitle() {
      return Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 14, defaultMargin, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Text(
                'Doctor for You',
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 18,
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
      );
    }

    Widget Doctor() {
      return Container(child: BlocBuilder<UserBloc, UserState>(
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
            return _foundUsers.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _foundUsers.length,
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                  userId: userState.user.id,
                                  imageUrl: _foundUsers[index]['imageUrl'],
                                  name: _foundUsers[index]['name'],
                                  rating: _foundUsers[index]["rating"],
                                  price: _foundUsers[index]['price'],
                                  spesialis: _foundUsers[index]['spesialis'],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(top: 14),
                            decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  margin: EdgeInsets.only(right: 16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        _foundUsers[index]['imageUrl'],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _foundUsers[index]['name'],
                                        style: blackTextStyle.copyWith(
                                          fontSize: 18,
                                          fontWeight: medium,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        _foundUsers[index]['spesialis'],
                                        style: greyTextStyle.copyWith(
                                          fontWeight: light,
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
                                      _foundUsers[index]['rating'].toString(),
                                      style: blackTextStyle.copyWith(
                                        fontWeight: medium,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ))
                : Center(
                    child: Text(
                      'No results found',
                      style: greyTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  );
          }else {
            return SpinKitFadingCircle(
              color: kBlueColor,
              size: 50,
            );
          }
        },
      ));
    }

    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToStartMenu());

        return;
      },
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                searchDestination(),
                listCategories(),
                recommendedTitle(),
                recommendedDoctor(),
                doctorTitle(),
                Doctor(),
                SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
