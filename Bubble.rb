def sort_array(a)
    j=a.length
    while j>1
     for i in 0...a.length-1
        if(a[i]>a[i+1])
            
            a[i], a[i+1] = a[i+1], a[i]
        end
     end
    j=j-1
    end
        return a
    end
    a=[4,3,78,2,0,2]
    ppsort_array(a)
    