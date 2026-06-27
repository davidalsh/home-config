"""Command-line interface for the todo app."""

from __future__ import annotations

import argparse

from todo import storage
from todo.models import Status
from todo.utils import render_list


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(prog="todo", description="A tiny todo list.")
    sub = parser.add_subparsers(dest="command", required=True)

    add = sub.add_parser("add", help="add a new task")
    add.add_argument("title", help="task description")

    done = sub.add_parser("done", help="mark a task as done")
    done.add_argument("id", type=int, help="task id")

    sub.add_parser("list", help="show all tasks")
    return parser


def run(argv: list[str] | None = None) -> int:
    args = build_parser().parse_args(argv)
    tasks = storage.load()

    if args.command == "add":
        task = tasks.add(args.title)
        print(f"added #{task.id}: {task.title}")
    elif args.command == "done":
        task = tasks.get(args.id)
        if task is None:
            print(f"no task with id {args.id}")
            return 1
        task.mark(Status.DONE)
        print(f"completed #{task.id}")
    elif args.command == "list":
        print(render_list(tasks))

    storage.save(tasks)
    return 0

