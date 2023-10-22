

class MethodsHelper{

  static String timeFormatter(String date){
    DateTime? convertedDate= DateTime.tryParse(date);
    if(convertedDate!=null){
      return '${convertedDate.year}-${convertedDate.month}-${convertedDate.day} à ${convertedDate.hour}:${convertedDate.minute} ';
    }
    return '';
  }
}