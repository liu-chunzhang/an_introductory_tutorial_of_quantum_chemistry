#Convert geometry (final, input orientation) in all Gaussian .out files in current folder to .gjf file by Multiwfn
#!/bin/bash
icc=0
nfile=`ls *.out|wc -l`
for inf in *.out
do
((icc++))
echo Converting ${inf} to ${inf//out/gjf} ... \($icc of $nfile\)
Multiwfn ${inf} << EOF > /dev/null
100
2
10
${inf//out/gjf}
0
q
EOF
done
