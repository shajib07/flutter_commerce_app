// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductsEvent()';
}


}

/// @nodoc
class $ProductsEventCopyWith<$Res>  {
$ProductsEventCopyWith(ProductsEvent _, $Res Function(ProductsEvent) __);
}


/// Adds pattern-matching-related methods to [ProductsEvent].
extension ProductsEventPatterns on ProductsEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProductsLoadRequested value)?  loadRequested,TResult Function( ProductsSearchQueryChanged value)?  searchQueryChanged,TResult Function( ProductsCategorySelected value)?  categorySelected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProductsLoadRequested() when loadRequested != null:
return loadRequested(_that);case ProductsSearchQueryChanged() when searchQueryChanged != null:
return searchQueryChanged(_that);case ProductsCategorySelected() when categorySelected != null:
return categorySelected(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProductsLoadRequested value)  loadRequested,required TResult Function( ProductsSearchQueryChanged value)  searchQueryChanged,required TResult Function( ProductsCategorySelected value)  categorySelected,}){
final _that = this;
switch (_that) {
case ProductsLoadRequested():
return loadRequested(_that);case ProductsSearchQueryChanged():
return searchQueryChanged(_that);case ProductsCategorySelected():
return categorySelected(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProductsLoadRequested value)?  loadRequested,TResult? Function( ProductsSearchQueryChanged value)?  searchQueryChanged,TResult? Function( ProductsCategorySelected value)?  categorySelected,}){
final _that = this;
switch (_that) {
case ProductsLoadRequested() when loadRequested != null:
return loadRequested(_that);case ProductsSearchQueryChanged() when searchQueryChanged != null:
return searchQueryChanged(_that);case ProductsCategorySelected() when categorySelected != null:
return categorySelected(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadRequested,TResult Function( String query)?  searchQueryChanged,TResult Function( ProductCategory? category)?  categorySelected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProductsLoadRequested() when loadRequested != null:
return loadRequested();case ProductsSearchQueryChanged() when searchQueryChanged != null:
return searchQueryChanged(_that.query);case ProductsCategorySelected() when categorySelected != null:
return categorySelected(_that.category);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadRequested,required TResult Function( String query)  searchQueryChanged,required TResult Function( ProductCategory? category)  categorySelected,}) {final _that = this;
switch (_that) {
case ProductsLoadRequested():
return loadRequested();case ProductsSearchQueryChanged():
return searchQueryChanged(_that.query);case ProductsCategorySelected():
return categorySelected(_that.category);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadRequested,TResult? Function( String query)?  searchQueryChanged,TResult? Function( ProductCategory? category)?  categorySelected,}) {final _that = this;
switch (_that) {
case ProductsLoadRequested() when loadRequested != null:
return loadRequested();case ProductsSearchQueryChanged() when searchQueryChanged != null:
return searchQueryChanged(_that.query);case ProductsCategorySelected() when categorySelected != null:
return categorySelected(_that.category);case _:
  return null;

}
}

}

/// @nodoc


class ProductsLoadRequested implements ProductsEvent {
  const ProductsLoadRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsLoadRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductsEvent.loadRequested()';
}


}




/// @nodoc


class ProductsSearchQueryChanged implements ProductsEvent {
  const ProductsSearchQueryChanged({required this.query});
  

 final  String query;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsSearchQueryChangedCopyWith<ProductsSearchQueryChanged> get copyWith => _$ProductsSearchQueryChangedCopyWithImpl<ProductsSearchQueryChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsSearchQueryChanged&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'ProductsEvent.searchQueryChanged(query: $query)';
}


}

/// @nodoc
abstract mixin class $ProductsSearchQueryChangedCopyWith<$Res> implements $ProductsEventCopyWith<$Res> {
  factory $ProductsSearchQueryChangedCopyWith(ProductsSearchQueryChanged value, $Res Function(ProductsSearchQueryChanged) _then) = _$ProductsSearchQueryChangedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$ProductsSearchQueryChangedCopyWithImpl<$Res>
    implements $ProductsSearchQueryChangedCopyWith<$Res> {
  _$ProductsSearchQueryChangedCopyWithImpl(this._self, this._then);

  final ProductsSearchQueryChanged _self;
  final $Res Function(ProductsSearchQueryChanged) _then;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(ProductsSearchQueryChanged(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProductsCategorySelected implements ProductsEvent {
  const ProductsCategorySelected({this.category});
  

 final  ProductCategory? category;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsCategorySelectedCopyWith<ProductsCategorySelected> get copyWith => _$ProductsCategorySelectedCopyWithImpl<ProductsCategorySelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsCategorySelected&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'ProductsEvent.categorySelected(category: $category)';
}


}

/// @nodoc
abstract mixin class $ProductsCategorySelectedCopyWith<$Res> implements $ProductsEventCopyWith<$Res> {
  factory $ProductsCategorySelectedCopyWith(ProductsCategorySelected value, $Res Function(ProductsCategorySelected) _then) = _$ProductsCategorySelectedCopyWithImpl;
@useResult
$Res call({
 ProductCategory? category
});




}
/// @nodoc
class _$ProductsCategorySelectedCopyWithImpl<$Res>
    implements $ProductsCategorySelectedCopyWith<$Res> {
  _$ProductsCategorySelectedCopyWithImpl(this._self, this._then);

  final ProductsCategorySelected _self;
  final $Res Function(ProductsCategorySelected) _then;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = freezed,}) {
  return _then(ProductsCategorySelected(
category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ProductCategory?,
  ));
}


}

// dart format on
