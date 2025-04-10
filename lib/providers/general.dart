import 'package:flutter/material.dart';
import 'package:solar/models/planetasModelo.dart';
import 'package:solar/service/apiService.dart';

class PlanetProvider with ChangeNotifier {
  List<Planet> _planets = [];
  List<Moon> _moons = [];
  List<Asteroid> _asteroids = [];
  bool _isLoading = false;
  String _error = '';

  List<Planet> get planets => _planets;
  List<Moon> get moons => _moons;
  List<Asteroid> get asteroids => _asteroids;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> fetchAllData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _planets = await ApiService.fetchPlanets();
      _moons = await ApiService.fetchMoons();
      _asteroids = await ApiService.fetchAsteroids();
      _error = '';
    } catch (e) {
      _error = 'Failed to fetch data: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Planet getPlanetById(String id) {
    return _planets.firstWhere((planet) => planet.id == id);
  }

  List<Moon> getMoonsByPlanetId(String planetId) {
    return _moons.where((moon) => moon.planetId == planetId).toList();
  }
}
