part of 'services.dart';

// ANCHOR METHODE MENG GATE DAN MENGSAVE TIKCET KE FIREBASE
// DAN JUGA SAVE DATA YANG DIBELI USER KE DATABASE

class TicketServices {
  static CollectionReference ticketCollection =
      Firestore.instance.collection('ticket');

  // NOTE: INI UNTUK MENGESAVE DATA PELANGGAN DI DATABASE

  static Future<void> saveTicket(String id, Ticket ticket) async {
    await ticketCollection.document().setData({
      'movieID': ticket.movieDetail.id ?? "",
      'userID': id ?? "",
      'theaterName': ticket.theater.name ?? "",
      'time': ticket.time.millisecondsSinceEpoch ??
          DateTime.now().millisecondsSinceEpoch,
      'bookingCode': ticket.bookingCode,
      'seats': ticket.seatsInString,
      'name': ticket.name,
      'totalPrice': ticket.totalPrice,
    });
  }

  // NOTE : SERVICE UNTUK GET TICKET

  static Future<List<Ticket>> getTickets(String userId) async {
    // ! MENGAMBIL DOCUMENT ATAU MENGAMBIL DATA PENGGUNA
    // ! BERDASARKAN USER ID NYA
    // * ELEMENT DI DOCUMENT.DATA DI AMBILD DARI KEY SAVETICKET

    QuerySnapshot snapshot = await ticketCollection.getDocuments();
    var documents = snapshot.documents
        .where((document) => document.data['userID'] == userId);

    List<Ticket> tickets = [];
    for (var document in documents) {
      // ! DATA DATA YANG AKAN DI AMBIL

      MovieDetail movieDetail = await MovieServices.getDetails(null,
          movieID: document.data['movieID']);
      tickets.add(Ticket(
        movieDetail,
        Theater(document.data['theaterName']),
        DateTime.fromMillisecondsSinceEpoch(document.data['time']),
        document.data['bookingCode'],
        document.data['seats'].toString().split(','),
        document.data['name'],
        document.data['totalPrice'],
      ));
    }

    return tickets;
  }
}
