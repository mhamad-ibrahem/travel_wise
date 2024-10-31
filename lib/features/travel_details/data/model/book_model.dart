class BookModel {
  final int numberOfTickets;
  final int userId;
  final int tripId;

  BookModel({
    required this.tripId,
    required this.numberOfTickets,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'travel_id': tripId,
      'count': numberOfTickets,
      'status': 'Pending',
      'is_Waiting_list': false
    };
  }
}
