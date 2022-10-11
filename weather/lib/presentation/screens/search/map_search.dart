import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather/core/constants/colors.dart';
import 'package:weather/core/themes/app_color.dart';
import 'package:weather/logic/cubit/mapCubit.dart';
import 'package:weather/logic/state/mapState.dart';
import 'component/bottom_comonent.dart';

class MapSearchScreen extends StatefulWidget {
  const MapSearchScreen({Key? key, }) : super(key: key);
  @override
  State<MapSearchScreen> createState() => _MapSearchScreenState();
}

class _MapSearchScreenState extends State<MapSearchScreen> {

  FocusScopeNode currentFocus = FocusScopeNode();
  final panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MapCubit>(
      create: (context) => MapCubit(MapState()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: BlocBuilder<MapCubit, MapState>(
            builder: (mapContext, mapState) {
              return BlocListener<MapCubit, MapState>(
                  listener: (context, state) async {

                  },
                  child:SlidingUpPanel(
                    minHeight: mapState.position == null?ScreenUtil().screenHeight * 0.0:ScreenUtil().screenHeight * 0.3,
                    maxHeight: ScreenUtil().screenHeight * 0.6,
                    controller: panelController,
                    renderPanelSheet: false,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    body: Stack(
                      children: [
                        SizedBox(
                          height:ScreenUtil().screenHeight,
                          child:mapState.position == null?
                          const Center(
                            child: CircularProgressIndicator(),
                          ):
                          GoogleMap(
                            onMapCreated: (GoogleMapController controller) {
                              mapContext.read<MapCubit>().onMapCreated(controller);
                            },
                            zoomControlsEnabled: false,
                            myLocationButtonEnabled: false,
                            myLocationEnabled: true,
                            markers: mapState.markers,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(
                                  mapState.position != null ? mapState.position!.latitude : mapState.lastKnownPositions!.latitude,
                                  mapState.position != null ? mapState.position!.longitude : mapState.lastKnownPositions!.longitude),
                              zoom: 10,
                            ),
                            onCameraMove: (CameraPosition position) {
                              mapContext.read<MapCubit>().onCameraMove(position);
                            },
                          ),
                        ),
                        SafeArea(
                            child:Align(
                              alignment: Alignment.topCenter,
                              child:Container(
                                decoration: const BoxDecoration(
                                    color: AppColor.colorWhite,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)
                                    )
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      margin:const EdgeInsets.only(top: 20,bottom: 20,left: 20,right: 20).r,
                                      child: TextFormField(
                                        keyboardType: TextInputType.text,
                                        style:AppStyle.textStyle(context, AppColor.black, 16, FontWeight.w400,[]),
                                        controller: mapState.searchController,
                                        onChanged: (eventChange){
                                          mapContext.read<MapCubit>().searchLocation(eventChange);
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'Search here',
                                          hintStyle: AppStyle.textStyle(context, AppColor.textColor, 18, FontWeight.w400,[]),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(color: AppColor.textColor),
                                              borderRadius: BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(color: AppColor.textColor),
                                              borderRadius: BorderRadius.circular(10)),
                                          contentPadding: const EdgeInsets.fromLTRB(20, 13, 0, 13),
                                          prefixIcon: InkWell(
                                            onTap: (){
                                              Navigator.pop(context);
                                            },
                                            child: const Icon(Icons.arrow_back,color: AppColor.black,size: 30,),
                                          ),
                                          suffixIcon: const Icon(Icons.mic,color: AppColor.micColor,size: 30,),
                                        ),
                                      ),
                                    ),
                                    mapState.searchLoading?
                                    const LinearProgressIndicator(
                                      minHeight: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(AppColor.black),
                                    ):
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: mapState.locationSearch?.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child:  ListTile(
                                            leading: Icon(Icons.location_on_outlined,size: 20.h,),
                                            onTap: (){
                                              //add marker
                                              mapContext.read<MapCubit>().addMarker(mapState.locationSearch![index]);
                                              FocusManager.instance.primaryFocus?.unfocus();

                                            },
                                            title: Text(mapState.locationSearch?[index].name ?? '',
                                              style:AppStyle.textStyle(context, AppColor.black, 15, FontWeight.normal,[]),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            )
                        )
                      ],
                    ),
                    panelBuilder: (scrollController) =>
                        MapScreenComponent(scrollController: scrollController,
                          panelController: panelController,
                          mapState: mapState,
                        ),
                  )

              );
            },
          ),
        ),
      ),
    );
  }
}