import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../models/sales.dart';

class CategoryProductsChart extends StatelessWidget {
  const CategoryProductsChart({super.key, required this.salesData});

  final List<Sales> salesData;

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        // maxY: 20, // Adjust maxY if needed
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(), // Display y value in tooltip

              const TextStyle(
                color: Colors.blue, // Adjust tooltip color if needed
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );
  Widget getTitles(double value, TitleMeta meta) {
    TextStyle style = const TextStyle(
      color: Colors.blueGrey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;

    // Dynamically access label based on index:
    if (value.toInt() < salesData.length) {
      text = salesData[value.toInt()].label;
    } else {
      text = '';
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  LinearGradient get _barsGradient => const LinearGradient(
        colors: [Colors.lightBlueAccent, Colors.blue], // Adjust gradient colors
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> get barGroups {
    return List.generate(salesData.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: salesData[index].earning.toDouble(),
            gradient: _barsGradient,
          ),
        ],
        showingTooltipIndicators: [0],
      );
    });
  }
}
