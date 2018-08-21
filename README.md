
## Part 1: Startup Company Data

Create the tables, companies and acquisitions. The column names for each table can
be derived from the first column of the two corresponding CSV files. The companies table
contains basic information about each startup's market, status, funding, and related times and
locations. The acquisitions table contains acquisition amount, times, and locations.
Load (import) the data from the CSV files into the tables. This might take a while…
After having successfully created the tables and inserted all data to them, you will have to
write SQL queries to answer the following questions. You should create a VIEW with the
appropriate results for each of them.
For example for Part1.a create a View as:

CREATE VIEW q1a AS
-- YOUR SQL CODE HERE
;

Part 1.a:
For all companies whose status column contains 'acquired', show the associated acquisition
price_amount (if there is no acquisition record, price_amount should be returned as NULL).
Output: company_name, price_amount

Part 1.b:
How many startups, according to this data, were founded (founded_at column) between 2012
and 2014, inclusive (on or after 2012-01-01, and before or on 2014-12-31)?
Output: a number (column name doesn't matter)
Part 1.c:
What is/are the state(s) that has/have the largest number(s) of startups in the "Security"
market (i.e. market column contains the word "Security")? (Plural due to ties)
Output: the state(s) and the corresponding number(s), column named "state" and "total"
respectively.
Notes:
- If the output is tied, then display all (i.e. if both CA and NY have, say 1000 startups, then
display both states)
- The state must be valid (i.e. not "")
Part 1.d:
Which cities have a larger number of acquirers than startups?
Note: a startup could be counted as an acquirer, but it should only be counted at most once in
each category and the data is not very clean (i.e. duplicates in company_name entry)

Part 1.b:
How many startups, according to this data, were founded (founded_at column) between 2012
and 2014, inclusive (on or after 2012-01-01, and before or on 2014-12-31)?
Output: a number (column name doesn't matter)
Part 1.c:
What is/are the state(s) that has/have the largest number(s) of startups in the "Security"
market (i.e. market column contains the word "Security")? (Plural due to ties)
Output: the state(s) and the corresponding number(s), column named "state" and "total"
respectively.
Notes:
- If the output is tied, then display all (i.e. if both CA and NY have, say 1000 startups, then
display both states)
- The state must be valid (i.e. not "")
Part 1.d:
Which cities have a larger number of acquirers than startups?
Note: a startup could be counted as an acquirer, but it should only be counted at most once in
each category and the data is not very clean (i.e. duplicates in company_name entry)

## Part 2: Linear Algebra

Consider two random 3x3 (N = 3) matrices A and B, having the following schema:
i INT: Row index
j INT: Column index
val INT: Cell value

Note: all of your answers below must work for any square matrix sizes, i.e. any value of N.
Part 2.a: Matrix transpose
Transposing a matrix A is the operation of switching its rows with its columns- written 𝐴𝑇 .
For example, if we have:
A = [𝑔 𝑑 𝑎 ℎ 𝑏 𝑒 𝑓 𝑐 𝑖]
Then the transpose matrix of A would be:
𝐴𝑇 = �𝑎 𝑏 𝑐 𝑑 𝑓 𝑒 𝑔 ℎ 𝑖 �

First, run the scripts in Part2.sql and create the tables A and B filling them with data.
After that, write a single query to get the matrix transpose 𝐴𝑇 (in the same format as A, output
tuples should be of format (i; j; val) where i is row, j is column, and the output is ordered by
row then column index).
Part 2.b: Dot product I
The dot product of two vectors α = [𝑎1 𝑎2 … 𝑎𝑛] and b = [𝑏1 𝑏2 … 𝑏𝑛] is
𝑎 · 𝑏 = � 𝑎𝑖 𝑏𝑖 = 𝑎1 𝑏1 + 𝑎2 𝑏2+ . . . + 𝑎𝑛 𝑏𝑛
𝑛
𝑖=1
Write a single query to take the dot product of the second column of A and the third column
of B.
Part 2.c: Dot product II
Write a single query to take the dot product of the second row of A and the third column of B.
Part 2.d: Matrix multiplication
The product of a matrix A (having dimensions n X m) and a matrix B (having dimensions
m X p) is the matrix C (of dimension n _X p) having cell at row i and column j equal to:
𝐶
𝑖𝑗 = � 𝐴𝑖𝑘𝐵𝑘𝑗
𝑚
𝑘=1
In other words, to multiply two matrices, get each cell of the resulting matrix C, Cij , by taking
the dot product of the ith row of A and the jth column of B. Write a single SQL query to get
the matrix product of A and B (in the same format as A and B).

## Part 3: The Traveling Salesman Problem (the… SQL version)
First, run the script in Part3.sql that creates the table streets and inserts data into it. The
table contains information about streets connecting company office buildings.
You should take into account that all streets are included twice, as A  B (direction F) and B
 A (direction R).
Then, you have to answer the following questions:
Part 3.a:
A salesman has stopped at AUEB University. He wants to steal some valuable results
acquired by Data Science MSc students, and then sell them to a company within 10 miles of
AUEB, passing through no more than 3 distinct streets.
Write a SQL query, to find all such companies. Your query should return tuples (company,
distance) where distance is cumulative from AUEB.

Part 3.b:
Then, he/she wants to find all routes- and their distances- that will take him/her from a
company A to a company B, with the following constraints:
• The route must pass through AUEB
• A and B must each individually be within 3 hops of AUEB
• The total distance must be <= 15
• A and B must be different companies
If you return a path A  B, also include B  A in your answer. In order to make your
answer a bit cleaner, you may split into two queries, one of which creates a VIEW.
Part 3.c:
A tree is an undirected graph where each node has exactly one parent (or, is the root, and has
none), but may have multiple children. A slightly more formal definition of a tree is as
follows: An undirected graph T is a tree if it is connected- meaning that there is a path
between every pair of nodes- and has no cycles (informally, closed loops). Suppose that we
guarantee the following about our graph of companies and streets:
• It is connected
• It has no cycles of length > 3
Write a SQL query which, if our graph is not a tree, turns it into a tree by deleting exactly one
street (= two entries in our table). Create a new table streets2 with the same structure and
data as streets. Then apply your deletion query on streets2.
Part 3.d:
Use SQL and Python to find the furthest (by distance) pair of companies that still have a path
of streets connecting them. Your query should return returning a single tuple of the form (A,
B, distance).
Note: Be careful of trivial cycles in the graph! Especially if you write recursive functions in
your python code, note that IPython handles hitting the max recursion depth pretty poorly (i.e.
crashes / freezes up)
