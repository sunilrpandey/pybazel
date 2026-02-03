"""String utility functions."""


def reverse_string(s):
    """Reverse a string."""
    return s[::-1]


def is_palindrome(s):
    """Check if a string is a palindrome (case-insensitive)."""
    s_clean = s.lower().replace(" ", "")
    return s_clean == s_clean[::-1]


def count_vowels(s):
    """Count the number of vowels in a string."""
    vowels = "aeiouAEIOU"
    return sum(1 for char in s if char in vowels)


def capitalize_words(s):
    """Capitalize the first letter of each word."""
    return " ".join(word.capitalize() for word in s.split())


class StringProcessor:
    """A class for processing strings."""

    def __init__(self, text):
        """Initialize with a text string."""
        self.text = text

    def get_length(self):
        """Return the length of the text."""
        return len(self.text)

    def get_word_count(self):
        """Return the number of words in the text."""
        return len(self.text.split())

    def to_upper(self):
        """Convert text to uppercase."""
        return self.text.upper()

    def to_lower(self):
        """Convert text to lowercase."""
        return self.text.lower()
