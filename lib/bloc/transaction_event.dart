abstract class TransactionEvent {}

class UserLoginEvent extends TransactionEvent {
  final String email;

  UserLoginEvent({required this.email});
}
