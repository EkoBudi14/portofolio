part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 136,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/logo.png"))),
            ),
            Container(
              margin: EdgeInsets.only(top: 70, bottom: 16),
              child: Text(
                "New Experience",
                style: blackTextFont.copyWith(fontSize: 20),
              ),
            ),
            Text(
              "Watch a new movie much\neasier than any before",
              textAlign: TextAlign.center,
              style: greyTextFont.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w300),
            ),
            Container(
              width: 250,
              height: 46,
              margin: EdgeInsets.only(
                top: 70,
                bottom: 19,
              ),
              child: RaisedButton(
                  child: Text(
                    "Get Started",
                    style: whiteTextFont.copyWith(fontSize: 16),
                  ),
                  color: mainColor,
                  onPressed: () {
                    context
                        .bloc<PageBloc>()
                        .add(GoToRegistrationPage(RegistrationData()));
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: greyTextFont.copyWith(fontWeight: FontWeight.w700),
                ),
                GestureDetector(
                  onTap: () {
                    context.bloc<PageBloc>().add(GoToLoginPage());
                  },
                  child: Text(
                    "Sign In",
                    style: purpleTextFont,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
