require './git_reader'

reader = GitReader.new("https://api.github.com/users/dhh/events/public")
reader.execute_calculation
