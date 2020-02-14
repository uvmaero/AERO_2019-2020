#!/bin/sh
in2csv $1 | csvformat -D \; -U 2 > BOM.csv
