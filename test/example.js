var Dirtle = require('../');
var path = require('path');
var db = new Dirtle(path.join(__dirname, 'example-db.json')).db;
db.users = [];
db.users.push({ name : 'hohoho' });
db.pages = {
  home: 'Home Page',
  profile: 'My Profile'
};
