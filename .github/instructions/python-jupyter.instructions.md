---
name: "Python/Jupyter"
description: "Use when creating, editing, debugging, or reviewing Python files and Jupyter notebooks. Covers reproducibility, data analysis, visualization, validation, and notebook JSON structure."
applyTo: ["**/*.py", "**/*.ipynb"]
---
# Python/Jupyter

## Compliance

- When applying this instruction, the first content inserted in the response message must be exactly `[INSTRUCTION Python/Jupyter]`.
- The marker must appear before any greeting, explanation, code, list, or other content.

## Virtual environment and dependencies

- Run Python and Jupyter in a project-isolated virtual environment, preferably `.venv` at the repository root.
- Before running code, select the VS Code interpreter and kernel associated with `.venv`; do not accidentally use the global Python installation.
- Record used dependencies in `requirements.txt`, keeping package names and versions compatible with the execution environment.
- Install or update dependencies from `requirements.txt` in the terminal, never from analysis cells that run automatically.
- When imports or versions change, update `requirements.txt` and validate the analysis again in `.venv`.

## Python

- Use descriptive names for variables, functions, and modules; follow PEP 8 and keep functions small with one clear responsibility.
- Organize code into imports, constants, functions, and the main flow. Avoid global state and code that runs implicitly during imports.
- Prefer `pathlib.Path` over manual path concatenation and use project-relative paths when execution depends on repository files.
- Validate inputs and assumptions before calculating results. Handle missing values, incorrect types, duplicates, and extreme values explicitly.
- Avoid modifying input data unintentionally; use copies or clear assignments when a transformation can alter the original object.
- Do not hide dependencies in cells or scripts. Record packages and versions in an appropriate dependency file and do not install packages automatically during analysis.
- Prefer vectorized operations and the APIs of the library in use. Use loops only when they are clearer or necessary.
- Include executable tests or checks for behavior changes and run the most specific available validation after each change.

## Jupyter notebooks

- Structure the notebook as a narrative: objective, data, preparation, analysis, visualizations, conclusions, and limitations.
- Keep cells short and focused. Avoid relying on accidental execution order; restart the kernel and run every cell before considering the notebook complete.
- Put imports and configuration in early cells. Set random seeds when randomness is involved and record decisions that affect reproducibility.
- Use `display()` or the last expression in a cell for important results. Give visualizations titles, axis labels, units, and legends.
- Do not include huge outputs, sensitive data, credentials, or machine-specific paths. Clear outputs before versioning when they are not needed for review.
- Separate exploration from reusable code: extract functions into `.py` modules when logic grows or is used by more than one notebook.
- Explain result interpretations and limitations in Markdown; do not present correlation as causation without justification.

## `.ipynb` file format

- Preserve the notebook as valid JSON. Each cell must be an object inside the `cells` property.
- Every cell must declare `metadata.language` as `markdown` or `python`, according to its content.
- Preserve `metadata.id` on existing cells. New cells do not need an ID, but may receive one when compatible with the project.
- Do not change unrelated cells or rewrite the entire notebook unnecessarily; preserve its existing structure and metadata.
- After editing the JSON, validate its syntax and, when possible, execute affected cells in a configured Python environment.

## Data and paths

- Describe the data source, format, and units before analysis.
- Use `pd.read_csv()` and equivalent APIs with explicit parameters when delimiter, encoding, types, or missing-value handling is non-trivial.
- Confirm dimensions, column names and types, null values, duplicates, and basic statistics before interpreting charts or models.
- Do not overwrite the raw dataset. Save derived data separately and document relevant transformations.
