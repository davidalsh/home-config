---
name: commit
description: Stage and commit the current working changes using Conventional Commits. Use when the user asks to "commit", "cmt", "make a commit", or otherwise wants to record changes. Writes a Conventional Commits subject ("type(scope): short description") and never adds a Claude or Anthropic Co-Authored-By trailer.
---

# Commit

Stage and commit the current working changes following the Conventional Commits spec. NEVER add a Claude / Anthropic Co-Authored-By trailer, generated-by note, or any other AI-attribution line — the commit must read as if the user authored it.

## Steps

Run these commands in parallel to inspect state:

- `git status` (without `-uall`)
- `git diff` (staged + unstaged)
- `git log --oneline -10` to match the repo's existing tone

Then:

1. Decide the Conventional Commits **type** based on the actual change:
   - `feat` — new user-facing capability
   - `fix` — bug fix
   - `refactor` — internal restructuring, no behavior change
   - `perf` — performance improvement
   - `docs` — documentation only
   - `test` — tests only
   - `build` — build system, dependencies, packaging
   - `ci` — CI config / workflows
   - `chore` — tooling, configs, housekeeping that doesn't fit above
   - `style` — formatting only (no logic change)
2. Pick a short **scope** in parentheses — the module, package, directory, or feature most affected (e.g. `auth`, `api`, `deploy`, `agent`). Lowercase. Omit the scope entirely (`feat: ...`) only if no single area dominates.
3. Write the **subject** in the imperative mood, lowercase, no trailing period, under ~72 chars. Describe the *why* or the user-visible effect, not the file names.
4. Subject line only — NEVER add a body, explanation paragraph, or bullet list. If the change is too complex for a single subject, split it into multiple commits instead.
5. Stage files explicitly by name (never `git add -A` / `git add .`). Skip anything that looks like secrets (`.env`, credentials, keys). Warn the user before committing those.
6. Commit with `git commit -m "<subject>"` — a single `-m` flag, no HEREDOC, no second `-m`.
7. Run `git status` after to confirm the commit landed.

## Format

```
<type>(<scope>): <short description>
```

Single line. No body. No trailers.

Examples:

- `feat(auth): add magic-link login`
- `fix(api): handle empty pagination cursor`
- `refactor(agent): extract tool registry into module`
- `ci(deploy): read GCP project ID from vars`
- `chore: bump uv lockfile`

## Hard rules

- NEVER write a body, explanation paragraph, or bullet list. Commits are subject-only.
- NEVER include `Co-Authored-By: Claude ...`, `Co-Authored-By: Anthropic ...`, `Generated with Claude Code`, or any similar attribution.
- NEVER use `--amend` unless the user explicitly asks. If a pre-commit hook fails, fix the issue and create a NEW commit.
- NEVER use `--no-verify` to skip hooks unless the user explicitly asks.
- NEVER push unless the user explicitly asks.
- If there are no changes to commit, say so — do not create an empty commit.
- If multiple unrelated changes are staged, ask whether to split them before committing.
