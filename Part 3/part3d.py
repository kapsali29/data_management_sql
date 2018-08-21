import cx_Oracle
b_prev = []
pathBegin = []
pathEnd = []
path_weight = []
sorted_path = []
path_weights = []
def myfunc(a,b,td,A,B,D):
	global b_prev
	global paths
	if b not in A:
		pathBegin.append(a)
		pathEnd.append(b)
		path_weight.append(td)
		return td
	else:
		for aa,bb,dd in zip(A,B,D):
			if b == aa:
				b = bb
				b_prev.append(bb)
				td = td+dd
				myfunc(a,b,td,A,B,D)
				return td






conn = cx_Oracle.connect('user_4/oracle@orads')
cur = conn.cursor()
cur.execute("""select A,B,D from streets where direction = 'F'""")
result = cur.fetchall()
A = []
B = []
D = []
for item in result:
	A.append(item[0])
	B.append(item[1])
	D.append(item[2])


for a,b,d in zip(A,B,D):
	path_weights.append(myfunc(a,b,d,A,B,D))

pathBegin,pathEnd,path_weight = zip(*sorted(zip(path_weight,pathBegin,pathEnd)))

for begin,end,weight in zip(pathBegin,pathEnd,path_weight):
	sorted_path.append(begin)
	sorted_path.append(end)
	sorted_path.append(weight)
	print(begin,end,weight)
print('\n')
print('Sorted Paths (ascending order):\n')
print(sorted_path)
print('\n')
print('The maximum path is:\n')
max_path = sorted_path[len(sorted_path) -3 :len(sorted_path)]
print(max_path)


