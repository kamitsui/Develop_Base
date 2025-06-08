#!/bin/bash

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

usage()
{
	echo "Usage: these command is creating symlink (and copy files) in ${PRJ_DIR}."
	echo "  ./setup docker 42"
	echo "  ./setup docker mkdocs"
	echo "  ./setup docker redmine"
	echo "  ./setup doxygen"
	echo "  ./setup python"
}

setup_docker()
{
	local types=("42" "mkdocs" "redmine")
	local symlink_name="${PRJ_DIR}/docker"
	local cmd="ln -s ${PWD}/docker/"

	if [ $# -lt 1 ]; then
		usage
		return 1
	fi
	for type in "${types[@]}"; do
		if [[ "$1" != "${type}" ]]; then
			continue
		fi
		symlink_name+="_${type}"
		cmd+="${type} ${symlink_name}"
		if [ -L "${symlink_name}" ];then
			echo "exist ${symlink_name}"
			return 1
		fi
		read -p "${cmd} ... execute? (y/n)" yn
		if [[ ! $yn == [yY] ]]; then
			return 1
		fi
		${cmd}
		return $?
	done
	echo "Error: illegal option"
	usage
	return 1
}

link_venv_to_prjdir()
{
	local symlink_name="${PRJ_DIR}/python_m_venv"
	local cmd="ln -s ${PWD} ${symlink_name}"

	read -p "${cmd} ... execute? (y/n): " yn
	if [[ ! $yn == [yY] ]]; then
		return 1
	fi
	if [ -L "${symlink_name}" ];then
		echo "exist ${symlink_name}"
		return 1
	fi
	${cmd}
	return $?
}

setup_doxygen()
{
	echo "It's still getting ready..."
	return 1
}

setup_python_venv()
{
	cp .env python_m_venv/.env
	cd python_m_venv; ./setup_project_env.sh
	return $?
}

select_env()
{
	local environs=("docker" "doxygen" "python")
	local functions=("setup_docker" "setup_doxygen" "setup_python_venv")

	if [ $# -lt 1 ]; then
		usage
		return 1
	fi
	for I in "${!environs[@]}"; do
		select=${environs[I]}
		func=${functions[I]}
		if [[ "$1" == "${select}" ]]; then
			${func} $2
			return $?
		fi
	done
	echo "Error: illegal option"
	usage
	return 1
}

main()
{
	local functions=("find_dot_env" "select_env")

	for func in "${functions[@]}"; do
		${func} $1 $2
		if [ $? == 1 ]; then
			echo "Not Complite ... ${func}"
			return 1
		fi
	done
}

main $1 $2
