require 'slim'
require 'cgi'
require 'optparse'

def join_path(path, file)
  path.nil? ? file : File.join(path, file)
end

opts = ARGV.getopts('o:')
args = ARGV.parse!

args.each do |path|
  html_path = join_path(opts['o'], "#{File.basename(path, '.slim')}.html")
  html = CGI.pretty(Slim::Template.new(path).render(self))
  File.open(html_path, 'w') { |f| f.puts(html) }
end
