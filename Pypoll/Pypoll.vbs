import os 
import csv

csvpath=os.path.join("..","Instructions","Pypoll","Resources","election_data.csv")
csvpath

with open(csvpath, mode="r") as csvfile:
    csvreader = csv.reader(csvfile,delimiter=",") 
    first_=next(csvreader) 
    data=list(csvreader)
    length=len(data)
    candidates = []
    for i in data:
        if i[2] not in candidates:
                candidates.append(i[2])
    name1=[]
    name2=[]
    name3=[]
    name4=[]
    for x in data:
        if x[2]==candidates[0]:
            name1.append("khan")
        elif x[2]==candidates[1]:
            name2.append('Correy')
        elif x[2]==candidates[2]:
            name3.append('Li')
        elif x[2]==candidates[3]:
            name4.append("O'Tooley")
    percentage1='{0:.3%}'.format(len(name1)/length)
    percentage2='{0:.3%}'.format(len(name2)/length)
    percentage3='{0:.3%}'.format(len(name3)/length)
    percentage4='{0:.3%}'.format(len(name4)/length)
   
    print(f"Election Results")
    print(f"----------------------------")
    print(f"Total Votes:{length}")     
    print(f"----------------------------")
    print(f"{candidates[0]}:{percentage1}({len(name1)})")
    print(f"{candidates[1]}:{percentage2}({len(name2)})")
    print(f"{candidates[2]}:{percentage3}({len(name3)})")
    print(f"{candidates[3]}:{percentage4}({len(name4)})")
    print(f"----------------------------")
    print(f"Winner: {candidates[0]}")
    print("----------------------------")

pypolltxt = open("Pypoll.txt", "w")
print(f"Election Results",file=pypolltxt)
print(f"----------------------------", file=pypolltxt)
print(f"Total Votes:{length}", file=pypolltxt)     
print(f"----------------------------", file=pypolltxt)
print(f"{candidates[0]}:{percentage1}({len(name1)})", file=pypolltxt)
print(f"{candidates[1]}:{percentage2}({len(name2)})", file=pypolltxt)
print(f"{candidates[2]}:{percentage3}({len(name3)})", file=pypolltxt)
print(f"{candidates[3]}:{percentage4}({len(name4)})", file=pypolltxt)
print(f"----------------------------", file=pypolltxt)
print(f"Winner: {candidates[0]}", file=pypolltxt)
print("----------------------------", file=pypolltxt)
pypolltxt.close()