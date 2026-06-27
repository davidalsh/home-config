"""Pretty-printing helpers for tasks."""

from __future__ import annotations

from todo.models import Status, Task, TaskList

# Little glyphs per status, just for nicer output.
_ICONS = {
    Status.TODO: "[ ]",
    Status.DOING: "[~]",
    Status.DONE: "[x]",
}


def format_task(task: Task) -> str:
    """Render a single task as one line."""
    icon = _ICONS.get(task.status, "[?]")
    return f"{icon} #{task.id:<3} {task.title}"


def render_list(tasks: TaskList) -> str:
    """Render a whole TaskList as a multi-line string."""
    if not tasks.tasks:
        return f"({tasks.name}) no tasks yet"

    header = f"== {tasks.name} ({len(tasks.remaining())} left) =="
    lines = [header] + [format_task(t) for t in tasks.tasks]
    return "\n".join(lines)
