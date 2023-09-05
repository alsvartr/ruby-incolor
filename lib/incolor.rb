# coding: utf-8
# incolor.rb - Library for colorizing console output
#
# This file is part of the incolor project
# Copyright (C) 2010 Pavel Nazarov

class String
	@@colors = Hash[
		'reset'	=> '0',
		'bold'		=> '1',
		'ul'		=> '4',
		'frame'	=> '7',
		'black'	=> '30',
		'red'		=> '31',
		'green'	=> '32',
		'yellow'	=> '33',
		'blue'		=> '34',
		'pink'		=> '35',
		'cyan'	=> '36',
		'white'	=> '37',
	]

	def tags?
		if self =~ /<.+?>.+?\/>/
			return true
		else return false
		end
	end

	def colorize(string)
		string.scan(/<.+?>.+?\/>/) do |s|
			color = s.scan(/<[a-z]+>/)[0][1..-2]
			text = s.scan(/>.+\//)[0][1..-2]
			code = "\e[#{@@colors[color]}m"
			std = "\e[#{@@colors['reset']}m"

			string = string.sub(s, "#{code}#{text}#{std}")
		end

		return string
	end

	def incolor
		string = self
		until string.tags? == false
			string = colorize(string)
		end

		begin
			printf string
		rescue
			puts string
		end
	end

end
