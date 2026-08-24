#!/bin/bash

cd ~/archIso/

sudo rm -r Build

mkarchiso -v -r -w ~/archIso/Build -o ~/archIso ~/archIso/baseline
