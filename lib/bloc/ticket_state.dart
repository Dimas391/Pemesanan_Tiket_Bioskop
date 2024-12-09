part of 'ticket_bloc.dart';

class TicketState extends Equatable {
  final List<Ticket> tickets;
  final String? error;

  const TicketState({
    required this.tickets, 
    this.error
  });

  @override
  List<Object?> get props => [tickets, error];
}