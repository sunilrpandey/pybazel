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
    args = [
        "test_calculator.py",
        "-v",
    ],
    main = "test_calculator.py",
    legacy_create_init = False,
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
    args = [
        "test_string_utils.py",
        "-v",
    ],
    main = "test_string_utils.py",
    legacy_create_init = False,
)
