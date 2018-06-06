# Udacity Data Analyst Nano Degree

## Part 3: Exploratory Data Analysis

> Keep curious and skeptical about data, test and develop intuitions of data

### Basic Commands

- `c()` — vector object, containing arguments

  - ```R
    numbers <- c(1:10)
    numbers <- c(numbers, 11:20)
    ```

- `nchar()` — count the number of each characters

  - ```R
    udacious = c("Chris Saden", "Lauren Castellano", "Sarah Spikes")
    mystery = nchar(udacious)
    ```

- Subsetting

  - ```R
    udacious[mystery == 11]
    ```

- `data()` — load data

- `str()` — feature names and their types, like `info()` in Pandas

- `summary()` — quantile info, like `describe()` in Pandas

- `table()` — counts of unique values, like `value_counts()` in pandas

- `levels()` — unique values, like `unique()` in pandas

  - ```R
    # Order the unique values for plotting
    # ses is a factor (categorical feature) containing low, mid and high
    ses.order <- ordered(ses, levels = c("low", "middle", "high"))
    
    # Alternative
    ses.order <- factor(ses, levels = c("low", "middle", "high"), ordered = T)
    ```

- `dim()` — size of R object

- `names()` — output all variable names in dataset

- `row.names()` — get and rename variable names

  - ```R
    row.names(mtcars)
    row.names(mtcars) <- c(1:32)  # rename
    ```

- `head()` — first 5 rows

- `tail()` — last 5 rows

- `$` — display particular variable

  - ```R
    mtcars$cyl
    ```

- `mean()` — average

- `rm()` — remove objects from workspace

- `getwd()` and `setwd()` — show and edit work dir

- `?[any command]` — help doc of command

### Loading & Subsetting DataFrame

- `read.csv()` — read csv file

- `subset(dataframe, ROWS, select = COLUMNS)` 

  - where COLUMNS can be `-name` as reverse expression 

- `dataframe[ROWS, COLUMNS]` 

  - ```R
    # dataframe: stateinfo
    stateinfo[stateinfo$state.region == 2, ]
    # equals to below
    subset(stateinfo, state.region == 2)
    ```

- Logical operator

  - `&` for AND
  - `|` for OR

PS: [Subsetting](https://www.statmethods.net/management/subset.html)

### Markdown in R

- RMD file —> through Knit HTML —> generate HTML file including the result of embedded R codes

  - ```R
    # Integrate R code by
    ​```{r}
    # r 块中的哈希或英镑符号会创建
    # 注释。这三行不是代码，因此不能被 # 执行。
    x <- [1:10]
    mean(x)
    ​```
    ```

### ggplot2



----

### Reference:

1. 