#!/usr/bin/python
# This file is part of Doctemplate
# Copyright (c) 2011 Kyle Nitzsche
#                    Canonical
#
#This program is free software: you can redistribute it and/or modify it 
#under the terms of the GNU General Public License version 3, as published 
#by the Free Software Foundation.

#This program is distributed in the hope that it will be useful, but 
#WITHOUT ANY WARRANTY; without even the implied warranties of 
#MERCHANTABILITY, SATISFACTORY QUALITY, or FITNESS FOR A PARTICULAR 
#PURPOSE.  See the GNU General Public License for more details.

#You should have received a copy of the GNU General Public License along 
#with this program.  If not, see <http://www.gnu.org/licenses/>.

import sys
import subprocess

arts = sys.argv[1:]

ids = []
for art in arts:
    cmd = ['grep', '-rsh', 'id=', art+"/article"]
    res = subprocess.Popen(cmd, stdout=subprocess.PIPE).communicate()[0]
    items = res.split("\n")
    for item in items:
        ids.append(item.strip())

atts = []
for i in ids:
    if len(i) < 2: continue
    q1 = i.find('"') + 1
    q2 = i.find('"', q1 +1 )
    atts.append(i[q1:q2])

uniques = set()
dups = set()
for att in atts:
    if att not in uniques:
        uniques.add(att)
    else:
        dups.add(att)

for item in dups:
    print item

sys.exit(0)
