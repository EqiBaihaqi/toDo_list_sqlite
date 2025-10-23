import 'dart:convert';

class SessionKey {
  static String token = base64.encode("token".codeUnits);
  static String id = base64.encode("id".codeUnits);
  static String email = base64.encode("email".codeUnits);
  static String passwordLastUpdatedAt =
      base64.encode("passwordLastUpdatedAt".codeUnits);
  static String fullName = base64.encode("fullName".codeUnits);
  static String isActive = base64.encode("isActive".codeUnits);
  static String avatarPath = base64.encode("avatarPath".codeUnits);
  static String createdAt = base64.encode("createdAt".codeUnits);
  static String updatedAt = base64.encode("updatedAt".codeUnits);
  static String deletedAt = base64.encode("deletedAt".codeUnits);
  static String manpowerId = base64.encode("manpowerId".codeUnits);
  static String manpowerLabel = base64.encode("manpowerLabel".codeUnits);
  static String passwordLastUpdatedAtToString =
      base64.encode("passwordLastUpdatedAtToString".codeUnits);            
  
 
}
