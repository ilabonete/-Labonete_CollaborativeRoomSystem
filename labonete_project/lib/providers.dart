import 'package:riverpod/riverpod.dart';
import 'package:labonete_project/services/booking_services.dart';
import 'package:labonete_project/services/room_services.dart';

// Room service provider
final roomServiceProvider = Provider<RoomService>((ref) {
  return RoomService();
});

// Booking service provider
final bookingServiceProvider = Provider<BookingService>((ref) {
  final roomService = ref.read(roomServiceProvider);
  return BookingService(roomService);  // Pass roomService here
});
