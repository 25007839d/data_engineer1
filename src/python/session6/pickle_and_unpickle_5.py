import pickle, time

def expensive_function():
    time.sleep(3)  # simulate heavy work
    return {"data": [1,2,3,4,5]}

# First run: compute & pickle
result = expensive_function()
with open("cache.pkl", "wb") as f:
    pickle.dump(result, f)
#Opens (or creates) cache.pkl in write-binary mode ("wb").
#Serializes (dump) result and

# Later run: load cached result
with open("cache.pkl", "rb") as f:
    cached_result = pickle.load(f)
#Opens cache.pkl in read-binary mode ("rb").
#Deserializes (load) the bytes back into a Python object → cached_result.
print("Loaded from cache:", cached_result)


