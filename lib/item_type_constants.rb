module ItemTypeConstants
  JEANS = {code:1, name:"Jeans", types: ['Boot Cut', 'Straight', 'Skinny'], sizes: ['24-32', 'Plus Size','Special Order']}
  SHOES = {code:2, name:"Shoes", types: ['Boot', 'Dress', 'Sneakers', 'Wedge', 'Pump', 'Sandal']}


  ALL = self.constants.map(&:to_s).map{|a|"#{self.to_s}::#{a}".constantize}

  MEN_SHOE_SIZES = %w(5 5.5 6 6.5 7 7.5 8 8.5 9 9.5 10 10.5 11 11.5 12 13 14 15 16)
  MEN_SHOE_SIZES_STR = MEN_SHOE_SIZES.map{|s|"#{s}M"}

  WOMEN_SHOE_SIZES =  %w(7 7.5 8 8.5 9 9.5 10 10.5 11 11.5 12)
  WOMEN_SHOE_SIZES_STR = WOMEN_SHOE_SIZES.map{|s|"#{s}W"}

  ALL_SHOE_SIZES_STR = [MEN_SHOE_SIZES_STR<<WOMEN_SHOE_SIZES_STR].flatten
  ALL_SHOE_SIZES = [MEN_SHOE_SIZES<<WOMEN_SHOE_SIZES].flatten.uniq

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