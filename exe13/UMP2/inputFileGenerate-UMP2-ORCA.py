
cnt = []
for i in range(7):
	cnt.append( ( i + 8 ) / 10  )

for i in range(23):
	cnt.append( ( 2 * i + 16 ) / 10 )

for i in cnt:
	filename = r"BH-" + str(i) + "-UMP2-O.inp" 
	with open(filename, 'w') as file_object:
		file_object.write("! UHF MP2 aug-cc-pVQZ pal8 VeryTightSCF MOread\n\n")
		file_object.write(f'%moinp "BH-{str(i)}-UHF-O.gbw"\n\n')
		file_object.write("*xyz 0 1\n")
		file_object.write(" B\t0.0\t0.0\t0.0\n")
		file_object.write(f" H\t{i}\t0.0\t0.0\n")
		file_object.write("*")
