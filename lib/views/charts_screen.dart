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

  Widget topTitlesWidget(double value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: SizedBox.shrink(),
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
        rightTitles:  AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles:  AxisTitles(
          sideTitles: SideTitles(showTitles: true,getTitlesWidget: topTitlesWidget),
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

    final double value = spot.y; // Assume spot.y represents the facial expression value

    final center = offsetInCanvas + Offset(0, 0);
    if (value >= happyThreshold) {
      // Add your custom drawing here
      drawCustomImage(canvas, center, Colors.black,"happy");

    } else if (value >= mildThreshold) {
      // Add your custom drawing here
      drawCustomImage(canvas, center, Colors.black,"mild");


    } else if (value >= moderateThreshold) {
      // Add your custom drawing here
      drawCustomImage(canvas, center, Colors.black,"modarate");


    } else if (value >= severeThreshold) {
      // Add your custom drawing here
      drawCustomImage(canvas, center, Colors.black,"severe");


    } else if (value >= vSevereThreshold) {
      // Add your custom drawing here
      drawCustomImage(canvas, center, Colors.black,"vSevere");


    } else {
      // Add your custom drawing here
      drawCustomImage(canvas, center, Colors.black,"painful");


    }




  }

  void drawCustomImage(Canvas canvas, Offset center, Color color,String type) {
    canvas.save();
    canvas.translate(center.dx-11, center.dy-11);
    final rpsPainter;
    switch(type){
      case "happy":
        {
          rpsPainter = PainlessCustomPainter();
          rpsPainter.paint(canvas, Size(23 , 23));
        }

      case "mild":
        {
          rpsPainter = MildCustomPainter();
          rpsPainter.paint(canvas, Size(23 , 23));
        }
      case "modarate":
        {
          rpsPainter = ModerateCustomPainter();
          rpsPainter.paint(canvas, Size(23 , 23));
        } case "severe":
      {
          rpsPainter = SevereCustomPainter();
          rpsPainter.paint(canvas, Size(23 , 23));
      }
      case "vSevere":
        {
          rpsPainter = VerySevereCustomPainter();
          rpsPainter.paint(canvas, Size(23 , 23));
        }
      case "painful":
        {
          rpsPainter = PainfulCustomPainter();
          rpsPainter.paint(canvas, Size(23, 23));
        }
      default:

    }


    canvas.restore();
  }

  @override
  Size getSize(FlSpot spot) {
    // Implement the size calculation if needed
    return Size(23, 23);
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}


class PainlessCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Path 1
    Path path1 = Path();
    path1.moveTo(23.3186, 11.6595);
    path1.cubicTo(23.3186, 5.22029, 18.0986, 0.000234057, 11.6593, 0.000234252);
    path1.cubicTo(5.22005, 0.000234446, 0, 5.22029, 0, 11.6595);
    path1.cubicTo(0, 18.0988, 5.22005, 23.3188, 11.6593, 23.3188);
    path1.cubicTo(18.0986, 23.3188, 23.3186, 18.0988, 23.3186, 11.6595);
    path1.close();

    // Path 2
    Path path2 = Path();
    path2.moveTo(6.64893, 13.7153);
    path2.cubicTo(6.64893, 16.4839, 8.89234, 18.7273, 11.6609, 18.7273);
    path2.cubicTo(14.4295, 18.7273, 16.6729, 16.4839, 16.6729, 13.7153);
    path2.lineTo(6.65353, 13.7153);
    path2.close();

    // Path 3
    Path path3 = Path();
    path3.moveTo(7.05877, 9.35654);
    path3.cubicTo(6.2818, 9.35654, 5.64668, 9.98686, 5.64668, 10.772);
    path3.cubicTo(5.64668, 11.1555, 5.33429, 11.4664, 4.94895, 11.4664);
    path3.cubicTo(4.5636, 11.4664, 4.25122, 11.1555, 4.25122, 10.772);
    path3.cubicTo(4.25122, 9.22616, 5.5048, 7.96777, 7.05877, 7.96777);
    path3.cubicTo(8.61274, 7.96777, 9.86632, 9.22616, 9.86632, 10.772);
    path3.cubicTo(9.86632, 11.1555, 9.55394, 11.4664, 9.16859, 11.4664);
    path3.cubicTo(8.78325, 11.4664, 8.47087, 11.1555, 8.47087, 10.772);
    path3.cubicTo(8.47087, 9.98686, 7.83574, 9.35654, 7.05877, 9.35654);
    path3.close();

    // Path 4
    Path path4 = Path();
    path4.moveTo(16.415, 9.35654);
    path4.cubicTo(15.638, 9.35654, 15.0029, 9.98686, 15.0029, 10.772);
    path4.cubicTo(15.0029, 11.1555, 14.6905, 11.4664, 14.3051, 11.4664);
    path4.cubicTo(13.9198, 11.4664, 13.6074, 11.1555, 13.6074, 10.772);
    path4.cubicTo(13.6074, 9.22616, 14.861, 7.96777, 16.415, 7.96777);
    path4.cubicTo(17.9689, 7.96777, 19.2225, 9.22616, 19.2225, 10.772);
    path4.cubicTo(19.2225, 11.1555, 18.9101, 11.4664, 18.5248, 11.4664);
    path4.cubicTo(18.1395, 11.4664, 17.8271, 11.1555, 17.8271, 10.772);
    path4.cubicTo(17.8271, 9.98686, 17.1919, 9.35654, 16.415, 9.35654);
    path4.close();

    // Apply paints
    Paint paint1 = Paint()..color = Color.fromRGBO(90, 194, 169, 1);
    Paint paint2 = Paint()..color = Colors.black.withOpacity(1.0);
    Paint paint3 = Paint()..color = Color(0xff000929).withOpacity(1.0);

    canvas.drawPath(path1, paint1);
    canvas.drawPath(path2, paint2);
    canvas.drawPath(path3, paint3);
    canvas.drawPath(path4, paint3);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


class MildCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Path 1
    Path path1 = Path();
    path1.moveTo(22.9997, 11.5244);
    path1.cubicTo(22.9997, 5.18664, 17.851, 0.0379141, 11.4998, 0.0244279);
    path1.cubicTo(5.14866, 0.0109417, -7.78647e-07, 5.1378, -5.01614e-07, 11.4756);
    path1.cubicTo(-2.2458e-07, 17.8134, 5.14866, 22.9621, 11.4998, 22.9756);
    path1.cubicTo(17.851, 22.9891, 22.9997, 17.8622, 22.9997, 11.5244);
    path1.close();

    // Path 2
    Path path2 = Path();
    path2.moveTo(8.92896, 14.5684);
    path2.cubicTo(8.92896, 16.0715, 10.0472, 17.2894, 11.4273, 17.2894);
    path2.cubicTo(12.8074, 17.2894, 13.9257, 16.0715, 13.9257, 14.5684);
    path2.lineTo(8.93125, 14.5684);
    path2.close();

    // Path 3
    Path path3 = Path();
    path3.moveTo(6.88479, 11.4119);
    path3.cubicTo(7.76285, 11.4119, 8.47466, 10.7012, 8.47466, 9.8246);
    path3.cubicTo(8.47466, 8.94796, 7.76285, 8.2373, 6.88479, 8.2373);
    path3.cubicTo(6.00673, 8.2373, 5.29492, 8.94796, 5.29492, 9.8246);
    path3.cubicTo(5.29492, 10.7012, 6.00673, 11.4119, 6.88479, 11.4119);
    path3.close();

    // Path 4
    Path path4 = Path();
    path4.moveTo(16.2876, 11.4119);
    path4.cubicTo(17.1657, 11.4119, 17.8775, 10.7012, 17.8775, 9.8246);
    path4.cubicTo(17.8775, 8.94796, 17.1657, 8.2373, 16.2876, 8.2373);
    path4.cubicTo(15.4096, 8.2373, 14.6978, 8.94796, 14.6978, 9.8246);
    path4.cubicTo(14.6978, 10.7012, 15.4096, 11.4119, 16.2876, 11.4119);
    path4.close();

    // Apply paints
    Paint paint1 = Paint()..color = Color(0xff71C988).withOpacity(1.0);
    Paint paint2 = Paint()..color = Colors.black.withOpacity(1.0);
    Paint paint3 = Paint()..color = Color(0xff000929).withOpacity(1.0);

    canvas.drawPath(path1, paint1);
    canvas.drawPath(path2, paint2);
    canvas.drawPath(path3, paint3);
    canvas.drawPath(path4, paint3);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


class ModerateCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint fillPaint = Paint()
      ..color = Color(0xFFE9CC44)
      ..style = PaintingStyle.fill;

    final Paint strokePaint = Paint()
      ..color = Color(0xFF35C0EC)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final Path path = Path();

    // Draw the first path
    path.moveTo(27, 15.5246);
    path.cubicTo(27, 9.18653, 21.8513, 4.03765, 15.5, 4.02425);
    path.cubicTo(9.14872, 4.01085, 4, 9.138, 4, 15.4761);
    path.cubicTo(4, 21.8141, 9.14873, 26.963, 15.5, 26.9764);
    path.cubicTo(21.8513, 26.9898, 27, 21.8627, 27, 15.5246);

    // Draw the second path
    path.moveTo(15.4312, 30);
    path.cubicTo(23.4087, 30, 29.8988, 23.5037, 29.9373, 15.5);
    path.cubicTo(29.9757, 7.49635, 23.548, 1.00001, 15.5706, 1.00001);
    path.cubicTo(7.59313, 1.00001, 1.10298, 7.49635, 1.06451, 15.5);
    path.cubicTo(1.02605, 23.5037, 7.45375, 30, 15.4312, 30);

    // Draw the remaining paths
    path.moveTo(11.9502, 18.0449);
    path.cubicTo(12.3302, 18.0449, 12.6383, 18.353, 12.6383, 18.7329);
    path.cubicTo(12.6383, 19.1011, 12.8582, 19.5144, 13.3767, 19.866);
    path.cubicTo(13.8912, 20.215, 14.6407, 20.4532, 15.5025, 20.4532);
    path.cubicTo(16.3643, 20.4532, 17.1138, 20.215, 17.6283, 19.866);
    path.cubicTo(18.1468, 19.5144, 18.3667, 19.1011, 18.3667, 18.7329);
    path.cubicTo(18.3667, 18.353, 18.6748, 18.0449, 19.0548, 18.0449);
    path.cubicTo(19.4348, 18.0449, 19.7428, 18.353, 19.7428, 18.7329);
    path.cubicTo(19.7428, 19.6936, 19.1678, 20.4845, 18.4007, 21.0048);
    path.cubicTo(17.6297, 21.5277, 16.6031, 21.8292, 15.5025, 21.8292);
    path.cubicTo(14.4019, 21.8292, 13.3753, 21.5277, 12.6043, 21.0048);
    path.cubicTo(11.8372, 20.4845, 11.2622, 19.6936, 11.2622, 18.7329);
    path.cubicTo(11.2622, 18.353, 11.5702, 18.0449, 11.9502, 18.0449);

    path.moveTo(10.8875, 15.4086);
    path.cubicTo(11.7656, 15.4086, 12.4774, 14.6979, 12.4774, 13.8213);
    path.cubicTo(12.4774, 12.9446, 11.7656, 12.2339, 10.8875, 12.2339);
    path.cubicTo(10.0094, 12.2339, 9.29761, 12.9446, 9.29761, 13.8213);
    path.cubicTo(9.29761, 14.6979, 10.0094, 15.4086, 10.8875, 15.4086);

    path.moveTo(20.2903, 15.4086);
    path.cubicTo(21.1684, 15.4086, 21.8802, 14.6979, 21.8802, 13.8213);
    path.cubicTo(21.8802, 12.9446, 21.1684, 12.2339, 20.2903, 12.2339);
    path.cubicTo(19.4123, 12.2339, 18.7004, 12.9446, 18.7004, 13.8213);
    path.cubicTo(18.7004, 14.6979, 19.4123, 15.4086, 20.2903, 15.4086);

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, strokePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


class SevereCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint fillPaint = Paint()
      ..color = Color(0xFFE99A3D)
      ..style = PaintingStyle.fill;

    final Path path = Path();

    // Draw the first path
    path.moveTo(11.4459, 23);
    path.cubicTo(17.7672, 23, 22.9164, 17.8513, 22.9469, 11.5);
    path.cubicTo(22.9775, 5.14872, 17.8777, 0, 11.5564, 0);
    path.cubicTo(5.23506, 0, 0.0858503, 5.14872, 0.0553252, 11.5);
    path.cubicTo(0.0248001, 17.8513, 5.12452, 23, 11.4459, 23);

    // Draw the second path
    path.moveTo(8.49951, 9.81971);
    path.cubicTo(8.49951, 10.7003, 7.79276, 11.4138, 6.92053, 11.4138);
    path.cubicTo(6.0483, 11.4138, 5.34155, 10.7003, 5.34155, 9.81971);
    path.cubicTo(5.34155, 8.93912, 6.0483, 8.22559, 6.92053, 8.22559);
    path.cubicTo(7.79276, 8.22559, 8.49951, 8.93912, 8.49951, 9.81971);

    // Draw the third path
    path.moveTo(17.8428, 9.81971);
    path.cubicTo(17.8428, 10.7003, 17.136, 11.4138, 16.2638, 11.4138);
    path.cubicTo(15.3916, 11.4138, 14.6848, 10.7003, 14.6848, 9.81971);
    path.cubicTo(14.6848, 8.93912, 15.3916, 8.22559, 16.2638, 8.22559);
    path.cubicTo(17.136, 8.22559, 17.8428, 8.93912, 17.8428, 9.81971);

    // Draw the fourth path
    path.moveTo(6.55737, 15.3855);
    path.cubicTo(6.55737, 15.0081, 6.8633, 14.7021, 7.24068, 14.7021);
    path.lineTo(15.9837, 14.7021);
    path.cubicTo(16.3611, 14.7021, 16.667, 15.0081, 16.667, 15.3855);
    path.cubicTo(16.667, 15.7628, 16.3611, 16.0688, 15.9837, 16.0688);
    path.lineTo(7.24068, 16.0688);

    canvas.drawPath(path, fillPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class VerySevereCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint fillPaint = Paint()
      ..color = Color(0xFFD4572D)
      ..style = PaintingStyle.fill;

    final Path path = Path();

    // Draw the first path
    path.moveTo(11.4448, 22.9978);
    path.cubicTo(17.7656, 22.9978, 22.9143, 17.8496, 22.9448, 11.4989);
    path.cubicTo(22.9753, 5.14824, 17.8761, 0, 11.5553, 0);
    path.cubicTo(5.23458, 0, 0.0858526, 5.14824, 0.0553304, 11.4989);
    path.cubicTo(0.0248082, 17.8496, 5.12405, 22.9978, 11.4448, 22.9978);

    // Draw the second path
    path.moveTo(9.39004, 14.6522);
    path.cubicTo(8.87611, 15.0047, 8.65383, 15.4218, 8.65383, 15.7983);
    path.cubicTo(8.65383, 16.1756, 8.34794, 16.4815, 7.97059, 16.4815);
    path.cubicTo(7.59325, 16.4815, 7.28735, 16.1756, 7.28735, 15.7983);
    path.cubicTo(7.28735, 14.8404, 7.85449, 14.0484, 8.61716, 13.5253);
    path.cubicTo(9.3831, 13, 10.4037, 12.6968, 11.4982, 12.6968);
    path.cubicTo(12.5926, 12.6968, 13.6132, 13, 14.3791, 13.5253);
    path.cubicTo(15.1418, 14.0484, 15.7089, 14.8404, 15.7089, 15.7983);
    path.cubicTo(15.7089, 16.1756, 15.4031, 16.4815, 15.0257, 16.4815);
    path.cubicTo(14.6484, 16.4815, 14.3425, 16.1756, 14.3425, 15.7983);
    path.cubicTo(14.3425, 15.4218, 14.1202, 15.0047, 13.6063, 14.6522);
    path.cubicTo(13.0956, 14.302, 12.3524, 14.0633, 11.4982, 14.0633);
    path.cubicTo(10.6439, 14.0633, 9.9007, 14.302, 9.39004, 14.6522);

    // Draw the third path
    path.moveTo(6.82945, 9.58643);
    path.cubicTo(5.68817, 9.58643, 4.76343, 10.52, 4.76343, 11.6722);
    path.lineTo(8.89997, 11.6722);
    path.cubicTo(8.89997, 10.52, 7.97523, 9.58643, 6.83396, 9.58643);

    // Draw the fourth path
    path.moveTo(15.9779, 9.58643);
    path.cubicTo(14.8366, 9.58643, 13.9119, 10.52, 13.9119, 11.6722);
    path.lineTo(18.0484, 11.6722);
    path.cubicTo(18.0484, 10.52, 17.1237, 9.58643, 15.9824, 9.58643);

    canvas.drawPath(path, fillPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class PainfulCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {


    final Path path = Path();

    // Draw the first path
    path.moveTo(11.4448, 22.9978);
    path.cubicTo(17.7656, 22.9978, 22.9143, 17.8496, 22.9448, 11.4989);
    path.cubicTo(22.9753, 5.14824, 17.8761, 0, 11.5553, 0);
    path.cubicTo(5.23458, 0, 0.0858526, 5.14824, 0.0553304, 11.4989);
    path.cubicTo(0.0248082, 17.8496, 5.12405, 22.9978, 11.4448, 22.9978);

    // Draw the second path
    final Path path2 = Path();
    path2.moveTo(9.39004, 14.6522);
    path2.cubicTo(8.87611, 15.0047, 8.65383, 15.4218, 8.65383, 15.7983);
    path2.cubicTo(8.65383, 16.1756, 8.34794, 16.4815, 7.97059, 16.4815);
    path2.cubicTo(7.59325, 16.4815, 7.28735, 16.1756, 7.28735, 15.7983);
    path2.cubicTo(7.28735, 14.8404, 7.85449, 14.0484, 8.61716, 13.5253);
    path2.cubicTo(9.3831, 13, 10.4037, 12.6968, 11.4982, 12.6968);
    path2.cubicTo(12.5926, 12.6968, 13.6132, 13, 14.3791, 13.5253);
    path2.cubicTo(15.1418, 14.0484, 15.7089, 14.8404, 15.7089, 15.7983);
    path2.cubicTo(15.7089, 16.1756, 15.4031, 16.4815, 15.0257, 16.4815);
    path2.cubicTo(14.6484, 16.4815, 14.3425, 16.1756, 14.3425, 15.7983);
    path2.cubicTo(14.3425, 15.4218, 14.1202, 15.0047, 13.6063, 14.6522);
    path2.cubicTo(13.0956, 14.302, 12.3524, 14.0633, 11.4982, 14.0633);
    path2.cubicTo(10.6439, 14.0633, 9.9007, 14.302, 9.39004, 14.6522);

    // Draw the third path
    final Path path3 = Path();
    path3.moveTo(6.82945, 9.58643);
    path3.cubicTo(5.68817, 9.58643, 4.76343, 10.52, 4.76343, 11.6722);
    path3.lineTo(8.89997, 11.6722);
    path3.cubicTo(8.89997, 10.52, 7.97523, 9.58643, 6.83396, 9.58643);

    // Draw the fourth path
    final Path path4 = Path();
    path4.moveTo(15.9779, 9.58643);
    path4.cubicTo(14.8366, 9.58643, 13.9119, 10.52, 13.9119, 11.6722);
    path4.lineTo(18.0484, 11.6722);
    path4.cubicTo(18.0484, 10.52, 17.1237, 9.58643, 15.9824, 9.58643);

    // Apply paints
    final Paint paint1 = Paint()
      ..color = Color(0xFFD4572D)
      ..style = PaintingStyle.fill;
    Paint paint2 = Paint()..color = Color(0xff000929).withOpacity(1.0);

    canvas.drawPath(path, paint1);
    canvas.drawPath(path2, paint2);
    canvas.drawPath(path3, paint2);
    canvas.drawPath(path4, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}