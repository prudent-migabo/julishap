import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/data.dart';

part 'alerts_state.dart';

class AlertsCubit extends Cubit<AlertsState> {
  AlertsRepository alertsRepository;
  String  uid;
  AlertsCubit({required this.alertsRepository,required this.uid}) : super(AlertsState.initial()){
    print('ccccccccccc${uid}');
    _notificationAlertsStream=alertsRepository.notificationAlerts(uid).listen((alerts) {
      getNotificationsAlerts(alerts);
    });
    _historyAlertsStream=alertsRepository.historyAlerts(uid).listen((alerts) {
      getHistoryAlerts(alerts);
    });

    _declinedAlertsStream= alertsRepository.declinedAlerts(uid).listen((alerts) {
      declinedAlerts(alerts);
    });
  }
  StreamSubscription? _notificationAlertsStream;
  StreamSubscription? _historyAlertsStream;
  StreamSubscription? _declinedAlertsStream;

  void getNotificationsAlerts(List<AlertModel> alerts){
  emit(state.copyWith(notificationAlerts: alerts));
  }

  void getHistoryAlerts(List<AlertModel> alerts){
    emit(state.copyWith(historyAlerts: alerts));
  }

  void declinedAlerts(List<AlertModel> alerts){
    emit(state.copyWith(declinedAlerts: alerts));
  }

  void sendAlert(AlertModel alertModel)async{
    try{
      emit(state.copyWith(status: AlertsStatus.loading));
       await alertsRepository.sendAnAlert(alertModel);
      emit(state.copyWith(status: AlertsStatus.success));
    }on CustomError catch(e){
      emit(state.copyWith(customError: e));
    }
  }

  @override
  Future<void> close() {
    _notificationAlertsStream!.cancel();
    _historyAlertsStream!.cancel();
    _declinedAlertsStream!.cancel();
    return super.close();
  }
}
