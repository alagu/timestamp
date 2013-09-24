require 'fileutils'
require 'json'
require 'webrick'

desc "Basic watcher and server"
task :default do
  pids = [
    spawn("compass watch"),
    spawn("coffee -w -o static -c static/*.coffee"),
    spawn("python -m SimpleHTTPServer 5000")
  ]

  trap "INT" do
    Process.kill "INT", *pids
    exit 1
  end

  loop do
    sleep 1
  end
end