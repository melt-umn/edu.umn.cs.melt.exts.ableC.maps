grammar edu:umn:cs:melt:exts:ableC:maps:src:concretesyntax;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:exts:ableC:maps:src:abstractsyntax as abs;

terminal Map_t 'map' lexer classes {Ckeyword};

concrete productions top::TypeSpecifier_c
| Map_t LessThan_t TypeSpecifier_c Comma_t TypeSpecifier_c GreaterThan_t
{
  top.realTypeSpecifiers = [errorTypeExpr([])];
  top.preTypeSpecifiers = [];
}
