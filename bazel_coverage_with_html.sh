#!/bin/bash
# Run bazel coverage and generate HTML from the tests

set -e

echo "======================================"
echo "Running: bazel coverage //src/tests/..."
echo "======================================"

# Run bazel coverage
bazel coverage //src/tests/...

echo ""
echo "======================================"
echo "Generating HTML Coverage Report"
echo "======================================"

# Activate virtual environment
if [ -d "cov_env" ]; then
    source cov_env/bin/activate
fi

# Run pytest with coverage to generate HTML
# This uses the pyproject.toml configuration
python -m pytest src/tests/ --cov=src --cov-report=html:coverage_html --cov-report=xml:coverage.xml --cov-report=term-missing -v

echo ""
echo "======================================"
echo "Coverage Complete!"
echo "======================================"

# Output the absolute path
COVERAGE_PATH="$(pwd)/coverage_html/index.html"
if [ -f "$COVERAGE_PATH" ]; then
    echo "✓ HTML Coverage Report Generated"
    echo ""
    echo "Path: $COVERAGE_PATH"
    echo ""
    echo "View with:"
    echo "  python3 -m http.server 8000 -d coverage_html"
    echo "  Then open: http://localhost:8000"
else
    echo "✗ HTML generation failed"
    exit 1
fi
