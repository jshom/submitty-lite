#!/usr/bin/env bash
function test() {
  TEST_NUM=1
  TEST_CASES_DIR="test-cases"
  TEST_OUT_DIR="test-runs"

  # check that test-cases directory exists
  if [[ -z $(ls $TEST_CASES_DIR 2> /dev/null) ]]; then

    # Print error if no command (route) found
    RED='\033[0;33m'
    NC='\033[0m' # No Color
    printf "${RED}Error: directory $TEST_CASES_DIR does not exist${NC}\n"
    exit 0
  fi

  # assume test-cases already exists
  # promp the user to input test cases

  mkdir -p $TEST_OUT_DIR

  # while test exists, incrememnt
  CONTINUE_TESTING=1
  while [[ $CONTINUE_TESTING -eq 1 ]]; do

    # test and compare
    echo ""
    echo "--------------------------"
    echo "RUNNING TEST NUMBER: $TEST_NUM"
    echo "--------------------------"
    echo ""

    # in,out,expected paths
    IN="$TEST_CASES_DIR/$TEST_NUM-in.txt"
    OUT="$TEST_OUT_DIR/$TEST_NUM-out.txt"
    EXPECTED="$TEST_CASES_DIR/$TEST_NUM-out.txt"

    # run hw and diff output with test case

    # allow multiple input types in future (stdin & cli args)
    ./a.out < $IN &> $OUT
    colordiff $OUT $EXPECTED -y --width=80

    # increment test
    TEST_NUM=$(($TEST_NUM + 1))

    # if another test exists, continue
    TEST_CHECK=$(ls "$TEST_CASES_DIR/$TEST_NUM-in.txt" 2> /dev/null)
    if [[ -z "$TEST_CHECK" ]]; then
      CONTINUE_TESTING=0
    fi
  done
}
