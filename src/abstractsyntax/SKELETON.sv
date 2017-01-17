grammar edu:umn:cs:melt:exts:ableC:maps:src:abstractsyntax;

imports edu:umn:cs:melt:ableC:abstractsyntax;


abstract production maps
s::Stmt ::= loc::Location
{
  local printStmts :: [Stmt] 
    = map (mkSkeletonLinePrint(loc,_), mapsLines);

  forwards to 
    foldl1 (seqStmt, printStmts);

  -- The maps, as a list of strings.  The need to escape
  -- backslashes and double quotes obscures things a bit.
  local mapsLines :: [ String ] =
   [ "                 .-\\\"```\\\"-.     ",
     "                /         \\\\    ",
     "                |  _   _  |    ",
     "                | (_\\\\ /_) |    ",
     "                (_   A   _)    ",
     "                 | _____ |     ",
     "                 \\\\`\\\"\\\"\\\"\\\"\\\"`/     ",
     "                  '-.-.-'      ",
     "                   _:=:_                   \\\\\\\\|  ",
     "            .-\\\"\\\"\\\"\\\"`_'='_`\\\"\\\"\\\"\\\"-.           \\\\///  ",
     "           (`,-- -`\\\\   /`- --,`)          (`/  ",
     "           / //`-_--| |--_-`\\\\\\\\ \\\\         .//  ",
     "          / /(_-_  _| |_  _-_)\\\\ \\\\       ///  ",
     "         / / (_- __ \\\\ / __ -_) \\\\ \\\\     ///  ",
     "        / /  (_ -_ - ^ - _- _)  \\\\ \\\\   ///  ",
     "       / /   (_-  _ /=\\\\ _ - _)   \\\\ \\\\ '//  ",
     "      / /     (_ -.':=:'. -_)     \\\\ \\\\//  ",
     "     (`;`     (_-'  :=:  '-_)      (_,'  ",
     "      \\\\\\\\.   jgs __  :=:  __     ",
     "       \\\\\\\\\\\\    .'  `':=:'`  '.     ",
     "        \\\\\\\\\\\\  |  .--. = .--.  |    ",
     "         \\\\\\\\\\\\ |  (  / = \\\\  )  |    ",
     "          \\\\\\\\` \\\\ _`' \\\\=/ '`_ /    ",
     "          ;`)  ( ;_/`v`\\\\_; )    ",
     "          |||\\\\ | |       | |    ",
     "          |\\\\\\\\  | |       | |    ",
     "               | |       | |    ",
     "               | |       | |    ",
     "               | |       | |    ",
     "               | |       | |    ",
     "               | |       | |    ",
     "              (._)       (_.)    ",
     "               ||,       ,||    ",
     "               ||:       :||    ",
     "               ||:       :||    ",
     "               ||:       :||    ",
     "               ||:       :||    ",
     "               ||'       '||    ",
     "              ///)       (\\\\\\\\\\\\    ",
     "            .///`         `\\\\\\\\\\\\.    ",
     "           `//`             `\\\\\\\\`    ",
     "",
     "     Courtesy of http://ascii-art.com."
   ] ;
}

function mkSkeletonLinePrint
Stmt ::= loc::Location mapsLine::String
{
  local strForPrintf :: String =
    "\"" ++ mapsLine ++ "\\n\"" ;

  return
    exprStmt(
      directCallExpr( 
        name("printf", location=loc),
        consExpr( stringLiteral(strForPrintf, location=loc),
	          nilExpr() ),
        location=loc
      )
    ) ;
}



{-
                 .-"```"-.
                /         \
                |  _   _  |
                | (_\ /_) |
                (_   A   _)
                 | _____ |
                 \`"""""`/
                  '-.-.-'
                   _:=:_                   \\|
            .-""""`_'='_`""""-.           \///
           (`,-- -`\   /`- --,`)          (`/
           / //`-_--| |--_-`\\ \         .//
          / /(_-_  _| |_  _-_)\ \       ///
         / / (_- __ \ / __ -_) \ \     ///
        / /  (_ -_ - ^ - _- _)  \ \   ///
       / /   (_-  _ /=\ _ - _)   \ \ '//
      / /     (_ -.':=:'. -_)     \ \//
     (`;`     (_-'  :=:  '-_)      (_,'
      \\.   jgs __  :=:  __
       \\\    .'  `':=:'`  '.
        \\\  |  .--. = .--.  |
         \\\ |  (  / = \  )  |
          \\` \ _`' \=/ '`_ /
          ;`)  ( ;_/`v`\_; )
          |||\ | |       | |
          |\\  | |       | |
               | |       | |
               | |       | |
               | |       | |
               | |       | |
               | |       | |
              (._)       (_.)
               ||,       ,||
               ||:       :||
               ||:       :||
               ||:       :||
               ||:       :||
               ||'       '||
              ///)       (\\\
            .///`         `\\\.
           `//`             `\\`

     Courtesy of http://ascii-art.com.
-}

