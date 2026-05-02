cd $(dirname $0)
library_name=$1
echo library name-entered: $library_name
library_name_snake=$(echo $library_name | sed -r 's/([a-z0-9])([A-Z])/\1_\2/g' | sed -r 's/([A-Z]+)([A-Z][a-z0-9])/\1_\2/g' | tr '[:upper:]' '[:lower:]')
echo library name-snake: $library_name_snake

if ! command -v mason &> /dev/null
then
    echo "Mason could not be found, attempting to install"
    dart pub global activate mason_cli
fi

output_root="${CONSUMER_CWD:-$(cd ../.. && pwd)}"
cd ../mason
mason make library_brick --library_name $library_name -o "$output_root/packages/"

#melos exec -c 2 --fail-fast --order-dependents --scope=$library_name_snake -- dart run build_runner build --delete-conflicting-outputs
#melos bs
#melos format

