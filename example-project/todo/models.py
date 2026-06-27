"""Core data models for the todo app."""

from __future__ import annotations

from dataclasses import dataclass, field
from enum import Enum


class Status(Enum):
    """Lifecycle of a single task."""

    TODO = "todo"
    DOING = "doing"
    DONE = "done"


@dataclass
class Task:
    """A single todo item."""

    title: str
    status: Status = Status.TODO
    id: int = 0  # assigned by TaskList.add

    def mark(self, status: Status) -> None:
        """Move the task to a new status."""
        self.status = status

    @property
    def is_done(self) -> bool:
        return self.status is Status.DONE


@dataclass
class TaskList:
    """An ordered collection of tasks with a few helpers."""

    name: str = "default"
    tasks: list[Task] = field(default_factory=list)

    def add(self, title: str) -> Task:
        next_id = max((t.id for t in self.tasks), default=0) + 1
        task = Task(title=title, id=next_id)
        self.tasks.append(task)
        return task

    def get(self, task_id: int) -> Task | None:
        return next((t for t in self.tasks if t.id == task_id), None)

    def remaining(self) -> list[Task]:
        return [t for t in self.tasks if not t.is_done]

    def __len__(self) -> int:
        return len(self.tasks)
