import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/no_temples_yet_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import '../valunteer_temple_posts/valunteer_temple_posts_widget.dart';
import '../volunteer_details/volunteer_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class YourTemplesWidget extends StatefulWidget {
  const YourTemplesWidget({Key key}) : super(key: key);

  @override
  _YourTemplesWidgetState createState() => _YourTemplesWidgetState();
}

class _YourTemplesWidgetState extends State<YourTemplesWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFEC4509),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NavBarPage(initialPage: 'about_temple'),
              ),
            );
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: FlutterFlowTheme.of(context).tertiaryColor,
            size: 24,
          ),
        ),
        title: Text(
          'Your Temples',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).tertiaryColor,
                fontSize: 18,
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VolunteerDetailsWidget(),
                  ),
                );
              },
              child: Icon(
                Icons.add,
                color: FlutterFlowTheme.of(context).tertiaryColor,
                size: 30,
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: Column(
            children: [
              TabBar(
                labelColor: FlutterFlowTheme.of(context).primaryColor,
                labelStyle: FlutterFlowTheme.of(context).bodyText1,
                indicatorColor: Color(0xFFF06427),
                tabs: [
                  Tab(
                    text: 'Approved',
                  ),
                  Tab(
                    text: 'Requested ',
                  ),
                  Tab(
                    text: 'Denied',
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    StreamBuilder<List<TempvalunteersRecord>>(
                      stream: queryTempvalunteersRecord(
                        queryBuilder: (tempvalunteersRecord) =>
                            tempvalunteersRecord
                                .where('isApproved', isEqualTo: true)
                                .where('valunteer_uid',
                                    isEqualTo: currentUserUid),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: SpinKitSquareCircle(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 50,
                              ),
                            ),
                          );
                        }
                        List<TempvalunteersRecord>
                            listViewTempvalunteersRecordList = snapshot.data;
                        if (listViewTempvalunteersRecordList.isEmpty) {
                          return NoTemplesYetWidget();
                        }
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewTempvalunteersRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewTempvalunteersRecord =
                                listViewTempvalunteersRecordList[listViewIndex];
                            return InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ValunteerTemplePostsWidget(
                                      templeName: listViewTempvalunteersRecord
                                          .templename,
                                    ),
                                  ),
                                );
                              },
                              child: ListTile(
                                title: Text(
                                  listViewTempvalunteersRecord.templename,
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
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
                    StreamBuilder<List<TempvalunteersRecord>>(
                      stream: queryTempvalunteersRecord(
                        queryBuilder: (tempvalunteersRecord) =>
                            tempvalunteersRecord
                                .where('isInPending', isEqualTo: true)
                                .where('valunteer_uid',
                                    isEqualTo: currentUserUid),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: SpinKitSquareCircle(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 50,
                              ),
                            ),
                          );
                        }
                        List<TempvalunteersRecord>
                            listViewTempvalunteersRecordList = snapshot.data;
                        if (listViewTempvalunteersRecordList.isEmpty) {
                          return NoTemplesYetWidget();
                        }
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewTempvalunteersRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewTempvalunteersRecord =
                                listViewTempvalunteersRecordList[listViewIndex];
                            return ListTile(
                              title: Text(
                                listViewTempvalunteersRecord.templename,
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
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
                    StreamBuilder<List<TempvalunteersRecord>>(
                      stream: queryTempvalunteersRecord(
                        queryBuilder: (tempvalunteersRecord) =>
                            tempvalunteersRecord
                                .where('isRejected', isEqualTo: true)
                                .where('valunteer_uid',
                                    isEqualTo: currentUserUid),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: SpinKitSquareCircle(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 50,
                              ),
                            ),
                          );
                        }
                        List<TempvalunteersRecord>
                            listViewTempvalunteersRecordList = snapshot.data;
                        if (listViewTempvalunteersRecordList.isEmpty) {
                          return NoTemplesYetWidget();
                        }
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewTempvalunteersRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewTempvalunteersRecord =
                                listViewTempvalunteersRecordList[listViewIndex];
                            return ListTile(
                              title: Text(
                                listViewTempvalunteersRecord.templename,
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
