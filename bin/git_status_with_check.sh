#!/bin/bash
RED='\033[1;33m'
NC='\033[0m' # No Color
#path=$1

prefix="$(git rev-parse --show-toplevel)/"
working_dir="$(pwd)"
paper_id="${working_dir#$prefix}"

git status --untracked-files=no $path

#file_list="$(git status --porcelain --untracked-files=no $path)"
file_list="$(git status --porcelain --untracked-files=no)"
IFS='
' 
for line in ${file_list}; do
  file="$(echo $line | cut -d ' ' -f3)"
  check="$(echo $file | grep $paper_id)"

  if [[ $check = "" ]]; then
    echo ""
    printf "${RED}WARN: there are modified files in other directory${NC}\n"
    exit 1
  fi
done
