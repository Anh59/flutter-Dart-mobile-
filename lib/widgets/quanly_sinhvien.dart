import 'package:flutter/material.dart';

import './new_sinhvien.dart';
import './list_sinhvien.dart';
import '../models/sinhvien.dart';

class QuanLySinhVien extends StatefulWidget {
  @override
  QuanLySinhVienTransactionsState createState() => QuanLySinhVienTransactionsState();
}

class QuanLySinhVienTransactionsState extends State<QuanLySinhVien> {
  final List<SinhVien> danhSachSinhVien = [
    SinhVien(ma: '2345678',
        hoVaTen: 'Nguyen Quynh Nga',
        ngayhethan: DateTime(2003, 12, 02),
        diemTotNghiep: 7.8),
    SinhVien(ma: '3336688',
        hoVaTen: 'Tran Van Quang',
        ngayhethan: DateTime(2002, 06, 27),
        diemTotNghiep: 8.5),
  ];

  /*void _addNewSinhVien(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewSinhVien(),
        //NewSinhVien(_addNewTransaction),
        SinhVienList(danhSachSinhVien),
      ],
    );
  }
}