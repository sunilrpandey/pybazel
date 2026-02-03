# Quick Start Guide

## 🚀 Getting Started in 3 Steps

### Step 1: Setup Environment
```bash
# Activate virtual environment
source cov_env/bin/activate

# Install dependencies (if not already installed)
pip install -r requirements.txt
```

### Step 2: Run Tests
```bash
# Option A: Simple test run
pytest -v

# Option B: With coverage
./run_coverage.sh
```

### Step 3: View Results
```bash
# Open coverage report in browser
xdg-open coverage_html/index.html  # Linux
open coverage_html/index.html       # macOS
```

## 📊 Current Test Coverage

✅ **30 tests** | ✅ **100% coverage**

```
Module                          Statements  Missing  Coverage
---------------------------------------------------------------
src/calculator.py                     22        0    100.00%
src/string_utils.py                   21        0    100.00%
src/sub_src/data_processor.py         27        0    100.00%
---------------------------------------------------------------
TOTAL                                 70        0    100.00%
```

## 📁 Project Structure

```
pybazel/
├── src/                          # Source code
│   ├── calculator.py            # Math operations
│   ├── string_utils.py          # String utilities
│   ├── tests/                   # Module tests
│   │   ├── test_calculator.py
│   │   └── test_string_utils.py
│   └── sub_src/                 # Sub-module
│       ├── data_processor.py
│       └── tests/
│           └── test_data_processor.py
├── tests/                        # Integration tests
│   └── test_integration.py
├── run_coverage.sh              # Run with coverage
├── requirements.txt             # Python dependencies
└── coverage_html/               # Coverage reports
```

## 🔧 Available Commands

### Testing
```bash
# Run all tests
pytest -v

# Run specific test file
pytest src/tests/test_calculator.py -v

# Run specific test class
pytest src/tests/test_calculator.py::TestCalculator -v

# Run specific test
pytest src/tests/test_calculator.py::TestCalculator::test_add -v
```

### Coverage
```bash
# Full coverage with all reports
./run_coverage.sh

# Coverage with terminal output only
pytest --cov=src --cov-report=term-missing

# Coverage for specific module
pytest --cov=src.calculator tests/
```

### Bazel (Advanced)
```bash
# Build all targets
bazel build //...

# Run all tests
bazel test //...

# Run specific test
bazel test //src:test_calculator

# Run with coverage
./run_bazel_coverage.sh
```

## 📈 Understanding Coverage Reports

### Terminal Output
Shows coverage percentage and missing lines:
```
src/calculator.py     100%
src/string_utils.py   100%
```

### HTML Report (Recommended)
- **Green lines**: Covered by tests ✅
- **Red lines**: Not covered by tests ❌
- **Yellow lines**: Partially covered (branch) ⚠️

Navigate to specific files to see line-by-line coverage.

### XML Report
Used by CI/CD tools:
- Jenkins (Cobertura plugin)
- SonarQube
- Codecov
- Coveralls

## 🎯 Best Practices

1. **Run tests before committing**
   ```bash
   pytest -v
   ```

2. **Check coverage regularly**
   ```bash
   ./run_coverage.sh
   ```

3. **Maintain high coverage**
   - Aim for 80%+ coverage
   - 100% for critical modules

4. **Write meaningful tests**
   - Test edge cases
   - Test error conditions
   - Test integration points

## 🐛 Troubleshooting

### Issue: "No module named 'src'"
**Solution**: Run tests from project root directory

### Issue: Tests fail with import errors
**Solution**:
```bash
# Ensure virtual environment is activated
source cov_env/bin/activate

# Reinstall dependencies
pip install -r requirements.txt
```

### Issue: Coverage shows 0%
**Solution**:
```bash
# Verify source path in .coveragerc
cat .coveragerc | grep source

# Should show: source = src
```

## 📦 CI/CD Integration

### GitHub Actions
```yaml
- run: pip install -r requirements.txt
- run: pytest --cov=src --cov-report=xml
- uses: codecov/codecov-action@v3
```

### Jenkins
```groovy
sh 'pytest --cov=src --cov-report=xml'
cobertura coberturaReportFile: 'coverage.xml'
```

### GitLab CI
```yaml
script:
  - pytest --cov=src --cov-report=xml
coverage: '/TOTAL.*\s+(\d+%)$/'
```

## 🎓 Learning Resources

- **Pytest Docs**: https://docs.pytest.org/
- **Coverage.py**: https://coverage.readthedocs.io/
- **Bazel Python**: https://github.com/bazelbuild/rules_python

## 📞 Need Help?

Check [README.md](README.md) for detailed documentation.
