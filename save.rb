require "json"

SAVE_PATH = 'guesser.json'

class Save
  def initialize()
    @data = {}

    self.load
  end

  def save()
  end

  def load()
    if !File.exist?(SAVE_PATH) || !File.file?(SAVE_PATH) then
      f = File.new(SAVE_PATH, 'w')
      f.write(@data)
      f.close

      return
    end

    f = File.read(SAVE_PATH)
    fileSize = f.size
    @data = JSON.parse(f)
    
    puts "Loaded save (#{fileSize} byte#{'s' if fileSize > 1})"
  end

  def update(key, value)
    @data[key] = value
    puts "Update #{key} = #{value}"
    p @data
  end
end

e = Save.new()
e.update("wins", 4)