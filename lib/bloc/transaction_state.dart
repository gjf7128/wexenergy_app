import 'package:wexenergy_app/models/customer.dart';

class TransactionState {
  final Customer customer;

  final bool loggedIn;

  const TransactionState({required this.customer, required this.loggedIn});

  const TransactionState.initialize()
      : customer = const Customer.initialize(),
        loggedIn = false;
}
