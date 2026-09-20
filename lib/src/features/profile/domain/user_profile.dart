import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  final String userId;
  final String displayName;
  final String? avatarUrl;
  final String countryCode;
  final bool isProfilePublic;

  const UserProfile({
    required this.userId,
    required this.displayName,
    this.avatarUrl,
    required this.countryCode,
    required this.isProfilePublic,
  });

  @override
  List<Object?> get props => [userId, displayName, avatarUrl, countryCode, isProfilePublic];
}