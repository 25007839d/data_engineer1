# 1 What are global, protected and private attributes in Python? 
**Global variables**
are public variables that are defined in the global scope. To use the variable in the global
scope inside a function, we use the global keyword. 

 **Protected attributes**
 are attributes defined with an underscore prefixed to their identifier eg. _sara.
 They can still be accessed and modified from outside the class they are defined in but a 
 responsible developer should refrain from doing so. 

**Private attributes**
are attributes with double underscore prefixed to their identifier eg. __ansh.
They cannot be accessed or modified from the outside directly and will result in an 
AttributeError if such an attempt is made.


# 2 What is lambda in Python? Why is it used?

A lambda function is a small anonymous function in Python.
It can have any number of arguments but only one expression.

## Why is it used?

* To create short, throwaway functions without formally defining them using def.
* Very useful in situations where a function is needed only once or for a short scope.
* Often used with higher-order functions like map(), filter(), reduce(), and sorted().

# 3 What are Generators?
Generators are special functions in Python that return an iterator using the yield keyword 
instead of return.
They allow you to generate values one at a time, rather than computing and storing all values 
at once.
They are memory-efficient because values are produced on-demand (lazy evaluation).

## Why use Generators?

* Memory efficiency → they don’t store the entire result in memory.
* Faster performance for large datasets.
* Useful in streaming/real-time data processing where data is too large to fit in memory.

# 4 Files
File is the collection of data that is available to a program. We can retrieve and use data 
stored in a file whenever we required.

## Advantages:-

* Stored Data is permanent unless someone remove it.
* Stored data can be shared.
* It is possible to update or remove the data.

## Type of Files

* Text File – It stores data in the form of characters. It is used to store characters and strings.
* Binary File – It stores data in the form of bytes, a group of 8 bits each. It is used to store 
text, images, pdf, csv, video and audio.

## Text Mode and Binary Mode
* Text Mode – A file opened in text mode, treats its contents as if it contains text strings of
the str type. 
When you get data from a text mode file, Python first decodes the raw bytes using either a 
platform-dependent encoding or, specified one.

* Binary Mode – A file opened in Binary Mode, Python uses the data in the file without any
decoding, binary mode file reflects the raw data in the file.

**Text File Mode**
| Mode | Meaning                                                                        | Notes                                  |
| ---- | ------------------------------------------------------------------------------ | -------------------------------------- |
| `r`  | Read (default). File pointer at start.                                         | **Error** if file doesn’t exist.       |
| `w`  | Write. Creates new file or **overwrites** existing file.                       |                                        |
| `x`  | Create + Write. Fails if file already exists.                                  | Useful for safety (avoid overwriting). |
| `a`  | Append. Creates file if not exists, pointer at **end**.                        | Doesn’t erase old data.                |
| `r+` | Read + Write (update). Pointer at **start**.                                   | Requires file to exist.                |
| `w+` | Write + Read. Creates file if not exists, but **overwrites** existing content. |                                        |
| `a+` | Append + Read. Creates file if not exists, pointer at **end**.                 | Reads allowed, writes only append.     |

**Binary File Mode**
| Mode  | Meaning                                                        | Notes                                           |
| ----- | -------------------------------------------------------------- | ----------------------------------------------- |
| `rb`  | Read binary. Pointer at start.                                 | **Error** if file doesn’t exist.                |
| `wb`  | Write binary. Creates new file or **overwrites** existing.     | Used for binary files (e.g., writing an image). |
| `xb`  | Create binary. Fails if file already exists.                   | Safe create.                                    |
| `ab`  | Append binary. Creates if not exists, pointer at end.          | Does not erase existing data.                   |
| `rb+` | Read + Write binary. Requires file to exist. Pointer at start. |                                                 |
| `wb+` | Write + Read binary. Overwrites if exists, else creates new.   |                                                 |
| `ab+` | Append + Read binary. Creates if not exists, pointer at end.   |                                                 |


# 5. Pickling and unpickling

**What is Pickling?*
Pickling = Converting a Python object → Byte stream (so it can be stored in a file or
transferred across a network).

**What is Unpickling?**
Unpickling = Converting back that byte stream → Original Python object.

## Pickle Functions

* pickle.dump(obj, file)
Purpose: Serializes (pickles) a Python object and writes it directly to a binary file.
Returns: None (it writes to the file, not to a variable).

* pickle.load(file)
Purpose: Reads a pickled object from a binary file and deserializes (unpickles) it back into a Python object.
Returns: Original Python object.

## Use Cases:
* Save ML/DL models (e.g., scikit-learn, XGBoost) for reuse without retraining.
* Store Python objects (lists, dicts, custom classes) in files or databases.
* Checkpointing – Save program state or intermediate results for long-running jobs.
* Data transfer – Send Python objects across a network between processes or systems.
* Caching – Store pre-computed results (e.g., API responses, processed data) to load quickly later.