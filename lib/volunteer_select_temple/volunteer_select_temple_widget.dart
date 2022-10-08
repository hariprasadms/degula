import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class VolunteerSelectTempleWidget extends StatefulWidget {
  const VolunteerSelectTempleWidget({Key? key}) : super(key: key);

  @override
  _VolunteerSelectTempleWidgetState createState() =>
      _VolunteerSelectTempleWidgetState();
}

class _VolunteerSelectTempleWidgetState
    extends State<VolunteerSelectTempleWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'volunteer_select_temple',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: true,
            title: Text(
              'Select a temple',
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 22,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: StreamBuilder<List<TemplesRecord>>(
                stream: queryTemplesRecord(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: SpinKitSquareCircle(
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 50,
                        ),
                      ),
                    );
                  }
                  List<TemplesRecord> listViewTemplesRecordList =
                      snapshot.data!;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewTemplesRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewTemplesRecord =
                          listViewTemplesRecordList[listViewIndex];
                      return InkWell(
                        onTap: () async {
                          setState(() => FFAppState().selectedtemple =
                              listViewTemplesRecord.templename!);
                          setState(() => FFAppState().selectedcity =
                              listViewTemplesRecord.cityname!);
                          context.pop();
                        },
                        child: ListTile(
                          title: Text(
                            listViewTemplesRecord.templename!,
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                ),
                          ),
                          subtitle: Text(
                            listViewTemplesRecord.cityname!,
                            style:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                    ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF303030),
                            size: 20,
                          ),
                          tileColor: Color(0xFFF5F5F5),
                          dense: false,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ));
  }
}
