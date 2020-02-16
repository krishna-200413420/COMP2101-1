#!/bin/bash
# This script demonstrates how the shift command works

# create an empty array to put the command line arguments into
myargs=()
# loop through the command line arguments
while [ $# -gt 0 ]; do
  # tell the user how many things are left on the command line
  echo "There are $# things left to process on the command line."
  # add whatever is in $1 to the myargs array
  myargs+=("$1")
  # tell the user what we did
  echo "Added \'$1\' to the arguments array"

# TASK 1: instead of just adding arguments to an array, use a case statement to recognize some options
#          Options to recognize: -h for help, -v for verbose mode, -d N for debug mode with N being a single digit number
#          If the help option is recognized, print out help for the command and exit
#          If the verbose option is recognized, set a variable to indicate verbose mode is on
#          If the debug optionis recognized, set a variable with the debug level from the number given after the -d on the command line
#             display an error if the user gave the -d option without a single digit number after it
#          Anything that wasn't recognized on the command line should still go into the myargs array

  # each time through the loop, shift the arguments left
  # this decrements the argument count for us
debug="off"
verbose="off"
  case "$1" in
    -h | --help)
    echo "Usage: $(basename $0) [-h|--help] [-v] [-d n]"
    echo "You can use -h or --help command to find more about command"

    ;;
    -v)
    echo "Usage: $(basename $0) [-v]"
    echo "You can use -v after the command to find verbose for that."
    verbose="on"

    ;;
    -d)
    echo "Usage: $(basename $0) [-digit]"
    echo "You can not se -d with out a single digit."
    debug="on"

    ;;

    *)
    echo "Unrecognized argument '$1'"
    exit 1
    ;;
  esac


  shift
  # tell the user we shifted things
  echo "Shifted command line, leaving $# things left to process."
  echo "--------------------------"
  # go back to the top of the loop to see if anything is left to work on
done
echo "Done"

# TASK2: display the settings and myargs contents
#         Tell the user if vebose mode is on
#         Tell the user if debug mode is on and if it is, what number it is set to
#         Print out the myargs array with a label

cat <<EOF

Verbose mode is: $verbose
debug mode is: $debug
Arguments stored in array:
------------------------------------
${myargs[@]}

EOF
