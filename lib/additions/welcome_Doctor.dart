import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_health/additions/dr_patient_queue.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const DoctorPageApp());
}

class DoctorPageApp extends StatelessWidget {
  const DoctorPageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DoctorPage(),
    );
  }
}

class DoctorPage extends StatefulWidget {
  const DoctorPage({super.key});

  @override
  _DoctorPageState createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  @override
  Widget build(BuildContext context) {
    // Get screen size
    final Size screenSize = MediaQuery.of(context).size;
    final bool isSmallScreen = screenSize.width < 600;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello Doctor',
          style: TextStyle(
            color: Colors.black,
            fontSize: isSmallScreen ? 20 : 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 2,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue, width: 2),
              ),
              child: const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('images/doctor1.jpg'),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(isSmallScreen ? 12.0 : 16.0),
            padding: EdgeInsets.symmetric(
              vertical: isSmallScreen ? 8.0 : 12.0,
              horizontal: isSmallScreen ? 16.0 : 24.0,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade400, Colors.blue.shade200],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              'Appointments',
              style: TextStyle(
                fontSize: isSmallScreen ? 18 : 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final bool isSmallScreen = constraints.maxWidth < 800;
                return Row(
                  children: [
                    // Patient list
                    Expanded(
                      flex: 3,
                      child: _buildPatientList(isSmallScreen),
                    ),
                    // Clock always stays on right
                    Container(
                      width: isSmallScreen ? 120 : screenSize.width * 0.25,
                      margin: EdgeInsets.all(isSmallScreen ? 8.0 : 16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const AnalogClockWithTime(),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomAppBar(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isSmallScreen ? 8.0 : 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavBarItem(Icons.home, "Home", true, isSmallScreen),
                _buildNavBarItem(
                    Icons.settings, "Settings", false, isSmallScreen),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPatientList(bool isSmallScreen) {
    return ListView.builder(
      itemCount: 50,
      padding: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 4.0 : 8.0,
      ),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: isSmallScreen ? 8.0 : 16.0,
            vertical: isSmallScreen ? 4.0 : 8.0,
          ),
          child: TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(isSmallScreen ? 12.0 : 16.0),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 2,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PatientDetailsPage(),
                ),
              );
            },
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue.shade100,
                  radius: isSmallScreen ? 16 : 20,
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: isSmallScreen ? 12 : 14,
                    ),
                  ),
                ),
                SizedBox(width: isSmallScreen ? 8 : 12),
                Text(
                  'Patient ${index + 1}',
                  style: TextStyle(
                    fontSize: isSmallScreen ? 14 : 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: isSmallScreen ? 12 : 16,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavBarItem(
      IconData icon, String label, bool isSelected, bool isSmallScreen) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: isSmallScreen ? 8.0 : 12.0,
            ),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: isSelected ? Colors.blue : Colors.transparent,
                  width: 3,
                ),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: isSmallScreen ? 20 : 24,
                  color: isSelected ? Colors.blue : Colors.grey,
                ),
                SizedBox(height: isSmallScreen ? 2 : 4),
                Text(
                  label,
                  style: TextStyle(
                    color: isSelected ? Colors.blue : Colors.grey,
                    fontSize: isSmallScreen ? 10 : 12,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnalogClockWithTime extends StatelessWidget {
  const AnalogClockWithTime({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 800;
    final clockSize = isSmallScreen ? 80.0 : 150.0;

    return Container(
      padding: EdgeInsets.all(isSmallScreen ? 4.0 : 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(isSmallScreen ? 4.0 : 16.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.blue.shade200,
                width: isSmallScreen ? 2 : 4,
              ),
            ),
            child: CustomPaint(
              painter: ClockPainter(),
              size: Size(clockSize, clockSize),
            ),
          ),
          SizedBox(height: isSmallScreen ? 8 : 24),
          const TimeDateDisplay(),
        ],
      ),
    );
  }
}

class TimeDateDisplay extends StatefulWidget {
  const TimeDateDisplay({super.key});

  @override
  _TimeDateDisplayState createState() => _TimeDateDisplayState();
}

class _TimeDateDisplayState extends State<TimeDateDisplay> {
  late String currentDay;
  late String currentDate;
  late String currentTime;

  @override
  void initState() {
    super.initState();
    updateTime();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      updateTime();
    });
  }

  void updateTime() {
    final DateTime now = DateTime.now();
    setState(() {
      currentDay = DateFormat('EEEE').format(now);
      currentDate = DateFormat('dd MMM yyyy').format(now);
      currentTime = DateFormat('hh:mm:ss a').format(now);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Column(
      children: [
        Text(
          currentTime,
          style: TextStyle(
            fontSize: isSmallScreen ? 18 : 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        SizedBox(height: isSmallScreen ? 4 : 8),
        Text(
          currentDay,
          style: TextStyle(
            fontSize: isSmallScreen ? 14 : 18,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          currentDate,
          style: TextStyle(
            fontSize: isSmallScreen ? 12 : 16,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    // Draw clock face
    canvas.drawCircle(center, radius, paint);

    // Draw clock hands
    final DateTime now = DateTime.now();
    final secondHandLength = radius * 0.9;
    final minuteHandLength = radius * 0.7;
    final hourHandLength = radius * 0.5;

    // Seconds
    final secondHandX =
        center.dx + secondHandLength * cos((now.second * 6 - 90) * pi / 180);
    final secondHandY =
        center.dy + secondHandLength * sin((now.second * 6 - 90) * pi / 180);
    paint.color = Colors.red;
    paint.strokeWidth = 2;
    canvas.drawLine(center, Offset(secondHandX, secondHandY), paint);

    // Minutes
    final minuteHandX =
        center.dx + minuteHandLength * cos((now.minute * 6 - 90) * pi / 180);
    final minuteHandY =
        center.dy + minuteHandLength * sin((now.minute * 6 - 90) * pi / 180);
    paint.color = Colors.blue;
    paint.strokeWidth = 4;
    canvas.drawLine(center, Offset(minuteHandX, minuteHandY), paint);

    // Hours
    final hourHandX = center.dx +
        hourHandLength * cos(((now.hour % 12) * 30 - 90) * pi / 180);
    final hourHandY = center.dy +
        hourHandLength * sin(((now.hour % 12) * 30 - 90) * pi / 180);
    paint.color = Colors.black;
    paint.strokeWidth = 6;
    canvas.drawLine(center, Offset(hourHandX, hourHandY), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true; // Repaint every second
  }
}
