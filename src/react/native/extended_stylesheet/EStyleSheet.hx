package react.native.extended_stylesheet;

import haxe.macro.Context;
import haxe.macro.Expr;

@:jsRequire('react-native-extended-stylesheet', 'default')
extern class EStyleSheet
{
    @:native('create') @:noCompletion static function _create<T>(obj:Dynamic):Dynamic;
    @:native('build') @:noCompletion static function _build<T>(obj:Dynamic):Dynamic;
    public static function value(value:Dynamic, prop:String):Dynamic;
    public static function memoize(fn:Dynamic):Dynamic;
    public static function child(stylesheet:Dynamic, styleName:String, index:Int, count:Int):Dynamic;
    public static function subscribe(event:EventType, listener:Void -> Void):Void;
   
    static inline macro function create(e:Expr):ExprOf<Dynamic<Int>> {
        switch Context.follow(Context.typeof(e)) {
            case TAnonymous(_.get() => a):
                var ct = ComplexType.TAnonymous([for(field in a.fields) {
                    access: [APublic],
                    kind: FVar(macro:Dynamic, null),
                    meta: null,
                    name: field.name,
                    pos: field.pos
                }]);
                return macro (react.native.extended_stylesheet.EStyleSheet._create($e):$ct);
            default:
                Context.fatalError('Expected anonymous object', e.pos);
                return macro null;
        }
    }
        
    static inline macro function build(e:Expr):ExprOf<Dynamic<Int>> {
        switch Context.follow(Context.typeof(e)) {
            case TAnonymous(_.get() => a):
                var ct = ComplexType.TAnonymous([for(field in a.fields) {
                    access: [APublic],
                    kind: FVar(macro:Dynamic, null),
                    meta: null,
                    name: field.name,
                    pos: field.pos
                }]);
                return macro (react.native.extended_stylesheet.EStyleSheet._build($e):$ct);
            default:
                Context.fatalError('Expected anonymous object', e.pos);
                return macro null;
        }
    }
}

@:enum abstract EventType(String) {
    var Build = 'build';
}