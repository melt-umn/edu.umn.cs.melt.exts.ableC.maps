grammar edu:umn:cs:melt:exts:ableC:maps:src:abstractsyntax;

imports edu:umn:cs:melt:ableC:abstractsyntax;

abstract production constructMap
top::Expr ::= k::TypeName v::TypeName e::[Pair<Expr Expr>]
{
  forwards to errorExpr([], location=top.location);
}
