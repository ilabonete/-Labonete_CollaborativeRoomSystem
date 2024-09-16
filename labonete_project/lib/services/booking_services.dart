import 'package:labonete_project/models/booking_model.dart';
import 'package:labonete_project/services/room_services.dart';
import 'package:collection/collection.dart';

class BookingService {
  final RoomService roomService;
  List<Booking> bookings = [];
  int _nextBookingId = 1; // Counter for the next booking ID

  BookingService(this.roomService);

  void addBooking(
      String roomId, String userId, DateTime startTime, DateTime endTime) {
    try {
      final room = roomService.rooms.firstWhere((room) => room.id == roomId);
      if (room.isAvailable) {
        final bookingId = _nextBookingId.toString();
        _nextBookingId++; // Increment the counter for the next booking
        final booking = Booking(
          id: bookingId,
          roomId: roomId,
          userId: userId,
          startTime: startTime,
          endTime: endTime,
        );
        bookings.add(booking);
        room.isAvailable = false; // Mark the room as unavailable
        print('Booking added: Room ${room.name} for user $userId');
      } else {
        print('Room is not available for booking.');
      }
    } catch (e) {
      print('Error: Room with ID $roomId not found.');
    }
  }

  void cancelBooking(String bookingId) {
    final booking = bookings.firstWhereOrNull((b) => b.id == bookingId);
    if (booking != null) {
      booking.isCancelled = true;

      // Mark the room as available again
      final room =
          roomService.rooms.firstWhere((room) => room.id == booking.roomId);
      room.isAvailable = true;

      print('Booking cancelled: ${booking.roomId}');
    } else {
      print('Error: Booking with ID $bookingId not found.');
    }
  }

  List<Booking> getAllBookings() {
    return bookings;
  }

  List<Booking> getActiveBookings() {
    return bookings.where((b) => !b.isCancelled).toList();
  }
}
