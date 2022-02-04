import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class DegulaValunteersWidget extends StatefulWidget {
  const DegulaValunteersWidget({Key key}) : super(key: key);

  @override
  _DegulaValunteersWidgetState createState() => _DegulaValunteersWidgetState();
}

class _DegulaValunteersWidgetState extends State<DegulaValunteersWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'Degula Valunteers',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: FlutterFlowTheme.tertiaryColor,
            fontSize: 18,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: StreamBuilder<List<TempvalunteersRecord>>(
            stream: queryTempvalunteersRecord(),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: SpinKitSquareCircle(
                      color: FlutterFlowTheme.primaryColor,
                      size: 50,
                    ),
                  ),
                );
              }
              List<TempvalunteersRecord> listViewTempvalunteersRecordList =
                  snapshot.data;
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: listViewTempvalunteersRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewTempvalunteersRecord =
                      listViewTempvalunteersRecordList[listViewIndex];
                  return ListTile(
                    title: Text(
                      listViewTempvalunteersRecord.valunteerName,
                      style: FlutterFlowTheme.title3.override(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      listViewTempvalunteersRecord.templename,
                      style: FlutterFlowTheme.subtitle2,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF303030),
                      size: 20,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
