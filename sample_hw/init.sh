#!/usr/bin/env bash  
# slit command to create directories and all necessary files to start homework 
# Assume that we are in homework dir
function start()
{
 	mkdir -p test
 	mkdir -p test-out
	cd test
	TEST_CASE_NUM=1

	INPUT_MORE_TESTS="y"
	while [[ "$INPUT_MORE_TESTS" -eq "y" ]]; do  #=~ ^([yY][eE][sS]|[yY]) +$ ]]; do 
		echo "----------------------------------------"
		echo "enter input for test case $TEST_CASE_NUM"
		echo "----------------------------------------"
		read INPUT_TEST_CASE
		echo $INPUT_TEST_CASE >> "$TEST_CASE_NUM-in.txt"

		echo "-------------------------------------------"
		echo "enter expected out for input $TEST_CASE_NUM"
		echo "-------------------------------------------"
		read INPUT_EXP_OUT
		echo $INPUT_EXP_OUT >> "$TEST_CASE_NUM-expected-out.txt"

		echo "-------------------------------------------"
		echo "enter expected err for input $TEST_CASE_NUM"
		echo "-------------------------------------------"
		read INPUT_EXP_ERR
		echo $INPUT_EXP_ERR >> "$TEST_CASE_NUM-expected-err.txt"

		echo "Do you have more test cases to add?: [y/N]"
		read INPUT_MORE_TESTS
		
		TEST_CASE_NUM=$(($TEST_CASE_NUM + 1))
	done

}

# =main
function main()
{
	read -r -p "Are you in desired homework directory? [y/N] " response 
	if [[ "$respons" -eq "y" ]] #(^([yY][eE][sS]|[yY]) +$) ]] 
		then
			start
			exit 0
	fi
	echo "Please navigate to your desired Homework Directory and run again" #with -stupid ("you piece of shit") 
}	

main

	