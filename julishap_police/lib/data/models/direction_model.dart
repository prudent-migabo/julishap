
class DirectionModel{

  double duration;
  double distance;
  List coordinates;

//<editor-fold desc="Data Methods">
  DirectionModel({
    required this.duration,
    required this.distance,
    required this.coordinates,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DirectionModel &&
          runtimeType == other.runtimeType &&
          duration == other.duration &&
          distance == other.distance &&
          coordinates == other.coordinates);

  @override
  int get hashCode =>
      duration.hashCode ^ distance.hashCode ^ coordinates.hashCode;

  @override
  String toString() {
    return 'DirectionModel{' +
        ' duration: $duration,' +
        ' distance: $distance,' +
        ' coordinates: $coordinates,' +
        '}';
  }

  DirectionModel copyWith({
    double? duration,
    double? distance,
    List? coordinates,
  }) {
    return DirectionModel(
      duration: duration ?? this.duration,
      distance: distance ?? this.distance,
      coordinates: coordinates ?? this.coordinates,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'duration': this.duration,
      'distance': this.distance,
      'coordinates': this.coordinates,
    };
  }

  factory DirectionModel.fromMap(Map<String, dynamic> data) {
    Map map= data['routes'][0];
    return DirectionModel(
      duration: map['duration'] as double,
      distance: map['distance'] as double,
      coordinates: map['geometry']['coordinates'] as List,
    );
  }

//</editor-fold>
}