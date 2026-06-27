#!/usr/bin/env python3
"""Entry point: run the todo CLI.

Usage:
    python main.py add "buy milk"
    python main.py list
    python main.py done 1
"""

import sys

from todo.cli import run

if __name__ == "__main__":
    sys.exit(run())

