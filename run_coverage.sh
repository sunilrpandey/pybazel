#!/bin/bash
# Script to run tests with coverage using pytest directly

set -e

echo "======================================"
echo "Running Tests with Coverage"
echo "======================================"

# Activate virtual environment if it exists
if [ -d "cov_env" ]; then
    source cov_env/bin/activate
fi

# Run pytest with coverage
pytest \
    --cov=src \
    --cov-report=html:coverage_html \
    --cov-report=xml:coverage.xml \
    --cov-report=term-missing \
    --cov-config=.coveragerc \
    -v

echo ""
echo "======================================"
echo "Coverage Report Generated!"
echo "======================================"
echo "HTML Report: coverage_html/index.html"
echo "XML Report: coverage.xml"
echo ""
