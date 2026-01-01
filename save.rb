require "json"

SAVE_PATH = 'guesser.json'

class Save
  def initialize()
    @data = {}
    self.load
  end

  def save()
    if !File.exist?(SAVE_PATH) || !File.file?(SAVE_PATH) then
      f = File.new(SAVE_PATH, 'w')
      f.write(@data.to_json)
      f.close

      return
    end
    
    f = File.open(SAVE_PATH, 'w')
    f.write(@data.to_json)
    f.close
  end

  def load()
    if !File.exist?(SAVE_PATH) || !File.file?(SAVE_PATH) then
      f = File.new(SAVE_PATH, 'w')
      f.write(@data.to_json)
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