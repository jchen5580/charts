echo 'package all charts in '$(pwd)/$1
for dir in $1/*/; do
    echo 'packaging chart in '${dir}
    helm package $dir
done

echo 'clean up dist folder'
rm dist/*.*

echo 'move packed charts to dist'
mv *.tgz dist/

echo 'update index of charts for repo https://jchen5580.github.io/charts'
helm repo index dist/ --url https://jchen5580.github.io/charts

echo 'push charts in dist/ to repo https://jchen5580.github.io/charts'
helm repo add dist https://jchen5580.github.io/charts
