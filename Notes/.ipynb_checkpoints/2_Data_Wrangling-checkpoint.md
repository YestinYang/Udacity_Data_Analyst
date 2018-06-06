# Udacity Data Analyst Nano Degree

## Part 2: Data Wrangling

### Intro

#### Gather

- Coding to download: scalability and reproducibility (scientific method)

- Use `with ... as ...` when handling files, to avoid out of memory due to not closing each file used     [Context Manager](https://jeffknupp.com/blog/2016/03/07/python-with-context-managers/)

  - ```python
    with zipfile.ZipFile('armenian-online-job-postings.zip', 'r') as myzip:
        myzip.extractall()
    ```


#### Assess (what to clean next)

- Quality --> dirty (missing / invalid / wrong / inconsistent)
- Tidiness --> messy (structural issue)
  - One variable per column
  - One observation per row
  - Each type of observational unit forms a table
- Tools
  - Visual: spreadsheet for small dataset
  - Programmatic: pandas for large dataset
    - `df.head` / `df.tail` / `df.info` / `df.column.value_counts` 
- Record the assessment result for next step
  - problem only, not action

#### Clean

- Define

  - transform assessment result to pseudo code (cleaning plan)

- Code

  - start from a copy of original data frame

- Test

  - ```python
    # Use assert to verify the result programmatically
    for phrase in asap_list:
        assert phrase not in df_clean.StartDate.values
    ```

#### Other Ideas

- Re-assess and Iteration
- Wrangling and EDA (Exploratory data analysis / Feature Engineering)
- Wrangling will not improve your analysis or modeling, but just make it possible
- EDA does improve
- ETL (Extract-Transform-Load Process)
- For IT user / well-structured data / BI use case, while wrangling is for analysts user / any data / exploratory new data 
- [Data Wrangling Versus ETL: What’s the Difference?](https://tdwi.org/articles/2017/02/10/data-wrangling-and-etl-differences.aspx)


### Gather Data

#### Types of Data Source

- Flat File (like CSV / TSV, structured text file)

  - human readable / easily edit / good for small dataset
  - `pd.read_csv(<path>, [sep='<RegEx>', ...])` 

- HTML from Web Scrapping

  - Elements

    - ```html
      <p>This is a paragraph.</p>
      <h1>This is a heading.</h1>
      <span>This is a span</span>
      <img src="image.jpg" alt="a picture">
      ```

  - Trees

    - ```html
      <!-- Parent div with child h1 and p -->
      <div>
          <h1>This is a heading.</h1>
          <p>This is a paragraph.</p>
      </div>
      ```

  - `BeautifulSoup` handle html file     [Sample code](../2_Wrangling_Code/gathering_html.ipynb)

- HTTP via `requests` 

- TXT File

  - Encoding and Decoding    [The difference between UTF-8 and Unicode?](http://www.polylab.dk/utf8-vs-unicode.html)
    - **ASCII / ANSI:** 8-bits per byte stores one character, which from code 32 to 127, while the content of code 128-255 is defined by different standards
    - **Unicode:** a list of characters with unique numbers (code points)
      - "Hello" has code points as "U+0048 U+0065 U+006C U+006C U+006F"
    - **UTF-8 / UTF-16:** encoding algorithm translating info to binary to store on disk
    - Therefore, when reading a text file, app **decoding** the binary data to number, and translate into character by mapping Unicode
    - In Python, `str` is Unicode itself, `bytes` and `bytearray` needs to be decoding     [What is the difference between a string and a byte string?](https://stackoverflow.com/questions/6224052/what-is-the-difference-between-a-string-and-a-byte-string)

  - Handle a Batch of TXT File

    - Way 1: `os.listdir` to return list of all files
    - Way 2: `glob.glob(path, globbing)` to return list of specified files

  - ```python
    with open(path, encoding='urf-8') as file:  # always specify 'encoding'
        print (file.readline())  # read the first line of rest
        print (file.read())  # read all lines of rest    
    ```

- Wrapper of API （库）

  - MediaWiki API → wptools 库
  - Twitter API → tweepy 库

- JSON

  - JSON Object { } --> Python Dictionary
  - JSON Array [ ] --> Python List
  - Both can be nested
  - [Reading and Writing JSON to a File in Python](http://stackabuse.com/reading-and-writing-json-to-a-file-in-python/) 

- Structural Database via `SQLAlchemy` 

#### Constructing DataFrame

```python
# from python list of dict to DataFrame
df_list.append({'title': title,
                'score': int(score),
                'number_of_ratings': int(num_ratings)})
df = pd.DataFrame(df_list, columns = ['title', 'score', 'number_of_ratings'])
```

### Assess Data

#### Dirty and Messy

- Dirty Data -- Quality
  - Trash not belonged to bedroom
  - Wrong dose / Duplicated name
- Messy Data -- Tidiness
  - Clothes on floor of bedroom
  - Drug columns should be combined (one variable) / Patient name should be in separated table (one observational unit)
- ![](https://d17h27t6h515a5.cloudfront.net/topher/2017/October/59dc65ad_screenshot-2017-10-10-02.10.18/screenshot-2017-10-10-02.10.18.png)

#### Quality Dimensions

Ranking from high to low severity:

1. Completeness
2. Validity --> cannot reflect real world
3. Accuracy
4. Consistency

#### Detect and Document

- Visual
  - To acquire meaning of features
  - obvious dirty or messy
- Programmatic
  - `head()` `tail()` `sample()` `info()` `describe()` `value_counts()` 
  - `isnull()` `duplicated()` `sort_values()` 
  - go more details after getting some clues from above
- Documented in two parts: Quality and Tidiness
- Record observation only, no solution
  - format in `<table>: <observation>`

### Clean Data

`df.copy()` backup data before cleaning

#### Sequence of Cleaning

1. Missing data (completeness)
2. Tidiness
3. Quality

#### Define

- Start with verb to describe pseudo-code

#### Code

- `pandas.Series.str` vectorized string functions
  - `.replace` 
  - `.pad` 
  - `split(sep, maxsplit)` 
- `pandas.melt(df, id_vars, var_name, value_name` 
- `pandas.merge(left, right, on=[keys], how)` 

#### Test

- Same as assessing

