class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end
  
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end
  #w/ak
  def self.find(id)
    Gossip.all[id.to_i]
  end
  
  def self.update(new_author,new_content,id)
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << csv_line
    end
    all_gossips[id.to_i][0] = new_author
    all_gossips[id.to_i][1] = new_content
   CSV.open("./db/gossip.csv", "w") do |gossip_csv|
    all_gossips.each do |line|
    gossip_csv << line
    end 
  end
end

end