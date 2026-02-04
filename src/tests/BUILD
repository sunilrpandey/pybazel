load("@rules_python//python:defs.bzl", "py_test")

py_test(
    name = "test_calculator",
    srcs = [
        "__init__.py",
        "test_calculator.py",
    ],
    deps = [
        "//src:calculator",
        "@pip_deps//pytest",
        "@pip_deps//pytest_cov",
        "@pip_deps//coverage",
    ],
    main = "test_calculator.py",
    env = {"COVERAGE_FILE": ".coverage"},
)

py_test(
    name = "test_string_utils",
    srcs = [
        "__init__.py",
        "test_string_utils.py",
    ],
    deps = [
        "//src:string_utils",
        "@pip_deps//pytest",
        "@pip_deps//pytest_cov",
        "@pip_deps//coverage",
    ],
    main = "test_string_utils.py",
    env = {"COVERAGE_FILE": ".coverage"},
)
