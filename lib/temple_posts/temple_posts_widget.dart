import '../backend/backend.dart';
import '../create_temple_post/create_temple_post_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class TemplePostsWidget extends StatefulWidget {
  const TemplePostsWidget({Key key}) : super(key: key);

  @override
  _TemplePostsWidgetState createState() => _TemplePostsWidgetState();
}

class _TemplePostsWidgetState extends State<TemplePostsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'Temple Posts',
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
                    builder: (context) => CreateTemplePostWidget(),
                  ),
                );
              },
              child: Icon(
                Icons.add,
                color: FlutterFlowTheme.of(context).tertiaryColor,
                size: 24,
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
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
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: listViewTemplePostsRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewTemplePostsRecord =
                      listViewTemplePostsRecordList[listViewIndex];
                  return ListTile(
                    title: Text(
                      listViewTemplePostsRecord.postTitle,
                      style: FlutterFlowTheme.of(context).title3.override(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    subtitle: Text(
                      listViewTemplePostsRecord.postDetails,
                      style: FlutterFlowTheme.of(context).subtitle2,
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
