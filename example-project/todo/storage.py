"""Load and save a TaskList as JSON on disk."""

from __future__ import annotations

import json
from pathlib import Path

from todo.models import Status, Task, TaskList

DEFAULT_PATH = Path.home() / ".todo.json"


def save(tasks: TaskList, path: Path = DEFAULT_PATH) -> None:
    """Serialize a TaskList to a JSON file."""
    payload = {
        "name": tasks.name,
        "tasks": [
            {"id": t.id, "title": t.title, "status": t.status.value}
            for t in tasks.tasks
        ],
    }
    path.write_text(json.dumps(payload, indent=2))


def load(path: Path = DEFAULT_PATH) -> TaskList:
    """Read a TaskList back from JSON, or return an empty one."""
    if not path.exists():
        return TaskList()

    data = json.loads(path.read_text())
    task_list = TaskList(name=data.get("name", "default"))
    for raw in data.get("tasks", []):
        task = Task(title=raw["title"], status=Status(raw["status"]), id=raw["id"])
        task_list.tasks.append(task)
    return task_list
