class Planet {
  final String id;
  final String name;
  final String description;
  final double distanceFromSun;
  final double radius;
  final double mass;
  final double gravity;
  final double orbitalPeriod;
  final double rotationPeriod;
  final int numberOfMoons;
  final double surfaceTemperature;
  final List<String> composition;

  Planet({
    required this.id,
    required this.name,
    required this.description,
    required this.distanceFromSun,
    required this.radius,
    required this.mass,
    required this.gravity,
    required this.orbitalPeriod,
    required this.rotationPeriod,
    required this.numberOfMoons,
    required this.surfaceTemperature,
    required this.composition,
  });

  factory Planet.fromJson(Map<String, dynamic> json) {
    return Planet(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      distanceFromSun: json['distanceFromSun'].toDouble(),
      radius: json['radius'].toDouble(),
      mass: json['mass'].toDouble(),
      gravity: json['gravity'].toDouble(),
      orbitalPeriod: json['orbitalPeriod'].toDouble(),
      rotationPeriod: json['rotationPeriod'].toDouble(),
      numberOfMoons: json['numberOfMoons'],
      surfaceTemperature: json['surfaceTemperature'].toDouble(),
      composition: List<String>.from(json['composition']),
    );
  }

  String get imagePath => 'assets/${name.toLowerCase()}.jpg';
}

class Moon {
  final String id;
  final String name;
  final String planetId;
  final double radius;
  final double orbitalPeriod;
  final String discoveryYear;

  Moon({
    required this.id,
    required this.name,
    required this.planetId,
    required this.radius,
    required this.orbitalPeriod,
    required this.discoveryYear,
  });

  factory Moon.fromJson(Map<String, dynamic> json) {
    return Moon(
      id: json['id'],
      name: json['name'],
      planetId: json['planetId'],
      radius: json['radius'].toDouble(),
      orbitalPeriod: json['orbitalPeriod'].toDouble(),
      discoveryYear: json['discoveryYear'],
    );
  }
}

class Asteroid {
  final String id;
  final String name;
  final double diameter;
  final double distanceFromSun;
  final String discoveryDate;
  final String orbitalPeriod;
  final String classification;

  Asteroid({
    required this.id,
    required this.name,
    required this.diameter,
    required this.distanceFromSun,
    required this.discoveryDate,
    required this.orbitalPeriod,
    required this.classification,
  });

  factory Asteroid.fromJson(Map<String, dynamic> json) {
    return Asteroid(
      id: json['id'],
      name: json['name'],
      diameter: json['diameter'].toDouble(),
      distanceFromSun: json['distanceFromSun'].toDouble(),
      discoveryDate: json['discoveryDate'],
      orbitalPeriod: json['orbitalPeriod'],
      classification: json['classification'],
    );
  }
}
