part of 'pages.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
        () => this.context.bloc<PageBloc>().add(GoToGetStartedPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlueColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              margin: EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_hospital.png'),
                ),
              ),
            ),
            Text(
              'SEHATDOK',
              style: whiteTextStyle.copyWith(
                fontSize: 32,
                fontWeight: medium,
                letterSpacing: 8,
              ),
            )
          ],
        ),
      ),
    );
  }
}
