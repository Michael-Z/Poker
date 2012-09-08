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
NotebookDataLength[     20401,        442]
NotebookOptionsPosition[     20626,        430]
NotebookOutlinePosition[     21167,        454]
CellTagsIndexPosition[     21124,        451]
WindowTitle->Distribution of 5-card Hands For One PreFlop Hand
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`f1$$ = 7, $CellContext`f2$$ = 
    6, $CellContext`hmin$$ = 3501, $CellContext`nh$$ = 5, $CellContext`t$$ = 
    "o", Typeset`show$$ = True, Typeset`bookmarkList$$ = {}, 
    Typeset`bookmarkMode$$ = "Menu", Typeset`animator$$, Typeset`animvar$$ = 
    1, Typeset`name$$ = "\"untitled\"", Typeset`specs$$ = {{
      Hold[
       Text[
        Style["First PreFlop Hand\n", 11, Bold]]], 
      Manipulate`Dump`ThisIsNotAControl}, {{
       Hold[$CellContext`f1$$], 7, "First face"}, {
      1 -> 2, 2 -> 3, 3 -> 4, 4 -> 5, 5 -> 6, 6 -> 7, 7 -> 8, 8 -> 9, 
       9 -> $CellContext`T, 10 -> $CellContext`J, 11 -> $CellContext`Q, 12 -> 
       K, 13 -> $CellContext`A}}, {{
       Hold[$CellContext`f2$$], 6, "Second face"}, {
      1 -> 2, 2 -> 3, 3 -> 4, 4 -> 5, 5 -> 6, 6 -> 7, 7 -> 8, 8 -> 9, 
       9 -> $CellContext`T, 10 -> $CellContext`J, 11 -> $CellContext`Q, 12 -> 
       K, 13 -> $CellContext`A}}, {{
       Hold[$CellContext`t$$], "o", "Type"}, 
      Dynamic[
       If[$CellContext`f1$$ != $CellContext`f2$$, $CellContext`suitChoice, \
$CellContext`suitNoChoice]]}, {
      Hold[
       Style["Selection of Hand Ranks", 11, Bold]], 
      Manipulate`Dump`ThisIsNotAControl}, {{
       Hold[$CellContext`hmin$$], 3501, "Lowest Hand Rank displayed"}, 1, 
      7452, 1}, {{
       Hold[$CellContext`nh$$], 5, "Number of Hand Ranks displayed"}, 1, 30, 
      1}}, Typeset`size$$ = Automatic, Typeset`update$$ = 0, 
    Typeset`initDone$$, Typeset`skipInitDone$$ = 
    False, $CellContext`f1$962$$ = False, $CellContext`f2$963$$ = 
    False, $CellContext`hmin$964$$ = 0, $CellContext`nh$965$$ = 0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, 
      "Variables" :> {$CellContext`f1$$ = 7, $CellContext`f2$$ = 
        6, $CellContext`hmin$$ = 3501, $CellContext`nh$$ = 
        5, $CellContext`t$$ = "o"}, "ControllerVariables" :> {
        Hold[$CellContext`f1$$, $CellContext`f1$962$$, False], 
        Hold[$CellContext`f2$$, $CellContext`f2$963$$, False], 
        Hold[$CellContext`hmin$$, $CellContext`hmin$964$$, 0], 
        Hold[$CellContext`nh$$, $CellContext`nh$965$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> 
      Module[{$CellContext`handRankPoint$, $CellContext`handRankBin$, \
$CellContext`handRank$}, 
        If[
         Not[
          
          And[$CellContext`f1$$ == $CellContext`f2$$, $CellContext`t$$ == 
           "s"]], $CellContext`handRank$ = 
          Part[$CellContext`allPreFlopHandRank, 
            $CellContext`convert[{$CellContext`f1$$, $CellContext`f2$$, \
$CellContext`t$$}]]; $CellContext`handRankPoint$ = Table[{$CellContext`i, 
             Part[$CellContext`handRank$, $CellContext`i]}, {$CellContext`i, 
             Length[$CellContext`handRank$]}]; $CellContext`handRankBin$ = 
          Table[
            Select[
             Take[$CellContext`handRankPoint$, 
              Span[Part[$CellContext`handRankLimit, $CellContext`i] + 1, 
               Part[$CellContext`handRankLimit, $CellContext`i + 1]]], 
             Part[#, 2] > 0& ], {$CellContext`i, 9}]; Column[{
            Text[
             Style["Number of Hands per Hand Rank", Larger, Bold]], "\n", 
            $CellContext`tableRangePreFlopHand[$CellContext`handRank$, \
{$CellContext`hmin$$, 
              Min[$CellContext`nh$$, 7462 - $CellContext`hmin$$]}]}, 
           Center]]], "Specifications" :> {
        Text[
         Style[
         "First PreFlop Hand\n", 11, Bold]], {{$CellContext`f1$$, 7, 
          "First face"}, {
         1 -> 2, 2 -> 3, 3 -> 4, 4 -> 5, 5 -> 6, 6 -> 7, 7 -> 8, 8 -> 9, 
          9 -> $CellContext`T, 10 -> $CellContext`J, 11 -> $CellContext`Q, 12 -> 
          K, 13 -> $CellContext`A}, ControlType -> 
         SetterBar}, {{$CellContext`f2$$, 6, "Second face"}, {
         1 -> 2, 2 -> 3, 3 -> 4, 4 -> 5, 5 -> 6, 6 -> 7, 7 -> 8, 8 -> 9, 
          9 -> $CellContext`T, 10 -> $CellContext`J, 11 -> $CellContext`Q, 12 -> 
          K, 13 -> $CellContext`A}, ControlType -> 
         SetterBar}, {{$CellContext`t$$, "o", "Type"}, 
         Dynamic[
          
          If[$CellContext`f1$$ != $CellContext`f2$$, $CellContext`suitChoice, \
$CellContext`suitNoChoice]], ControlType -> SetterBar}, Delimiter, 
        Style[
        "Selection of Hand Ranks", 11, 
         Bold], {{$CellContext`hmin$$, 3501, "Lowest Hand Rank displayed"}, 1,
          7452, 1, Appearance -> 
         "Labeled"}, {{$CellContext`nh$$, 5, 
          "Number of Hand Ranks displayed"}, 1, 30, 1, Appearance -> 
         "Labeled"}}, 
      "Options" :> {
       ControlPlacement -> Top, ContentSize -> {400, 300}, 
        SynchronousInitialization -> False}, "DefaultOptions" :> {}],
     ImageSizeCache->{414., {259., 265.}},
     SingleEvaluation->True],
    Deinitialization:>None,
    DynamicModuleValues:>{},
    Initialization:>(($CellContext`faceEq = {
        1 -> 2, 2 -> 3, 3 -> 4, 4 -> 5, 5 -> 6, 6 -> 7, 7 -> 8, 8 -> 9, 
         9 -> $CellContext`T, 10 -> $CellContext`J, 11 -> $CellContext`Q, 12 -> 
         K, 13 -> $CellContext`A}; $CellContext`face = {
        2, 3, 4, 5, 6, 7, 8, 
         9, $CellContext`T, $CellContext`J, $CellContext`Q, 
         K, $CellContext`A}; $CellContext`deckCardNo[
         Pattern[$CellContext`deckCardFace, 
          Blank[]], 
         Pattern[$CellContext`deckCardSuit, 
          Blank[]]] := 
       1 + 4 ($CellContext`deckCardFace - 1) + ($CellContext`deckCardSuit - 
         1); $CellContext`allPreFlopHand = Flatten[
         Table[
          If[$CellContext`f1$$ > $CellContext`f2$$, {
            $CellContext`deckCardNo[$CellContext`f1$$, 4], 
            $CellContext`deckCardNo[$CellContext`f2$$, 4]}, {
            $CellContext`deckCardNo[$CellContext`f1$$, 4], 
            $CellContext`deckCardNo[$CellContext`f2$$, 
             3]}], {$CellContext`f1$$, 13, 1, -1}, {$CellContext`f2$$, 13, 
           1, -1}], 1]; $CellContext`nameHand = {
        "Total", "High Card", "One Pair", "Two Pairs", "Three of a kind", 
         "Straight", "Flush", "Full House", "Four of a kind", 
         "Straight Flush"}; $CellContext`nbDistinctHand = {7462, 1277, 2860, 
        858, 858, 10, 1277, 156, 156, 
        10}; $CellContext`cumulUpNbDistinctHand = {1277, 4137, 4995, 5853, 
        5863, 7140, 7296, 7452, 7462}; $CellContext`handRankLimit = {0, 1277, 
        4137, 4995, 5853, 5863, 7140, 7296, 7452, 
        7462}; $CellContext`allPreFlopHandRank = 
       Import["https://raw.github.com/oscar6echo/Poker/master/Tables/\
allPreFlopHandRank.csv"]; $CellContext`handFaceFiveSorted = 
       Import["https://raw.github.com/oscar6echo/Poker/master/Tables/\
handFaceFive.csv"]; $CellContext`tableTypeHand[
         Pattern[$CellContext`handRankBin, 
          Blank[]]] := 
       Module[{$CellContext`nbTypeHand, $CellContext`perCentTypeHand}, \
$CellContext`nbTypeHand = Table[
            Total[
             Part[
              Part[$CellContext`handRankBin, $CellContext`i], All, 
              2]], {$CellContext`i, 9}]; $CellContext`perCentTypeHand = 
          Table[N[100 Part[$CellContext`nbTypeHand, $CellContext`i]]/
            Total[$CellContext`nbTypeHand], {$CellContext`i, 9}]; TableForm[
           Map[Text, 
            Append[
             Table[{
               Part[$CellContext`nameHand, 1 + $CellContext`i], 
               NumberForm[
                Part[$CellContext`nbTypeHand, $CellContext`i], DigitBlock -> 
                3], 
               NumberForm[
                Part[$CellContext`perCentTypeHand, $CellContext`i], {5, 3}], 
               Part[$CellContext`nbDistinctHand, $CellContext`i + 1], 
               
               Part[$CellContext`cumulUpNbDistinctHand, $CellContext`i]}, \
{$CellContext`i, 9, 1, -1}], {
              Part[$CellContext`nameHand, 1], 
              NumberForm[
               Total[$CellContext`nbTypeHand], DigitBlock -> 3], 
              NumberForm[
               Total[$CellContext`perCentTypeHand], {5, 3}], 
              Total[
               Part[$CellContext`nbDistinctHand, 
                Span[2, All]]], "N/A"}], {2}], TableAlignments -> Right, 
           TableHeadings -> {None, 
             Map[
             Text, {"Hand Name", "Nb of Hands", "% of Hands", 
               "Nb Distinctly Ranked Hands", 
               "Nb Cumulative Up"}]}]]; $CellContext`rectChartPreFlopHand[
         Pattern[$CellContext`handRankPoint, 
          Blank[]], 
         Pattern[$CellContext`nbHandRankBucket, 
          Blank[]]] := 
       Module[{$CellContext`width, $CellContext`handRankLimitBucket, \
$CellContext`handRankBin, $CellContext`nbHand, $CellContext`nbAllHand, \
$CellContext`dataRect, $CellContext`color, $CellContext`colorList, \
$CellContext`tooltipLabel}, $CellContext`width = 
          Round[7462/$CellContext`nbHandRankBucket]; \
