#!/bin/bash
# Script to run tests with coverage integrated with Bazel

set -e

echo "======================================"
echo "Running Tests with Coverage"
echo "======================================"

# Ensure pytest and dependencies are available
if [ -d "cov_env" ]; then
    echo "Using existing cov_env virtual environment..."
    source cov_env/bin/activate
elif [ -d ".venv" ]; then
    echo "Using existing .venv virtual environment..."
    source .venv/bin/activate
else
    echo "Creating virtual environment..."
    python3 -m venv .venv
    source .venv/bin/activate
    echo "Installing dependencies..."
    pip install -q -r requirements.txt
fi

# Run tests with pytest and coverage
echo "Running tests with pytest-cov..."
python3 -m pytest src/tests/ \
    --cov=src \
    --cov-report=html:coverage_html \
    --cov-report=term \
    --cov-report=xml:coverage.xml \
    -v

echo ""
echo "======================================"
echo "Coverage Complete!"
echo "======================================"
echo "HTML report: coverage_html/index.html"
echo "XML report: coverage.xml"
echo ""
echo "To view HTML report, run:"
echo "  python3 -m http.server 8000 -d coverage_html"
echo "  Then open http://localhost:8000 in your browser"
echo ""
