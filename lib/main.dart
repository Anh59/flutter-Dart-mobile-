import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import './models/sinhvien.dart';
import './widgets/list_sinhvien.dart';
import './widgets/new_sinhvien.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quản lý Sinh Vien ',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<SinhVien> danhSachSinhVien = [
    SinhVien(
        ma: '2345678',
        hoVaTen: 'Bán Hàng',
        ngayhethan: DateTime(2023, 12, 02),
        diemTotNghiep: 7.8),
    SinhVien(
        ma: '3336688',
        hoVaTen: 'Tiếp Viên',
        ngayhethan: DateTime(2002, 06, 27),
        diemTotNghiep: 8.5),
  ];

  void addNewSinhVien(
      String ma, String hoVaTen, DateTime ngayhethan, double diemTotNghiep) {
    final newSinhVien = SinhVien(
      ma: ma,
      hoVaTen: hoVaTen,
      ngayhethan: ngayhethan,
      diemTotNghiep: diemTotNghiep,
    );
//
    setState(() {
      danhSachSinhVien.add(newSinhVien);
    });
  }

  void startAddNewSinhVien(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewSinhVien(addNewSinhVien),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quản lý Công Việc'), actions: <Widget>[
        IconButton(
            onPressed: () => startAddNewSinhVien(context),
            icon: Icon(Icons.add))
      ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              width: double.infinity,
              child: Card(
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(10),
                // ),

                color: Colors.blue,
                elevation: 20,
                child: Text('Thông Tin',
                    style: TextStyle(fontSize: 20, fontFamily: 'Raleway')),
              ),
            ),
            SinhVienList(danhSachSinhVien),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddNewSinhVien(context),
      ),
    );
  }
}
