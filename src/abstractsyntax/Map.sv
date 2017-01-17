-- grammar edu:umn:cs:melt:exts:ableC:maps:abstractsyntax;

imports edu:umn:cs:melt:ableC:abstractsyntax;

abstract production constructMap
top::Expr ::= k::TypeName v::TypeName e::Exprs
{
  forwards to errorExpr([], location=top.location);
}
