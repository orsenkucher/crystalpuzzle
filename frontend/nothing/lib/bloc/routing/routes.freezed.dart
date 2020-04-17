// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'routes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$Routes {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result home(),
    @required Result history(),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result home(),
    Result history(),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result home(_Home value),
    @required Result history(_History value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result home(_Home value),
    Result history(_History value),
    @required Result orElse(),
  });
}

class _$RoutesTearOff {
  const _$RoutesTearOff();

  _Home home() {
    return const _Home();
  }

  _History history() {
    return const _History();
  }
}

const $Routes = _$RoutesTearOff();

class _$_Home with DiagnosticableTreeMixin implements _Home {
  const _$_Home();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Routes.home()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'Routes.home'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Home);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result home(),
    @required Result history(),
  }) {
    assert(home != null);
    assert(history != null);
    return home();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result home(),
    Result history(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (home != null) {
      return home();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result home(_Home value),
    @required Result history(_History value),
  }) {
    assert(home != null);
    assert(history != null);
    return home(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result home(_Home value),
    Result history(_History value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (home != null) {
      return home(this);
    }
    return orElse();
  }
}

abstract class _Home implements Routes {
  const factory _Home() = _$_Home;
}

class _$_History with DiagnosticableTreeMixin implements _History {
  const _$_History();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Routes.history()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'Routes.history'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _History);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result home(),
    @required Result history(),
  }) {
    assert(home != null);
    assert(history != null);
    return history();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result home(),
    Result history(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (history != null) {
      return history();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result home(_Home value),
    @required Result history(_History value),
  }) {
    assert(home != null);
    assert(history != null);
    return history(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result home(_Home value),
    Result history(_History value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (history != null) {
      return history(this);
    }
    return orElse();
  }
}

abstract class _History implements Routes {
  const factory _History() = _$_History;
}
