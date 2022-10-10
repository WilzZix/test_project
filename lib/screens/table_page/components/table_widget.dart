import 'package:flutter/material.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

class TableWidget extends StatefulWidget {
  const TableWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 400,
            margin: const EdgeInsets.all(10),
            child: StickyHeadersTable(
              legendCell: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child:  const Center(child: Text(''))),
              cellAlignments: CellAlignments.base,
              columnsLength: 10,
              rowsLength: 10,
              columnsTitleBuilder: (int columnIndex) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: Center(child: Text('I $columnIndex')),
                );
              },
              rowsTitleBuilder: (int rowIndex) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: Center(child: Text('I $rowIndex')),
                );
              },
              contentCellBuilder: (int columnIndex, int rowIndex) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: Center(
                    child: Text(
                      'COLUMN $columnIndex    ROW $rowIndex',
                    ),
                  ),
                );
              },
            ),
            //Table(
            //   border: TableBorder.all(),
            //   children: const [
            //     TableRow(
            //       children: [
            //         Text(
            //           'Период',
            //           textAlign: TextAlign.center,
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         Text(
            //           'Количество сотрудников',
            //           textAlign: TextAlign.center,
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         Text(
            //           'Чем занимался компания',
            //           textAlign: TextAlign.center,
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ],
            //     ),
            //     TableRow(
            //       children: [
            //         Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: Text('2014', textAlign: TextAlign.center),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: Text('67', textAlign: TextAlign.center),
            //         ),
            //         Text('Основание компании', textAlign: TextAlign.center),
            //       ],
            //     ),
            //     TableRow(
            //       children: [
            //         Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: Text('2005-2007', textAlign: TextAlign.center),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: Text('1067', textAlign: TextAlign.center),
            //         ),
            //         Text('ERIELL - лидер на рынке буравых услуг в Узбекистане',
            //             textAlign: TextAlign.center),
            //       ],
            //     ),
            //     TableRow(
            //       children: [
            //         Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: Text('2010-2012', textAlign: TextAlign.center),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: Text('4478', textAlign: TextAlign.center),
            //         ),
            //         Text('Укрепление позиции,выход на новый рынок',
            //             textAlign: TextAlign.center),
            //       ],
            //     ),
            //     TableRow(
            //       children: [
            //         Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: Text('2013-2014', textAlign: TextAlign.center),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: Text('7579', textAlign: TextAlign.center),
            //         ),
            //         Text('ERIELL 10 лет', textAlign: TextAlign.center),
            //       ],
            //     ),
            //     TableRow(
            //       children: [
            //         Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: Text('2015-2016', textAlign: TextAlign.center),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: Text('7226', textAlign: TextAlign.center),
            //         ),
            //         Text(
            //             'ERIELL - номер один в експлуатационном и разведочном бурении',
            //             textAlign: TextAlign.center),
            //       ],
            //     ),
            //     TableRow(
            //       children: [
            //         Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: Text('2017-2018', textAlign: TextAlign.center),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: Text('8724', textAlign: TextAlign.center),
            //         ),
            //         Text(
            //             'ERIELL достигло рекордных показателей по проходке - 1 миллион метров в год',
            //             textAlign: TextAlign.center),
            //       ],
            //     ),
            //     TableRow(
            //       children: [
            //         Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: Text('2019-2020', textAlign: TextAlign.center),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: Text('11 000', textAlign: TextAlign.center),
            //         ),
            //         Text(
            //             '14 июня 2019 года компания отметила 15 - летний юбилей',
            //             textAlign: TextAlign.center),
            //       ],
            //     ),
            //     TableRow(
            //       children: [
            //         Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: Text('2021', textAlign: TextAlign.center),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: Text('12234', textAlign: TextAlign.center),
            //         ),
            //         Text(
            //           'ERIELL - лучший буровой подрядчик и самый экологичный партнер',
            //           textAlign: TextAlign.center,
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
          ),
        ],
      ),
    );
  }
}
