grammar edu:umn:cs:melt:exts:ableC:maps:src:concretesyntax:constructor;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports silver:langutil only ast;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
-- imports edu:umn:cs:melt:ableC:abstractsyntax;

import edu:umn:cs:melt:exts:ableC:maps:src:abstractsyntax;

marking terminal NewMap_t 'new_map' lexer classes {Ckeyword};

concrete productions top::PrimaryExpr_c
| 'new_map' '<' k::TypeName_c ',' v::TypeName_c '>' '{' elems::MapExprList_c '}'
  { top.ast = constructMap(k.ast, v.ast, foldExpr(elems.ast), location=top.location); }

closed nonterminal MapExprList_c with location, ast<[Pair<Expr Expr>]>;
concrete productions top::MapExprList_c
| e::AssignExprPair_c
  { top.ast = [e.ast]; }
| h::MapExprList_c ',' t::AssignExprPair_c
  { top.ast = h ++ [t]; }

closed nonterminal AssignExprPair_c with location, ast<Pair<Expr Expr>>;
concrete productions top::AssignExprPair_c
| k::AssignExpr_c ':' v::AssignExpr_c
  { top.ast = pair(k.ast, v.ast); }
