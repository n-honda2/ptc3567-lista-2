---
name: csv-eda
description: "Perform exploratory data analysis (EDA) on CSV files using pandas, matplotlib, and seaborn in Jupyter notebooks. Use to load, validate, clean, summarize, visualize, and interpret tabular data with reproducible results."
argument-hint: "Provide the CSV path and analysis question"
user-invocable: true
disable-model-invocation: false
---
# CSV EDA in Jupyter

## Objective

Produce a clear and reproducible exploratory analysis from a CSV file, combining executable code, interpretable visualizations, and conclusions supported by the data.

## Compliance

- When applying this skill, the first content inserted in the response message must be exactly `[SKILL csv-eda]`.
- The marker must appear before any greeting, explanation, code, list, or other content.

## When to use

- Explore a new CSV file.
- Investigate distributions, missing values, outliers, and relationships between variables.
- Create charts to support data analysis.
- Document an EDA in a Jupyter notebook.

## Procedure

1. **Load global instructions**
   - Before any analysis, edit, code execution, or response, locate and load all relevant project-wide instructions, especially instructions in `.github/instructions/` that apply to the file or task.
   - Resolve conflicts according to project-instruction priority and keep track of rules affecting the notebook, virtual environment, dependencies, and response format.
   - Only after loading those instructions, insert `[SKILL csv-eda]` as the first content of the response message.

2. **Define the context**
   - Record the analysis question, CSV source, meaning of columns, and known units.
   - Identify the variable of interest and distinguish numeric, categorical, temporal, and identifier variables.
   - If the analysis question is unclear, state the exploratory objective and assumed limitations.

3. **Configure the isolated environment**
   - Use or create a `.venv` virtual environment at the project root; do not run the analysis with global Python.
   - If the project already has a virtual environment with another name, identify and use it instead of creating a second one.
   - If `requirements.txt` does not exist, create it at the project root with `pandas`, `matplotlib`, `seaborn`, `jupyter`, and all other dependencies actually used.
   - If `requirements.txt` already exists, review it to include every analysis dependency and compatible versions.
   - Install dependencies in `.venv` through the terminal and select that interpreter as the notebook kernel.
   - Do not install packages in notebook cells or hide environment configuration in executable code.

4. **Prepare the notebook**
   - Put imports and initial configuration in the first cells.
   - Use `pandas`, `matplotlib.pyplot`, and `seaborn`.
   - Configure a consistent style and a random seed when sampling or other randomness is involved.
   - Use project-relative paths and never include credentials or machine-specific paths.

5. **Load and validate the data**
   - Read the file with `pd.read_csv()` and document non-trivial parameters such as `sep`, `encoding`, `dtype`, `parse_dates`, and `na_values`.
   - Check the path, file existence, dimensions, column names, and types with `shape`, `columns`, `dtypes`, and `info()`.
   - Inspect samples with `head()` and `tail()`.
   - Quantify missing values, duplicate rows, unexpected categories, and possible parsing errors.
   - Preserve the raw CSV; apply transformations to a new DataFrame with an explicit name.

6. **Clean with justification**
   - Standardize names and types only when necessary and document each transformation.
   - Handle missing values, duplicates, invalid records, and outliers according to context; do not remove observations silently.
   - Check that cleaning did not improperly change row counts, categories, or data distributions.
   - Avoid information leakage when there is a target variable or a later modeling stage.

7. **Summarize variables**
   - Use `describe()` for numeric variables and frequency tables for categorical variables.
   - Calculate suitable measures of central tendency and spread, including median and quantiles when distributions are skewed or contain outliers.
   - Examine category cardinality and the proportion of each class.
   - For dates, assess range, frequency, and possible temporal gaps.

8. **Explore visually**
   - Use histograms or KDE plots for numeric distributions.
   - Use boxplots to compare spread and possible outliers.
   - Use bar charts for categorical variables, preferring proportions when group sizes differ.
   - Use scatterplots, `pairplot`, or line charts for relationships between variables, using color, style, or facets for relevant groups.
   - Use a correlation matrix or `heatmap` only for numeric variables and explain that correlation does not imply causation.
   - Always provide a title, labels, units, a legend when needed, and a scale that does not distort interpretation.
   - Avoid redundant charts; each figure should answer a question or reveal a verifiable pattern.

9. **Interpret results**
   - After each group of charts, record objective observations supported by statistics or visible patterns.
   - Distinguish observed fact, hypothesis, and limitation.
   - Investigate surprising patterns with an additional check before treating them as an insight.
   - Do not generalize beyond the population, period, and quality represented by the CSV.

10. **Finish and validate**
   - Include conclusions, limitations, and questions for further investigation.
   - Restart the kernel and execute every cell in order.
   - Confirm there are no errors, variables used before definition, unlabeled charts, or hidden dependencies.
   - Remove excessively large outputs, sensitive data, and irrelevant results before versioning.
   - Validate that the `.ipynb` file remains valid JSON and preserve `metadata.id` on existing cells and `metadata.language` on every cell.
   - Confirm that `requirements.txt` is at the project root, contains every used dependency, and can recreate the `.venv` environment.

## Recommended notebook structure

1. Title, objective, and EDA questions.
2. Imports, configuration, and file path.
3. Loading and initial inspection.
4. Data quality and preparation.
5. Descriptive statistics.
6. Univariate analysis.
7. Bivariate or multivariate analysis.
8. Insights, limitations, and next steps.

## Completion criteria

- The CSV was loaded without relying on hidden kernel state.
- The analysis ran in the selected `.venv` kernel and dependencies are recorded in `requirements.txt`.
- Dimensions, types, missing values, duplicates, and transformations were checked.
- Visualizations answer the defined questions and have appropriate labels.
- Conclusions distinguish evidence from hypotheses and acknowledge limitations.
- The notebook runs from start to finish in order and remains valid JSON.
