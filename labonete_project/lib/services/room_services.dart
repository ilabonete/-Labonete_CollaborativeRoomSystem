import '../models/room_model.dart';

class RoomService {
  List<Room> rooms = [];
  int _nextId = 1; // Counter for the next room ID

  RoomService();

  void addRoom(String roomName) {
    final roomId = _nextId.toString();
    _nextId++; // Increment the counter for the next room
    final room = Room(id: roomId, name: roomName);
    rooms.add(room);
    print('Room added: ${room.name} with ID: ${room.id}');
  }

  void deleteRoom(String roomId) {
    rooms.removeWhere((room) => room.id == roomId);
    print('Room deleted: $roomId');
  }

  List<Room> getAllRooms() {
    return rooms;
  }

  List<Room> getAvailableRooms() {
    return rooms.where((room) => room.isAvailable).toList();
  }
}