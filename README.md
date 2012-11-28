# Dirtle

Database done right.

## What?

Dirtle is a fast, in-memory, persistent JSON store for node.js
with synchroneous access.

## How?

Easy.

1. Install it.

  ``` bash
  npm i dirtle
  ```

2. Create the database.

  ``` bash
  echo '{}' > db.json
  ```

3. Use it.

  ``` js
  var Dirtle = require('dirtle');
  var path = require('path');
  var db = new Dirtle(path.join(__dirname, 'db.json')).db;

  db.users = [];
  db.users.push({ name : 'hohoho' });
  db.pages = {
      home: 'Home Page',
      profile: 'My Profile'
  };
  ```

## How does it work?

When creating an instance of `Dirtle`,
the Database is being loaded into memory _synchroneously_
from a JSON file.
It is being dumped non-blockingly to disk once every 470 milliseconds by default
and once when the application exits.

You use it just like a native Object in JavaScript.
However, it has to pass through JSON.stringify or the app will crash.


## API

```js
var db = new Dirtle(path[, timeout]).db;
```
`path` is the path to the database json text file.
`timeout` is an optional timeout in ms, when the db will be persisted to disk
(default 470ms).
