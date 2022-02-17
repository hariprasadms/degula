import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../temple_posts/temple_posts_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ValunteerTemplePostsWidget extends StatefulWidget {
  const ValunteerTemplePostsWidget({
    Key key,
    this.templeName,
    this.temple,
  }) : super(key: key);

  final String templeName;
  final TemplesRecord temple;

  @override
  _ValunteerTemplePostsWidgetState createState() =>
      _ValunteerTemplePostsWidgetState();
}

class _ValunteerTemplePostsWidgetState
    extends State<ValunteerTemplePostsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'Volunteer Posts',
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
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                    child: Text(
                      widget.templeName,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                      child: ListTile(
                        title: Text(
                          'Update Temple information',
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Poppins',
                                fontSize: 18,
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
                    ),
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TemplePostsWidget(),
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text(
                          'Create Post',
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Poppins',
                                fontSize: 18,
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
