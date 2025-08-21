#!/usr/bin/env wolframscript
(* ::Package:: *)

<<LiteRed2`
SetDim[d];
Declare[{p,l1,l2},Vector,{pp},Number];
sp[p,p]=1;

NewDsSet[modA2L,{sp[l1],sp[l2],sp[p+l1+l2],sp[l1]+sp[l2]+sp[p+l1+l2], sp[p,l2],sp[l1,p]},{l1,l2},Directory->"modA2L"]
allB2L=NewDsBases[modA2L]
GenerateIBP/@allB2L
AnalyzeSectors/@allB2L
FindSymmetries/@allB2L
Table[FindExtSymmetries@@Reverse[allB2L[[1;;i]]],{i,2,Length[allB2L]}]
SolvejSector[ (Union[Flatten[(UniqueSectors/@ allB2L) ]/. Flatten[ExtSectorsMappings /@ allB2L]])]
D1aL2=IBPReduce[PFReduce[j[modA2L,1,1,1,(* cut *) 1,(* aux props *) 0,0]]/.SetToBasesRule[modA2L]]


dir = DirectoryName[$InputFileName];
file = FileNameJoin[{dir, "result.txt"}];

Export[file, D1aL2, "Text"]
