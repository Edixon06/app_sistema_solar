/* import 'dart:convert';
import 'package:http/http.dart' as http; */
import 'package:solar/models/planetasModelo.dart';

class ApiService {
  // static const String _baseUrl = 'https://api.le-systeme-solaire.net/rest/';

  static Future<List<Planet>> fetchPlanets() async {
    // En una app real, aquí consumirías la API real
    // Para este ejemplo, usaremos datos mock
    await Future.delayed(const Duration(seconds: 1));

    return mockPlanets;
  }

  static Future<List<Moon>> fetchMoons() async {
    await Future.delayed(const Duration(seconds: 1));
    return mockMoons;
  }

  static Future<List<Asteroid>> fetchAsteroids() async {
    await Future.delayed(const Duration(seconds: 1));
    return mockAsteroids;
  }

  static final List<Planet> mockPlanets = [
    Planet(
      id: '1',
      name: 'Mercury',
      description:
          'Mercury is the smallest and innermost planet in the Solar System. Its orbit around the Sun takes 87.97 Earth days, the shortest of all the planets in the Solar System.',
      distanceFromSun: 57.9,
      radius: 2439.7,
      mass: 3.3011e23,
      gravity: 3.7,
      orbitalPeriod: 88,
      rotationPeriod: 1407.6,
      numberOfMoons: 0,
      surfaceTemperature: 167,
      composition: ['70% metallic', '30% silicate'],
    ),
    Planet(
      id: '2',
      name: 'Venus',
      description:
          'Venus is the second planet from the Sun. It is named after the Roman goddess of love and beauty. Venus orbits the Sun every 224.7 Earth days.',
      distanceFromSun: 108.2,
      radius: 6051.8,
      mass: 4.8675e24,
      gravity: 8.87,
      orbitalPeriod: 224.7,
      rotationPeriod: 5832.5,
      numberOfMoons: 0,
      surfaceTemperature: 464,
      composition: ['96.5% CO₂', '3.5% N₂'],
    ),
    Planet(
      id: '3',
      name: 'Earth',
      description:
          'Earth is the third planet from the Sun and the only astronomical object known to harbor life. About 29% of Earth\'s surface is land consisting of continents and islands.',
      distanceFromSun: 149.6,
      radius: 6371,
      mass: 5.97237e24,
      gravity: 9.807,
      orbitalPeriod: 365.2,
      rotationPeriod: 23.9,
      numberOfMoons: 1,
      surfaceTemperature: 15,
      composition: ['78% N₂', '21% O₂', '1% other'],
    ),
    Planet(
      id: '4',
      name: 'Mars',
      description:
          'Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, being larger than only Mercury. Mars carries the name of the Roman god of war.',
      distanceFromSun: 227.9,
      radius: 3389.5,
      mass: 6.417e23,
      gravity: 3.711,
      orbitalPeriod: 687,
      rotationPeriod: 24.6,
      numberOfMoons: 2,
      surfaceTemperature: -65,
      composition: ['95% CO₂', '3% N₂', '1.6% Ar'],
    ),
    Planet(
      id: '5',
      name: 'Jupiter',
      description:
          'Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass one-thousandth that of the Sun.',
      distanceFromSun: 778.5,
      radius: 69911,
      mass: 1.8982e27,
      gravity: 24.79,
      orbitalPeriod: 4331,
      rotationPeriod: 9.9,
      numberOfMoons: 79,
      surfaceTemperature: -110,
      composition: ['90% H₂', '10% He'],
    ),
    Planet(
      id: '6',
      name: 'Saturn',
      description:
          'Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. It is a gas giant with an average radius about nine times that of Earth.',
      distanceFromSun: 1434,
      radius: 58232,
      mass: 5.6834e26,
      gravity: 10.44,
      orbitalPeriod: 10747,
      rotationPeriod: 10.7,
      numberOfMoons: 82,
      surfaceTemperature: -140,
      composition: ['96% H₂', '3% He', '1% other'],
    ),
    Planet(
      id: '7',
      name: 'Uranus',
      description:
          'Uranus is the seventh planet from the Sun. It has the third-largest planetary radius and fourth-largest planetary mass in the Solar System.',
      distanceFromSun: 2871,
      radius: 25362,
      mass: 8.6810e25,
      gravity: 8.69,
      orbitalPeriod: 30589,
      rotationPeriod: 17.2,
      numberOfMoons: 27,
      surfaceTemperature: -195,
      composition: ['83% H₂', '15% He', '2% CH₄'],
    ),
    Planet(
      id: '8',
      name: 'Neptune',
      description:
          'Neptune is the eighth and farthest-known Solar planet from the Sun. In the Solar System, it is the fourth-largest planet by diameter, the third-most-massive planet.',
      distanceFromSun: 4495,
      radius: 24622,
      mass: 1.02413e26,
      gravity: 11.15,
      orbitalPeriod: 59800,
      rotationPeriod: 16.1,
      numberOfMoons: 14,
      surfaceTemperature: -200,
      composition: ['80% H₂', '19% He', '1% CH₄'],
    ),
  ];

