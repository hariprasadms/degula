import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/no_temples_yet_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../templedetails/templedetails_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CitytemplesWidget extends StatefulWidget {
  const CitytemplesWidget({
    Key key,
    this.cityname,
    this.kannadaName,
  }) : super(key: key);

  final String cityname;
  final String kannadaName;

  @override
  _CitytemplesWidgetState createState() => _CitytemplesWidgetState();
}

class _CitytemplesWidgetState extends State<CitytemplesWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          widget.kannadaName,
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: FlutterFlowTheme.tertiaryColor,
            fontSize: 16,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
          child: StreamBuilder<List<TemplesRecord>>(
            stream: queryTemplesRecord(
              queryBuilder: (templesRecord) => templesRecord
                  .where('cityname', isEqualTo: widget.cityname)
                  .where('publishe', isEqualTo: true),
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
              List<TemplesRecord> listViewTemplesRecordList = snapshot.data;
              if (listViewTemplesRecordList.isEmpty) {
                return NoTemplesYetWidget();
              }
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: listViewTemplesRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewTemplesRecord =
                      listViewTemplesRecordList[listViewIndex];
                  return InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TempledetailsWidget(
                            currenttemple: listViewTemplesRecord,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.network(
                                      functions.getImageURL(
                                          listViewTemplesRecord.tempDetailsImg
                                              .toList()),
                                      width: 150,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 3, 0, 2),
                                    child: Text(
                                      listViewTemplesRecord.templename,
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                  ),
                                  Text(
                                    '${listViewTemplesRecord.templePlaceName}, ${listViewTemplesRecord.cityKanName}',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.secondaryColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                  if (listViewTemplesRecord.favBy
                                          .contains(currentUserUid) ??
                                      true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 5, 0, 0),
                                      child: Icon(
                                        Icons.favorite,
                                        color: FlutterFlowTheme.primaryColor,
                                        size: 24,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
