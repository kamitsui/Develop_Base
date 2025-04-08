#!/bin/bash

find_venv_dir()
{
	local cmd='python3 -m venv venv'

	if [ -d 'venv' ]; then
		echo "exist 'venv' directory. Continue..."
		return 0
	fi
	read -p "${cmd} ... execute? (y/n)" yn
	if [[ ! $yn == [yY] ]]; then
		return 1
	fi
	${cmd}
	return $?
}

find_dot_env()
{
	local cmd='source .env'

	if [ ! -f "./.env" ]; then
		echo "Error: Not find '.env' file"
		echo "Tips: README.md"
		return 1
	fi
	${cmd}
	return $?
}

link_venv_to_prjdir()
{
	local cmd="ln -s ${PWD} ${PRJ_DIR}/venv"

	read -p "${cmd} ... execute? (y/n): " yn
	if [[ ! $yn == [yY] ]]; then
		return 1
	fi
	if [ -L "${PRJ_DIR}/venv" ];then
		echo "exist ${PRJ_DIR}/venv"
		return 1
	fi
	${cmd}
	return $?
}

main()
{
	local functions=("find_venv_dir" "find_dot_env" "link_venv_to_prjdir")

	for func in "${functions[@]}"; do
		${func}
		if [ $? == 1 ]; then
			echo "Not Complite ... ${func}"
			return 1
		fi
	done
}

main
