#!/bin/bash
cd ..
read -p "Enter commit message: " comment
git add . && git commit -m "$comment" && git push

