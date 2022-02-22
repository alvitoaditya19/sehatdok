part of 'shared.dart';

const double defaultMargin = 24;
double defaultRadius = 17.0;

Color mainColor = Color(0xFF503E9D);
Color accentColor2 = Color(0xFFFBD460);

Color kRedColor = Color(0xFFE13D26);
Color kPrimaryColor = Color(0xff0D2841);
Color kBlackColor = Color(0xff1F1449);
Color kWhiteColor = Color(0xffFFFFFF);
Color kBackgroundColor = Color(0xffFAFAFA);
Color kBlueColor = Color(0xff308CF8);
Color kYellowColor = Color(0xffF1F51C);
Color kGreyColor = Color(0xff9698A9);
Color kGrey2Color = Color(0xffF4F4F4);
Color kGreenColor = Color(0xff27E07C);
Color transparentColor = Colors.transparent;

Color kOrangeColor = Color(0xffFFA235);

TextStyle blackTextStyle = GoogleFonts.poppins(
  color: kBlackColor,
);
TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: kWhiteColor,
);
TextStyle greyTextStyle = GoogleFonts.poppins(
  color: kGreyColor,
);
TextStyle blueTextStyle = GoogleFonts.poppins(
  color: kBlueColor,
);
TextStyle redTextStyle = GoogleFonts.poppins(
  color: kRedColor,
);

TextStyle whiteNumberFont =
    GoogleFonts.openSans().copyWith(color: Colors.white);
TextStyle yellowNumberFont =
    GoogleFonts.openSans().copyWith(color: accentColor2);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;
