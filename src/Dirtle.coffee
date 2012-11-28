fs = require 'fs'
# Cheap local in-memory DB that is backed up to disk periodically
class Dirtle
  module.exports = Dirtle
  constructor: (@path, @interval) ->
    # Write to disk every 470ms
    @interval or= 470
    # Read local backup from file @path
    # set @db
    @setupSync()
    # Periodically back the data up
    @doBackup()
    # On termination, back the data up
    process.on 'exit', @dumpSync
    # Return DB
    @db

  # Read JSON data from disk
  setupSync: =>
    @db = JSON.parse fs.readFileSync @path, 'utf8'

  # Write data to disk
  dump: (cb) =>
    fs.writeFile @path, @stringify(), 'utf8', cb

  # Dump synchroneously
  dumpSync: =>
    fs.writeFileSync @path, @stringify(), 'utf8'

  stringify: =>
    JSON.stringify @db

  doBackup: =>
    setInterval (=> @dump ->), @interval
