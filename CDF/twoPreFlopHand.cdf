(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 8.0' *)

(*************************************************************************)
(*                                                                       *)
(*  The Mathematica License under which this file was created prohibits  *)
(*  restricting third parties in receipt of this file from republishing  *)
(*  or redistributing it by any means, including but not limited to      *)
(*  rights management or terms of use, without the express consent of    *)
(*  Wolfram Research, Inc.                                               *)
(*                                                                       *)
(*************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[       835,         17]
NotebookDataLength[     34783,        733]
NotebookOptionsPosition[     35004,        721]
NotebookOutlinePosition[     35548,        745]
CellTagsIndexPosition[     35505,        742]
WindowTitle->One-To-One Equity Distribution for a 2 PreFlop Hands
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`f1$$ = 1, $CellContext`f2$$ = 
    1, $CellContext`f3$$ = 1, $CellContext`f4$$ = 1, $CellContext`t1$$ = 
    "o", $CellContext`t2$$ = "o", Typeset`show$$ = True, 
    Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
    Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
    "\"untitled\"", Typeset`specs$$ = {{
      Hold[
       Text[
        Style["First PreFlop Hand\n", 11, Bold]]], 
      Manipulate`Dump`ThisIsNotAControl}, {{
       Hold[$CellContext`f1$$], 1, "First face"}, {
      1 -> 2, 2 -> 3, 3 -> 4, 4 -> 5, 5 -> 6, 6 -> 7, 7 -> 8, 8 -> 9, 
       9 -> $CellContext`T, 10 -> $CellContext`J, 11 -> $CellContext`Q, 12 -> 
       K, 13 -> $CellContext`A}}, {{
       Hold[$CellContext`f2$$], 1, "Second face"}, {
      1 -> 2, 2 -> 3, 3 -> 4, 4 -> 5, 5 -> 6, 6 -> 7, 7 -> 8, 8 -> 9, 
       9 -> $CellContext`T, 10 -> $CellContext`J, 11 -> $CellContext`Q, 12 -> 
       K, 13 -> $CellContext`A}}, {{
       Hold[$CellContext`t1$$], "o", "Type"}, 
      Dynamic[
       If[$CellContext`f1$$ != $CellContext`f2$$, {
        "s" -> "suited", "o" -> "off-suited"}, {"o" -> "off-suited"}]]}, {
      Hold[
       Text[
        Style["Second PreFlop Hand\n", 11, Bold]]], 
      Manipulate`Dump`ThisIsNotAControl}, {{
       Hold[$CellContext`f3$$], 1, "First face"}, {
      1 -> 2, 2 -> 3, 3 -> 4, 4 -> 5, 5 -> 6, 6 -> 7, 7 -> 8, 8 -> 9, 
       9 -> $CellContext`T, 10 -> $CellContext`J, 11 -> $CellContext`Q, 12 -> 
       K, 13 -> $CellContext`A}}, {{
       Hold[$CellContext`f4$$], 1, "Second face"}, {
      1 -> 2, 2 -> 3, 3 -> 4, 4 -> 5, 5 -> 6, 6 -> 7, 7 -> 8, 8 -> 9, 
       9 -> $CellContext`T, 10 -> $CellContext`J, 11 -> $CellContext`Q, 12 -> 
       K, 13 -> $CellContext`A}}, {{
       Hold[$CellContext`t2$$], "o", "Type"}, 
      Dynamic[
       If[$CellContext`f3$$ != $CellContext`f4$$, {
        "s" -> "suited", "o" -> "off-suited"}, {"o" -> "off-suited"}]]}}, 
    Typeset`size$$ = Automatic, Typeset`update$$ = 0, Typeset`initDone$$, 
    Typeset`skipInitDone$$ = False, $CellContext`f1$46739$$ = 
    False, $CellContext`f2$46740$$ = False, $CellContext`f3$46741$$ = 
    False, $CellContext`f4$46742$$ = False}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, 
      "Variables" :> {$CellContext`f1$$ = 1, $CellContext`f2$$ = 
        1, $CellContext`f3$$ = 1, $CellContext`f4$$ = 1, $CellContext`t1$$ = 
        "o", $CellContext`t2$$ = "o"}, "ControllerVariables" :> {
        Hold[$CellContext`f1$$, $CellContext`f1$46739$$, False], 
        Hold[$CellContext`f2$$, $CellContext`f2$46740$$, False], 
        Hold[$CellContext`f3$$, $CellContext`f3$46741$$, False], 
        Hold[$CellContext`f4$$, $CellContext`f4$46742$$, False]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> 
      Module[{$CellContext`enpf2ht$, $CellContext`pf2ht$}, 
        If[
         Not[
          Or[
           
           And[$CellContext`f1$$ == $CellContext`f2$$, $CellContext`t1$$ == 
            "s"], 
           
           And[$CellContext`f3$$ == $CellContext`f4$$, $CellContext`t2$$ == 
            "s"]]], $CellContext`pf2ht$ = {{$CellContext`f1$$, \
$CellContext`f2$$, $CellContext`t1$$}, {$CellContext`f3$$, $CellContext`f4$$, \
$CellContext`t2$$}}; $CellContext`enpf2ht$ = First[
            $CellContext`extract[
             $CellContext`order[$CellContext`pf2ht$]]]; \
$CellContext`format[$CellContext`enpf2ht$]]], "Specifications" :> {
        Text[
         Style[
         "First PreFlop Hand\n", 11, Bold]], {{$CellContext`f1$$, 1, 
          "First face"}, {
         1 -> 2, 2 -> 3, 3 -> 4, 4 -> 5, 5 -> 6, 6 -> 7, 7 -> 8, 8 -> 9, 
          9 -> $CellContext`T, 10 -> $CellContext`J, 11 -> $CellContext`Q, 12 -> 
          K, 13 -> $CellContext`A}}, {{$CellContext`f2$$, 1, "Second face"}, {
         1 -> 2, 2 -> 3, 3 -> 4, 4 -> 5, 5 -> 6, 6 -> 7, 7 -> 8, 8 -> 9, 
          9 -> $CellContext`T, 10 -> $CellContext`J, 11 -> $CellContext`Q, 12 -> 
          K, 13 -> $CellContext`A}}, {{$CellContext`t1$$, "o", "Type"}, 
         Dynamic[
          
          If[$CellContext`f1$$ != $CellContext`f2$$, {
           "s" -> "suited", "o" -> "off-suited"}, {"o" -> "off-suited"}]]}, 
        Delimiter, 
        Text[
         Style[
         "Second PreFlop Hand\n", 11, Bold]], {{$CellContext`f3$$, 1, 
          "First face"}, {
         1 -> 2, 2 -> 3, 3 -> 4, 4 -> 5, 5 -> 6, 6 -> 7, 7 -> 8, 8 -> 9, 
          9 -> $CellContext`T, 10 -> $CellContext`J, 11 -> $CellContext`Q, 12 -> 
          K, 13 -> $CellContext`A}}, {{$CellContext`f4$$, 1, "Second face"}, {
         1 -> 2, 2 -> 3, 3 -> 4, 4 -> 5, 5 -> 6, 6 -> 7, 7 -> 8, 8 -> 9, 
          9 -> $CellContext`T, 10 -> $CellContext`J, 11 -> $CellContext`Q, 12 -> 
          K, 13 -> $CellContext`A}}, {{$CellContext`t2$$, "o", "Type"}, 
         Dynamic[
          
          If[$CellContext`f3$$ != $CellContext`f4$$, {
           "s" -> "suited", "o" -> "off-suited"}, {"o" -> "off-suited"}]]}}, 
      "Options" :> {
       ControlPlacement -> Top, ControlType -> SetterBar, 
        ContentSize -> {750, 850}, SynchronousInitialization -> False}, 
      "DefaultOptions" :> {}],
     ImageSizeCache->{764., {551., 556.}},
     SingleEvaluation->True],
    Deinitialization:>None,
    DynamicModuleValues:>{},
    Initialization:>(($CellContext`allPreFlop2HandEquity = Map[ToExpression, 
         Import[
         "https://raw.github.com/oscar6echo/Poker/master/Tables/\
allPreFlop2HandEquity.csv"], {2}]; $CellContext`allPreFlop2Hand = 
       Map[ToExpression, 
         Import[
         "https://raw.github.com/oscar6echo/Poker/master/Tables/\
allPreFlop2Hand.csv"], {2}]; $CellContext`deckCardFace = {1, 1, 1, 1, 2, 2, 2,
         2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 
        8, 8, 9, 9, 9, 9, 10, 10, 10, 10, 11, 11, 11, 11, 12, 12, 12, 12, 13, 
        13, 13, 13}; $CellContext`deckCardId = {
         Row[{2, 
           
           Style[$CellContext`\[ClubSuit], LineColor -> GrayLevel[0], 
            FrontFaceColor -> GrayLevel[0], $CellContext`BackFaceColor -> 
            GrayLevel[0], GraphicsColor -> GrayLevel[0], FontSize -> Larger, 
            FontColor -> GrayLevel[0]]}], 
         Row[{2, 
           
           Style[$CellContext`\:2666, LineColor -> RGBColor[1, 0, 0], 
            FrontFaceColor -> RGBColor[1, 0, 0], $CellContext`BackFaceColor -> 
            RGBColor[1, 0, 0], GraphicsColor -> RGBColor[1, 0, 0], FontColor -> 
            RGBColor[1, 0, 0]]}], 
         Row[{2, 
           
           Style[$CellContext`\:2665, LineColor -> RGBColor[1, 0, 0], 
            FrontFaceColor -> RGBColor[1, 0, 0], $CellContext`BackFaceColor -> 
            RGBColor[1, 0, 0], GraphicsColor -> RGBColor[1, 0, 0], FontColor -> 
            RGBColor[1, 0, 0]]}], 
         Row[{2, 
           
           Style[$CellContext`\[SpadeSuit], LineColor -> GrayLevel[0], 
            FrontFaceColor -> GrayLevel[0], $CellContext`BackFaceColor -> 
            GrayLevel[0], GraphicsColor -> GrayLevel[0], FontSize -> Larger, 
            FontColor -> GrayLevel[0]]}], 
         Row[{3, 
           
           Style[$CellContext`\[ClubSuit], LineColor -> GrayLevel[0], 
            FrontFaceColor -> GrayLevel[0], $CellContext`BackFaceColor -> 
            GrayLevel[0], GraphicsColor -> GrayLevel[0], FontSize -> Larger, 
            FontColor -> GrayLevel[0]]}], 
         Row[{3, 
           
           Style[$CellContext`\:2666, LineColor -> RGBColor[1, 0, 0], 
            FrontFaceColor -> RGBColor[1, 0, 0], $CellContext`BackFaceColor -> 
            RGBColor[1, 0, 0], GraphicsColor -> RGBColor[1, 0, 0], FontColor -> 
            RGBColor[1, 0, 0]]}], 
         Row[{3, 
           
           Style[$CellContext`\:2665, LineColor -> RGBColor[1, 0, 0], 
            FrontFaceColor -> RGBColor[1, 0, 0], $CellContext`BackFaceColor -> 
            RGBColor[1, 0, 0], GraphicsColor -> RGBColor[1, 0, 0], FontColor -> 
            RGBColor[1, 0, 0]]}], 
         Row[{3, 
           
           Style[$CellContext`\[SpadeSuit], LineColor -> GrayLevel[0], 
            FrontFaceColor -> GrayLevel[0], $CellContext`BackFaceColor -> 
            GrayLevel[0], GraphicsColor -> GrayLevel[0], FontSize -> Larger, 
            FontColor -> GrayLevel[0]]}], 
         Row[{4, 
           
           Style[$CellContext`\[ClubSuit], LineColor -> GrayLevel[0], 
            FrontFaceColor -> GrayLevel[0], $CellContext`BackFaceColor -> 
            GrayLevel[0], GraphicsColor -> GrayLevel[0], FontSize -> Larger, 
            FontColor -> GrayLevel[0]]}], 
         Row[{4, 
           
           Style[$CellContext`\:2666, LineColor -> RGBColor[1, 0, 0], 
            FrontFaceColor -> RGBColor[1, 0, 0], $CellContext`BackFaceColor -> 
            RGBColor[1, 0, 0], GraphicsColor -> RGBColor[1, 0, 0], FontColor -> 
            RGBColor[1, 0, 0]]}], 
         Row[{4, 
           
           Style[$CellContext`\:2665, LineColor -> RGBColor[1, 0, 0], 
            FrontFaceColor -> RGBColor[1, 0, 0], $CellContext`BackFaceColor -> 
            RGBColor[1, 0, 0], GraphicsColor -> RGBColor[1, 0, 0], FontColor -> 
            RGBColor[1, 0, 0]]}], 
         Row[{4, 
           
           Style[$CellContext`\[SpadeSuit], LineColor -> GrayLevel[0], 
            FrontFaceColor -> GrayLevel[0], $CellContext`BackFaceColor -> 
            GrayLevel[0], GraphicsColor -> GrayLevel[0], FontSize -> Larger, 
            FontColor -> GrayLevel[0]]}], 
         Row[{5, 
           
           Style[$CellContext`\[ClubSuit], LineColor -> GrayLevel[0], 
            FrontFaceColor -> GrayLevel[0], $CellContext`BackFaceColor -> 
            GrayLevel[0], GraphicsColor -> GrayLevel[0], FontSize -> Larger, 
            FontColor -> GrayLevel[0]]}], 
         Row[{5, 
           
           Style[$CellContext`\:2666, LineColor -> RGBColor[1, 0, 0], 
            FrontFaceColor -> RGBColor[1, 0, 0], $CellContext`BackFaceColor -> 
            RGBColor[1, 0, 0], GraphicsColor -> RGBColor[1, 0, 0], FontColor -> 
            RGBColor[1, 0, 0]]}], 
         Row[{5, 
           
           Style[$CellContext`\:2665, LineColor -> RGBColor[1, 0, 0], 
            FrontFaceColor -> RGBColor[1, 0, 0], $CellContext`BackFaceColor -> 
            RGBColor[1, 0, 0], GraphicsColor -> RGBColor[1, 0, 0], FontColor -> 
            RGBColor[1, 0, 0]]}], 
         Row[{5, 
           
           Style[$CellContext`\[SpadeSuit], LineColor -> GrayLevel[0], 
            FrontFaceColor -> GrayLevel[0], $CellContext`BackFaceColor -> 
            GrayLevel[0], GraphicsColor -> GrayLevel[0], FontSize -> Larger, 
            FontColor -> GrayLevel[0]]}], 
         Row[{6, 
           
           Style[$CellContext`\[ClubSuit], LineColor -> GrayLevel[0], 
            FrontFaceColor -> GrayLevel[0], $CellContext`BackFaceColor -> 
            GrayLevel[0], GraphicsColor -> GrayLevel[0], FontSize -> Larger, 
            FontColor -> GrayLevel[0]]}], 
         Row[{6, 
           
           Style[$CellContext`\:2666, LineColor -> RGBColor[1, 0, 0], 
            FrontFaceColor -> RGBColor[1, 0, 0], $CellContext`BackFaceColor -> 
            RGBColor[1, 0, 0], GraphicsColor -> RGBColor[1, 0, 0], FontColor -> 
            RGBColor[1, 0, 0]]}], 
         Row[{6, 
           
           Style[$CellContext`\:2665, LineColor -> RGBColor[1, 0, 0], 
            FrontFaceColor -> RGBColor[1, 0, 0], $CellContext`BackFaceColor -> 
            RGBColor[1, 0, 0], GraphicsColor -> RGBColor[1, 0, 0], FontColor -> 
            RGBColor[1, 0, 0]]}], 
         Row[{6, 
           
           Style[$CellContext`\[SpadeSuit], LineColor -> GrayLevel[0], 
            FrontFaceColor -> GrayLevel[0], $CellContext`BackFaceColor -> 
            GrayLevel[0], GraphicsColor -> GrayLevel[0], FontSize -> Larger, 
            FontColor -> GrayLevel[0]]}], 
         Row[{7, 
           
           Style[$CellContext`\[ClubSuit], LineColor -> GrayLevel[0], 
            FrontFaceColor -> GrayLevel[0], $CellContext`BackFaceColor -> 
            GrayLevel[0], GraphicsColor -> GrayLevel[0], FontSize -> Larger, 
            FontColor -> GrayLevel[0]]}], 
         Row[{7, 
           
           Style[$CellContext`\:2666, LineColor -> RGBColor[1, 0, 0], 
            FrontFaceColor -> RGBColor[1, 0, 0], $CellContext`BackFaceColor -> 
            RGBColor[1, 0, 0], GraphicsColor -> RGBColor[1, 0, 0], FontColor -> 
            RGBColor[1, 0, 0]]}], 
         Row[{7, 
           
           Style[$CellContext`\:2665, LineColor -> RGBColor[1, 0, 0], 
            FrontFaceColor -> RGBColor[1, 0, 0], $CellContext`BackFaceColor -> 
            RGBColor[1, 0, 0], GraphicsColor -> RGBColor[1, 0, 0], FontColor -> 
            RGBColor[1, 0, 0]]}], 
         Row[{7, 
           Style[$CellContext`\[SpadeSuit], LineColor -> GrayLevel[0], 
            FrontFaceColor -> GrayLevel[0], $CellContext`BackFaceColor -> 
            GrayLevel[0], GraphicsColor -> GrayLevel[0], FontSize -> Larger, 
            FontColor -> GrayLevel[0]]}], 
         Row[{8, 
           
           Style[$CellContext`\[ClubSuit], LineColor -> GrayLevel[0], 
            FrontFaceColor -> GrayLevel[0], $CellContext`BackFaceColor -> 
            GrayLevel[0], GraphicsColor -> GrayLevel[0], FontSize -> Larger, 
            FontColor -> GrayLevel[0]]}], 
         Row[{8, 
           
           Style[$CellContext`\:2666, LineColor -> RGBColor[1, 0, 0], 
            FrontFaceColor -> RGBColor[1, 0, 0], $CellContext`BackFaceColor -> 
            RGBColor[1, 0, 0], GraphicsColor -> RGBColor[1, 0, 0], FontColor -> 
            RGBColor[1, 0, 0]]}], 
         Row[{8, 
           
           Style[$CellContext`\:2665, LineColor -> RGBColor[1, 0, 0], 
            FrontFaceColor -> RGBColor[1, 0, 0], $CellContext`BackFaceColor -> 
            RGBColor[1, 0, 0], GraphicsColor -> RGBColor[1, 0, 0], FontColor -> 
            RGBColor[1, 0, 0]]}], 
         Row[{8, 
           
           Style[$CellContext`\[SpadeSuit], LineColor -> GrayLevel[0], 
            FrontFaceColor -> GrayLevel[0], $CellContext`BackFaceColor -> 
            GrayLevel[0], GraphicsColor -> GrayLevel[0], FontSize -> Larger, 
            FontColor -> GrayLevel[0]]}], 
         Row[{9, 
           
           Style[$CellContext`\[ClubSuit], LineColor -> GrayLevel[0], 
            FrontFaceColor -> GrayLevel[0], $CellContext`BackFaceColor -> 
            GrayLevel[0], GraphicsColor -> GrayLevel[0], FontSize -> Larger, 
            FontColor -> GrayLevel[0]]}], 
         Row[{9, 
           
           Style[$CellContext`\:2666, LineColor -> RGBColor[1, 0, 0], 
            FrontFaceColor -> RGBColor[1, 0, 0], $CellContext`BackFaceColor -> 
            RGBColor[1, 0, 0], GraphicsColor -> RGBColor[1, 0, 0], FontColor -> 
            RGBColor[1, 0, 0]]}], 
         Row[{9, 
           
           Style[$CellContext`\:2665, LineColor -> RGBColor[1, 0, 0], 
            FrontFaceColor -> RGBColor[1, 0, 0], $CellContext`BackFaceColor -> 
            RGBColor[1, 0, 0], GraphicsColor -> RGBColor[1, 0, 0], FontColor -> 
            RGBColor[1, 0, 0]]}], 
         Row[{9, 
           
           Style[$CellContext`\[SpadeSuit], LineColor -> GrayLevel[0], 
            FrontFaceColor -> GrayLevel[0], $CellContext`BackFaceColor -> 
            GrayLevel[0], GraphicsColor -> GrayLevel[0], FontSize -> Larger, 
            FontColor -> GrayLevel[0]]}], 
         Row[{$CellContext`T, 
           
           Style[$CellContext`\[ClubSuit], LineColor -> GrayLevel[0], 
            FrontFaceColor -> GrayLevel[0], $CellContext`BackFaceColor -> 
            GrayLevel[0], GraphicsColor -> GrayLevel[0], FontSize -> Larger, 
            FontColor -> GrayLevel[0]]}], 
         Row[{$CellContext`T, 
           
           Style[$CellContext`\:2666, LineColor -> RGBColor[1, 0, 0], 
            FrontFaceColor -> RGBColor[1, 0, 0], $CellContext`BackFaceColor -> 
            RGBColor[1, 0, 0], GraphicsColor -> RGBColor[1, 0, 0], FontColor -> 
            RGBColor[1, 0, 0]]}], 
         Row[{$CellContext`T, 
           
           Style[$CellContext`\:2665, LineColor -> RGBColor[1, 0, 0], 
            FrontFaceColor -> RGBColor[1, 0, 0], $CellContext`BackFaceColor -> 
            RGBColor[1, 0, 0], GraphicsColor -> RGBColor[1, 0, 0], FontColor -> 
            RGBColor[1, 0, 0]]}], 
         Row[{$CellContext`T, 
           
           Style[$CellContext`\[SpadeSuit], LineColor -> GrayLevel[0], 
            FrontFaceColor -> GrayLevel[0], $CellContext`BackFaceColor -> 
            GrayLevel[0], GraphicsColor -> GrayLevel[0], FontSize -> Larger, 
            FontColor -> GrayLevel[0]]}], 
         Row[{$CellContext`J, 
           
           Style[$CellContext`\[ClubSuit], LineColor -> GrayLevel[0], 
            FrontFaceColor -> GrayLevel[0], $CellContext`BackFaceColor -> 
            GrayLevel[0], GraphicsColor -> GrayLevel[0], FontSize -> Larger, 
            FontColor -> GrayLevel[0]]}], 
         Row[{$CellContext`J, 
           
           Style[$CellContext`\:2666, LineColor -> RGBColor[1, 0, 0], 
            FrontFaceColor -> RGBColor[1, 0, 0], $CellContext`BackFaceColor -> 
            RGBColor[1, 0, 0], GraphicsColor -> RGBColor[1, 0, 0], FontColor -> 
            RGBColor[1, 0, 0]]}], 
         Row[{$CellContext`J, 
           
           Style[$CellContext`\:2665, LineColor -> RGBColor[1, 0, 0], 
            FrontFaceColor -> RGBColor[1, 0, 0], $CellContext`BackFaceColor -> 
            RGBColor[1, 0, 0], GraphicsColor -> RGBColor[1, 0, 0], FontColor -> 
            RGBColor[1, 0, 0]]}], 
         Row[{$CellContext`J, 
           
           Style[$CellContext`\[SpadeSuit], LineColor -> GrayLevel[0], 
            FrontFaceColor -> GrayLevel[0], $CellContext`BackFaceColor -> 
            GrayLevel[0], GraphicsColor -> GrayLevel[0], FontSize -> Larger, 
            FontColor -> GrayLevel[0]]}], 
         Row[{$CellContext`Q, 
           
           Style[$CellContext`\[ClubSuit], LineColor -> GrayLevel[0], 
            FrontFaceColor -> GrayLevel[0], $CellContext`BackFaceColor -> 
            GrayLevel[0], GraphicsColor -> GrayLevel[0], FontSize -> Larger, 
            FontColor -> GrayLevel[0]]}], 
         Row[{$CellContext`Q, 
           
           Style[$CellContext`\:2666, LineColor -> RGBColor[1, 0, 0], 
            FrontFaceColor -> RGBColor[1, 0, 0], $CellContext`BackFaceColor -> 
            RGBColor[1, 0, 0], GraphicsColor -> RGBColor[1, 0, 0], FontColor -> 
            RGBColor[1, 0, 0]]}], 
         Row[{$CellContext`Q, 
           
           Style[$CellContext`\:2665, LineColor -> RGBColor[1, 0, 0], 
            FrontFaceColor -> RGBColor[1, 0, 0], $CellContext`BackFaceColor -> 
            RGBColor[1, 0, 0], GraphicsColor -> RGBColor[1, 0, 0], FontColor -> 
            RGBColor[1, 0, 0]]}], 
         Row[{$CellContext`Q, 
           
           Style[$CellContext`\[SpadeSuit], LineColor -> GrayLevel[0], 
            FrontFaceColor -> GrayLevel[0], $CellContext`BackFaceColor -> 
            GrayLevel[0], GraphicsColor -> GrayLevel[0], FontSize -> Larger, 
            FontColor -> GrayLevel[0]]}], 
         Row[{K, 
           
           Style[$CellContext`\[ClubSuit], LineColor -> GrayLevel[0], 
            FrontFaceColor -> GrayLevel[0], $CellContext`BackFaceColor -> 
            GrayLevel[0], GraphicsColor -> GrayLevel[0], FontSize -> Larger, 
            FontColor -> GrayLevel[0]]}], 
         Row[{K, 
           Style[$CellContext`\:2666, LineColor -> RGBColor[1, 0, 0], 
            FrontFaceColor -> RGBColor[1, 0, 0], $CellContext`BackFaceColor -> 
            RGBColor[1, 0, 0], GraphicsColor -> RGBColor[1, 0, 0], FontColor -> 
            RGBColor[1, 0, 0]]}], 
         Row[{K, 
           
           Style[$CellContext`\:2665, LineColor -> RGBColor[1, 0, 0], 
            FrontFaceColor -> RGBColor[1, 0, 0], $CellContext`BackFaceColor -> 
            RGBColor[1, 0, 0], GraphicsColor -> RGBColor[1, 0, 0], FontColor -> 
            RGBColor[1, 0, 0]]}], 
         Row[{K, 
           
           Style[$CellContext`\[SpadeSuit], LineColor -> GrayLevel[0], 
            FrontFaceColor -> GrayLevel[0], $CellContext`BackFaceColor -> 
            GrayLevel[0], GraphicsColor -> GrayLevel[0], FontSize -> Larger, 
            FontColor -> GrayLevel[0]]}], 
         Row[{$CellContext`A, 
           
           Style[$CellContext`\[ClubSuit], LineColor -> GrayLevel[0], 
            FrontFaceColor -> GrayLevel[0], $CellContext`BackFaceColor -> 
            GrayLevel[0], GraphicsColor -> GrayLevel[0], FontSize -> Larger, 
            FontColor -> GrayLevel[0]]}], 
         Row[{$CellContext`A, 
           
           Style[$CellContext`\:2666, LineColor -> RGBColor[1, 0, 0], 
            FrontFaceColor -> RGBColor[1, 0, 0], $CellContext`BackFaceColor -> 
            RGBColor[1, 0, 0], GraphicsColor -> RGBColor[1, 0, 0], FontColor -> 
            RGBColor[1, 0, 0]]}], 
         Row[{$CellContext`A, 
           
           Style[$CellContext`\:2665, LineColor -> RGBColor[1, 0, 0], 
            FrontFaceColor -> RGBColor[1, 0, 0], $CellContext`BackFaceColor -> 
            RGBColor[1, 0, 0], GraphicsColor -> RGBColor[1, 0, 0], FontColor -> 
            RGBColor[1, 0, 0]]}], 
         Row[{$CellContext`A, 
           
           Style[$CellContext`\[SpadeSuit], LineColor -> GrayLevel[0], 
            FrontFaceColor -> GrayLevel[0], $CellContext`BackFaceColor -> 
            GrayLevel[0], GraphicsColor -> GrayLevel[0], FontSize -> Larger, 
            FontColor -> GrayLevel[0]]}]}; $CellContext`preFlop2HandTable = 
       Module[{$CellContext`apf2h = $CellContext`allPreFlop2Hand, \
$CellContext`pf2hTable, $CellContext`len = 0, $CellContext`p = 1}, Do[
           Do[
            If[Length[
               Part[$CellContext`apf2h, $CellContext`i, $CellContext`j]] > 0, 
             
             Increment[$CellContext`len]], {$CellContext`j, 
             Length[
              Part[$CellContext`apf2h, $CellContext`i]]}], {$CellContext`i, 
            Length[$CellContext`apf2h]}]; $CellContext`pf2hTable = 
          Table[{{0, 0, " "}, {0, 0, " "}, 
             
             Table[{{0, 0}, {" ", " "}, {0, 0}, {" ", " "}, {0, 0, 0}, {0, 
               0}}, {$CellContext`j, 7}], Null}, {$CellContext`len}]; Do[
           Do[If[Length[
                Part[$CellContext`apf2h, $CellContext`i, $CellContext`j]] > 0,
               Part[$CellContext`pf2hTable, $CellContext`p] = {
                 Flatten[{
                   Map[Part[$CellContext`deckCardFace, #]& , 
                    
                    Part[$CellContext`apf2h, $CellContext`i, $CellContext`j, 
                    1, 1], {1}], 
                   If[
                    Or[$CellContext`j == 1, $CellContext`j == 2], "s", "o"]}], 
                 Flatten[{
                   Map[Part[$CellContext`deckCardFace, #]& , 
                    
                    Part[$CellContext`apf2h, $CellContext`i, $CellContext`j, 
                    1, 2], {1}], 
                   If[
                    Or[$CellContext`j == 1, $CellContext`j == 3], "s", "o"]}], 
                 Table[{
                   
                   Part[$CellContext`apf2h, $CellContext`i, $CellContext`j, \
$CellContext`k, 1], 
                   Map[Part[$CellContext`deckCardId, #]& , 
                    
                    Part[$CellContext`apf2h, $CellContext`i, $CellContext`j, \
$CellContext`k, 1], {1}], 
                   
                   Part[$CellContext`apf2h, $CellContext`i, $CellContext`j, \
$CellContext`k, 2], 
                   Map[Part[$CellContext`deckCardId, #]& , 
                    
                    Part[$CellContext`apf2h, $CellContext`i, $CellContext`j, \
$CellContext`k, 2], {1}], 
                   
                   Part[$CellContext`allPreFlop2HandEquity, $CellContext`i, \
$CellContext`j, $CellContext`k], {
                    ((Part[#, 1] + 0.5 Part[#, 3])/Total[#]& )[
                    
                    Part[$CellContext`allPreFlop2HandEquity, $CellContext`i, \
$CellContext`j, $CellContext`k]], 
                    ((Part[#, 2] + 0.5 Part[#, 3])/Total[#]& )[
                    
                    Part[$CellContext`allPreFlop2HandEquity, $CellContext`i, \
$CellContext`j, $CellContext`k]]}}, {$CellContext`k, 
                   Length[
                    
                    Part[$CellContext`apf2h, $CellContext`i, \
$CellContext`j]]}]}; Increment[$CellContext`p]]; Null, {$CellContext`j, 
             Length[
              Part[$CellContext`apf2h, $CellContext`i]]}], {$CellContext`i, 
            
            Length[$CellContext`apf2h]}]; $CellContext`pf2hTable]; \
$CellContext`face = ($CellContext`face = {
         2, 3, 4, 5, 6, 7, 8, 
          9, $CellContext`T, $CellContext`J, $CellContext`Q, 
          K, $CellContext`A}); $CellContext`faceChoice = 
       Table[$CellContext`i -> 
         Part[$CellContext`face, $CellContext`i], {$CellContext`i, 
          Length[$CellContext`face]}]; $CellContext`faceChoiceRev = 
       Table[Part[$CellContext`face, $CellContext`i] -> $CellContext`i, \
{$CellContext`i, 
          Length[$CellContext`face]}]; $CellContext`suitChoice = {
        "s" -> "suited", "o" -> "off-suited"}; $CellContext`suitNoChoice = {
        "o" -> "off-suited"}; $CellContext`order[
         Pattern[$CellContext`preFlop2HandTarget, 
          Blank[]]] := Module[{$CellContext`hf1 = Take[
            Part[$CellContext`preFlop2HandTarget, 1], 2], $CellContext`hf2 = 
          Take[
            Part[$CellContext`preFlop2HandTarget, 2], 
            2], $CellContext`shf1, $CellContext`shf2}, $CellContext`shf1 = 
         Reverse[
           Sort[{
             Append[
              Reverse[
               Sort[$CellContext`hf1]], 
              Part[$CellContext`preFlop2HandTarget, 1, 3]], 
             Append[
              Reverse[
               Sort[$CellContext`hf2]], 
              Part[$CellContext`preFlop2HandTarget, 2, 
               3]]}]]]; $CellContext`extract[
         Pattern[$CellContext`preFlop2HandTarget, 
          Blank[]]] := 
       Module[{$CellContext`pf2ht = $CellContext`preFlop2HandTarget}, 
         Select[$CellContext`preFlop2HandTable, And[
          Part[#, 1] == Part[$CellContext`pf2ht, 1], Part[#, 2] == 
           Part[$CellContext`pf2ht, 2]]& ]]; $CellContext`oneWay[
         Pattern[$CellContext`input, 
          Blank[]]] := 
       Module[{$CellContext`h1 = Part[$CellContext`input, 1], $CellContext`h2 = 
          Part[$CellContext`input, 2], $CellContext`eqty = 
          Part[$CellContext`input, 3, All, 
            6], $CellContext`len, $CellContext`ow, $CellContext`own, \
$CellContext`i}, $CellContext`len = Length[$CellContext`eqty]; $CellContext`i = 
          1; $CellContext`ow = 
          Which[Part[$CellContext`eqty, $CellContext`i, 1] > 
            Part[$CellContext`eqty, $CellContext`i, 2], 1, 
            Part[$CellContext`eqty, $CellContext`i, 1] < 
            Part[$CellContext`eqty, $CellContext`i, 2], 2, 
            Part[$CellContext`eqty, $CellContext`i, 1] == 
            Part[$CellContext`eqty, $CellContext`i, 2], 3]; 
         Do[$CellContext`own = 
            Which[Part[$CellContext`eqty, $CellContext`i, 1] > 
              Part[$CellContext`eqty, $CellContext`i, 2], 1, 
              Part[$CellContext`eqty, $CellContext`i, 1] < 
              Part[$CellContext`eqty, $CellContext`i, 2], 2, 
              Part[$CellContext`eqty, $CellContext`i, 1] == 
              Part[$CellContext`eqty, $CellContext`i, 2], 3]; $CellContext`ow = 
            If[$CellContext`own == $CellContext`ow, $CellContext`ow, 
              0], {$CellContext`i, 
            2, $CellContext`len}]; $CellContext`ow]; $CellContext`comment[
         Pattern[$CellContext`input, 
          Blank[]]] := 
       Module[{$CellContext`h1 = Part[$CellContext`input, 1], $CellContext`h2 = 
          Part[$CellContext`input, 
            2], $CellContext`ow = $CellContext`oneWay[$CellContext`input], \
$CellContext`len = Length[
            Part[$CellContext`input, 3, All, 6]]}, 
         Which[$CellContext`ow == 1, 
          Row[{"Preflop Hand A ", 
            Style[
             Row[
              ReplaceAll[$CellContext`h1, $CellContext`faceChoice]], Bold, 
             Red], " has more equity than Preflop Hand B ", 
            Style[
             Row[
              ReplaceAll[$CellContext`h2, $CellContext`faceChoice]], Bold, 
             Red], " over the ", $CellContext`len, 
            " combination(s) of card suits across both hands"}], \
$CellContext`ow == 2, 
          Row[{"Preflop Hand A ", 
            Style[
             Row[
              ReplaceAll[$CellContext`h1, $CellContext`faceChoice]], Bold, 
             Red], " has less equity than Preflop Hand B ", 
            Style[
             Row[
              ReplaceAll[$CellContext`h2, $CellContext`faceChoice]], Bold, 
             Red], " over the ", $CellContext`len, 
            " combination(s) of card suits across both hands"}], \
$CellContext`ow == 3, 
          Row[{"Preflop Hand A ", 
            Style[
             Row[
              ReplaceAll[$CellContext`h1, $CellContext`faceChoice]], Bold, 
             Red], " has the same equity as Preflop Hand B ", 
            Style[
             Row[
              ReplaceAll[$CellContext`h2, $CellContext`faceChoice]], Bold, 
             Red], " over the ", $CellContext`len, 
            " combination(s) of card suits across both hands"}], \
$CellContext`ow == 0, 
          Row[{"Preflop Hand A ", 
            Style[
             Row[
              ReplaceAll[$CellContext`h1, $CellContext`faceChoice]], Bold, 
             Red], " has more/less/the same equity than/as Preflop Hand B ", 
            Style[
             Row[
              ReplaceAll[$CellContext`h2, $CellContext`faceChoice]], Bold, 
             Red], " depending on the combination of card suits (among ", \
$CellContext`len, " possible) across both hands"}]]]; $CellContext`format[
         Pattern[$CellContext`input, 
          Blank[]]] := 
       Module[{$CellContext`table}, $CellContext`table = Table[{
             Text[
              Row[
               Part[$CellContext`input, 3, $CellContext`i, 2]]], 
             Text[
              NumberForm[
              100 Part[$CellContext`input, 3, $CellContext`i, 6, 1], {5, 3}]], 
             Column[{
               Text[
                NumberForm[
                 Part[$CellContext`input, 3, $CellContext`i, 5, 1], 
                 DigitBlock -> 3]], 
               Text[
                NumberForm[
                 N[
                 100 (Part[$CellContext`input, 3, $CellContext`i, 5, 1]/Total[
                   
                    Part[$CellContext`input, 3, $CellContext`i, 5]])], {5, 
                 3}]]}], 
             Column[{
               Text[
                NumberForm[
                 Part[$CellContext`input, 3, $CellContext`i, 5, 3], 
                 DigitBlock -> 3]], 
               Text[
                NumberForm[
                 N[
                 100 (Part[$CellContext`input, 3, $CellContext`i, 5, 3]/Total[
                   
                    Part[$CellContext`input, 3, $CellContext`i, 5]])], {5, 
                 3}]]}], 
             Column[{
               Text[
                NumberForm[
                 Part[$CellContext`input, 3, $CellContext`i, 5, 2], 
                 DigitBlock -> 3]], 
               Text[
                NumberForm[
                 N[
                 100 (Part[$CellContext`input, 3, $CellContext`i, 5, 2]/Total[
                   
                    Part[$CellContext`input, 3, $CellContext`i, 5]])], {5, 
                 3}]]}], 
             Text[
              NumberForm[
              100 Part[$CellContext`input, 3, $CellContext`i, 6, 2], {5, 3}]], 
             Text[
              Row[
               Part[$CellContext`input, 3, $CellContext`i, 4]]], 
             BarChart[{
               Part[$CellContext`input, 3, $CellContext`i, 5, 1], 
               Part[$CellContext`input, 3, $CellContext`i, 5, 3], 
               Part[$CellContext`input, 3, $CellContext`i, 5, 2]}, 
              ChartLegends -> {"Hand A Wins", "Ties", "Hand B Wins"}, 
              ChartStyle -> "DarkBands", LabelingFunction -> (Placed[
                Column[{NumberForm[100 N[#/Total[
                    Part[$CellContext`input, 3, $CellContext`i, 5]]], {5, 2}] 
                  "%", #}], Above]& ), Axes -> {True, False}, ImageSize -> 
              200, AspectRatio -> 1/3]}, {$CellContext`i, 
             Length[
              Part[$CellContext`input, 3]]}]; Column[{
            Text[
             Style[
             "One-To-One Equity Distribution for a 2 PreFlop Hands", Larger, 
              Bold]], "\n", 
            
            TableForm[$CellContext`table, TableAlignments -> Center, 
             TableSpacing -> {0.75, 0.75}, TableHeadings -> {None, 
               Map[
               Text, {"Hand A", "Equity", "Wins(Nb/%)", "Ties(Nb/%)", 
                 "Wins(Nb/%)", "Equity", "Hand B"}]}], "\n", 
            Text[
             $CellContext`comment[$CellContext`input]]}, Center]]; Null); 
     Typeset`initDone$$ = True),
    SynchronousInitialization->False,
    UnsavedVariables:>{Typeset`initDone$$},
    UntrackedVariables:>{Typeset`size$$}], "Manipulate",
   Deployed->True,
   StripOnInput->False],
  Manipulate`InterpretManipulate[1]]]]
},
Editable->False,
Saveable->False,
WindowSize->{All, All},
WindowMargins->Automatic,
WindowElements->{},
WindowFrameElements->{"CloseBox"},
WindowTitle->"One-To-One Equity Distribution for a 2 PreFlop Hands",
ShowCellBracket->False,
CellMargins->0,
Deployed->True,
FrontEndVersion->"8.0 for Mac OS X x86 (32-bit, 64-bit Kernel) (October 5, \
2011)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[1301, 31, 33699, 688, 1109, InheritFromParent]
}
]
*)

(* End of internal cache information *)
(* NotebookSignature 2vpGAqKYJ1o0wCKKv8Mrv2LB *)
