#!/usr/bin/python3

import webbrowser
import sys

if len(sys.argv) > 1:
    address = ' '.join(sys.argv[1:])

webbrowser.open('https://www.youtube.com/search?q=' + address)
