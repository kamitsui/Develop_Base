#!/bin/bash
DIR_DB='../pm_db_data'
DIR_REDMINE='../pm_redmine_data'
DIR_REDMINE_LOGS='../pm_redmine_logs'

make_directories()
{
	mkdir $DIR_DB
	mkdir $DIR_REDMINE
	mkdir $DIR_REDMINE_LOGS
}

remove_directories()
{
	rm -rf $DIR_DB
	rm -rf $DIR_REDMINE
	rm -rf $DIR_REDMINE_LOGS
}

if [[ "$1" == "mk" ]]; then
	make_directories
elif [[ "$1" == "rm" ]]; then
	remove_directories
else
	echo "Usage: ./volumes.sh \"mk\" or ./volumes \"rm\""
fi
