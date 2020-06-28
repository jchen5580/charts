echo 'updating dependencies in $1'
helm dep update $1

echo 'packaging master chart'
helm package $1

echo 'moving packed chart to charts/'
mv *.tgz ../charts/

echo 'indexing the updates charts'
helm repo index ../charts --url https://jchen5580.github.io/charts

echo 'pushing updated charts and index to repo'
cd ../charts
git add .
git commit -m 'updated charts and index'
git push

cd -

echo 'master chart is updated in repo'
