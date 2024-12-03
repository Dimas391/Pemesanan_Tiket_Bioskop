import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/models.dart';
import '../services/services.dart';

part 'ticket_event.dart';
part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  final TicketServices ticketServices;

  TicketBloc({required this.ticketServices}) : super(TicketState(tickets: const [])) {
    on<BuyTicket>(_onBuyTicket);
    on<GetTickets>(_onGetTickets);
  }

  Future<void> _onBuyTicket(BuyTicket event, Emitter<TicketState> emit) async {
    try {
      await TicketServices.saveTicket(event.userID, event.ticket);
      
      final updatedTickets = List<Ticket>.from(state.tickets)..add(event.ticket);
      emit(TicketState(tickets: updatedTickets));
    } catch (error) {
      emit(TicketState(tickets: state.tickets, error: error.toString()));
    }
  }

  Future<void> _onGetTickets(GetTickets event, Emitter<TicketState> emit) async {
    try {
      final tickets = await TicketServices.getTickets(event.userID);
      emit(TicketState(tickets: tickets));
    } catch (error) {
      emit(TicketState(tickets: state.tickets, error: error.toString()));
    }
  }
}