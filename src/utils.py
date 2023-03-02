def capitalizeWords(words: list) -> list:
    """
    Captialize each word in a list of words.
    """
    return [capitalize(word) for word in words]


def capitalize(string):
    """
    Capitalize the first letter of a string.

    Yes, ignore the fact that string.capitalize() exists.
    """
    return string[0].upper() + string[1:]
