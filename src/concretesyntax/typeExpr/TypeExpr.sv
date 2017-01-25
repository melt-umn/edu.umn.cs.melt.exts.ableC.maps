grammar edu:umn:cs:melt:exts:ableC:maps:src:concretesyntax:typeExpr;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports silver:langutil only ast;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:exts:ableC:maps:src:abstractsyntax;

terminal Map_t 'map' lexer classes {Ckeyword};

concrete productions top::TypeSpecifier_c
| 'map' '<' kType::TypeName_c ',' vType::TypeName_c '>'
  { top.realTypeSpecifiers = [mapTypeExpr(kType.ast, vType.ast)];
    top.preTypeSpecifiers = []; }
