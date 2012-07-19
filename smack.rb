#!/usr/bin/env ruby

# DO NOT USE THIS.  Use smack, written in Perl, instead.
# The purpose of this is to compare Perl regexp matching with that of Ruby.
# Ruby is only about 50% slower than Perl on this task.

# However, ptools has a File.binary? method that is absurdly slow.
# The timing is without the binary? test, which multiplies time by about 20.

require 'find'
require 'ptools'

Find.find('.') do |path|
  if FileTest.file?(path)# && !File.binary?(path)
    File.open(path, 'rb').each_with_index do |line, lineno|
      print "#{path}:#{lineno}: #{line}" if line =~ /#{ARGV[0]}/o
    end
  end
end
