import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solar/providers/general.dart';
import 'package:solar/service/token.dart';
import 'package:solar/views/homeView.dart';
import 'package:solar/views/login/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://gphuyfhkbfginuypfccw.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdwaHV5ZmhrYmZnaW51eXBmY2N3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDQxNTk3NDcsImV4cCI6MjA1OTczNTc0N30.5WEvYt1OSYcfTw0KUTj9Q3JJPdx91nzwnpuu2VnniG0',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PlanetProvider()),
      ],
      child: MaterialApp(
        title: 'Exploración NASA',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFF0A0E21),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF0A0E21),
            elevation: 0,
          ),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.blueAccent,
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkSessionAndNavigate();
  }

  Future<void> _checkSessionAndNavigate() async {
    await Future.delayed(const Duration(seconds: 2)); // Duración del splash

    // Primero verifica SharedPreferences
    final savedSession = await SessionManager.getSession();

    if (!mounted) return;

    if (savedSession != null) {
      // Si hay sesión guardada, navega al Home
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeView()),
      );
    } else {
      // Si no hay sesión guardada, verifica la sesión actual de Supabase
      final supabase = Supabase.instance.client;
      final currentSession = supabase.auth.currentSession;

      if (currentSession != null) {
        // Si hay sesión en Supabase pero no en SharedPreferences, guárdala
        await SessionManager.saveSession(currentSession);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeView()),
        );
      } else {
        // No hay sesión en ningún lado, muestra el login
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (_) => const /* CosmicAuthScreen */ HomeView()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Fondo del espacio
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.5,
                colors: [
                  Color(0xFF02022D),
                  Colors.black,
                ],
              ),
            ),
          ),

          // Estrellas
          CustomPaint(
            painter: _StarsPainter(),
            size: Size.infinite,
          ),

          // Contenido central
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo NASA con efecto
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Colors.blueAccent, Colors.lightBlueAccent],
                  ).createShader(bounds),
                  child: const Icon(
                    Icons.rocket,
                    size: 100,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 20),

                // Texto con animación
                const Text(
                  'NASA EXPLORER',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),

                const SizedBox(height: 10),

                // Subtítulo
                Text(
                  'Cargando universo...',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blueAccent[200],
                  ),
                ),

                const SizedBox(height: 30),

                // Indicador de progreso personalizado
                SizedBox(
                  width: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.blueAccent.withOpacity(0.8),
                      ),
                      backgroundColor: Colors.blueAccent.withOpacity(0.1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StarsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final random = Random(42);
    final paint = Paint()..color = Colors.white;

    // Dibujar estrellas pequeñas
    for (int i = 0; i < 150; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 1.5;
      final opacity = random.nextDouble() * 0.8 + 0.2;
      paint.color = Colors.white.withOpacity(opacity);
      canvas.drawCircle(Offset(x, y), radius, paint);
    }

    // Dibujar estrellas grandes
    for (int i = 0; i < 10; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 3 + 1;
      paint.color = Colors.white.withOpacity(0.9);
      canvas.drawCircle(Offset(x, y), radius, paint);

      // Efecto de brillo
      paint.color = Colors.white.withOpacity(0.3);
      canvas.drawCircle(Offset(x, y), radius * 2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
