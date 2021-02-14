# extract_words.py

import re
import collections

original = open("./text_data/metamorphosis.txt", "r")
allwords = open("./text_data/allwords.txt", "a")
uniqwords = open("./a3_novelvisualization/data/uniquewords.txt", "a")
wordfreq = open("./a3_wordfrequency/data/wordfrequency.txt", "a")

for x in original:
    x = x.lower()
    x = re.sub(r'[^\w\s]','',x)
    allwords.write(x)
    
allwords.close()

allwords = open("./text_data/allwords.txt", "r")

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
