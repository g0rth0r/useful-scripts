#!/bin/bash

SOURCEDIR=$1
DESTDIR=$2
exiftool -progress -o . '-imagedescription<${directory;s(.*/)()}' '-FileName<FileModifyDate' '-FileName<DateCreated' '-FileName<CreateDate' -d "$SOURCEDIR"'/%Y/%Y-%m-%d/%Y-%m-%dT%H.%M.%S %%16f%%-c.%%le' -r -v -ext JPG -overwrite_original "$DESTDIR"

