class RegisterProblem {
  final String by;
  final String textMessage;
  final double latitude;
  final double longitude;
  final String address;
  final String problemDate;
  final String problemTime;
  final int numOfPerson;
  final String mainProblemType;
  final String pinCode;

  RegisterProblem(
      {required this.textMessage,
      required this.latitude,
      required this.by,
      required this.longitude,
      required this.address,
      required this.problemDate,
      required this.problemTime,
      required this.numOfPerson,
      required this.mainProblemType,
      required this.pinCode});
}
