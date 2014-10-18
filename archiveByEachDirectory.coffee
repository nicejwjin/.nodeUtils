# Created by jwjin@me.com
# Usage : run 'coffee archiveByEachDirectory.coffee' in the target directory.
# This will archive each directory on current location and will create the named of directoryName.zip files.

fs = require 'fs'
sys = require 'sys'
exec = require('child_process').exec

getDirs = (rootDir) ->
  files = fs.readdirSync(rootDir)
  dirs = []
  for file in files
    if file[0] != '.'
      filePath = "#{rootDir}/#{file}"
      stat = fs.statSync(filePath)
      if stat.isDirectory()
        dirs.push(file)
  return dirs

output = (err, stdout, stderr) ->
  if err then console.log "error: #{err}"
  if stdout then sys.print "stdout: #{stdout}"
  if stderr then sys.print "stderr: #{stderr}"

dirs = getDirs(process.cwd())

for dir in dirs
  exec "zip -r #{dir}.zip #{dir}", output



