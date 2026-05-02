cd $(dirname $0)
echo bloc name: $1
package_name="${2:-"core"}"
echo package name: "$package_name"
lib_subDirectory="${3:-"src/bloc/"}"
echo lib subdirectory: "$lib_subDirectory"
nest_in_subdirectory="${4:-"true"}"
echo nest in subdirectory: "$nest_in_subdirectory"

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
if [ "$nest_in_subdirectory" = "true" ]; then
  mason make bloc_brick --bloc_name_prefix $1 --package_name "$package_name" -o ../../packages/"$package_name"/lib/"$lib_subDirectory"/"$1"
else
  mason make bloc_brick --bloc_name_prefix $1 --package_name "$package_name" -o ../../packages/"$package_name"/lib/"$lib_subDirectory"
fi
#
#melos exec -c 2 --fail-fast --order-dependents --scope=$package_name --scope=add_to_app --scope=standalone -- dart run build_runner build --delete-conflicting-outputs
#melos format


