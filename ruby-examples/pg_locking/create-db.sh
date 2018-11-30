#!/usr/bin/env sh

app_name=lockingv1_example

dropdb --if-exists $app_name
createdb --owner postgres $app_name

psql --dbname $app_name --username postgres --command "$command"
