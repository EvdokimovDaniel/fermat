#!/usr/bin/env wolframscript
(* ::Package:: *)

res = 2 + 3;

dir = DirectoryName[$InputFileName];
file = FileNameJoin[{dir, "result.txt"}];

Export[file, res, "Text"]
