class Booking {
  final String id;
  final String roomId;
  final String userId;
  final DateTime startTime;
  final DateTime endTime;
  bool isCancelled;

//CONSTRUCTOR NI SIYA
  Booking({
    required this.id,
    required this.roomId,
    required this.userId,
    required this.startTime,
    required this.endTime,
    this.isCancelled = false, 
  });
}

//explain na mao ni imong book model, same pud sa the rest na models ingna
