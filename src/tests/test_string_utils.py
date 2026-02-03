"""Tests for string utilities module."""
import pytest
from src.string_utils import (
    reverse_string,
    is_palindrome,
    count_vowels,
    capitalize_words,
    StringProcessor
)


class TestStringFunctions:
    """Test cases for string utility functions."""

    def test_reverse_string(self):
        """Test string reversal."""
        assert reverse_string("hello") == "olleh"
        assert reverse_string("Python") == "nohtyP"
        assert reverse_string("") == ""
        assert reverse_string("a") == "a"

    def test_is_palindrome(self):
        """Test palindrome detection."""
        assert is_palindrome("racecar") is True
        assert is_palindrome("A man a plan a canal Panama") is True
        assert is_palindrome("hello") is False
        assert is_palindrome("") is True

    def test_count_vowels(self):
        """Test vowel counting."""
        assert count_vowels("hello") == 2
        assert count_vowels("AEIOU") == 5
        assert count_vowels("xyz") == 0
        assert count_vowels("Programming") == 3

    def test_capitalize_words(self):
        """Test word capitalization."""
        assert capitalize_words("hello world") == "Hello World"
        assert capitalize_words("python programming") == "Python Programming"
        assert capitalize_words("") == ""


class TestStringProcessor:
    """Test cases for StringProcessor class."""

    def test_get_length(self):
        """Test getting text length."""
        processor = StringProcessor("Hello World")
        assert processor.get_length() == 11

    def test_get_word_count(self):
        """Test word counting."""
        processor = StringProcessor("Hello World Python")
        assert processor.get_word_count() == 3

    def test_to_upper(self):
        """Test uppercase conversion."""
        processor = StringProcessor("hello")
        assert processor.to_upper() == "HELLO"

    def test_to_lower(self):
        """Test lowercase conversion    ."""
        processor = StringProcessor("HELLO")
        assert processor.to_lower() == "hello"
