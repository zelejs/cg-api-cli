dir=$(readlink -f $0)
dir=$(dirname $dir)
dir=$(dirname $dir)

echo $dir/cg-api-cli test cruds/sql/cg-mysql-schema.sql cruds/onemany.json
