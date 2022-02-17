import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../bording_page/bording_page_widget.dart';
import '../components/no_temples_yet_widget.dart';
import '../components/temple_post_widget.dart';
import '../famous_temples/famous_temples_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class TempFeedWidget extends StatefulWidget {
  const TempFeedWidget({Key key}) : super(key: key);

  @override
  _TempFeedWidgetState createState() => _TempFeedWidgetState();
}

class _TempFeedWidgetState extends State<TempFeedWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        opacity: 0,
      ),
      finalState: AnimationState(
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            scaffoldKey.currentState.openDrawer();
          },
          child: Icon(
            Icons.menu,
            color: FlutterFlowTheme.of(context).tertiaryColor,
            size: 24,
          ),
        ),
        title: Text(
          'Temples Feed',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).tertiaryColor,
                fontSize: 18,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF0EBEB),
      drawer: Drawer(
        elevation: 16,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: 100,
                    height: 200,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryColor,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: AuthUserStreamWidget(
                            child: Container(
                              width: 90,
                              height: 90,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                currentUserPhoto,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Text(
                            currentUserEmail,
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        if (scaffoldKey.currentState.isDrawerOpen ||
                            scaffoldKey.currentState.isEndDrawerOpen) {
                          Navigator.pop(context);
                        }
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                            reverseDuration: Duration(milliseconds: 0),
                            child: FamousTemplesWidget(),
                          ),
                        );
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                        ),
                        alignment: AlignmentDirectional(0.10000000000000009, 0),
                        child: Align(
                          alignment: AlignmentDirectional(-0.65, 0),
                          child: Text(
                            'Famous Temples',
                            style: FlutterFlowTheme.of(context).title2.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        await signOut();
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BordingPageWidget(),
                          ),
                          (r) => false,
                        );
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                        ),
                        alignment: AlignmentDirectional(0.10000000000000009, 0),
                        child: Align(
                          alignment: AlignmentDirectional(-0.65, 0),
                          child: Text(
                            'Log out',
                            style: FlutterFlowTheme.of(context).title2.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ).animated([animationsMap['columnOnPageLoadAnimation']]),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: StreamBuilder<List<TemplePostsRecord>>(
            stream: queryTemplePostsRecord(),
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
              List<TemplePostsRecord> listViewTemplePostsRecordList =
                  snapshot.data;
              if (listViewTemplePostsRecordList.isEmpty) {
                return NoTemplesYetWidget();
              }
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: listViewTemplePostsRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewTemplePostsRecord =
                      listViewTemplePostsRecordList[listViewIndex];
                  return Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      border: Border.all(
                        color: Color(0xFFB8AFAF),
                      ),
                    ),
                    child: TemplePostWidget(),
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
