# search for external go imports
go_search_imports ()
{( # run as subshell
    if [[ "$1" == "-h" ]]; then
        echo "usage: <dnikku/proj> [github.com]"
        return 0
    fi

    if [ ! -d $GOPATH ]; then
        echo "env GOPATH not set."
        return 1
    fi

    dir=$1
    repo=${2:-github.com}

    abs_dir="$GOPATH/src/$repo/$dir"
    if [ ! -d $abs_dir ]; then
        echo "dir: $abs_dir not found"
        exit 2
    fi

    # escape
    dir=$(echo "$dir" | sed 's/\//\\\//g; s/\./\\\./g')
    repo=$(echo "$repo" | sed 's/\//\\\//g; s/\./\\\./g')

    cd "$abs_dir"
    find . -type f -name *.go | {
        while read file; do
            echo $file
            sed -n "/^\\/\\//d; /$dir/d; /$repo/p" $file
        done
    } | sed -n '/^\./{x; /\n/{p; s/\n//g;}; D}; H'
)}
