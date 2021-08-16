#!/bin/bash

echo "1. All sed statements"
grep -r "sed"

echo "2. All lines that start with the letter m"
grep -r "^m"

echo "3. All lines that contain three digit numbers"
grep -rE '[0-9]{3}'

echo "4. All echo statements with at least three words"
grep -rE 'echo (\w+\b.){4}'

echo "5. All lines that would make a good password"
grep -E "^.{8,255}" | \
             grep -E "[A-Z]" | \
             grep -E "[a-z"] | \
             grep -E "[0-9]" | \
             grep -E "[-_!%^&*()_+{}|:<>?=]" 