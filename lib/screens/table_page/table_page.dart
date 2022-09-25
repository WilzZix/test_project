import 'package:flutter/material.dart';

import '../../application/login/login_bloc.dart';
import '../../application/login/login_event.dart';
import '../login_page.dart';
import 'components/pie_chart_widget.dart';
import 'components/table_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TablePage extends StatefulWidget {
  const TablePage({Key? key}) : super(key: key);

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => LoginBloc(),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(
                    Icons.logout,
                  ),
                  onPressed: () {
                    LoginBloc().add(LogOutEvent());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                ),
              ),
              body: OrientationBuilder(builder: (context, orientation) {
                return SingleChildScrollView(
                  child: orientation == Orientation.portrait
                      ? Column(
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
                        )
                      : Column(
                          children: const [
                            Center(
                              child: Text(
                                'Список стран по добыче нефти в % по данным «Опек»,',
                                style: TextStyle(fontSize: 20, fontFamily: 'Raleway'),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TableWidget(),
                          ],
                        ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
