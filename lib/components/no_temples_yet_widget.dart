import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NoTemplesYetWidget extends StatefulWidget {
  const NoTemplesYetWidget({Key key}) : super(key: key);

  @override
  _NoTemplesYetWidgetState createState() => _NoTemplesYetWidgetState();
}

class _NoTemplesYetWidgetState extends State<NoTemplesYetWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
          child: Icon(
            Icons.hourglass_empty,
            color: FlutterFlowTheme.of(context).secondaryColor,
            size: 40,
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0, 0),
          child: Text(
            'No temples to display',
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
          ),
        ),
      ],
    );
  }
}
