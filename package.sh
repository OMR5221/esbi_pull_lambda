#!/bin/bash

mkdir esbi_api_pull
git clone OMR5221/esbi_pull_lambda
python3 -m pip install requirements.txt -t esbi_api_pull

# Untested optimization to reduce deployment size
# See https://github.com/ralienpp/simplipy/blob/master/README.md
# echo DELETING *.py `find tmp411 -name "*.py" -type f`
# find tmp411 -name "*.py" -type f -delete

# remove any old .zips
rm -f /io/lambda.zip

# grab existing products
cp -r /io/* esbi_api_pull

# zip without any containing folder (or it won't work)
cd esbi_api_pull
zip -r /io/lambda.zip *
