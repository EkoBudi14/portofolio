part of 'pages.dart';

class CheckoutPage extends StatefulWidget {
  final Ticket ticket;

  CheckoutPage(this.ticket);
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    int total = 26500 * widget.ticket.seats.length;

    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToSelectSeatPage(widget.ticket));

        return;
      },
      child: Scaffold(
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
                Stack(
                  children: [
                    // NOTE : BACK BUTTON
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, left: defaultMargin),
                          padding: EdgeInsets.all(1),
                          child: GestureDetector(
                            onTap: () {
                              context
                                  .bloc<PageBloc>()
                                  .add(GoToSelectSeatPage(widget.ticket));
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),

                    BlocBuilder<UserBloc, UserState>(
                      builder: (_, userState) {
                        User user = (userState as UserLoaded).user;

                        return Column(
                          children: [
                            // NOTE : PAGE TITTLE
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                "Checkout\nMovie",
                                style: blackTextFont.copyWith(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            // NOTE : MOVIE DESCRIPTION
                            Row(
                              children: [
                                Container(
                                  width: 70,
                                  height: 100,
                                  margin: EdgeInsets.only(
                                      left: defaultMargin, right: 20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          image: NetworkImage(imageBaseURL +
                                              'w342' +
                                              widget.ticket.movieDetail
                                                  .posterPath),
                                          fit: BoxFit.cover)),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                2 * defaultMargin -
                                                70 -
                                                20,
                                        child: Text(
                                            widget.ticket.movieDetail.title,
                                            style: blackTextFont.copyWith(
                                                fontSize: 18),
                                            maxLines: 2,
                                            overflow: TextOverflow.clip)),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                2 * defaultMargin -
                                                70 -
                                                20,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 6),
                                        child: Text(
                                            widget.ticket.movieDetail
                                                .genresAndLanguage,
                                            style: greyTextFont.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300,
                                            ))),
                                    RatingStars(
                                      voteAverage:
                                          widget.ticket.movieDetail.voteAverage,
                                      color: accentColor3,
                                    )
                                  ],
                                ),
                              ],
                            ),

                            // ANCHOR : ISI DARI CHECKOUT MOVIE
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: defaultMargin),
                              child: Divider(
                                color: Color(0xFFE4E4E4),
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Order ID",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                  Text(
                                    widget.ticket.bookingCode,
                                    style: whiteNumberFont.copyWith(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Cinema",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Text(
                                      widget.ticket.theater.name,
                                      textAlign: TextAlign.end,
                                      style: whiteNumberFont.copyWith(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 9),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Date And Time",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                  Text(
                                    widget.ticket.time.dateAndTime,
                                    style: whiteNumberFont.copyWith(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Seat Number",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Text(
                                      widget.ticket.seatsInString,
                                      textAlign: TextAlign.end,
                                      style: whiteNumberFont.copyWith(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Price",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Text(
                                      "IDR 25.000 x ${widget.ticket.seats.length}",
                                      textAlign: TextAlign.end,
                                      style: whiteNumberFont.copyWith(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Fee",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                  Text(
                                    "IDR 1.500 x ${widget.ticket.seats.length}",
                                    style: whiteNumberFont.copyWith(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                  Text(
                                    NumberFormat.currency(
                                      locale: 'id_ID',
                                      decimalDigits: 0,
                                      symbol: 'IDR ',
                                    ).format(total),
                                    style: whiteNumberFont.copyWith(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: defaultMargin),
                              child: Divider(
                                color: Color(0xFFE4E4E4),
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Your Wallet",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                  Text(
                                    NumberFormat.currency(
                                      locale: 'id_ID',
                                      decimalDigits: 0,
                                      symbol: 'IDR ',
                                    ).format(user.balance),
                                    style: whiteNumberFont.copyWith(
                                        color: user.balance >= total
                                            ? Color(0xFF3E9D9D)
                                            : Color(0xFFFF5C83),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 250,
                              height: 46,
                              margin: EdgeInsets.only(top: 36, bottom: 50),
                              child: RaisedButton(
                                elevation: 0,
                                color: user.balance >= total
                                    ? Color(0xFF3E9D9D)
                                    : mainColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text(
                                    user.balance >= total
                                        ? "Checkout Now"
                                        : "Top Up My Wallet",
                                    style:
                                        whiteTextFont.copyWith(fontSize: 16)),
                                onPressed: () {
                                  if (user.balance >= total) {
                                    // ! UANG CUKUP ( DIPERIKSA DULU APAKAH DI BAWAH INI SUDAH TERPENUHI
                                    // ! APA BELUM /)
                                    FlutixTransaction transaction =
                                        FlutixTransaction(
                                            userID: user.id,
                                            title:
                                                widget.ticket.movieDetail.title,
                                            subtitle:
                                                widget.ticket.theater.name,
                                            time: DateTime.now(),
                                            amount: -total,
                                            picture: widget
                                                .ticket.movieDetail.posterPath);
                                    //  ! SETELAH SELESAI MAKA LANGSUNG KE LAMAN SUCCES PAGE
                                    context.bloc<PageBloc>().add(
                                        GoToSuccessPage(
                                            widget.ticket
                                                .copyWith(totalPrice: total),
                                            transaction));
                                  } else {
                                    // ! UANG TIDAK CUKUP

                                  }
                                },
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
