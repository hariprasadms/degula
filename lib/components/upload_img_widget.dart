import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadImgWidget extends StatefulWidget {
  const UploadImgWidget({
    Key? key,
    this.image,
  }) : super(key: key);

  final String? image;

  @override
  _UploadImgWidgetState createState() => _UploadImgWidgetState();
}

class _UploadImgWidgetState extends State<UploadImgWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
        border: Border.all(
          color: Color(0xFF656161),
        ),
      ),
      child: Image.network(
        'https://via.placeholder.com/450x360',
        width: double.infinity,
        height: 300,
        fit: BoxFit.cover,
      ),
    );
  }
}
