import math
import random
import string
from collections import Counter, OrderedDict
from itertools import permutations
from difflib import get_close_matches
from operator import itemgetter

# 1 Factorial
def factorial(n):
    return 1 if n<=1 else n*factorial(n-1)

def factorial_iter(n):
    f=1
    for i in range(1,n+1): f*=i
    return f

# 2 Armstrong
def armstrong(n):
    p=len(str(n))
    return n==sum(int(d)**p for d in str(n))

# 3 Prime interval
def primes(a,b):
    return [x for x in range(a,b+1) if x>1 and all(x%i!=0 for i in range(2,int(x**0.5)+1))]

# 4 Fibonacci
def fib(n):
    a,b=0,1
    res=[]
    for _ in range(n):
        res.append(a)
        a,b=b,a+b
    return res

# 5 Sum array
def sum_arr(a): return sum(a)

# 6 Largest
def largest(a): return max(a)

# 7 Rotation
def rotate(a,k): return a[k:]+a[:k]

# 8 Reverse rotation
def rev_rotate(a,k): return a[-k:]+a[:-k]

# 9 Split add
def split_add(a,k): return a[k:]+a[:k]

# 10 product remainder
def prod_rem(a,n):
    p=1
    for i in a: p*=i
    return p%n

# 11 swap first last
def swap_fl(a):
    a[0],a[-1]=a[-1],a[0]
    return a

# 12 swap two
def swap(a,i,j):
    a[i],a[j]=a[j],a[i]
    return a

# 13 remove nth occurrence
def remove_nth(lst,word,n):
    c=0
    res=[]
    for w in lst:
        if w==word:
            c+=1
            if c==n: continue
        res.append(w)
    return res

# 14 length
def length(a): return len(a)

# 15 exists
def exists(a,x): return x in a

# 16 clear
def clear(a):
    a.clear()
    return a

# 17 reverse list
def reverse(a): return a[::-1]

# 18 copy
def copy(a): return a.copy()

# 19 count occurrence
def count_occ(a,x): return a.count(x)

# 20 sum list
def sum_list(a): return sum(a)

# 21 multiply
def multiply(a):
    p=1
    for i in a: p*=i
    return p

# 22 smallest
def smallest(a): return min(a)

# 23 largest again
def largest2(a): return max(a)

# 24 second largest
def second_largest(a): return sorted(set(a))[-2]

# 25 even list
def even(a): return [x for x in a if x%2==0]

# 26 odd list
def odd(a): return [x for x in a if x%2]

# 27 even range
def even_range(a,b): return [x for x in range(a,b+1) if x%2==0]

# 28 odd range
def odd_range(a,b): return [x for x in range(a,b+1) if x%2]

# 29 count even odd
def count_eo(a):
    e=len([x for x in a if x%2==0])
    return e,len(a)-e

# 30 positive list
def positive(a): return [x for x in a if x>=0]

# 31 negative list
def negative(a): return [x for x in a if x<0]

# 32 positive range
def pos_range(a,b): return [x for x in range(a,b+1) if x>=0]

# 33 negative range
def neg_range(a,b): return [x for x in range(a,b+1) if x<0]

# 34 count pos neg
def count_pn(a):
    p=len([x for x in a if x>=0])
    return p,len(a)-p

# 35 remove multiple
def remove_multi(a,rem):
    return [x for x in a if x not in rem]

# 36 remove empty tuples
def remove_empty(a):
    return [x for x in a if x]

# 37 duplicates
def duplicates(a):
    return list(set([x for x in a if a.count(x)>1]))

# 38 cumulative sum
def cum_sum(a):
    res=[]
    s=0
    for i in a:
        s+=i
        res.append(s)
    return res

def chunks(a,n):
    return [a[i:i+n] for i in range(0,len(a),n)]

# 39 sort list by another
def sort_by(a,b):
    return [x for _,x in sorted(zip(b,a))]

