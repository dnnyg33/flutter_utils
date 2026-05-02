cd $(dirname $0)
package_name=$1
echo package name-entered: $package_name
package_name_snake=$(echo $package_name | sed -r 's/([a-z0-9])([A-Z])/\1_\2/g' | sed -r 's/([A-Z]+)([A-Z][a-z0-9])/\1_\2/g' | tr '[:upper:]' '[:lower:]')
echo package name-snake: $package_name_snake
package_name_api=$package_name_snake"_api"
echo package name api-snake: $package_name_api

if ! command -v mason &> /dev/null
then
    echo "Mason could not be found, attempting to install"
    dart pub global activate mason_cli
fi

cd ../mason
mason make package_brick --package_name $package_name -o ../../packages/

#melos exec -c 2 --fail-fast --order-dependents --scope=$package_name_snake --scope=$package_name_api --scope=add_to_app --scope=standalone -- dart run build_runner build --delete-conflicting-outputs
#melos bs
#melos format


