echo 'package all charts in '$(pwd)/$1
for dir in $1/*/; do
    echo 'packaging chart in '${dir}
    helm package $dir
done

echo 'cleaning up dist folder'
rm dist/*.*

echo 'moving packed charts to dist'
mv *.tgz dist/

echo 'moving packed charts to /charts'
mv dist/*.tgz ../charts/

echo 'pushing packed charts to repo'
cd ../charts

git add .
git commit -m 'charts updates'
git push

echo 'updated charts published'

