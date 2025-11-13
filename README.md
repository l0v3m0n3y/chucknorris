# chucknorris
api for chucknorris.io random joke by Chuck Norris
# Example
```nim
import asyncdispatch, chucknorris, json, strutils
let data = waitFor random_jokes()
echo data
```

# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
