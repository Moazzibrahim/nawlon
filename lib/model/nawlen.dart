class Nawlen {
  final int nawlenPindingCount;
  final int nawlenDoneCount;

  Nawlen({
    required this.nawlenDoneCount,
    required this.nawlenPindingCount,
  });

  factory Nawlen.fromJson(Map<String, dynamic> json) => Nawlen(
        nawlenPindingCount: json['0']['nawlonesPending'],
        nawlenDoneCount: json['1']['nawlonesDone'],
      );
}

class DetailsPinding {
  final int nawlonPrice;
  final String locationTatekName;
  final String tatekLocation;
  final String locationName;
  final Map car;

  DetailsPinding(
      {required this.nawlonPrice,
      required this.locationTatekName,
      required this.tatekLocation,
      required this.locationName,
      required this.car});

  factory DetailsPinding.fromJson(Map<String, dynamic> json) => DetailsPinding(
      nawlonPrice: json['nawlone_price'],
      locationTatekName: json['location_tatek_name'],
      tatekLocation: json['tatek_location'],
      locationName: json['location_name'],
      car: json['car']
      );
}

class DetailsPindingList{
  final List<dynamic> dpl;

  DetailsPindingList({required this.dpl});

  factory DetailsPindingList.fromJson(Map<String, dynamic> json)=> DetailsPindingList(
    dpl: json['2']['detailsPinding'],
    );
}
