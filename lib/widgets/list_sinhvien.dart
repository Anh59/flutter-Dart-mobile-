import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/sinhvien.dart';

// class dinh extends StatefulWidget
class SinhVienList extends StatefulWidget {
  final List<SinhVien> danhSachSinhVien;

  SinhVienList(this.danhSachSinhVien);

  @override
  State<SinhVienList> createState() => _SinhVienListState();
}

class _SinhVienListState extends State<SinhVienList> {
  Color checkngay(SinhVien chon) {
    if (DateTime.now().isAfter(chon.ngayhethan))
      return Colors.red;
    else
      return Colors.white;
  }

  void delete(String ma) {
    setState(() {
      widget.danhSachSinhVien.removeWhere((SinhVien) => SinhVien.ma == ma);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: widget.danhSachSinhVien.map((sv) {
            return Card(
              // Card.all(Radius.circular(90)),
              // side :BorderSide.all(Radius.circular(80)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(90),
              ),

              color: checkngay(sv),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.purple,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(80)),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      sv.diemTotNghiep.toStringAsFixed(1),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        sv.ma + ' - ' + sv.hoVaTen,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat('dd-MM-yyyy').format(sv.ngayhethan),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                delete(sv.ma);
                              });
                            },
                            icon: const Icon(Icons.delete),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                delete(sv.ma);
                              });
                            },
                            icon: const Icon(Icons.edit),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
