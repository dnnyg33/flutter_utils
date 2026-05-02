cd $(dirname $0)
echo feature name: $1
package_name="${2:-"core"}"
echo package name: $package_name

if ! command -v mason &> /dev/null
then
    echo "Mason could not be found, attempting to install"
    dart pub global activate mason_cli
fi

if ! command -v mason &> /dev/null
then
    echo "Mason could not be found, attempting to install"
    dart pub global activate mason_cli
fi

cd ../mason
mason make feature_brick --feature_name $1 --package_name $package_name -o ../../packages/$package_name/lib/src

#melos exec -c 2 --fail-fast --order-dependents --scope=$package_name --scope=add_to_app --scope=standalone --scope=app_strings -- dart run build_runner build --delete-conflicting-outputs
#melos format