$CellContext`handRankLimitBucket = Table[
            DeleteDuplicates[
             Append[
              Range[Part[$CellContext`handRankLimit, $CellContext`i] + 0, 
               
               Part[$CellContext`handRankLimit, $CellContext`i + 
                1], $CellContext`width], 
              
              Part[$CellContext`handRankLimit, $CellContext`i + 
               1]]], {$CellContext`i, 9}]; $CellContext`handRankBin = Table[
            Table[
             Take[$CellContext`handRankPoint, 
              Span[
              Part[$CellContext`handRankLimitBucket, $CellContext`i, \
$CellContext`j] + 1, 
               
               Part[$CellContext`handRankLimitBucket, $CellContext`i, \
$CellContext`j + 1]]], {$CellContext`j, Length[
                Part[$CellContext`handRankLimitBucket, $CellContext`i]] - 
              1}], {$CellContext`i, 
             Length[$CellContext`handRankLimitBucket]}]; $CellContext`nbHand = 
          Table[
            Table[
             Total[
              Part[
               Part[$CellContext`handRankBin, $CellContext`i, $CellContext`j],
                All, 2]], {$CellContext`j, Length[
                Part[$CellContext`handRankLimitBucket, $CellContext`i]] - 
              1}], {$CellContext`i, 
             
             Length[$CellContext`handRankLimitBucket]}]; \
$CellContext`nbAllHand = Total[$CellContext`nbHand, 2]; $CellContext`dataRect = 
          Table[
            Table[{$CellContext`nbHandRankBucket, 
              
              Part[$CellContext`nbHand, $CellContext`i, $CellContext`j]}, \
{$CellContext`j, Length[
                Part[$CellContext`handRankLimitBucket, $CellContext`i]] - 
              1}], {$CellContext`i, 
             Length[$CellContext`handRankLimitBucket]}]; $CellContext`color = 
          Table[
            ColorData[
            "DarkBands"][($CellContext`i - 1)/8], {$CellContext`i, 
             9}]; $CellContext`colorList = Table[
            
            Part[$CellContext`color, $CellContext`i], {$CellContext`i, 
             9}]; $CellContext`tooltipLabel[
            Pattern[$CellContext`v, 
             Blank[]], {
             Pattern[$CellContext`r, 
              Blank[]], 
             Pattern[$CellContext`c, 
              Blank[]]}, 
            BlankNullSequence[]] := Placed[
            Grid[{{"Hand Ranks from ", 
               
               Part[$CellContext`handRankLimitBucket, $CellContext`r, \
$CellContext`c], "to", 
               
               Part[$CellContext`handRankLimitBucket, $CellContext`r, \
$CellContext`c + 1]}, {"Number of Hands =", 
               Part[$CellContext`v, 2], " / ", $CellContext`nbAllHand}, {
              "Fraction (%) =", 
               NumberForm[
                N[100 (Part[$CellContext`v, 2]/$CellContext`nbAllHand)], {5, 
                3}]}}, Alignment -> Left], Tooltip]; 
         RectangleChart[$CellContext`dataRect, ChartLegends -> {
             Part[$CellContext`nameHand, 
              Span[2, 10]], None}, 
           ChartStyle -> {$CellContext`colorList, None}, 
           AxesLabel -> {"Hand Rank", "Nb Hands"}, 
           LabelingFunction -> $CellContext`tooltipLabel, ImagePadding -> 
           Automatic, 
           ImageSize -> {600, 500}]]; $CellContext`tableMostFreqPreFlopHand[
         Pattern[$CellContext`handRank, 
          Blank[]], 
         Pattern[$CellContext`nbHighRank, 
          Blank[]]] := 
       Module[{$CellContext`mostFreqPreFlopHand, $CellContext`table}, \
$CellContext`mostFreqPreFlopHand = Flatten[
            Table[
             Position[$CellContext`handRank, 
              
              RankedMax[$CellContext`handRank, $CellContext`i]], \
{$CellContext`i, $CellContext`nbHighRank}]]; $CellContext`table = Map[Text, 
            Table[{
              Part[$CellContext`mostFreqPreFlopHand, $CellContext`i], 
              Part[$CellContext`handRank, 
               Part[$CellContext`mostFreqPreFlopHand, $CellContext`i]], 
              Row[
               ReplaceAll[
                Part[$CellContext`handFaceFiveSorted, 
                 
                 Part[$CellContext`mostFreqPreFlopHand, $CellContext`i]], \
$CellContext`faceEq]]}, {$CellContext`i, 
              Length[$CellContext`mostFreqPreFlopHand]}], {2}]; 
         TableForm[$CellContext`table, TableHeadings -> {Automatic, 
             Map[
             Text, {"Hand Rank", "Nb Hands", 
               "Hand Faces"}]}]]; $CellContext`listPlotHandRank[
         Pattern[$CellContext`handRankBin, 
          Blank[]], 
         Pattern[$CellContext`hmin, 
          Blank[]], 
         Pattern[$CellContext`hmax, 
          Blank[]], 
         Pattern[$CellContext`xmin, 
          Blank[]], 
         Pattern[$CellContext`xmax, 
          Blank[]], 
         Pattern[$CellContext`ymax, 
          Blank[]]] := 
       Module[{$CellContext`handRankBinAdj = 
          ReplaceAll[$CellContext`handRankBin, {} -> {
             0}], $CellContext`color, $CellContext`colorList}, \
$CellContext`color = Table[
            ColorData[
            "DarkBands"][($CellContext`i - 1)/8], {$CellContext`i, 
             9}]; $CellContext`colorList = Table[
            Part[$CellContext`color, $CellContext`i], {$CellContext`i, 9}]; 
         ListPlot[
           Part[$CellContext`handRankBinAdj, 
            Span[$CellContext`hmin, $CellContext`hmax]], AspectRatio -> 1/2, 
           AxesLabel -> {"Hand rank", "Nb of hands"}, 
           AxesOrigin -> {$CellContext`xmin, 0}, Ticks -> {
             Range[$CellContext`xmin, $CellContext`xmax, 
              Round[($CellContext`xmax - $CellContext`xmin)/7]], Automatic}, 
           PlotRange -> {{$CellContext`xmin, $CellContext`xmax}, {
             0, $CellContext`ymax}}, PlotStyle -> $CellContext`colorList, 
           Filling -> Axis, FillingStyle -> Automatic, ImageSize -> 
           800]]; $CellContext`handType[
         Pattern[$CellContext`oneHandRank, 
          Blank[]]] := 
       Which[$CellContext`oneHandRank <= Part[$CellContext`handRankLimit, 2], 
         
         Part[$CellContext`nameHand, 2], $CellContext`oneHandRank <= 
         Part[$CellContext`handRankLimit, 3], 
         Part[$CellContext`nameHand, 3], $CellContext`oneHandRank <= 
         Part[$CellContext`handRankLimit, 4], 
         Part[$CellContext`nameHand, 4], $CellContext`oneHandRank <= 
         Part[$CellContext`handRankLimit, 5], 
         Part[$CellContext`nameHand, 5], $CellContext`oneHandRank <= 
         Part[$CellContext`handRankLimit, 6], 
         Part[$CellContext`nameHand, 6], $CellContext`oneHandRank <= 
         Part[$CellContext`handRankLimit, 7], 
         Part[$CellContext`nameHand, 7], $CellContext`oneHandRank <= 
         Part[$CellContext`handRankLimit, 8], 
         Part[$CellContext`nameHand, 8], $CellContext`oneHandRank <= 
         Part[$CellContext`handRankLimit, 9], 
         Part[$CellContext`nameHand, 9]]; $CellContext`tableRangePreFlopHand[
         Pattern[$CellContext`handRank, 
          Blank[]], 
         Pattern[$CellContext`rangePreFlopHand, 
          Blank[]]] := 
       Module[{$CellContext`preFlopHand, $CellContext`table}, \
$CellContext`preFlopHand = Table[$CellContext`i, {$CellContext`i, 
             Part[$CellContext`rangePreFlopHand, 1], 
             Part[$CellContext`rangePreFlopHand, 1] + 
             Part[$CellContext`rangePreFlopHand, 2]}]; $CellContext`table = 
          Map[Text, 
            Table[{
              Part[$CellContext`preFlopHand, $CellContext`i], 
              Part[$CellContext`handRank, 
               Part[$CellContext`preFlopHand, $CellContext`i]], 
              Row[
               ReplaceAll[
                Part[$CellContext`handFaceFiveSorted, 
                 
                 Part[$CellContext`preFlopHand, $CellContext`i]], \
$CellContext`faceEq]], 
              $CellContext`handType[
               
               Part[$CellContext`preFlopHand, $CellContext`i]]}, \
{$CellContext`i, 
              Length[$CellContext`preFlopHand]}], {2}]; 
         TableForm[$CellContext`table, TableHeadings -> {Automatic, 
             Map[
             Text, {"Hand Rank", "Nb Hands", "Hand Faces", 
               "Hand Type"}]}]]; $CellContext`faceChoice = 
       Table[$CellContext`i -> 
         Part[$CellContext`face, $CellContext`i], {$CellContext`i, 
          Length[$CellContext`face]}]; $CellContext`faceChoiceRev = 
       Table[Part[$CellContext`face, $CellContext`i] -> $CellContext`i, \
{$CellContext`i, 
          Length[$CellContext`face]}]; $CellContext`suitChoice = {
        "s" -> "suited", "o" -> "off-suited"}; $CellContext`suitNoChoice = {
        "o" -> "off-suited"}; $CellContext`nameHandChoice = 
       Table[$CellContext`i -> Part[
           Part[$CellContext`nameHand, 
            Span[2, All]], $CellContext`i], {$CellContext`i, 
          9}]; $CellContext`convert[
         Pattern[$CellContext`pfh, 
          Blank[]]] := 
       Module[{$CellContext`f1, $CellContext`f2, $CellContext`t, \
$CellContext`max, $CellContext`min, $CellContext`pfh1 = 
          Table[0, {2}]}, $CellContext`f1 = ReplaceAll[
            
            Part[$CellContext`pfh, 
             1], $CellContext`faceChoiceRev]; $CellContext`f2 = ReplaceAll[
            Part[$CellContext`pfh, 2], $CellContext`faceChoiceRev]; 
         If[$CellContext`f1 > $CellContext`f2, $CellContext`max = \
$CellContext`f1; $CellContext`min = $CellContext`f2, $CellContext`max = \
$CellContext`f2; $CellContext`min = $CellContext`f1]; $CellContext`t = 
          Part[$CellContext`pfh, 3]; 
         If[$CellContext`t == "s", $CellContext`pfh1 = {
             $CellContext`deckCardNo[$CellContext`max, 4], 
             $CellContext`deckCardNo[$CellContext`min, 4]}, $CellContext`pfh1 = {
             $CellContext`deckCardNo[$CellContext`min, 4], 
             $CellContext`deckCardNo[$CellContext`max, 3]}]; First[
           First[
            Position[$CellContext`allPreFlopHand, $CellContext`pfh1]]]]; 
      Null); Typeset`initDone$$ = True),
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
WindowTitle->"Distribution of 5-card Hands For One PreFlop Hand",
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
Cell[1298, 31, 19324, 397, 526, InheritFromParent]
}
]
*)

(* End of internal cache information *)
(* NotebookSignature Uwp2rotgPNla#CwIZp9CnfWl *)
