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
NotebookDataLength[      6835,        171]
NotebookOptionsPosition[      7058,        159]
NotebookOutlinePosition[      7602,        183]
CellTagsIndexPosition[      7559,        180]
WindowTitle->One-To-One Equity Distribution for a 2 PreFlop Hands
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`pos$$ = {84.5, 84.5}, Typeset`show$$ = True,
     Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
    Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
    "\"untitled\"", Typeset`specs$$ = {{{
       Hold[$CellContext`pos$$], {84.5, 84.5}}, 0}}, Typeset`size$$ = 
    Automatic, Typeset`update$$ = 0, Typeset`initDone$$, 
    Typeset`skipInitDone$$ = False}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, "Variables" :> {$CellContext`pos$$ = {84.5, 84.5}}, 
      "ControllerVariables" :> {}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> 
      DynamicModule[{$CellContext`posn = Table[0, {2}], $CellContext`pair = 
         Table[0, {
           2}]}, $CellContext`posn = $CellContext`normPos[$CellContext`pos$$]; 
        Part[$CellContext`pair, 1] = Part[$CellContext`posn, 1]; 
        Part[$CellContext`pair, 2] = 169 + 1 - Part[$CellContext`posn, 2]; 
        Column[{
           Text[
            Style[
            "One-To-One Equity Distribution for a 2 PreFlop Hands", Larger, 
             Bold]], 
           Row[{
             Row[
              Map[Text, {"x = ", 
                Dynamic[
                 Part[$CellContext`pair, 1]]}]], "\t", 
             Text[
              Style[
               Row[
                ReplaceAll[
                 Part[$CellContext`preFlopHandList, 
                  Part[$CellContext`pair, 1]], $CellContext`faceChoice]], 
               Bold, Red]], "\t", 
             Dynamic[
              $CellContext`format2[$CellContext`pair]], "\t", 
             Text[
              Style[
               Row[
                ReplaceAll[
                 Part[$CellContext`preFlopHandList, 
                  Part[$CellContext`pair, 2]], $CellContext`faceChoice]], 
               Bold, Red]], "\t", 
             Row[
              Map[Text, {"y = ", 
                Dynamic[
                 Part[$CellContext`pair, 2]]}]]}], "\n", 
           Text[
            Style["Color Code for Equity %", Bold]], $CellContext`legend, 
           LocatorPane[
            Dynamic[$CellContext`pos$$], $CellContext`array]}, Center]], 
      "Specifications" :> {{{$CellContext`pos$$, {84.5, 84.5}}, 0, 
         ControlType -> None}}, 
      "Options" :> {
       ContentSize -> {750, 900}, SynchronousInitialization -> False}, 
      "DefaultOptions" :> {}],
     ImageSizeCache->{764., {461., 467.}},
     SingleEvaluation->True],
    Deinitialization:>None,
    DynamicModuleValues:>{},
    Initialization:>(($CellContext`normPos[
         Pattern[$CellContext`pos, 
          Blank[]]] := 
       Module[{$CellContext`result = Table[0, {2}]}, 
         Part[$CellContext`result, 1] = 
          Round[Part[$CellContext`pos, 1] + 0.5]; 
         Part[$CellContext`result, 1] = Min[
            Max[1, 
             Part[$CellContext`result, 1]], 169]; 
         Part[$CellContext`result, 2] = 
          Round[Part[$CellContext`pos, 2] + 0.5]; 
         Part[$CellContext`result, 2] = Min[
            Max[1, 
             Part[$CellContext`result, 2]], 
            169]; $CellContext`result]; $CellContext`colorTheme = 
       "ThermometerColors"; $CellContext`format2[
         Pattern[$CellContext`pair, 
          Blank[]]] := Module[{}, 
         BarChart[{
           Part[$CellContext`preFlopHandMatrix, 
            Part[$CellContext`pair, 1], 
            Part[$CellContext`pair, 2]], 1 - 
           Part[$CellContext`preFlopHandMatrix, 
            Part[$CellContext`pair, 1], 
            Part[$CellContext`pair, 2]]}, ChartLegends -> None, ChartStyle -> {
            ColorData[$CellContext`colorTheme][
            1 - Part[$CellContext`preFlopHandMatrix, 
              Part[$CellContext`pair, 1], 
              Part[$CellContext`pair, 2]]], 
            ColorData[$CellContext`colorTheme][
             Part[$CellContext`preFlopHandMatrix, 
              Part[$CellContext`pair, 1], 
              Part[$CellContext`pair, 2]]]}, 
          LabelingFunction -> (Placed[
           NumberForm[100 #, {5, 2}] "%", Above]& ), Axes -> {True, False}, 
          ImageSize -> 150, AspectRatio -> 
          1/3]]; $CellContext`preFlopHandMatrix = ToExpression[
         Import[
         "https://raw.github.com/oscar6echo/Poker/master/Tables/\
preFlopHandMatrix.csv"]]; $CellContext`preFlopHandList = ToExpression[
         Import[
         "https://raw.github.com/oscar6echo/Poker/master/Tables/\
preFlopHandList.csv"]]; $CellContext`faceChoice = {
        1 -> 2, 2 -> 3, 3 -> 4, 4 -> 5, 5 -> 6, 6 -> 7, 7 -> 8, 8 -> 9, 
         9 -> $CellContext`T, 10 -> $CellContext`J, 11 -> $CellContext`Q, 12 -> 
         K, 13 -> $CellContext`A}; $CellContext`array = 
       ArrayPlot[$CellContext`preFlopHandMatrix, 
         ColorFunction -> $CellContext`colorTheme, ImageSize -> 700, 
         ImageMargins -> 0, Frame -> Automatic, FrameTicks -> 
         Automatic]; $CellContext`legend = 
       DensityPlot[
        1 - $CellContext`x, {$CellContext`x, 0, 1}, {$CellContext`y, 0, 1}, 
         ColorFunction -> $CellContext`colorTheme, AspectRatio -> 1/10, Frame -> 
         True, FrameTicks -> {{None, None}, {All, None}}, PlotRangePadding -> 
         None, ImageSize -> {150, Automatic}]); Typeset`initDone$$ = True),
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
Cell[1301, 31, 5753, 126, 930, InheritFromParent]
}
]
*)

(* End of internal cache information *)
(* NotebookSignature 7upfbFI2xouykCgdQtQi7PC7 *)
