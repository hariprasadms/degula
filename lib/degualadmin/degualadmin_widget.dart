import '../degula_users/degula_users_widget.dart';
import '../degula_valunteers/degula_valunteers_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class DegualadminWidget extends StatefulWidget {
  const DegualadminWidget({Key key}) : super(key: key);

  @override
  _DegualadminWidgetState createState() => _DegualadminWidgetState();
}

class _DegualadminWidgetState extends State<DegualadminWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'Degula Admin',
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
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DegulaValunteersWidget(),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(
                    'Manage Valunteers',
                    style: FlutterFlowTheme.title3.override(
                      fontFamily: 'Poppins',
                      fontSize: 18,
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
                      builder: (context) => DegulaUsersWidget(),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(
                    'Manage Users',
                    style: FlutterFlowTheme.title3.override(
                      fontFamily: 'Poppins',
                      fontSize: 18,
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
      ),
    );
  }
}
