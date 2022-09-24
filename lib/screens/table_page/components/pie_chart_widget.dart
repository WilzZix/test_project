import 'package:flutter/cupertino.dart';
import 'package:pie_chart/pie_chart.dart';
class PieChartWidget extends StatelessWidget {
   PieChartWidget({Key? key}) : super(key: key);
  Map<String, double> dataMap = {
    "США": 16.8,
    "Россия": 12.7,
    "Китай": 4.7,
    "Узбекистан": 0.1,
  };

  @override
  Widget build(BuildContext context) {
    return PieChart(
      chartValuesOptions: const ChartValuesOptions(
        showChartValueBackground: false,
        showChartValues: true,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
        decimalPlaces: 1,
      ),
      dataMap: dataMap,
    );
  }
}
