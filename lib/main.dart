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

// 1. واجهة البداية (Splash Screen)
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
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
      backgroundColor: const Color(0xFF0F172A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
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
              const Text(
                'سبيد لاين / سيد مهند',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
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
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white12),
                ),
                child: Column(
                  children: const [
                    Text(
                      'للدعم الفني والاستفسار:',
                      style: TextStyle(color: Colors.white60, fontSize: 13),
                    ),
                    SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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

// 2. شاشة تسجيل الدخول (Login Screen)
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.lock_person_rounded,
                    size: 80,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'تسجيل دخول المشتركين',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'يرجى إدخال رقم الاشتراك أو اسم المستخدم الخاص بك للمتابعة',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 35),
                  TextField(
                    controller: _controller,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'رقم الاشتراك / اسم المستخدم',
                      labelStyle: const TextStyle(color: Colors.white70),
                      prefixIcon: const Icon(Icons.person, color: Colors.blueAccent),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.05),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.white24),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.white24),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        String userInput = _controller.text.trim();
                        if (userInput.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('الرجاء إدخال رقم الاشتراك أولاً!'),
                              backgroundColor: Colors.redAccent,
                            ),
                          );
                        } else {
                          // الانتقال للشاشة الرئيسية بنجاح
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(subscriberId: userInput),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        'دخول إلى الخدمة',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// 3. الشاشة الرئيسية للمشترك (Home Screen)
class HomeScreen extends StatelessWidget {
  final String subscriberId;
  const HomeScreen({Key? key, required this.subscriberId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        title: Text('أهلاً بك: $subscriberId', style: const TextStyle(fontSize: 16, color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.redAccent),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // كارت تفاصيل الاشتراك
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blueAccent.withOpacity(0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.between,
                    children: const [
                      Text('حالة الاشتراك:', style: TextStyle(color: Colors.white70)),
                      Chip(
                        backgroundColor: Colors.green,
                        label: Text('نشط (Active)', style: TextStyle(color: Colors.white, fontSize: 12)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text('الباقة الحالية: باقة الـ 40,000 د.ع', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  const Text('الأيام المتبقية: 18 يوم', style: TextStyle(color: Colors.greenAccent, fontSize: 14)),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // قسم المتصلين على الراوتر وحظر المتطفلين
            const Text(
              'إدارة الأجهزة المتصلة (الراوتر المنزلي)',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            
            // جهاز متصل تجريبي 1
            _buildDeviceCard(context, 'Galaxy A54 (موبايل)', '192.168.1.15', true),
            // جهاز متصل تجريبي 2
            _buildDeviceCard(context, 'Smart TV (تلفزيون)', '192.168.1.20', false),
            // جهاز متصل تجريبي 3 (متطفل)
            _buildDeviceCard(context, 'Unknown Device (متطفل)', '192.168.1.45', false),

            const SizedBox(height: 25),

            // قسم القنوات الرياضية البث المباشر
            const Text(
              'قنوات البث المباشر والرياضة',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _buildChannelButton(context, 'beIN Sports 1', Icons.sports_soccer)),
                const SizedBox(width: 12),
                Expanded(child: _buildChannelButton(context, 'beIN Sports 2', Icons.sports_basketball)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // دالة تصميم كارت الجهاز المتصل
  Widget _buildDeviceCard(BuildContext context, String deviceName, String ip, bool isCurrent) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.between,
        children: [
          Row(
            children: [
              const Icon(Icons.devices, color: Colors.blueAccent, size: 24),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(deviceName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 2),
                  Text(ip, style: const TextStyle(color: Colors.white60, fontSize: 12)),
                ],
              ),
            ],
          ),
          ElevatedButton.styleFrom(
            backgroundColor: isCurrent ? Colors.grey : Colors.redAccent,
          ).runtimeType == ElevatedButton ? ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isCurrent ? Colors.grey.withOpacity(0.3) : Colors.redAccent.withOpacity(0.2),
              elevation: 0,
            ),
            onPressed: isCurrent ? null : () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('تم حظر الجهاز $deviceName بنجاح!'), backgroundColor: Colors.red),
              );
            },
            child: Text(
              isCurrent ? 'جهازك الحالي' : 'حظر',
              style: TextStyle(color: isCurrent ? Colors.white38 : Colors.redAccent, fontSize: 12),
            ),
          ) : Container(),
        ],
      ),
    );
  }

  // دالة زر القنوات الرياضية
  Widget _buildChannelButton(BuildContext context, String channelName, IconData icon) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('جاري تشغيل بث $channelName...'), backgroundColor: Colors.blue),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blueAccent.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blueAccent),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.blueAccent, size: 30),
            const SizedBox(height: 8),
            Text(
              channelName,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
