import 'package:amazon_clone_tutorial/common/widgets/loader.dart';
import 'package:amazon_clone_tutorial/features/admin/models/sales.dart';
import 'package:amazon_clone_tutorial/features/admin/services/admin_services.dart';
import 'package:amazon_clone_tutorial/features/admin/widgets/category_products_chart.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final AdminServices adminServices = AdminServices();
  int? totalSales;
  List<Sales>? earnings;

  @override
  void initState() {
    super.initState();
    getEarnings();
  }

  getEarnings() async {
    var earningData = await adminServices.getEarnings(context);
    totalSales = earningData['totalEarnings'];
    earnings = earningData['sales'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return earnings == null || totalSales == null
        ? const Loader()
        : Column(
            children: [
              Text(
                '\$$totalSales',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1),
                child: SizedBox(
                  height: 250,
                  child: CategoryProductsChart(
                    salesData: [...earnings ?? []],
                    //DUMMY DATA BELOW

                    // salesData: [
                    //   Sales('Test 1', 10),
                    //   Sales('Test 2', 80),
                    //   Sales('Test 4', 90),
                    //   Sales('Test 5', 100),
                    //   Sales('Test 6', 120),
                    //   Sales('Test 6', 120),
                    //   Sales('Test 6', 120),
                    //   Sales('Test 6', 150),
                    // ],
                  ),
                ),
              ),
            ],
          );
  }
}
