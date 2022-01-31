import '../backend/backend.dart';
import '../citytemples/citytemples_widget.dart';
import '../components/search_page_no_data_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CitiesSearchPageWidget extends StatefulWidget {
  const CitiesSearchPageWidget({Key key}) : super(key: key);

  @override
  _CitiesSearchPageWidgetState createState() => _CitiesSearchPageWidgetState();
}

class _CitiesSearchPageWidgetState extends State<CitiesSearchPageWidget>
    with TickerProviderStateMixin {
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
    'listTileOnPageLoadAnimation': AnimationInfo(
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
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'ಸಿಟಿ  search ಮಾಡಿ',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: FlutterFlowTheme.tertiaryColor,
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
                  hintText: 'ಸಿಟಿ ಹೆಸರನ್ನು search ಮಾಡಿ...',
                  hintStyle: FlutterFlowTheme.bodyText1,
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
                    color: FlutterFlowTheme.primaryColor,
                    size: 22,
                  ),
                  suffixIcon: textController.text.isNotEmpty
                      ? InkWell(
                          onTap: () => setState(
                            () => textController.clear(),
                          ),
                          child: Icon(
                            Icons.clear,
                            color: FlutterFlowTheme.primaryColor,
                            size: 22,
                          ),
                        )
                      : null,
                ),
                style: FlutterFlowTheme.bodyText1,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                  child: FutureBuilder<List<CitiesRecord>>(
                    future: CitiesRecord.search(
                      term: valueOrDefault<String>(
                        textController.text,
                        'b',
                      ),
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
                      List<CitiesRecord> listViewCitiesRecordList =
                          snapshot.data;
                      if (listViewCitiesRecordList.isEmpty) {
                        return Center(
                          child: Container(
                            width: 200,
                            height: 200,
                            child: SearchPageNoDataWidget(),
                          ),
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewCitiesRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewCitiesRecord =
                              listViewCitiesRecordList[listViewIndex];
                          return InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CitytemplesWidget(
                                    cityname: listViewCitiesRecord.englishName,
                                    kannadaName: listViewCitiesRecord.cityname,
                                  ),
                                ),
                              );
                            },
                            child: ListTile(
                              title: Text(
                                listViewCitiesRecord.cityname,
                                style: FlutterFlowTheme.title3.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                ),
                              ),
                              subtitle: Text(
                                listViewCitiesRecord.englishName,
                                style: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.primaryColor,
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
                          ).animated(
                              [animationsMap['listTileOnPageLoadAnimation']]);
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
