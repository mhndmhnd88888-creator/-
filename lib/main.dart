import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'سيد مهند لخدمات الإنترنت',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Cairo',
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // الانتظار لمدة 3 ثواني ثم الانتقال لشاشة تسجيل الدخول
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // خلفية داكنة فخمة
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // مكان اللوغو (شعار المنظومة)
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.2),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blueAccent, width: 2),
                ),
                child: const Icon(
                  Icons.wifi_rounded,
                  size: 60,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 30),
              
              // اسم المنظومة
              const Text(
                'سبيد لاين / سيد مهند',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              
              // عبارة الترحيب
              const Text(
                'أهلاً وسهلاً بكم في عالم سيد مهند لخدمات الانترنت',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              
              const SizedBox(height: 40),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
              ),
              const Spacer(),

              // قسم أرقام الدعم الفني في الأسفل
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white12),
                ),
                child: Column(
                  children: [
                    const Text(
                      'للدعم الفني والاستفسار:',
                      style: TextStyle(color: Colors.white60, fontSize: 13),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.phone, color: Colors.greenAccent, size: 16),
                        SizedBox(width: 8),
                        Text(
                          '07718099806 - 07823381834',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// شاشة تسجيل الدخول (الخطوة التالية)
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تسجيل دخول المشتركين'),
        backgroundColor: const Color(0xFF0F172A),
      ),
      body: const Center(
        child: Text('هنا راح نصمم شاشة تسجيل الدخول برقم الاشتراك'),
      ),
    );
  }
}

