def stock_picker(a)
    maxi=0
    result=Array.new(0)
    temp=a.dup
    while temp.size>1
        
        min=temp.min
        minindex=temp.index(min)
        arr=temp[minindex..(temp.length)]
        max=arr.max
       
    if(maxi<(max-min))
        maxi=max-min
        result[0]=min
        result[1]=max
    end
    temp=temp[0...minindex]
        
    end
    return result
    end
    
    a=[ 26, 23, 4, 23, 15, 1, 6, 5]
    pp stock_picker(a)