import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ChartStatistics extends StatefulWidget {
  const ChartStatistics({super.key});

  @override
  State<ChartStatistics> createState() => _ChartStatisticsState();
}

class _ChartStatisticsState extends State<ChartStatistics> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 300,
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          series: <SplineSeries<SalesDate, String>>[
            SplineSeries<SalesDate, String>(
              color: Color.fromARGB(255, 47, 125, 121),
              width: 3,
              dataSource: <SalesDate>[
                SalesDate(100, 'Mon'),
                SalesDate(20, 'Tue'),
                SalesDate(40, 'Wed'),
                SalesDate(15, 'Sat'),
                SalesDate(5, 'Sun'),
              ],
              xValueMapper: (SalesDate data, _) => data.year,
              yValueMapper: (SalesDate data, _) => data.sales,
            ),
          ],
        )
    );
  }
}

class SalesDate {
  final String year;
  final int sales;

  SalesDate(this.sales, this.year);
}
