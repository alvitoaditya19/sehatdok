part of 'pages.dart';

class GetStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image_splash.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Center(
                    child: Text(
                      'Treat Patient Like A Queen',
                      style: whiteTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 6),
                  child: Center(
                    child: Text(
                      'Explore the best our services with\nprofessional specialist doctor',
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: light,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Spacer(),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      context.bloc<PageBloc>().add(GoToSignInPage());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 14,
                      ),
                      margin: EdgeInsets.only(
                        bottom: 46,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: kWhiteColor,
                      ),
                      child: Text(
                        'Get Started',
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
