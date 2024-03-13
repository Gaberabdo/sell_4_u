
abstract class FeedsState {}

class FeedsInitial extends FeedsState {}

class GetCategoryLoading extends FeedsState {}
class GetCategorySuccess extends FeedsState {}
class GetCategoryError extends FeedsState {}

class GetMostPopularLoading extends FeedsState {}
class GetMostPopularSuccess extends FeedsState {}
class GetMostPopularError extends FeedsState {}


class GetUserLoading extends FeedsState {}
class GetUserSuccess extends FeedsState {}
class GetUserError extends FeedsState {}
