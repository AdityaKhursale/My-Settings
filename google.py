import webbrowser
import sys

if len(sys.argv) > 1:
    address = ' '.join(sys.argv[1:])

webbrowser.open('https://www.google.com/search?q=' + address)
