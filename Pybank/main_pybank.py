import os 
import csv


csvpath=os.path.join("..","Instructions","Pybank","Resources","budget_data.csv")
csvpath


with open(csvpath, mode="r") as csvfile:
    csvreader = csv.reader(csvfile,delimiter=",") 
    first_=next(csvreader)
    data=list(csvreader)
    length=len(data) 
    total = sum(int(col[1]) for col in data)  
    init_value=int(data[0][1])
    profit=[]
    for i in data:
        change =int(i[1])-init_value
        profit.append(change)
        init_value=(int(i[1]))
    average="{:.2f}".format(sum(profit)/(len(profit)-1))
    increase=max(profit)
    decrease=min(profit)
    months_increase=profit.index(max(profit))
    months_decrease=profit.index(min(profit))
    in_month=data[months_increase][0]
    de_month=data[months_decrease][0]
    print("Financial Analysis")
    print("----------------------------")
    print("Total months: "+ str(length))
    print(f"Total:${str(total)}")
    print("Average Change:$"+str(average))
    print("Greatest Increase in Profits: "+str(in_month)+" ("+str(increase)+")")
    print("Greatest Decrease in Profits: "+str(de_month)+" ("+str(decrease)+")")
   

pybanktxt = open("Pybank.txt", "w")
print("Financial Analysis", file=pybanktxt)
print("----------------------------", file=pybanktxt)
print("Total months: "+ str(length), file=pybanktxt)
print("Total:$"+str(total), file=pybanktxt)
print("Average Change:$"+str(average), file=pybanktxt)
print("Greatest Increase in Profits: "+str(in_month)+" ("+str(increase)+")", file=pybanktxt)
print("Greatest Decrease in Profits: "+str(de_month)+" ("+str(decrease)+")", file=pybanktxt)
pybanktxt.close()


