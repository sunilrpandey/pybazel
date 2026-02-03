#!/bin/bash
# Script to run tests with Bazel

set -e

echo "======================================"
echo "Running Bazel Tests"
echo "======================================"

# Run all tests
bazel test //src/tests:test_calculator \
           //src/tests:test_string_utils \
           --test_output=all

echo ""
echo "======================================"
echo "All tests passed!"
echo "======================================"
