import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StrategicalInvestmentPage extends StatefulWidget {
  final int Tenure_period;
  final String start_Date;
  final String end_Date;
  final int amount;
  final int lakhamount;
  final int fixed_return;
  final int withdraw_amount;
  const StrategicalInvestmentPage({
    super.key,
    required this.Tenure_period,
    required this.start_Date,
    required this.end_Date,
    required this.amount,
    required this.lakhamount,
    required this.fixed_return,
    required this.withdraw_amount,
  });

  @override
  State<StrategicalInvestmentPage> createState() =>
      _StrategicalInvestmentPageState();
}

class _StrategicalInvestmentPageState extends State<StrategicalInvestmentPage> {
  double _currentSliderValue = 0; // Initial value of the slider
  bool _isOverlayVisible = false;
  String? Name;
  double? amount;
  void _toggleOverlay() {
    setState(() {
      _isOverlayVisible = !_isOverlayVisible;
    });
  }

  void _showWithdrawBottomSheet() {
    if (_currentSliderValue > 6) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true, // Allow height to be controlled
        backgroundColor: Colors.transparent, // Remove the default background
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width, // Full width
            height: 185, // Fixed height
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20), // Rounded top corners
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16), // Padding from the top
                Padding(
                  padding: const EdgeInsets.only(left: 60, top: 30),
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/gpay.png'),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 120, top: 30),
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/phonepe.png'),
                  ),
                ),
              ],
            ),
          );
        },
      );
    } else {
      // Show a message if weeks are 6 or less
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('For withdraw, the number of due should be greater than 6.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _showAddFundBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allow height to be controlled
      backgroundColor: Colors.transparent, // Remove the default background
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width, // Full width
          height: 185, // Fixed height
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20), // Rounded top corners
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16), // Padding from the top
              Padding(
                padding: const EdgeInsets.only(left: 60, top: 30),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/gpay.png'),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 120, top: 30),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/phonepe.png'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background.jpg"),
                  fit: BoxFit.cover)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text(
                'Investment Details',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    height: 37 / 27,
                    color: Colors.white),
              ),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.close_rounded,
                  size: 35,
                  color: Colors.white,
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isOverlayVisible = !_isOverlayVisible;
                    });
                  },
                  child: Icon(
                    Icons.edit_document,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                // Icon(
                //   Icons.notifications_sharp,
                //   color: Colors.white,
                //   size: 30,
                // ),
                // SizedBox(
                //   width: 10,
                // ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, right: 10, left: 10),
                    child: Container(
                      width: 400,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff17B9ff)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 23, top: 10),
                            child: Text(
                              "Tenure Period : ${widget.Tenure_period}",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white)),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, left: 20),
                                child: Text(
                                  "Investment Amount:",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Colors.white),
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 23, top: 10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.currency_rupee_outlined,
                                  color: Colors.white,
                                ),
                                Text(
                                  "${widget.lakhamount}",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 24.75,
                                          color: Colors.white)),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  "Start Date : ${widget.start_Date}",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text(
                                  "End Date : ${widget.end_Date}",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Assured Fixed return  : ${widget.fixed_return}%+",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Colors.white),
                                  // decoration: TextDecoration.underline,
                                  decorationColor: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.35,
                        width: MediaQuery.of(context).size.height * 0.35,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/Group 627.png'))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.currency_rupee_outlined,
                                  color: Colors.white,
                                ),
                                Text(widget.withdraw_amount.toString(),
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 23,
                                            color: Colors.white))),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Earned',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: Colors.white)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Withdrawable amount : ',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: const Color.fromARGB(255, 194, 192, 192))),
                          ),
                          Text(
                            '1250',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.white)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: _showWithdrawBottomSheet,
                        child: Container(
                          width: 300,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xff0067FF), Color(0xff090F26)],
                            ),
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(20),
                              right: Radius.circular(20),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Add Fund",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 14.23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: _showWithdrawBottomSheet,
                        child: Container(
                          width: 300,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xff0067FF), Color(0xff090F26)],
                            ),
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(20),
                              right: Radius.circular(20),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Withdraw",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 14.23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        if (_isOverlayVisible)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 18),
            child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 245, 244, 244),
                    borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: _toggleOverlay,
                            child: const Icon(
                              Icons.close_rounded,
                              size: 35,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.8,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 245, 244, 244),
                            borderRadius: BorderRadius.circular(25)),
                      )
                    ],
                  ),
                )),
          ),
      ],
    );
  }

  double calculateTooltipPosition1(double val, double max) {
    final sliderWidth = MediaQuery.of(context).size.width - 60;
    final tooltipWidth = 50; // Width of the tooltip
    final maxSliderValue = 30; // Maximum value of the slider

    double position = (val / max) * sliderWidth;

    if (position + tooltipWidth > sliderWidth) {
      position = sliderWidth - tooltipWidth;
    }

    return position;
  }
}

class CircularProgressBarPainter extends CustomPainter {
  final double progress;

  CircularProgressBarPainter({
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final double strokeWidth = 15.0;

    final Paint paintBackground = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final Paint paintForegroundGlow = Paint()
      ..color = const Color(0xff37F4FA)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 4);

    final Paint paintForeground = Paint()
      ..color = const Color(0xff37F4FA)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final Paint paintThumb = Paint()
      ..color = Color(0xff00D7FF)
      ..style = PaintingStyle.fill;

    final double adjustedRadius = radius - strokeWidth / 2;

    canvas.drawCircle(
      Offset(radius, radius),
      adjustedRadius,
      paintBackground,
    );

    final double sweepAngle = 2 * pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(radius, radius), radius: adjustedRadius),
      -pi / 2,
      sweepAngle,
      false,
      paintForegroundGlow,
    );

    canvas.drawArc(
      Rect.fromCircle(center: Offset(radius, radius), radius: adjustedRadius),
      -pi / 2,
      sweepAngle,
      false,
      paintForeground,
    );

    final double thumbRadius = 12.0;
    final double thumbAngle = -pi / 2 + sweepAngle;
    final double thumbX = radius + (adjustedRadius) * cos(thumbAngle);
    final double thumbY = radius + (adjustedRadius) * sin(thumbAngle);

    canvas.drawCircle(
      Offset(thumbX, thumbY),
      thumbRadius,
      paintThumb,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
