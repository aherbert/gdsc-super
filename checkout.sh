#!/bin/sh

# Print usage
usage() {
    echo "$0 [OPTION]... DIR"
    echo "Checkout all GDSC repositories to a directory"
    echo "Options:"
    echo "-h     Print help"
    echo "E.g. Checkout for Eclipse to folder ../gdsc"
    echo "$0 -e ../gdsc"
    exit 0
}

if [ $# = 0 ]; then
    usage
fi

# Parse options
while getopts "he" opt; do
    case $opt in
        h)
            usage
            ;;
        \?)
            echo "Invalid option -$OPTARG" >&2
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done

# Remove parsed parameters
shift $((OPTIND-1))

# Get the directory
DIR="$1"
if [ -z "$DIR" ]; then
    echo "ERROR - No directory specified"
    echo
    usage
fi

# Check for bad params
shift
if [ "$*" ]; then
    echo "ERROR - Unused parameters:$@:"
    echo
    usage
fi

# Create directory
echo $DIR
mkdir -p -- "$DIR"
if [ ! -d "$DIR" ]; then
    echo "ERROR - Failed to make directory: $DIR"
    exit 1
fi

# Checkout
cp pom.xml "$DIR"
cd "$DIR"
for d in gdsc-analytics gdsc-test gdsc-core gdsc gdsc-smlm gdsc-examples
do
    git clone https://github.com/aherbert/${d}.git
done
