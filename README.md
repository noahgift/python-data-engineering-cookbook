# python-data-engineering-cookbook
Some recipes for data engineering with Python

## decli.py

Command-line tool that takes plugins that perform operations on CSV files.



## How to interact with Commandline tool (Click Framework):


Check Version:

```
(.pai-aws) ➜  pai-aws git:(master) ✗ ./csvutil.py --version
csvutil.py, version 0.1
```

Check Help:

```
(.pai-aws) ➜  pai-aws git:(master) ✗ ./csvutil.py --help   
Usage: csvutil.py [OPTIONS] COMMAND [ARGS]...

  CSV Operations Tool



Options:
  --version  Show the version and exit.
  --help     Show this message and exit.
```

Aggregate CSV

```
(.pai-aws) ➜  pai-aws git:(master) ✗ ./csvcli.py cvsagg --file ext/input.csv --column last_name
Processing csvfile: ext/input.csv and column name: last_name
{"count":{"mcgregor":34,"lee":3,"norris":27}}
```

Testing a bigger file than the assignment:

```
(.pai-aws) ➜  pai-aws git:(master) ✗ ./csvcli.py cvsagg --file ext/large_input.csv --column last_name 
Processing csvfile: ext/large_input.csv and column name: last_name
{"count":{"mcgregor":34,"lee":3,"norris":27},"random_column":{"mcgregor":57,"lee":61,"norris":100}}
```
