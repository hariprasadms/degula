import '../backend/backend.dart';
import '../components/search_page_no_data_temples_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../templedetails/templedetails_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class TemplesFeedPageSearchWidget extends StatefulWidget {
  const TemplesFeedPageSearchWidget({Key key}) : super(key: key);

  @override
  _TemplesFeedPageSearchWidgetState createState() =>
      _TemplesFeedPageSearchWidgetState();
}

class _TemplesFeedPageSearchWidgetState
    extends State<TemplesFeedPageSearchWidget> with TickerProviderStateMixin {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'listViewOnPageLoadAnimation': AnimationInfo(
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

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'ದೇವಸ್ಥಾನ  search ಮಾಡಿ',
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
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              TextFormField(
                onChanged: (_) => EasyDebounce.debounce(
                  'textController',
                  Duration(milliseconds: 0),
                  () => setState(() {}),
                ),
                controller: textController,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'ದೇವಸ್ಥಾನ ಹೆಸರನ್ನು search ಮಾಡಿ...',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFE7E3E3),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(3),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFE7E3E3),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(3),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  filled: true,
                  fillColor: Color(0xFFE7E4E4),
                  prefixIcon: Icon(
                    Icons.search,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    size: 22,
                  ),
                  suffixIcon: textController.text.isNotEmpty
                      ? InkWell(
                          onTap: () => setState(
                            () => textController.clear(),
                          ),
                          child: Icon(
                            Icons.clear,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 22,
                          ),
                        )
                      : null,
                ),
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                  child: FutureBuilder<List<TemplesRecord>>(
                    future: TemplesRecord.search(
                      term: textController.text,
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
                      List<TemplesRecord> listViewTemplesRecordList =
                          snapshot.data;
                      if (listViewTemplesRecordList.isEmpty) {
                        return Center(
                          child: Container(
                            width: 200,
                            height: 200,
                            child: SearchPageNoDataTemplesWidget(),
                          ),
                        );
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
                            child: ListTile(
                              title: Text(
                                listViewTemplesRecord.templeEngName,
                                style: FlutterFlowTheme.of(context).title3,
                              ),
                              subtitle: Text(
                                '${listViewTemplesRecord.templename}, ${listViewTemplesRecord.templePlaceName}',
                                style: FlutterFlowTheme.of(context).subtitle2,
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
                      ).animated(
                          [animationsMap['listViewOnPageLoadAnimation']]);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
