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
  final String status;
  final String locationTatekName;
  final String tatekLocation;
  final String locationName;
  final Map car;
  Map<String, dynamic> toJson() {
    return {
      'nawlone_price': nawlonPrice,
      // Add other properties here
    };
  }

  DetailsPinding( 
      {required this.nawlonPrice,
      required this.locationTatekName,
      required this.tatekLocation,
      required this.locationName,
      required this.car,
      required this.status});

  factory DetailsPinding.fromJson(Map<String, dynamic> json) => DetailsPinding(
      status: json['status'],
      nawlonPrice: json['nawlone_price'],
      locationTatekName: json['location_tatek_name'],
      tatekLocation: json['tatek_location'],
      locationName: json['location_name'],
      car: json['car']);
}

class DetailsPindingList {
  final List<dynamic> dpl;

  DetailsPindingList({required this.dpl});

  factory DetailsPindingList.fromJson(Map<String, dynamic> json) =>
      DetailsPindingList(
        dpl: json['2']['detailsPinding'],
      );
}

class DetailsDone {
  final int nawlonPrice;
  final String status;
  final String locationTatekName;
  final String tatekLocation;
  final String locationName;
  final Map car;

  DetailsDone(
      {required this.nawlonPrice,
      required this.locationTatekName,
      required this.tatekLocation,
      required this.locationName,
      required this.car,
      required this.status
      });

      factory DetailsDone.fromJson(Map<String, dynamic> json) => DetailsDone
      (
      status: json['status'],
      nawlonPrice: json['nawlone_price'], 
      locationTatekName: json['location_tatek_name'], 
      tatekLocation: json['tatek_location'], 
      locationName: json['location_name'], 
      car: json['car']
      );
}


class DetailsDoneList{
  final List<dynamic> detailsDone;

  DetailsDoneList({required this.detailsDone});

  factory DetailsDoneList.fromJson(Map<String, dynamic> json) => DetailsDoneList(
    detailsDone: json['3']['detailsDone']
    );
}