  static final List<Moon> mockMoons = [
    Moon(
      id: '1',
      name: 'Luna',
      planetId: '3',
      radius: 1737.4,
      orbitalPeriod: 27.3,
      discoveryYear: 'Prehistoria',
    ),
    Moon(
      id: '2',
      name: 'Phobos',
      planetId: '4',
      radius: 11.1,
      orbitalPeriod: 0.3,
      discoveryYear: '1877',
    ),
    Moon(
      id: '3',
      name: 'Deimos',
      planetId: '4',
      radius: 6.2,
      orbitalPeriod: 1.3,
      discoveryYear: '1877',
    ),
    Moon(
      id: '4',
      name: 'Io',
      planetId: '5',
      radius: 1821.6,
      orbitalPeriod: 1.8,
      discoveryYear: '1610',
    ),
    Moon(
      id: '5',
      name: 'Europa',
      planetId: '5',
      radius: 1560.8,
      orbitalPeriod: 3.6,
      discoveryYear: '1610',
    ),
    Moon(
      id: '6',
      name: 'Ganymede',
      planetId: '5',
      radius: 2634.1,
      orbitalPeriod: 7.2,
      discoveryYear: '1610',
    ),
    Moon(
      id: '7',
      name: 'Callisto',
      planetId: '5',
      radius: 2410.3,
      orbitalPeriod: 16.7,
      discoveryYear: '1610',
    ),
    Moon(
      id: '8',
      name: 'Titan',
      planetId: '6',
      radius: 2574.7,
      orbitalPeriod: 15.9,
      discoveryYear: '1655',
    ),
  ];

  static final List<Asteroid> mockAsteroids = [
    Asteroid(
      id: '1',
      name: 'Ceres',
      diameter: 939.4,
      distanceFromSun: 413.7,
      discoveryDate: '1801',
      orbitalPeriod: '4.6 years',
      classification: 'Dwarf planet',
    ),
    Asteroid(
      id: '2',
      name: 'Vesta',
      diameter: 525.4,
      distanceFromSun: 353.4,
      discoveryDate: '1807',
      orbitalPeriod: '3.6 years',
      classification: 'Asteroid',
    ),
    Asteroid(
      id: '3',
      name: 'Pallas',
      diameter: 512,
      distanceFromSun: 414.5,
      discoveryDate: '1802',
      orbitalPeriod: '4.6 years',
      classification: 'Asteroid',
    ),
    Asteroid(
      id: '4',
      name: 'Hygiea',
      diameter: 434,
      distanceFromSun: 470.3,
      discoveryDate: '1849',
      orbitalPeriod: '5.6 years',
      classification: 'Asteroid',
    ),
    Asteroid(
      id: '5',
      name: 'Eros',
      diameter: 16.84,
      distanceFromSun: 218.2,
      discoveryDate: '1898',
      orbitalPeriod: '1.8 years',
      classification: 'Near-Earth',
    ),
    Asteroid(
      id: '6',
      name: 'Ida',
      diameter: 31.4,
      distanceFromSun: 428,
      discoveryDate: '1884',
      orbitalPeriod: '4.8 years',
      classification: 'Main belt',
    ),
  ];
}
