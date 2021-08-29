part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToMainPage());

        return;
      },
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
          return Scaffold(
            body: Stack(
              children: [
                Container(
                  color: accentColor1,
                ),
                SafeArea(
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                ListView(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, left: defaultMargin),
                          padding: EdgeInsets.all(1),
                          child: GestureDetector(
                            onTap: () {
                              context.bloc<PageBloc>().add(GoToMainPage());
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 30),
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: userState.user.profilePicture ==
                                              null
                                          ? AssetImage("assets/user_pic.png")
                                          : NetworkImage(
                                              userState.user.profilePicture),
                                      fit: BoxFit.cover),
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                userState.user.name,
                                style: blackTextFont.copyWith(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                userState.user.email,
                                style: greyTextFont.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 33,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: defaultMargin),
                                  child: BlocBuilder<UserBloc, UserState>(
                                    builder: (_, userState) => Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 10),
                                          width: 24,
                                          height: 24,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/edit_profil.png"))),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            context.bloc<PageBloc>().add(
                                                GoToEditProfilePage(
                                                    (userState as UserLoaded)
                                                        .user));
                                          },
                                          child: Text(
                                            "Edit Profile",
                                            style: blackTextFont.copyWith(
                                                fontSize: 16),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5, bottom: 10),
                              width: 336,
                              child: Divider(
                                thickness: 1,
                                color: accentColor3,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: defaultMargin),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/my_wallet.png"))),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          context.bloc<PageBloc>().add(
                                              GoToWalletPage(
                                                  GoToProfilePage()));
                                        },
                                        child: Text(
                                          "My Wallet",
                                          style: blackTextFont.copyWith(
                                              fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5, bottom: 10),
                              width: 336,
                              child: Divider(
                                thickness: 1,
                                color: accentColor3,
                              ),
                            ),
                            Row(
                              children: [
                                ProfileMenu(
                                    "assets/language.png", "Change Language")
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5, bottom: 10),
                              width: 336,
                              child: Divider(
                                thickness: 1,
                                color: accentColor3,
                              ),
                            ),
                            Row(
                              children: [
                                ProfileMenu(
                                    "assets/help_center.png", "Help Center"),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5, bottom: 10),
                              width: 336,
                              child: Divider(
                                thickness: 1,
                                color: accentColor3,
                              ),
                            ),
                            Row(
                              children: [
                                ProfileMenu(
                                    "assets/rate.png", "Rate Flutix App")
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5, bottom: 10),
                              width: 336,
                              child: Divider(
                                thickness: 1,
                                color: accentColor3,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: defaultMargin),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                              "assets/log_out.png",
                                            ))),
                                      ),
                                      GestureDetector(
                                        child: Text(
                                          "Log Out",
                                          style: blackTextFont.copyWith(
                                              fontSize: 16),
                                        ),
                                        onTap: () {
                                          context
                                              .bloc<UserBloc>()
                                              .add(SignOut());
                                          AuthServices.signOut();
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5, bottom: 10),
                              width: 336,
                              child: Divider(
                                thickness: 1,
                                color: accentColor3,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        } else {
          return SpinKitFadingCircle(
            color: accentColor2,
            size: 50,
          );
        }
      }),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  final String assetImages;
  final String text;

  ProfileMenu(this.assetImages, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            width: 25,
            height: 25,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(assetImages))),
          ),
          Text(
            text,
            style: blackTextFont.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
