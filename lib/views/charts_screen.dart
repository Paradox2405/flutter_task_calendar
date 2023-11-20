import 'dart:math';

import 'package:booking_calendar/theme/colors/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class LineChartSample8 extends StatefulWidget {
  const LineChartSample8({super.key});

  @override
  State<LineChartSample8> createState() => _LineChartSample8State();
}

class _LineChartSample8State extends State<LineChartSample8> {
  List<Color> quadrantColors = [
    Color(0xFF53D769), // Morning
    Color(0xFFFB4309), // Afternoon
    Color(0xFFD2D3D9), // Night
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: 291,
                width: 912,
                child: LineChart(
                  mainData(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    String title;

    switch (value.toInt()) {
      case 0:
        title = "00:00 am";
        break;
      case 1:
        title = "01:00 am";
        break;
      case 2:
        title = "02:00 am";
        break;
      case 3:
        title = "03:00 am";
        break;
      case 4:
        title = "04:00 am";
        break;
      case 5:
        title = "05:00 am";
        break;
      case 6:
        title = "06:00 am";
        break;
      case 7:
        title = "07:00 am";
        break;
      case 8:
        title = "08:00 am";
        break;
      case 9:
        title = "09:00 am";
        break;
      case 10:
        title = "10:00 am";
        break;
      case 11:
        title = "11:00 am";
        break;
      case 12:
        title = "12:00 pm";
        break;
      case 13:
        title = "01:00 pm";
        break;
      case 14:
        title = "02:00 pm";
        break;
      case 15:
        title = "03:00 pm";
        break;
      case 16:
        title = "04:00 pm";
        break;
      case 17:
        title = "05:00 pm";
        break;
      case 18:
        title = "06:00 pm";
        break;
      case 19:
        title = "07:00 pm";
        break;
      case 20:
        title = "08:00 pm";
        break;
      case 21:
        title = "09:00 pm";
        break;
      case 22:
        title = "10:00 pm";
        break;
      case 23:
        title = "11:00 pm";
        break;
      case 24:
        title = "12:00 pm";
        break;
      default:
        title = "NA";
        break;
    }
    return SideTitleWidget(
      axisSide: AxisSide.left,
      angle: -90 * (3.141592653589793 / 180),
      space: 15,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    String title;

    switch (value.toInt()) {
      case 0:
        title = "Worst";
        break;
      case 1:
        title = "Very Severe";
        break;
      case 2:
        title = "Severe";
        break;
      case 3:
        title = "Moderate";
        break;
      case 4:
        title = "Mild";
        break;
      case 5:
        title = "No Pain";
        break;
      default:
        throw StateError('Invalid');
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      fitInside: SideTitleFitInsideData.fromTitleMeta(meta,
          enabled: true, distanceFromEdge: 0),
      space: 11,
      child: Text(
        title,
        style: TextStyle(fontSize: 12),
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      rangeAnnotations: RangeAnnotations(
        verticalRangeAnnotations: [
          VerticalRangeAnnotation(
            x1: 0, x2: 11.5,
            color: quadrantColors[0].withOpacity(0.05), // Morning
          ),
          VerticalRangeAnnotation(
            x1: 11.5, x2: 12.5,
            color: quadrantColors[1].withOpacity(0.05), // Afternoon
          ),
          VerticalRangeAnnotation(
            x1: 12.5, x2: 24,
            color: quadrantColors[2].withOpacity(0.05), // Night
          ),
        ],
      ),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        drawHorizontalLine: true,
        horizontalInterval: 1,
        getDrawingHorizontalLine: (double value) {
          return FlLine(
            color: Color(0xFFF7F7F7),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          drawBelowEverything: true,
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 70,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          drawBelowEverything: true,
          sideTitles: SideTitles(
            interval: 1,
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 82,
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: true,),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(
          color: AppColors.borderColor,
        ),
      ),
      minX: 0,
      maxX: 24,
      minY: 0,
      maxY: 5,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 0),
            FlSpot(2, 1),
            FlSpot(4, 2),
            FlSpot(6, 3),
            FlSpot(8, 4),
            FlSpot(10, 5),
            FlSpot(12, 4),
            FlSpot(14, 3),
            FlSpot(16, 2),
            FlSpot(18, 1),
            FlSpot(20, 0),
            FlSpot(22, 0),
            FlSpot(24, 0),
          ],
          color: Colors.grey,
          barWidth: 1,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) =>
                CustomFlDotPainter(),
          ),
        ),
      ],
    );
  }
}
class CustomFlDotPainter extends FlDotPainter {
  @override
  void draw(Canvas canvas, FlSpot spot, Offset offsetInCanvas) {
    final double happyThreshold = 5.0;
    final double mildThreshold = 4.0;
    final double moderateThreshold = 3.0;
    final double severeThreshold = 2.0;
    final double vSevereThreshold = 1.0;

    final double value =
        spot.y; // Assume spot.y represents the facial expression value

    Color faceColor;
    Color eyeColor;
    Color mouthColor;
    String mouthExpression;
    String eyeType;

    if (value >= happyThreshold) {
      faceColor = Color.fromRGBO(90, 194, 169, 1);
      eyeColor = Colors.black;
      mouthColor = Colors.black;
      mouthExpression = "painless";
      eyeType = "happy";
    } else if (value >= mildThreshold) {
      faceColor = Color.fromRGBO(113, 201, 136, 1);
      eyeColor = Colors.black;
      mouthColor = Colors.black;
      mouthExpression = "mild";
      eyeType = "open";
    } else if (value >= moderateThreshold) {
      faceColor = Color.fromRGBO(233, 204, 68, 1);
      eyeColor = Colors.black;
      mouthColor = Colors.black;
      mouthExpression = "moderate";
      eyeType = "open";
    } else if (value >= severeThreshold) {
      faceColor = Color.fromRGBO(233, 154, 61, 1);
      eyeColor = Colors.black;
      mouthColor = Colors.black;
      mouthExpression = "severe";
      eyeType = "open";
    } else if (value >= vSevereThreshold) {
      faceColor = Color.fromRGBO(212, 87, 45, 1);
      eyeColor = Colors.black;
      mouthColor = Colors.black;
      mouthExpression = "vSevere";
      eyeType = "open";
    } else {
      faceColor = Color.fromRGBO(199, 50, 37, 1);
      eyeColor = Colors.black;
      mouthColor = Colors.black;
      mouthExpression = "pain";
      eyeType = "hurt";
    }

    final paint = Paint()
      ..color = faceColor
      ..style = PaintingStyle.fill;

    final center = offsetInCanvas + Offset(0, 0);

    canvas.drawCircle(center, 13.5, paint);

    // Draw eyes
    final eyeRadius = 2.0;
    final leftEyeOffset = center.translate(-5, -5);
    final rightEyeOffset = center.translate(5, -5);
    final eyePaint = Paint()
      ..color = eyeColor
      ..style = PaintingStyle.fill;
    final leftEye = getEyeType(leftEyeOffset, eyeType, eyeRadius, eyePaint);
    final rightEye = getEyeType(rightEyeOffset, eyeType, eyeRadius, eyePaint);
    canvas.drawPath(leftEye, eyePaint);
    canvas.drawPath(rightEye, eyePaint);

    // Draw mouth with expression
    final mouthPaint = Paint()
      ..color = mouthColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    Path mouthPath = getMouthPath(mouthExpression, center);

    canvas.drawPath(mouthPath, mouthPaint);
  }

