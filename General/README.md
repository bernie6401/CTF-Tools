# How to use?
## d8
According to [this page](https://v8.dev/docs/d8), d8 is a V8’s own developer shell which is an useful tool for running some JavaScript locally or debugging changes you have made to V8. 

And use the command `./d8`, you will get into d8 shell or use the command `./d8 {js script}` to execute js script directly.

```bash
$ ./d8
V8 version 9.1.0 (candidate)
d8> console.log('test')
test
undefined
$ echo "console.log('test')" > ./test.js
$ ./d8 test.js
test
```