from utils import capitalizeWords


def main():
    words = ['hello', 'world', 1]

    try:
        capitalizedWords = capitalizeWords(words)
        print(capitalizedWords)
    except Exception as e:
        print('Your list of words contains a non-string element.')


if __name__ == '__main__':
    main()
