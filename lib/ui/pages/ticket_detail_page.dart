part of 'pages.dart';

class TicketDetailPage extends StatelessWidget {
  final Ticket ticket;

  TicketDetailPage(this.ticket);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToMainPage(
            bottomNavBarIndex: 1,
            isExpired: ticket.time.isBefore(DateTime.now())));

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
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, left: defaultMargin),
                          padding: EdgeInsets.all(1),
                          child: GestureDetector(
                            onTap: () {
                              context.bloc<PageBloc>().add(GoToMainPage(
                                  bottomNavBarIndex: 1,
                                  isExpired:
                                      ticket.time.isBefore(DateTime.now())));
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
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          child: Text("Ticket Details",
                              textAlign: TextAlign.center,
                              style: blackTextFont.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          height: 170,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(imageBaseURL +
                                    "w500" +
                                    ticket.movieDetail.backdropPath),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          color: Color(0xFFEBEFF6),
                          margin: EdgeInsets.only(
                            left: defaultMargin,
                            right: defaultMargin,
                          ),
                          height: 470,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 16),
                                child: Column(
                                  children: [
                                    Text(
                                      ticket.movieDetail.title,
                                      maxLines: 2,
                                      overflow: TextOverflow.clip,
                                      style:
                                          blackTextFont.copyWith(fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      ticket.movieDetail.genresAndLanguage,
                                      style: greyTextFont.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    RatingStars(
                                      voteAverage:
                                          ticket.movieDetail.voteAverage,
                                      alignment: MainAxisAlignment.center,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: defaultMargin,
                                        right: defaultMargin,
                                        top: 9),
                                    child: Text(
                                      "Cinema",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          right: defaultMargin, top: 9),
                                      child: Text(
                                        ticket.theater.name,
                                        textAlign: TextAlign.end,
                                        style: whiteNumberFont.copyWith(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: defaultMargin,
                                        right: defaultMargin,
                                        top: 9),
                                    child: Text(
                                      "Date & Time",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: defaultMargin, top: 9),
                                    child: Text(
                                      ticket.time.dateAndTime,
                                      style: whiteNumberFont.copyWith(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: defaultMargin,
                                        right: defaultMargin,
                                        top: 9),
                                    child: Text(
                                      "Seat Number",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(right: 24, top: 9),
                                      child: Text(
                                        ticket.seatsInString,
                                        style: whiteNumberFont.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: defaultMargin,
                                        right: defaultMargin,
                                        top: 9),
                                    child: Text(
                                      "Order ID",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: defaultMargin, top: 9),
                                    child: Text(
                                      ticket.bookingCode,
                                      style: whiteNumberFont.copyWith(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: defaultMargin,
                                        right: defaultMargin,
                                        top: 9),
                                    child: Text(
                                      "Name",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: defaultMargin, top: 9),
                                    child: Text(
                                      ticket.name,
                                      style: whiteNumberFont.copyWith(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: defaultMargin,
                                        right: defaultMargin,
                                        top: 9),
                                    child: Text(
                                      "Paid",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: defaultMargin, top: 9),
                                    child: Text(
                                      NumberFormat.currency(
                                              locale: "id_ID",
                                              decimalDigits: 0,
                                              symbol: "IDR ")
                                          .format(ticket.totalPrice),
                                      style: whiteNumberFont.copyWith(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              QrImage(
                                data: ticket.bookingCode,
                                size: 150,
                                version: 6,
                                foregroundColor: accentColor1,
                                errorCorrectionLevel: QrErrorCorrectLevel.M,
                                padding: EdgeInsets.all(0),
                              )
                            ],
                          ),
                        )
                      ],
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
