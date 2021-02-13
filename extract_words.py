# extract_words.py

import re
import collections

original = open("metamorphosis.txt", "r")
allwords = open("allwords.txt", "a")
uniqwords = open("uniquewords.txt", "a")
wordfreq = open("wordfrequency.txt", "a")

for x in original:
    x = x.lower()
    x = re.sub(r'[^\w\s]','',x)
    allwords.write(x)
    
allwords.close()

allwords = open("allwords.txt", "r")

uniq = {}

for x in allwords:
    line = x.split()
    for word in line:
        if word not in uniq:
            uniq[word] = 1
        else:
            uniq[word] += 1
            
            
for k in uniq.keys():
    uniqwords.write(k + "\n")
    
uniqwords.close()

freq = {}
for v in uniq.values():
    if v not in freq:
        freq[v] = 1
    else:
        freq[v] += 1
        

        
od = collections.OrderedDict(sorted(freq.items()))
for k, v in od.items():
    wordfreq.write(str(k) + ": " + str(v) + "\n")
    
wordfreq.close()
