class CustomError{
  String code;
  String message;
  String plugin;

  CustomError({required this.code, required this.message, required this.plugin});
  factory CustomError.initial(){
    return CustomError(code: '', message: '', plugin: '');
  }
}