  @override
  Size getSize(FlSpot spot) {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => throw UnimplementedError();

  Path getEyeType(
      Offset eyeOffset, String eyeType, double radius, Paint eyePaint) {
    switch (eyeType) {
      case "happy":
        return Path()
          ..moveTo(eyeOffset.dx - 5, eyeOffset.dy + 5)
          ..quadraticBezierTo(
              eyeOffset.dx, eyeOffset.dy - 8, eyeOffset.dx + 4, eyeOffset.dy + 5)
          ..arcToPoint(
            eyeOffset,
            radius: Radius.circular(13),
            clockwise: true,
          );
      case "open":
        return Path()
          ..addOval(Rect.fromCircle(center: eyeOffset, radius: radius));
      case "hurt":
        return Path()
          ..moveTo(eyeOffset.dx - 5, eyeOffset.dy + 5)
          ..addArc(
            Rect.fromCircle(center: eyeOffset.translate(0, 4), radius: 3),
            pi,
            pi,
          );
      case "pain":
        return Path()
          ..moveTo(eyeOffset.dx - 5, eyeOffset.dy + 5)
          ..quadraticBezierTo(
              eyeOffset.dx, eyeOffset.dy - 5, eyeOffset.dx + 3, eyeOffset.dy + 5);
      default:
      // Default to a neutral expression
        return Path()
          ..moveTo(eyeOffset.dx - 5, eyeOffset.dy + 5)
          ..lineTo(eyeOffset.dx + 5, eyeOffset.dy + 5);
    }
  }

  Path getMouthPath(String mouthExpression, Offset center) {
    switch (mouthExpression) {
      case "painless":
        return Path()
          ..addArc(
            Rect.fromCircle(center: center.translate(0, 3), radius: 6),
            0,
            pi,
          );
      case "mild":
        return Path()
          ..moveTo(center.dx - 5, center.dy + 5)
          ..quadraticBezierTo(
              center.dx, center.dy + 7, center.dx + 5, center.dy + 5);
      case "moderate":
        return Path()
          ..moveTo(center.dx - 5, center.dy + 5)
          ..lineTo(center.dx + 5, center.dy + 5);
      case "severe":
        return Path()
          ..moveTo(center.dx - 5, center.dy + 5)
          ..quadraticBezierTo(
              center.dx, center.dy + 3, center.dx + 5, center.dy + 5);
      case "vSevere":
        return Path()
          ..moveTo(center.dx - 5, center.dy + 5)
          ..quadraticBezierTo(
              center.dx, center.dy, center.dx + 5, center.dy + 5);
      case "pain":
        return Path()
          ..moveTo(center.dx - 5, center.dy + 5)
          ..quadraticBezierTo(
              center.dx, center.dy - 2, center.dx + 5, center.dy + 5);
      default:
      // Default to a neutral expression
        return Path()
          ..moveTo(center.dx - 5, center.dy + 5)
          ..lineTo(center.dx + 5, center.dy + 5);
    }
  }
}


