cd $(dirname $0)
cd ../mason
mason init
mason add feature_brick --path ./bricks/feature_brick
mason add package_brick --path ./bricks/package_brick
mason add bloc_brick --path ./bricks/bloc_brick
mason add library_brick --path ./bricks/library_brick