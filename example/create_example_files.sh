#!/bin/bash
TEST_PATH='/tmp/pristine/example/'
mkdir -p "$TEST_PATH"{a,b} && touch $TEST_PATH/a/c $TEST_PATH/a/d
