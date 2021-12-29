import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class TempledetailsWidget extends StatefulWidget {
  const TempledetailsWidget({
    Key key,
    this.currenttemple,
  }) : super(key: key);

  final TemplesRecord currenttemple;

  @override
  _TempledetailsWidgetState createState() => _TempledetailsWidgetState();
}

class _TempledetailsWidgetState extends State<TempledetailsWidget>
    with TickerProviderStateMixin {
  LatLng currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng googleMapsCenter;
  Completer<GoogleMapController> googleMapsController;
  final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
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

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
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
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: StreamBuilder<List<TemplesRecord>>(
              stream: queryTemplesRecord(
                queryBuilder: (templesRecord) => templesRecord.where(
                    'templename',
                    isEqualTo: widget.currenttemple.templename),
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
                        color: FlutterFlowTheme.primaryColor,
                        size: 50,
                      ),
                    ),
                  );
                }
                List<TemplesRecord> toggleIconTemplesRecordList = snapshot.data;
                // Return an empty Container when the document does not exist.
                if (snapshot.data.isEmpty) {
                  return Container();
                }
                final toggleIconTemplesRecord =
                    toggleIconTemplesRecordList.isNotEmpty
                        ? toggleIconTemplesRecordList.first
                        : null;
                return ToggleIcon(
                  onPressed: () async {
                    final favByElement = currentUserUid;
                    final favByUpdate =
                        toggleIconTemplesRecord.favBy.contains(favByElement)
                            ? FieldValue.arrayRemove([favByElement])
                            : FieldValue.arrayUnion([favByElement]);
                    final templesUpdateData = {
                      'favBy': favByUpdate,
                    };
                    await toggleIconTemplesRecord.reference
                        .update(templesUpdateData);
                  },
                  value: toggleIconTemplesRecord.favBy.contains(currentUserUid),
                  onIcon: Icon(
                    Icons.favorite,
                    color: FlutterFlowTheme.tertiaryColor,
                    size: 25,
                  ),
                  offIcon: Icon(
                    Icons.favorite_border_sharp,
                    color: FlutterFlowTheme.tertiaryColor,
                    size: 25,
                  ),
                );
              },
            ),
          ),
        ],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
            Container(
              width: double.infinity,
              height: 330,
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Image.network(
                      functions.getImageURL(
                          widget.currenttemple.tempDetailsImg.toList()),
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ).animated([animationsMap['imageOnPageLoadAnimation']]),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.81, 0.8),
                    child: Text(
                      widget.currenttemple.templename,
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.tertiaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ListTile(
                              leading: Icon(
                                Icons.directions,
                                color: FlutterFlowTheme.secondaryColor,
                                size: 20,
                              ),
                              title: Text(
                                widget.currenttemple.address,
                                style: FlutterFlowTheme.bodyText1,
                              ),
                              tileColor: Color(0xFFF5F5F5),
                              dense: false,
                            ),
                            ListTile(
                              leading: FaIcon(
                                FontAwesomeIcons.globe,
                                color: FlutterFlowTheme.secondaryColor,
                                size: 18,
                              ),
                              title: Text(
                                widget.currenttemple.website,
                                style: FlutterFlowTheme.bodyText1,
                              ),
                              tileColor: Color(0xFFF5F5F5),
                              dense: false,
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.phone,
                                color: FlutterFlowTheme.secondaryColor,
                                size: 18,
                              ),
                              title: Text(
                                widget.currenttemple.phoneNumber,
                                style: FlutterFlowTheme.bodyText1,
                              ),
                              tileColor: Color(0xFFF5F5F5),
                              dense: false,
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.location_pin,
                                color: FlutterFlowTheme.secondaryColor,
                                size: 20,
                              ),
                              title: Text(
                                '${functions.geoDistance(widget.currenttemple.geoLocation, currentUserLocationValue)} Kilo-meters',
                                style: FlutterFlowTheme.bodyText1,
                              ),
                              tileColor: Color(0xFFF5F5F5),
                              dense: false,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                      child: FlutterFlowGoogleMap(
                        controller: googleMapsController,
                        onCameraIdle: (latLng) => googleMapsCenter = latLng,
                        initialLocation: googleMapsCenter ??=
                            widget.currenttemple.geoLocation,
                        markers: [
                          if (widget.currenttemple != null)
                            FlutterFlowMarker(
                              widget.currenttemple.reference.path,
                              widget.currenttemple.geoLocation,
                              () async {
                                await launchURL(functions
                                    .openMap(widget.currenttemple.geoLocation));
                              },
                            ),
                        ],
                        markerColor: GoogleMarkerColor.violet,
                        mapType: MapType.normal,
                        style: GoogleMapStyle.standard,
                        initialZoom: 14,
                        allowInteraction: false,
                        allowZoom: false,
                        showZoomControls: false,
                        showLocation: false,
                        showCompass: false,
                        showMapToolbar: false,
                        showTraffic: false,
                        centerMapOnMarkerTap: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
