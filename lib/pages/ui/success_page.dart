part of 'pages.dart';

class SuccessPage extends StatelessWidget {
  // const SuccessPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 270,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("assets/success.png"))),
            ),
            Text(
              "Ticket Booked!",
              style: blackTextStyle.copyWith(
                fontSize: 32,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Thanks For Using Our Service!\nEnjoy Your Vacation!",
              textAlign: TextAlign.center,
              style: greyTextStyle.copyWith(fontSize: 16, fontWeight: light),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 54,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPage(),
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.blue,
                child: Text(
                  "Back to Home",
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
