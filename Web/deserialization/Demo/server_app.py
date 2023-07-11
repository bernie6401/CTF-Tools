import pickle

serialized = bytes.fromhex(input('Data: '))
pickle.loads(serialized)