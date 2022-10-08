import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutTempleWidget extends StatefulWidget {
  const AboutTempleWidget({Key? key}) : super(key: key);

  @override
  _AboutTempleWidgetState createState() => _AboutTempleWidgetState();
}

class _AboutTempleWidgetState extends State<AboutTempleWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TempvalunteersRecord>>(
      stream: queryTempvalunteersRecord(),
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
        List<TempvalunteersRecord> aboutTempleTempvalunteersRecordList =
            snapshot.data!;
        return Title(
            title: 'about_temple',
            color: FlutterFlowTheme.of(context).primaryColor,
            child: Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                backgroundColor: Color(0xFFEC4509),
                automaticallyImplyLeading: false,
                title: Text(
                  'Degula',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).tertiaryColor,
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
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 50,
                            ),
                          ),
                        );
                      }
                      List<AboutRecord> columnAboutRecordList = snapshot.data!;
                      // Return an empty Container when the document does not exist.
                      if (snapshot.data!.isEmpty) {
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: InkWell(
                                onTap: () async {},
                                child: Text(
                                  columnAboutRecord!.aboutTemple!,
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 3,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (aboutTempleTempvalunteersRecordList.length == 0)
                            InkWell(
                              onTap: () async {
                                context.pushNamed('volunteer_details');
                              },
                              child: ListTile(
                                leading: Icon(
                                  Icons.people_alt_outlined,
                                ),
                                title: Text(
                                  'Submit a volunteer request.',
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
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
                          if (aboutTempleTempvalunteersRecordList.length != 0)
                            InkWell(
                              onTap: () async {
                                context.pushNamed('your_temples');
                              },
                              child: ListTile(
                                leading: Icon(
                                  Icons.adjust_rounded,
                                ),
                                title: Text(
                                  'Your Temples',
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
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
                          if (valueOrDefault<bool>(
                                  currentUserDocument?.degulaAdmin, false) ==
                              true)
                            AuthUserStreamWidget(
                              child: InkWell(
                                onTap: () async {
                                  context.pushNamed('degualadmin');
                                },
                                child: ListTile(
                                  leading: Icon(
                                    Icons.admin_panel_settings,
                                  ),
                                  title: Text(
                                    'Degula admin',
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
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
                            ),
                          InkWell(
                            onTap: () async {
                              GoRouter.of(context).prepareAuthEvent();
                              await signOut();

                              context.goNamedAuth('bording_page', mounted);
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.logout,
                              ),
                              title: Text(
                                'Logout',
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF727070),
                                      fontSize: 16,
                                    ),
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
            ));
      },
    );
  }
}