# 40 palindrome + reverse words
def palindrome(s): return s==s[::-1]
def rev_words(s): return " ".join(s.split()[::-1])

# 41 remove ith char
def remove_i(s,i): return s[:i]+s[i+1:]

# 42 substring + length
def substring(s,sub): return sub in s
def strlen(s): return len(s)

# 43 even length words
def even_words(s): return [w for w in s.split() if len(w)%2==0]

# 44 all vowels
def all_vowels(s): return set("aeiou").issubset(set(s.lower()))

# 45 matching chars
def match(s1,s2): return len(set(s1)&set(s2))

# 46 vowels + remove duplicates
def count_vowel(s): return sum(1 for c in s if c.lower() in "aeiou")
def rem_dup_str(s): return "".join(dict.fromkeys(s))

# 47 special char
def special(s): return any(c in string.punctuation for c in s)

def rand_until(target):
    chars=string.ascii_lowercase
    s=""
    while s!=target:
        s="".join(random.choice(chars) for _ in range(len(target)))
    return s

def words_gt_k(s,k): return [w for w in s.split() if len(w)>k]

# 48 remove ith
def remove_i2(s,i): return s[:i]+s[i+1:]

# 49 split join
def split_join(s): return "-".join(s.split())

# 50 binary string
def binary(s): return all(c in "01" for c in s)

# 51 close matches
def close(word, lst): return get_close_matches(word,lst)

# 52 uncommon words
def uncommon(s1,s2):
    return list(set(s1.split())^set(s2.split()))

# 53 swap comma dot
def swap_cd(s): return s.replace(',', 'temp').replace('.', ',').replace('temp','.')

# 54 permutation
def perm(s): return list("".join(p) for p in permutations(s))

# 55 url check + exec
def has_url(s): return "http" in s or "www" in s
def exec_code(code): exec(code)

# 56 rotate string
def rotate_str(s,k): return s[k:]+s[:k]

# 57 recursive deletion
def empty_by_delete(s):
    if not s: return True
    return empty_by_delete(s[1:-1])

# 58 duplicate chars
def dup_char(s): return [c for c in set(s) if s.count(c)>1]

# 59 sort dict
def sort_dict(d): return dict(sorted(d.items()))

# 60 missing keys + multiple inputs
def multi_input_dict(keys,vals):
    return dict(zip(keys,vals))

# 61 sum dict
def dict_sum(d): return sum(d.values())

# 62 remove key + sort list of dict
def remove_key(d,k):
    d.pop(k,None)
    return d

def sort_list_dict(lst):
    return sorted(lst,key=lambda x:x['key'])

# 63 itemgetter + lambda
def sort_itemgetter(lst):
    return sorted(lst,key=itemgetter('key'))

# 64 merge dict + grade
def merge(d1,d2): return {**d1,**d2}

def grade(m):
    if m>=90:return "A"
    elif m>=75:return "B"
    elif m>=50:return "C"
    else:return "Fail"

# 65 order check
def order_check(s,pattern):
    return list(OrderedDict.fromkeys(s)).index(pattern[0]) < list(OrderedDict.fromkeys(s)).index(pattern[1])

# 66 anagram subset
def anagram_subset(lst):
    c=Counter(["".join(sorted(w)) for w in lst])
    return max(c.values())

# 67 remove duplicate words
def rem_dup_words(s):
    return " ".join(dict.fromkeys(s.split()))

# 68 mirror chars + frequency
def mirror(s):
    return "".join(chr(219-ord(c)) if c.isalpha() else c for c in s)

def freq(a):
    d={}
    for i in a:
        d[i]=d.get(i,0)+1
    return d

# 69 list of tuples to dict
def tuple_dict(lst): return dict(lst)

# 70 counter intersection
def counter_intersection(s1,s2):
    return Counter(s1)&Counter(s2)

# 71 equal freq
def equal_freq(s):
    c=Counter(s)
    return len(set(c.values()))==1


