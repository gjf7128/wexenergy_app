import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wexenergy_app/bloc/transaction_event.dart';
import 'package:wexenergy_app/bloc/transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  // final TransactionRepository transactionRepository;  TODO: uncomment these 2 lines once repo is set
  TransactionBloc(/*{required this.transactionRepository}*/)
      : super(const TransactionState.initialize()) {
    on<UserLoginEvent>(userLoginHandler);
  }

  userLoginHandler(UserLoginEvent event, Emitter<TransactionState> emit) {
    // Do logic
    // transactionRepository.login();

    // if login is good
    // emit(state.loggedIn = true)
  }
}
