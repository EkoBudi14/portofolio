part of 'ticket_bloc.dart';

abstract class TicketEvent extends Equatable {
  const TicketEvent();
}

class GetTickets extends TicketEvent {
  final String userID;

  GetTickets(this.userID);

  @override
  List<Object> get props => [userID];
}

class BuyTicket extends TicketEvent {
  final Ticket ticket;
  final String userId;

  BuyTicket(this.ticket, this.userId);

  @override
  List<Object> get props => [ticket, userId];
}
