module ItemTypeConstants
  JEANS = {code:1, name:"Jeans", types: ['Boot Cut', 'Straight', 'Skinny'], sizes: ['24-32', 'Plus Size','Special Order']}
  SHOES = {code:2, name:"Shoes", types: ['Boot', 'Dress', 'Sneakers', 'Wedge', 'Pump', 'Sandal']}


  ALL = self.constants.map(&:to_s).map{|a|"#{self.to_s}::#{a}".constantize}

  def self.find_by_code code
    item = nil
    ALL.each do |range|
      if item.nil? && range[:code] == code.to_i
        item = range
      end
    end
    item
  end
end