class Nawlen {
  final String status;
  final String car;
  final String tatekLocation;
  final String downLocation;
  final int value;

  Nawlen({
    required this.status,
    required this.car,
    required this.tatekLocation,
    required this.downLocation,
    required this.value,
  });

  factory Nawlen.fromJson(Map<String, dynamic> json)=> Nawlen(
    status: json[''],
    car: json[''],
      tatekLocation: json[''], 
      downLocation: json[''], 
      value: json[''],
      );

}

class Nawlens{
  final List<dynamic> xx;

  Nawlens({required this.xx});
  
  factory Nawlens.fromJson(Map<String,dynamic> json)=> Nawlens(
    xx: List<Nawlen>.from(json[''].map((e) => Nawlen.fromJson(e))),
    );

}
