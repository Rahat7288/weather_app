// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

class CustomError {
  final String errMsg;
  CustomError({
    this.errMsg = '',
  });
  @override
  List<Object> get props => [errMsg];

  // @override
  // bool get stringify => true;

  @override
  String toString() => 'CustomError(errMsg: $errMsg)';
}
