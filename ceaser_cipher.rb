def translate(a, shift)
    for i in 0...a.size
    temp=a[i].chr
         base = temp.ord < 91 ? 65 : 97
        if(temp.ord.between?(65,91) || temp.ord.between?(97,122))
            temp2=temp.ord
            temp2=(((temp2 - base) + shift) % 26) + base
        temp=temp2.chr
        end
        print temp
    end
      end
    
    translate("Hello World!",5)
    