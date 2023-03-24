import 'package:flutter/material.dart';
// import './models/sinhvien.dart';
import 'package:intl/intl.dart';
import '../models/sinhvien.dart';

class NewSinhVien extends StatefulWidget {
  final Function addSinhVien;
  // final Function deteleSinhVien;
  NewSinhVien(this.addSinhVien);
  // NewSinhVien(this.deleteSinhVien);
  @override
  State<NewSinhVien> createState() => _NewSinhVienState();
}
// class DeleteSinhVien extends StatefulWidget{
//   final Function deteleSinhVien;
//   DeleteSinhVien(this.deteleSinhVien);
//   State<NewSinhVien>
// }

class _NewSinhVienState extends State<NewSinhVien> {
  final maController = TextEditingController();
  final hoVaTenController = TextEditingController();
  final diemTotNghiepController = TextEditingController();
  final ngayhethanController = TextEditingController();

  //kiêm tra deadline
  // DateTime testdeadline = viewModel.gettestdeadline(index);

  // Color checkngay(SinhVien chon) {
  //   if (DateTime.now().isAfter(chon.ngayhethan))
  //     return Colors.red;
  //   else
  //     return Colors.white;
  // }

  // final ngaySinhController = TextEditingController();
  DateTime bata = DateTime.now();
  DateTime currentDate = DateTime.now();
  void submitData() {
    final enteredMa = maController.text;
    final enteredHoVaTen = hoVaTenController.text;
    final enteredDiemTotNghiep = double.parse(diemTotNghiepController.text);

    // final enteredngaySinh = DateTime.parse(ngaySinhController.text);
    final enteredngayhethan = DateTime.parse(ngayhethanController.text);
    //  final hethan=enteredngayhethan;

    if (enteredMa.isEmpty ||
        enteredHoVaTen.isEmpty ||
        // enteredngayhethan. ||
        enteredDiemTotNghiep <= 0) return;

    widget.addSinhVien(
      enteredMa,
      enteredHoVaTen,
      enteredngayhethan,
      enteredDiemTotNghiep,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Tiêu đề'),
              controller: maController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Mô tả công Việc'),
              controller: hoVaTenController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'ngày hết hạn', icon: Icon(Icons.calendar_month)),
              readOnly: true,
              onTap: () async {
                DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1999),
                    lastDate: DateTime(2070));
                if (date != null) {
                  setState(() {
                    ngayhethanController.text =
                        DateFormat('yyyy-MM-dd').format(date);
                    // enteredngayhethan =DateFormat('yyyy-MM-dd').format();
                  });
                }
              },
              controller: ngayhethanController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration:
                  InputDecoration(labelText: 'Điểm Đánh Giá hoàn Thành'),
              controller: diemTotNghiepController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
              child: Text('Thêm Công Việc'),
              onPressed: () {
                // widget.addSinhVien();
                widget.addSinhVien(
                  maController.text,
                  hoVaTenController.text,
                  DateTime.parse(ngayhethanController.text),
                  double.parse(diemTotNghiepController.text),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
