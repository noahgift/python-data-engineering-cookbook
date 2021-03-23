[![Python application test with Github Actions](https://github.com/noahgift/python-data-engineering-cookbook/actions/workflows/python-publish.yml/badge.svg)](https://github.com/noahgift/python-data-engineering-cookbook/actions/workflows/python-publish.yml)


# Python Data Engineering Cookbook
Some recipes for data engineering with Python

![data-engineering-tool](https://user-images.githubusercontent.com/58792/112189504-752dcf80-8bda-11eb-8f1b-8993107236c7.png)


## decli.py

This is a "teaching" tool that shows how a library like Pandas, or potentially Spark can be combined to do operations on a data set.  Different columns can be selected for "grouping" and different columns for "applying" and the "apply" itself can be any function you write.

* Create a source a Python virtualenv 
```python3 -m venv ~/.pyde && source ~/.pyde/bin/activate```


### How to interact with Commandline tool (Click Framework):


Check Version:

```
 ./csvutil.py --version
csvutil.py, version 0.1
```

Check Help:

```
./csvutil.py --help   
Usage: csvutil.py [OPTIONS] COMMAND [ARGS]...

  CSV Operations Tool



Options:
  --version  Show the version and exit.
  --help     Show this message and exit.
```

Aggregate CSV

```
./csvcli.py cvsagg --file ext/input.csv --column last_name
Processing csvfile: ext/input.csv and column name: last_name
{"count":{"mcgregor":34,"lee":3,"norris":27}}
```

Note, a different files leads to different conclusions.  Here is an NBA dataset where the AGE of players is grouped and then the sum of all three-pointers per game are summed by age.

```
 ./csvcli.py cvsops --file ext/nba-2017.csv --groupby AGE --applyname 3P --func npsum   
Processing csvfile: ext/nba-2017.csv and groupby name: AGE and applyname: 3P
2021-03-22 12:51:50,628 - nlib.utils - INFO - Loading appliable functions/plugins: npmedian
2021-03-22 12:51:50,628 - nlib.utils - INFO - Loading appliable functions/plugins: npsum
2021-03-22 12:51:50,628 - nlib.utils - INFO - Loading appliable functions/plugins: numpy
2021-03-22 12:51:50,628 - nlib.utils - INFO - Loading appliable functions/plugins: tanimoto
AGE
19     4.2
20     9.6
21    13.7
22    11.1
23    18.4
24    17.3
25    18.5
26    28.0
27    13.1
28    26.7
29    16.8
30    11.1
31    14.1
32     8.3
33     3.7
34     1.7
35     3.7
36     2.8
38     1.5
39     1.9
40     1.5
Name: 3P, dtype: float64
```

Seperately, the AGE of the players can be used to generate a median wikipedia pageview by AGE.

```
 ./csvcli.py cvsops --file ext/nba-2017.csv --groupby AGE --applyname PAGEVIEWS --func npmedian 
Processing csvfile: ext/nba-2017.csv and groupby name: AGE and applyname: PAGEVIEWS
2021-03-22 12:50:24,365 - nlib.utils - INFO - Loading appliable functions/plugins: npmedian
2021-03-22 12:50:24,365 - nlib.utils - INFO - Loading appliable functions/plugins: npsum
2021-03-22 12:50:24,365 - nlib.utils - INFO - Loading appliable functions/plugins: numpy
2021-03-22 12:50:24,365 - nlib.utils - INFO - Loading appliable functions/plugins: tanimoto
AGE
19     453.00
20     456.50
21     334.50
22     187.50
23     271.25
24     368.50
25     182.75
26     547.50
27     189.00
28     368.25
29     169.50
30     131.25
31     427.00
32     315.00
33     267.50
34     489.50
35     685.50
36     416.00
38    2960.00
39     862.00
40    2891.50
Name: PAGEVIEWS, dtype: float64
```
