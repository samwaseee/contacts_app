class Contact {
  String id;
  String name;
  String phone;
  String email;
  String address;

  Contact({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
  });

  // Factory method to create a Contact from Firebase data
  factory Contact.fromMap(String id, Map<dynamic, dynamic> data) {
    return Contact(
      id: id,
      name: data['name'] ?? '',
      phone: data['phone'] ?? '',
      email: data['email'] ?? '',
      address: data['address'] ?? '',
    );
  }

  // Method to convert Contact object to a Map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'address': address,
    };
  }
}
