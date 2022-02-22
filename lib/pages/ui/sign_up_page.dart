part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  final RegistrationData registrationData;

  SignUpPage(this.registrationData);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    nameController.text = widget.registrationData.name;
    emailController.text = widget.registrationData.email;
  }

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: Text(
          'Create Your \nAccount',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget inputSection() {
      Widget imageProfile() {
        return Container(
          width: 90,
          height: 104,
          child: Stack(
            children: <Widget>[
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: (widget.registrationData.profileImage == null)
                            ? AssetImage("assets/user_pic.png")
                            : FileImage(widget.registrationData.profileImage),
                        fit: BoxFit.cover)),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () async {
                    if (widget.registrationData.profileImage == null) {
                      widget.registrationData.profileImage = await getImage();
                    } else {
                      widget.registrationData.profileImage = null;
                    }

                    setState(() {});
                  },
                  child: Container(
                    height: 28,
                    width: 28,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                                (widget.registrationData.profileImage == null)
                                    ? "assets/btn_add_photo.png"
                                    : "assets/btn_del_photo.png"))),
                  ),
                ),
              )
            ],
          ),
        );
      }

      Widget nameInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Full Name',
                style: blackTextStyle,
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: nameController,
                cursorColor: kBlackColor,
                decoration: InputDecoration(
                  hintText: 'Full Name',
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
          margin: EdgeInsets.only(bottom: 20),
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
                controller: passwordController,
                cursorColor: kBlackColor,
                obscureText: true,
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

      Widget repasswordInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Re-Password',
                style: blackTextStyle,
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: retypePasswordController,
                cursorColor: kBlackColor,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Re-Password',
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

      Widget signUpButton() {
        return Container(
          height: 55,
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 32),
          child: TextButton(
            onPressed: () {
              if (!(nameController.text.trim() != "" &&
                  emailController.text.trim() != "" &&
                  passwordController.text.trim() != "" &&
                  retypePasswordController.text.trim() != "")) {
                Flushbar(
                  duration: Duration(milliseconds: 1500),
                  flushbarPosition: FlushbarPosition.TOP,
                  backgroundColor: Color(0xFFFF5C83),
                  message: "Please fill all the fields",
                )..show(context);
              } else if (passwordController.text !=
                  retypePasswordController.text) {
                Flushbar(
                  duration: Duration(milliseconds: 1500),
                  flushbarPosition: FlushbarPosition.TOP,
                  backgroundColor: Color(0xFFFF5C83),
                  message: "Mismatch password and confirmed password",
                )..show(context);
              } else if (passwordController.text.length < 6) {
                Flushbar(
                  duration: Duration(milliseconds: 1500),
                  flushbarPosition: FlushbarPosition.TOP,
                  backgroundColor: Color(0xFFFF5C83),
                  message: "Password's length min 6 characters",
                )..show(context);
              } else if (!EmailValidator.validate(emailController.text)) {
                Flushbar(
                  duration: Duration(milliseconds: 1500),
                  flushbarPosition: FlushbarPosition.TOP,
                  backgroundColor: Color(0xFFFF5C83),
                  message: "Wrong formatted email address",
                )..show(context);
              } else {
                widget.registrationData.name = nameController.text;
                widget.registrationData.email = emailController.text;
                widget.registrationData.password = passwordController.text;

                context
                    .bloc<PageBloc>()
                    .add(GoToAccountConfirmationPage(widget.registrationData));
              }
            },
            style: TextButton.styleFrom(
              backgroundColor: kBlueColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
            ),
            child: Text(
              'Sign-Up',
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
                'Already have an account?',
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 16,
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.bloc<PageBloc>().add(GoToSignInPage());
                },
                child: Text(
                  ' Sign-In',
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
          bottom: 65,
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
            imageProfile(),
            nameInput(),
            emailInput(),
            passwordInput(),
            repasswordInput(),
            signUpButton(),
            optionButton()
          ],
        ),
      );
    }

    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToSignInPage());

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
