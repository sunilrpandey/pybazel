# Python Bazel Project with Coverage

A Python project demonstrating Bazel build system integration with pytest and coverage reporting.

## Project Structure

```
pybazel/
├── WORKSPACE                 # Bazel workspace configuration
├── requirements.txt          # Python dependencies
├── pytest.ini               # Pytest configuration
├── .coveragerc              # Coverage configuration
├── src/                     # Source code directory
│   ├── __init__.py
│   ├── BUILD                # Bazel build file for src
│   ├── calculator.py        # Calculator module
│   ├── string_utils.py      # String utilities module
│   ├── tests/               # Tests for main src modules
│   │   ├── __init__.py
│   │   ├── test_calculator.py
│   │   └── test_string_utils.py
│   └── sub_src/             # Sub-module
│       ├── __init__.py
│       ├── data_processor.py
│       └── tests/           # Tests for sub_src
│           ├── __init__.py
│           └── test_data_processor.py
├── tests/                   # Project-level integration tests
│   ├── __init__.py
│   ├── BUILD                # Bazel build file for tests
│   └── test_integration.py
├── run_tests.sh             # Script to run Bazel tests
├── run_coverage.sh          # Script to run coverage with pytest
└── run_bazel_coverage.sh    # Script to run coverage with Bazel
```

## Prerequisites

- Python 3.8+
- Bazel 6.0+
- Virtual environment (recommended)

## Setup

### 1. Create Virtual Environment (Optional but Recommended)

```bash
python3 -m venv cov_env
source cov_env/bin/activate  # On Linux/Mac
# or
cov_env\Scripts\activate  # On Windows
```

### 2. Install Python Dependencies

```bash
pip install -r requirements.txt
```

### 3. Setup Bazel Dependencies

Bazel will automatically download and setup dependencies defined in WORKSPACE when you first run a build or test command.

```bash
bazel build //src:all //tests:all
```

## Running Tests

### Option 1: Using Bazel (Recommended for CI/CD)

Run all tests with Bazel:

```bash
./run_tests.sh
```

Or run specific tests:

```bash
bazel test //src:test_calculator
bazel test //src:test_string_utils
bazel test //src:test_data_processor
bazel test //tests:test_integration
```

Run all tests at once:

```bash
bazel test //...
```

### Option 2: Using Pytest Directly

```bash
pytest -v
```

## Running Coverage

### Phase 1: Basic Testing (Completed ✓)

The project includes:
- Multiple Python modules with business logic
- Pytest test cases organized in multiple directories
- Bazel BUILD files for building and testing
- Integration tests

### Phase 2: Coverage Integration (Completed ✓)

#### Option A: Using Pytest with Coverage (Simpler)

This generates both HTML and XML coverage reports:

```bash
./run_coverage.sh
```

This will:
- Run all tests with pytest
- Generate HTML coverage report in `coverage_html/`
- Generate XML coverage report as `coverage.xml`
- Display coverage summary in terminal

View the HTML report:

```bash
open coverage_html/index.html  # On Mac
xdg-open coverage_html/index.html  # On Linux
start coverage_html/index.html  # On Windows
```

#### Option B: Using Bazel Coverage (Advanced)

```bash
./run_bazel_coverage.sh
```

This uses Bazel's native coverage support. To convert the output to HTML:

```bash
# Install lcov if not already installed
# Ubuntu/Debian: sudo apt-get install lcov
# Mac: brew install lcov

# Generate HTML from Bazel coverage data
genhtml bazel-out/_coverage/_coverage_report.dat -o coverage_html
```

#### Manual Coverage Commands

Run coverage manually:

```bash
# With pytest
pytest --cov=src --cov-report=html --cov-report=xml --cov-report=term-missing

# With Bazel
bazel coverage //... --combined_report=lcov
```

## Project Modules

### src/calculator.py
- `Calculator` class with basic math operations (add, subtract, multiply, divide, power)
- `factorial()` function for calculating factorials

### src/string_utils.py
- String utility functions: `reverse_string()`, `is_palindrome()`, `count_vowels()`, `capitalize_words()`
- `StringProcessor` class for text processing

### src/sub_src/data_processor.py
- `DataProcessor` class for data manipulation
- Filter functions: `filter_even_numbers()`, `filter_odd_numbers()`
- Sorting utilities

## Test Organization

1. **Module Tests** (`src/tests/`): Tests for main source modules
   - `test_calculator.py` - Tests for calculator functionality
   - `test_string_utils.py` - Tests for string utilities

2. **Sub-module Tests** (`src/sub_src/tests/`): Tests for sub-source modules
   - `test_data_processor.py` - Tests for data processor

3. **Integration Tests** (`tests/`): Project-level integration tests
   - `test_integration.py` - Tests combining multiple modules

## Coverage Configuration

### .coveragerc
- Configures coverage.py behavior
- Sets source directories, omit patterns
- Configures HTML and XML output

### pytest.ini
- Configures pytest behavior
- Sets test discovery patterns
- Configures coverage options

## CI/CD Integration

### For Jenkins/GitLab CI/GitHub Actions:

```yaml
# Example for GitHub Actions
- name: Run Tests with Coverage
  run: |
    pip install -r requirements.txt
    pytest --cov=src --cov-report=xml --cov-report=html

- name: Upload Coverage Reports
  uses: actions/upload-artifact@v2
  with:
    name: coverage-reports
    path: |
      coverage.xml
      coverage_html/
```

### For Bazel-based CI:

```bash
bazel coverage //... --combined_report=lcov
```

## Interpreting Coverage Reports

### Terminal Output
Shows percentage of code covered and missing lines:
```
src/calculator.py          95%   12
src/string_utils.py        98%   45
```

### HTML Report
- Open `coverage_html/index.html` in a browser
- Click on files to see line-by-line coverage
- Red lines = not covered
- Green lines = covered
- Yellow lines = partially covered (branches)

### XML Report
- `coverage.xml` can be consumed by tools like:
  - SonarQube
  - Codecov
  - Coveralls
  - Jenkins Coverage plugins

## Cleaning Up

```bash
# Clean Bazel artifacts
bazel clean

# Remove coverage reports
rm -rf coverage_html coverage.xml .coverage

# Remove Python cache
find . -type d -name __pycache__ -exec rm -rf {} +
find . -type f -name "*.pyc" -delete
```

## Troubleshooting

### Issue: "No module named 'src'"

Make sure you're running tests from the project root directory.

### Issue: Bazel test fails with import errors

Run `bazel clean` and rebuild:
```bash
bazel clean
bazel build //...
bazel test //...
```

### Issue: Coverage report shows 0%

Check that:
1. Source code is in the `src/` directory
2. `.coveragerc` has correct source path
3. Tests are actually running (check test output)

## Next Steps

1. Add more complex modules and tests
2. Integrate with CI/CD pipeline
3. Set coverage thresholds
4. Add pre-commit hooks for running tests
5. Configure branch coverage analysis
6. Add performance tests
7. Integrate with code quality tools (pylint, mypy, black)

## Resources

- [Bazel Python Rules](https://github.com/bazelbuild/rules_python)
- [Pytest Documentation](https://docs.pytest.org/)
- [Coverage.py Documentation](https://coverage.readthedocs.io/)
- [Bazel Testing Guide](https://bazel.build/reference/test-encyclopedia)

## License

MIT License - Feel free to use this as a template for your projects.
