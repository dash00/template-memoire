#!/bin/sh
# @Author: Jérémy Coatelen
# @Date:   2015-05-05 20:21:23
# @Last Modified by:   dash00
# @Last Modified time: 2015-05-05 21:04:24

grep -R "\\\\cite{.*}" . -l | grep -v ".*\~$" | grep -v "\.svn" | grep -v "\.backup$"

