
cnt = []
for i in range(7):
	cnt.append( ( i + 8 ) / 10  )

for i in range(23):
	cnt.append( ( 2 * i + 16 ) / 10 )

for i in cnt:
	filename = r"BH-" + str(i) + "-MP2-G.inp" 
	with open(filename, 'w') as file_object:
		file_object.write(f"%chk=BH-{str(i)}-MP2-G.chk\n")
		file_object.write("#p RHF/aug-cc-pVQZ MP2=FC\n\n")
		file_object.write(f"BH RMP2 at {i} Angstrom\n\n")
		file_object.write("0 1\n")
		file_object.write(" B\t0.0\t0.0\t0.0\n")
		file_object.write(f" H\t{i}\t0.0\t0.0\n")
		file_object.write("\n\n\n\n")
