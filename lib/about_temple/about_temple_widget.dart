import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../volunteer_login/volunteer_login_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutTempleWidget extends StatefulWidget {
  const AboutTempleWidget({Key key}) : super(key: key);

  @override
  _AboutTempleWidgetState createState() => _AboutTempleWidgetState();
}

class _AboutTempleWidgetState extends State<AboutTempleWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'ದೇಗುಲ',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: FlutterFlowTheme.tertiaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Align(
          alignment: AlignmentDirectional(0.05, 0),
          child: StreamBuilder<List<AboutRecord>>(
            stream: queryAboutRecord(
              singleRecord: true,
            ),
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
              List<AboutRecord> columnAboutRecordList = snapshot.data;
              // Return an empty Container when the document does not exist.
              if (snapshot.data.isEmpty) {
                return Container();
              }
              final columnAboutRecord = columnAboutRecordList.isNotEmpty
                  ? columnAboutRecordList.first
                  : null;
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, -1),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Text(
                        columnAboutRecord.aboutTemple,
                        style: FlutterFlowTheme.bodyText1,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Container(
                            width: double.infinity,
                            height: 3,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () async {
                      await actions.shareAppStoreLink(
                        'https://play.google.com/store/apps/details?id=com.harimogalli.degula',
                        '1606408373',
                      );
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.share,
                      ),
                      title: Text(
                        'App ಲಿಂಕನ್ನು ಸ್ನೇಹಿಥರಿಗೆ ಶೇರ್ ಮಾಡಿ ',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF727070),
                          fontSize: 15,
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
                  ),
                  InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                          reverseDuration: Duration(milliseconds: 0),
                          child: VolunteerLoginWidget(),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.people_alt_outlined,
                      ),
                      title: Text(
                        'Submit a volunteer request.',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF727070),
                          fontSize: 16,
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
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
