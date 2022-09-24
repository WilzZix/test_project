import 'package:flutter/material.dart';

import 'components/pie_chart_widget.dart';
import 'components/table_widget.dart';

class TablePage extends StatefulWidget {
  const TablePage({Key? key}) : super(key: key);

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: Text(
                  'Список стран по добыче нефти в % по данным «Опек»,',
                  style: TextStyle(fontSize: 20, fontFamily: 'Raleway'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              PieChartWidget(),
              const TableWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

