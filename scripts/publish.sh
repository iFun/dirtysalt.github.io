#!/bin/bash
# publish org files.

# clean trash files
rm -rf images/\.#*
rm -rf src/\.#*
rm -rf html/\.#*

echo "********** check references **********"
python3 ./scripts/check-image-ref.py `pwd`
if [ $? != 0 ]; then
    echo "resolve image ref issues!"
    exit 1
fi

echo "********** enforce org format **********"
python $HOME/.private/project/pyscript/utils/enforce-org-format.py `pwd`
if [ $? != 0 ]; then
    echo "enforce org format failed"
    exit 1
fi

echo "********** rename org images **********"
python $HOME/.private/project/pyscript/utils/rename-org-images.py `pwd`/images
if [ $? != 0 ]; then
    echo "rename org images failed"
    exit 1
fi

echo "********** compress images **********"
python $HOME/.private/project/pyscript/utils/compress-images.py `pwd`/images
if [ $? != 0 ]; then
    echo "compress images failed"
    exit 1
fi

bash ./scripts/publish-html.sh
