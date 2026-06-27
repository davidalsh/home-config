# example-project

A tiny todo-list CLI — a playground for navigating files in Neovim.

## Layout

```
example-project/
├── main.py              # entry point
├── todo/
│   ├── __init__.py      # package exports
│   ├── models.py        # Task, TaskList, Status
│   ├── storage.py       # save/load JSON
│   ├── cli.py           # argparse command handling
│   └── utils/
│       ├── __init__.py
│       └── formatting.py # pretty-printing
└── tests/
    └── test_models.py
```

## Run

```sh
cd ~/example-project
python main.py add "buy milk"
python main.py list
python main.py done 1
```

## Test

```sh
python -m pytest
```
