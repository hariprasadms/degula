import '../backend/backend.dart';
import '../cities_search_page/cities_search_page_widget.dart';
import '../citytemples/citytemples_widget.dart';
import '../components/no_temples_yet_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CitylistWidget extends StatefulWidget {
  const CitylistWidget({Key key}) : super(key: key);

  @override
  _CitylistWidgetState createState() => _CitylistWidgetState();
}

class _CitylistWidgetState extends State<CitylistWidget>
    with TickerProviderStateMixin {
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
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'ಕರ್ನಾಟಕ ಜಿಲ್ಲೆಗಳು',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: FlutterFlowTheme.tertiaryColor,
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
                    builder: (context) => CitiesSearchPageWidget(),
                  ),
                );
              },
              child: Icon(
                Icons.search,
                color: FlutterFlowTheme.tertiaryColor,
                size: 24,
              ),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: StreamBuilder<List<CitiesRecord>>(
        stream: queryCitiesRecord(
          queryBuilder: (citiesRecord) =>
              citiesRecord.where('publishe', isEqualTo: true),
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
          List<CitiesRecord> listViewCitiesRecordList = snapshot.data;
          if (listViewCitiesRecordList.isEmpty) {
            return NoTemplesYetWidget();
          }
          return ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemCount: listViewCitiesRecordList.length,
            itemBuilder: (context, listViewIndex) {
              final listViewCitiesRecord =
                  listViewCitiesRecordList[listViewIndex];
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                child: InkWell(
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
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: CachedNetworkImage(
                            imageUrl: functions.getImageURL(
                                listViewCitiesRecord.cityphoto.toList()),
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.74, 0.76),
                          child: Text(
                            listViewCitiesRecord.cityname,
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFFFAFAFA),
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ).animated([animationsMap['listViewOnPageLoadAnimation']]);
        },
      ),
    );
  }
}
