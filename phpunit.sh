#!/usr/bin/env bash

function func_phpunit
{
    local cmd=$(which phpunit 2>/dev/null)
    local dir="${PWD}"

    while [ -n "${dir}" ]; do
        if [ -x "${dir}/vendor/bin/phpunit" ]; then
            cmd="${dir}/vendor/bin/phpunit"
            break
        fi
        dir="${dir%/*}"
    done

    if [ -z "$cmd" ]; then
        echo 'command not found: phpunit'
        return 1
    fi

    dir="${PWD}"
    while [ -n "${dir}" ]; do
        for testdir in "tests" "test" "" ; do
            for xml in "phpunit.xml" "phpunit.xml.dist"; do
                if [ -f "${dir}/${testdir}/${xml}" ]; then
                    cmd="${cmd} --configuration=${dir}/${testdir}/${xml}"
                    break 3
                fi
            done
        done
        dir="${dir%/*}"
    done

    $cmd $@ | cat
    return ${PIPESTATUS[0]}
}

func_phpunit $@
