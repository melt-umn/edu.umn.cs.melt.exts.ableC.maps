grammar edu:umn:cs:melt:exts:ableC:maps:src:concretesyntax:constructor;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports silver:langutil only ast;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
-- imports edu:umn:cs:melt:ableC:abstractsyntax;

import edu:umn:cs:melt:exts:ableC:maps:src:abstractsyntax;

marking terminal NewMap_t 'new_map' lexer classes {Ckeyword};

concrete productions top::PrimaryExpr_c
| 'new_map' '<' k::TypeName_c ',' v::TypeName_c '>' '{' elems::ArgumentExprList_c '}'
  { top.ast = constructMap(k.ast, v.ast, foldExpr(elems.ast), location=top.location); }
