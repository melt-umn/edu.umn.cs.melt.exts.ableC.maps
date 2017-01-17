grammar edu:umn:cs:melt:exts:ableC:maps:src:concretesyntax:constructor;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports silver:langutil only ast;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;

import edu:umn:cs:melt:exts:ableC:maps:src:abstractsyntax;

marking terminal NewMap_t 'new_map' lexer classes {Ckeyword};

concrete productions top::PrimaryExpr_c
| 'new_map' '<' k::TypeName_c ',' v::TypeName_c '>' '{' elems::MapKVList_c '}'
  { top.ast = constructMap(k.ast, v.ast, elems.ast, location=top.location); }

closed nonterminal MapKVList_c with location, ast<[Pair<Expr Expr>]>;
concrete productions top::MapKVList_c
| e::MapKVPair_c
  { top.ast = [e.ast]; }
| h::MapKVPair_c ',' t::MapKVList_c
  { top.ast = h.ast :: t.ast; }

closed nonterminal MapKVPair_c with location, ast<Pair<Expr Expr>>;
concrete productions top::MapKVPair_c
| k::AssignExpr_c ':' v::AssignExpr_c
  { top.ast = pair(k.ast, v.ast); }
