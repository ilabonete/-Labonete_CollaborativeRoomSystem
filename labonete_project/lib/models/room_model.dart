class Room {
  final String id;
  final String name;
  bool isAvailable;

  Room({
    required this.id,
    required this.name,
    this.isAvailable = true,
  });
}
