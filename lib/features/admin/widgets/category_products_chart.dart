// // import 'package:amazon_clone_tutorial/features/admin/models/sales.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import '../screens/price_points.dart';

// class LineChartWidget extends StatelessWidget {
//   final List<PricePoint> points;
//   const LineChartWidget(this.points, {Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 2,
//       child: LineChart(LineChartData(lineBarsData: [
//         LineChartBarData(
//             spots: points.map((point) => FlSpot(point.x, point.y)).toList(),
//             isCurved: false,
//             dotData: FlDotData(show: true))
//       ])),
//     );
//   }
// }
import 'package:amazon_clone_tutorial/features/admin/models/sales.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class CategoryProductsChart extends StatelessWidget {
  final List<charts.Series<Sales, String>> seriesList;
  const CategoryProductsChart({
    Key? key,
    required this.seriesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: true,
    );
  }
}
