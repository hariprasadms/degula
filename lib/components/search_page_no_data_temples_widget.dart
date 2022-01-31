import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPageNoDataTemplesWidget extends StatefulWidget {
  const SearchPageNoDataTemplesWidget({Key key}) : super(key: key);

  @override
  _SearchPageNoDataTemplesWidgetState createState() =>
      _SearchPageNoDataTemplesWidgetState();
}

class _SearchPageNoDataTemplesWidgetState
    extends State<SearchPageNoDataTemplesWidget> {
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
            'Search temple name or place name',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.bodyText1.override(
              fontFamily: 'Poppins',
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
