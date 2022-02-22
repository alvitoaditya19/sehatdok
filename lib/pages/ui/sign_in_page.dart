part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isSigningIn = false;
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: Text(
          'Get Ready for\nTreatment with Us',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget inputSection() {
      Widget emailInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email Address',
                style: blackTextStyle,
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                onChanged: (text) {
                  setState(() {
                    isEmailValid = EmailValidator.validate(text);
                  });
                },
                controller: emailController,
                cursorColor: kBlackColor,
                decoration: InputDecoration(
                  hintText: 'Email Address',
                  hintStyle: blackTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      defaultRadius,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      defaultRadius,
                    ),
                    borderSide: BorderSide(
                      width: 2,
                      color: kBlueColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }

      Widget passwordInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Password',
                style: blackTextStyle,
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                onChanged: (text) {
                  setState(() {
                    isPasswordValid = text.length >= 6;
                  });
                },
                controller: passwordController,
                cursorColor: kBlackColor,
                obscureText: _isObscure,
                decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: blackTextStyle.copyWith(
                      fontSize: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        defaultRadius,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        defaultRadius,
                      ),
                      borderSide: BorderSide(
                        width: 2,
                        color: kBlueColor,
                      ),
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(_isObscure
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        })),
              )
            ],
          ),
        );
      }

      Widget signInButton() {
        return Container(
          height: 55,
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 32),
          child: isSigningIn
              ? SpinKitFadingCircle(
                  color: kBlueColor,
                )
              : TextButton(
                  onPressed: isEmailValid && isPasswordValid
                      ? () async {
                          setState(() {
                            isSigningIn = true;
                          });

                          SignInSignUpResult result = await AuthServices.signIn(
                              emailController.text, passwordController.text);

                          if (result.user == null) {
                            setState(() {
                              isSigningIn = false;
                            });

                            Flushbar(
                              duration: Duration(seconds: 4),
                              flushbarPosition: FlushbarPosition.TOP,
                              backgroundColor: Color(0xFFFF5C83),
                              message: result.message,
                            )..show(context);
                          }
                        }
                      : null,
                  style: TextButton.styleFrom(
                    backgroundColor: kBlueColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                  ),
                  child: Text(
                    'Sign-In',
                    style: whiteTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 18,
                    ),
                  ),
                ),
        );
      }

      Widget optionButton() {
        return Container(
          margin: EdgeInsets.only(bottom: 30),
          child: Row(
            children: [
              Text(
                'Don’t have an account?',
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 16,
                ),
              ),
              GestureDetector(
                onTap: () {
                  context
                      .bloc<PageBloc>()
                      .add(GoToRegistrationPage(RegistrationData()));
                },
                child: Text(
                  ' Sign-Up',
                  style: blueTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        );
      }

      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(
              defaultRadius,
            )),
        child: Column(
          children: [
            emailInput(),
            passwordInput(),
            signInButton(),
            optionButton()
          ],
        ),
      );
    }

    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToSplashPage());

        return;
      },
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            children: [
              title(),
              inputSection(),
            ],
          ),
        ),
      ),
    );
  }
}
