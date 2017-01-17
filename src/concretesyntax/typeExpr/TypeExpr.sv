grammar edu:umn:cs:melt:exts:ableC:maps:src:concretesyntax:typeExpr;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:exts:ableC:maps:src:abstractsyntax as abs;

terminal Map_t 'map' lexer classes {Ckeyword};

concrete productions top::TypeSpecifier_c
| 'map' '<' TypeName_c ',' TypeName_c '>'
{
  top.realTypeSpecifiers = [errorTypeExpr([])];
  top.preTypeSpecifiers = [];
}
