require_relative 'author'
require 'json'

module AuthorUtils
  def add_author
    print 'Enter first name: '
    f_name = gets.chomp
    print 'Enter last name: '
    l_name = gets.chomp
    author = Author.new(f_name, l_name)
    File.write('authors.json', JSON.generate([])) unless File.exist? 'authors.json'
    authors = JSON.parse(File.read('authors.json'))
    authors << { 'first_name' => author.first_name, 'last_name' => author.last_name }
    File.write('authors.json', JSON.generate(authors))
  end

  def list_authors
    authors = JSON.parse(File.read('authors.json'))
    if authors.empty?
      puts 'No author in catalog yet!'
    else
      authors.each do |author|
        puts "First name: #{author['first_name']}"
        puts "Last name: #{author['last_name']}"
        puts ''
      end
    end
  end
end
