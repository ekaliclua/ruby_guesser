require "json"

class Store
  def initialize(store_path = nil)
    @store_path = store_path || File.join(Dir.pwd, "store#{Time.now.to_i}.json")
    @data = {}
    self.load
  end

  def save()
    if self.init_file then
      return
    end
    
    f = File.open(@store_path, 'w')
    f.write(@data.to_json)
    f.close

    puts "Saved #{@data.size} entr#{@data.size == 1 ? "y" : "ies"} to #{@store_path}"
  end

  def update(key, value)
    p key.class
    @data[key] = value
    puts "Update #{key} = #{value}"
    p @data
  end

  private
  def init_file()
    if !File.exist?(@store_path) || !File.file?(@store_path) then
      f = File.new(@store_path, 'w')
      f.write(@data.to_json)
      f.close

      true
    end
  end

  def load()
    if self.init_file then
      return
    end

    f = File.read(@store_path)
    fileSize = f.size
    @data = JSON.parse(f)

    puts "Loaded save (#{fileSize} byte#{'s' if fileSize > 1})"
  end
end