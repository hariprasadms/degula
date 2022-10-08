import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/no_temples_yet_widget.dart';
import '../components/temple_feed_filter_widget.dart';
import '../components/temple_post_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class TempFeedWidget extends StatefulWidget {
  const TempFeedWidget({Key? key}) : super(key: key);

  @override
  _TempFeedWidgetState createState() => _TempFeedWidgetState();
}

class _TempFeedWidgetState extends State<TempFeedWidget> {
  PagingController<DocumentSnapshot?, TemplePostsRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  String? selectedCity;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CitiesRecord>>(
      future: queryCitiesRecordOnce(),
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
        List<CitiesRecord> tempFeedCitiesRecordList = snapshot.data!;
        return Title(
            title: 'temp_feed',
            color: FlutterFlowTheme.of(context).primaryColor,
            child: Scaffold(
              key: scaffoldKey,
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Text(
                                    currentUserEmail,
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
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
                                if (scaffoldKey.currentState!.isDrawerOpen ||
                                    scaffoldKey.currentState!.isEndDrawerOpen) {
                                  Navigator.pop(context);
                                }

                                context.pushNamed(
                                  'famous_temples',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                ),
                                alignment: AlignmentDirectional(
                                    0.10000000000000009, 0),
                                child: Align(
                                  alignment: AlignmentDirectional(-0.65, 0),
                                  child: Text(
                                    'Famous Temples',
                                    style: FlutterFlowTheme.of(context)
                                        .title2
                                        .override(
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
                                GoRouter.of(context).prepareAuthEvent();
                                await signOut();

                                context.goNamedAuth('bording_page', mounted);
                              },
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                ),
                                alignment: AlignmentDirectional(
                                    0.10000000000000009, 0),
                                child: Align(
                                  alignment: AlignmentDirectional(-0.65, 0),
                                  child: Text(
                                    'Log out',
                                    style: FlutterFlowTheme.of(context)
                                        .title2
                                        .override(
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
                ),
              ),
              appBar: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                automaticallyImplyLeading: false,
                leading: InkWell(
                  onTap: () async {
                    scaffoldKey.currentState!.openDrawer();
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
                actions: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                    child: InkWell(
                      onTap: () async {
                        setState(() => FFAppState().templenamelist =
                            tempFeedCitiesRecordList
                                .map((e) => e.englishName!)
                                .toList());
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor:
                              FlutterFlowTheme.of(context).tertiaryColor,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                child: TempleFeedFilterWidget(),
                              ),
                            );
                          },
                        ).then((value) => setState(() => selectedCity = value));

                        setState(() {});
                      },
                      child: Icon(
                        Icons.filter_list_sharp,
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                        size: 24,
                      ),
                    ),
                  ),
                ],
                centerTitle: true,
                elevation: 4,
              ),
              body: SafeArea(
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: PagedListView<DocumentSnapshot<Object?>?,
                      TemplePostsRecord>(
                    pagingController: () {
                      final Query<Object?> Function(Query<Object?>)
                          queryBuilder =
                          (templePostsRecord) => templePostsRecord
                              .where('cityname',
                                  isEqualTo:
                                      selectedCity != '' ? selectedCity : null)
                              .orderBy('created_date_time', descending: true);
                      if (_pagingController != null) {
                        final query =
                            queryBuilder(TemplePostsRecord.collection);
                        if (query != _pagingQuery) {
                          // The query has changed
                          _pagingQuery = query;
                          _streamSubscriptions.forEach((s) => s?.cancel());
                          _streamSubscriptions.clear();
                          _pagingController!.refresh();
                        }
                        return _pagingController!;
                      }

                      _pagingController = PagingController(firstPageKey: null);
                      _pagingQuery = queryBuilder(TemplePostsRecord.collection);
                      _pagingController!
                          .addPageRequestListener((nextPageMarker) {
                        queryTemplePostsRecordPage(
                          queryBuilder: (templePostsRecord) => templePostsRecord
                              .where('cityname',
                                  isEqualTo:
                                      selectedCity != '' ? selectedCity : null)
                              .orderBy('created_date_time', descending: true),
                          nextPageMarker: nextPageMarker,
                          pageSize: 10,
                          isStream: true,
                        ).then((page) {
                          _pagingController!.appendPage(
                            page.data,
                            page.nextPageMarker,
                          );
                          final streamSubscription =
                              page.dataStream?.listen((data) {
                            final itemIndexes = _pagingController!.itemList!
                                .asMap()
                                .map((k, v) => MapEntry(v.reference.id, k));
                            data.forEach((item) {
                              final index = itemIndexes[item.reference.id];
                              final items = _pagingController!.itemList!;
                              if (index != null) {
                                items.replaceRange(index, index + 1, [item]);
                                _pagingController!.itemList = {
                                  for (var item in items) item.reference: item
                                }.values.toList();
                              }
                            });
                            setState(() {});
                          });
                          _streamSubscriptions.add(streamSubscription);
                        });
                      });
                      return _pagingController!;
                    }(),
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    builderDelegate:
                        PagedChildBuilderDelegate<TemplePostsRecord>(
                      // Customize what your widget looks like when it's loading the first page.
                      firstPageProgressIndicatorBuilder: (_) => Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: SpinKitSquareCircle(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 50,
                          ),
                        ),
                      ),
                      noItemsFoundIndicatorBuilder: (_) => NoTemplesYetWidget(),
                      itemBuilder: (context, _, listViewIndex) {
                        final listViewTemplePostsRecord =
                            _pagingController!.itemList![listViewIndex];
                        return TemplePostWidget(
                          templeName: listViewTemplePostsRecord.templeName,
                          templePlace: listViewTemplePostsRecord.cityname,
                          poojaName: listViewTemplePostsRecord.postTitle,
                          poojaDetails: listViewTemplePostsRecord.postDetails,
                          templimg: listViewTemplePostsRecord.templimg,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
