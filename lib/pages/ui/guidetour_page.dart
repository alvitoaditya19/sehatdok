part of 'pages.dart';

class GuideTourPage extends StatefulWidget {
  // const GuideTourPage({ Key? key }) : super(key: key);

  @override
  _GuideTourPageState createState() => _GuideTourPageState();
}

class _GuideTourPageState extends State<GuideTourPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text("Guide Tour"),
      ),
      body: SafeArea(
        child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Guide Tour',
                    style: blackTextStyle.copyWith(
                      fontSize: 28,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Contact us if you want to know \nall about Bali vacation spot!',
                          style: greyTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: light,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  GuideTour(
                    name: 'I Made Wijaya',
                    imageUrl: 'assets/image_guide1.jpeg',
                    rating: 4.9,
                    walink: 'https://wa.me/+62822-9714-5285',
                  ),
                  GuideTour(
                    name: 'I Putu Sanjaya',
                    imageUrl: 'assets/image_guide2.jpg',
                    rating: 4.9,
                    walink: 'https://wa.me/+62822-9714-5285',
                  ),
                  GuideTour(
                    name: 'Kadek Putra',
                    imageUrl: 'assets/image_guide3.jpg',
                    rating: 4.9,
                    walink: 'https://wa.me/+62822-9714-5285',
                  ),
                  GuideTour(
                    name: 'I Wayan Dharma',
                    imageUrl: 'assets/image_guide4.jpg',
                    rating: 4.9,
                    walink: 'https://wa.me/+62822-9714-5285',
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
