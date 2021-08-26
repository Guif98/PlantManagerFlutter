class Plant {
  final String name;

  Plant({this.name});

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      name: json['name'],
    );
  }
}
