  import 'package:riverpod/riverpod.dart';
  import 'package:labonete_project/providers.dart';
  import 'dart:io';

  final container = ProviderContainer();

  void main() {
    final roomService = container.read(roomServiceProvider);
    final bookingService = container.read(bookingServiceProvider);

    while (true) {
      print('--- Collaborative Room Booking System ---');
      print('1. Add Room');
      print('2. Delete Room');
      print('3. View All Rooms');
      print('4. Add Booking');
      print('5. Cancel Booking');
      print('6. View All Bookings');
      print('7. Exit');

      final input = stdin.readLineSync();

      switch (input) {
        case '1':
          print('Enter room name:');
          final roomName = stdin.readLineSync()!;
          roomService.addRoom(roomName);
          break;

        case '2':
          print('Enter room ID to delete:');
          final roomId = stdin.readLineSync()!;
          roomService.deleteRoom(roomId);
          break;

        case '3':
          final rooms = roomService.getAllRooms();
          print('--- All Rooms ---');
          if (rooms.isEmpty) {
            print('No rooms available.');
          } else {
            for (var room in rooms) {
              final status = room.isAvailable ? 'Available' : 'Occupied';
              print('Room ID: ${room.id}, Name: ${room.name}, Status: $status');
            }
          }
          break;

        case '4':
          print('Enter room ID:');
          final roomId = stdin.readLineSync()!;
          print('Enter user ID:');
          final userId = stdin.readLineSync()!;
          print('Enter start time (yyyy-mm-dd hh:mm):');
          final startTimeStr = stdin.readLineSync()!;
          final startTime = DateTime.parse(startTimeStr);
          print('Enter end time (yyyy-mm-dd hh:mm):');
          final endTimeStr = stdin.readLineSync()!;
          final endTime = DateTime.parse(endTimeStr);
          bookingService.addBooking(roomId, userId, startTime, endTime);
          break;

        case '5':
          print('Enter booking ID to cancel:');
          final bookingId = stdin.readLineSync()!;
          bookingService.cancelBooking(bookingId);
          break;

        case '6':
          final bookings = bookingService.getAllBookings();
          print('--- All Bookings ---');
          if (bookings.isEmpty) {
            print('No bookings available.');
          } else {
            for (var booking in bookings) {
              final status = booking.isCancelled ? 'Cancelled' : 'Active';
              print(
                  'Booking ID: ${booking.id}, Room ID: ${booking.roomId}, User ID: ${booking.userId}, Status: $status');
            }
          }
          break;

        case '7':
          print('Exiting system...');
          exit(0);

        default:
          print('Invalid option. Please try again.');
      }
    }
  }
