import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPageNoDataWidget extends StatefulWidget {
  const SearchPageNoDataWidget({Key? key}) : super(key: key);

  @override
  _SearchPageNoDataWidgetState createState() => _SearchPageNoDataWidgetState();
}

class _SearchPageNoDataWidgetState extends State<SearchPageNoDataWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.05, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
            child: Icon(
              Icons.search,
              color: Color(0xFFE67B55),
              size: 40,
            ),
          ),
          Text(
            'Search city  name',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
          ),
        ],
      ),
    );
  }
}
