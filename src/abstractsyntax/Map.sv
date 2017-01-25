grammar edu:umn:cs:melt:exts:ableC:maps:src:abstractsyntax;

imports silver:langutil;
imports silver:langutil:pp with implode as ppImplode;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
imports edu:umn:cs:melt:ableC:abstractsyntax:overload;

abstract production mapTypeExpr
top::BaseTypeExpr ::= kType::TypeName vType::TypeName
{
  top.typerep = mapType([], kType.typerep, vType.typerep);
  forwards to typedefTypeExpr([], name("_map", location=builtIn()));
}

abstract production mapType
top::Type ::= qs::[Qualifier] kType::Type vType::Type
{
  top.lpp = pp"${ppImplode(space(), map((.pp), qs))} map<${kType.lpp}${kType.rpp}, ${vType.lpp}${vType.rpp}>";
  top.rpp = pp"";

  -- TODO Overloaded operators

  forwards to noncanonicalType(
    typedefType(qs, "_map",
      pointerType([],
        tagType([],
          refIdTagType(
            structSEU(),
            "_map_struct",
            "edu:umn:cs:melt:exts:ableC:maps:_map_struct")))));
}

abstract production constructMap
top::Expr ::= kType::TypeName vType::TypeName e::[Pair<Expr Expr>]
{
  top.typerep = mapType([], kType.typerep, vType.typerep);
  local mapName::Name = name("_map_being_made", location=builtIn());
  forwards to stmtExpr(
    seqStmt(
      declStmt(variableDecls(
        [], -- Storage Classes
        [], -- Attributes
        directTypeExpr(top.typerep),
        consDeclarator(
          declarator(
            mapName,
            baseTypeExpr(),
            [], -- Attributes
            justInitializer(
              exprInitializer(
                directCallExpr(
                  name("_map_new", location=builtIn()),
                  foldExpr([
                    realConstant(
                      integerConstant(
                        -- I HEAR YOU DOCKING ME POINTS, DOVOLIS. I just don't wanna
                        -- implement "find next greatest prime" at 22:30...
                        --
                        -- To people who aren't me: `length(e)` should instead be
                        -- `nextLargestPrime(length(e))`, because it's being used as
                        --  the size for a hashmap.
                        toString(length(e)),
                        true, -- Unsigned or not
                        noIntSuffix(),
                        location=builtIn()),
                      location=builtIn()),
                    unaryExprOrTypeTraitExpr(
                      sizeofOp(location=builtIn()),
                      typeNameExpr(kType),
                      location=top.location),
                    unaryExprOrTypeTraitExpr(
                      sizeofOp(location=builtIn()),
                      typeNameExpr(vType),
                      location=top.location)]),
                  location=top.location)))),
            nilDeclarator()))),
      mapInitStmts(e)),
    declRefExpr(mapName, location=top.location),
    location=top.location);
}

-- TODO Move to ableC core?
abstract production builtIn
top::Location ::=
{
  forwards to loc("Built In", 0, 0, 0, 0, 0, 0);
}

abstract production mapInitStmts
top::Stmt ::= e::[Pair<Expr Expr>]
{
  forwards to foldStmt(map(mapInitStmt, e));
}

-- TODO Pass the top.location into this instead of using builtIn() for
-- everything.
abstract production mapInitStmt
top::Stmt ::= pair::Pair<Expr Expr>
{
  local mapName::Name = name("_map_being_made", location=builtIn());
  forwards to exprStmt(directCallExpr(
    name("_map_put", location=builtIn()),
    foldExpr([
      declRefExpr(mapName, location=builtIn()),
      unaryOpExpr(
        addressOfOp(location=builtIn()),
        pair.fst,
        location=builtIn()),
      pair.snd]),
    location=builtIn()));
}
