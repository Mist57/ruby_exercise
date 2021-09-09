def substring(find,dic)
    find=find.downcase
    temp=""
    hash=Hash.new(0)
    for i in 0...dic.length
        result=find.scan(dic[i]).length
            hash[dic[i]]+=result unless result==0
    end
    
    pp hash
    end
    dic = ["below","down","go","going","horn","low","howdy","it","i","below","own","part","partner","below"]
    find="below";
    substring(find,dic)