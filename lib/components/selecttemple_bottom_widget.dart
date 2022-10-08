import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SelecttempleBottomWidget extends StatefulWidget {
  const SelecttempleBottomWidget({Key? key}) : super(key: key);

  @override
  _SelecttempleBottomWidgetState createState() =>
      _SelecttempleBottomWidgetState();
}

class _SelecttempleBottomWidgetState extends State<SelecttempleBottomWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TemplesRecord>>(
      stream: queryTemplesRecord(),
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
        List<TemplesRecord> listViewTemplesRecordList = snapshot.data!;
        return ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          itemCount: listViewTemplesRecordList.length,
          itemBuilder: (context, listViewIndex) {
            final listViewTemplesRecord =
                listViewTemplesRecordList[listViewIndex];
            return InkWell(
              onTap: () async {
                Navigator.pop(context, listViewTemplesRecord.templename);
                setState(() => FFAppState().selectedtempref =
                    listViewTemplesRecord.reference);
                setState(() => FFAppState().selectedtemple =
                    listViewTemplesRecord.templename!);
                setState(() => FFAppState().selectedcity =
                    listViewTemplesRecord.cityname!);
                setState(() => FFAppState().selectedtempimg =
                    functions.getImageURL(
                        listViewTemplesRecord.tempDetailsImg!.toList())!);
              },
              child: ListTile(
                title: Text(
                  listViewTemplesRecord.templename!,
                  style: FlutterFlowTheme.of(context).title3,
                ),
                subtitle: Text(
                  listViewTemplesRecord.cityname!,
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
        );
      },
    );
  }
}
