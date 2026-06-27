"""A few tiny tests for the models module."""

from todo.models import Status, TaskList


def test_add_creates_task():
    tasks = TaskList()
    task = tasks.add("write config")
    assert task.title == "write config"
    assert task.status is Status.TODO
    assert len(tasks) == 1


def test_mark_done():
    tasks = TaskList()
    task = tasks.add("learn neovim")
    task.mark(Status.DONE)
    assert task.is_done
    assert tasks.remaining() == []


def test_get_missing_returns_none():
    tasks = TaskList()
    assert tasks.get(999) is None
