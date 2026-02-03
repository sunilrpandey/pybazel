#!/bin/bash
# Script to run tests with coverage integrated with Bazel

set -e

echo "======================================"
echo "Running Bazel Tests with Coverage"
echo "======================================"

# First, ensure dependencies are installed
if [ ! -d "bazel-bin" ]; then
    echo "Building project first..."
    bazel build //src:all //tests:all
fi

# Run tests with Bazel coverage
bazel coverage //src/tests/... \
               --combined_report=lcov \
               --instrumentation_filter="//src[/:]" \
               --test_output=errors

echo ""
echo "======================================"
echo "Bazel Coverage Complete!"
echo "======================================"
echo "Coverage data: bazel-out/_coverage/_coverage_report.dat"
echo ""
echo "To generate HTML report, run:"
echo "  genhtml bazel-out/_coverage/_coverage_report.dat -o coverage_html"
echo ""
