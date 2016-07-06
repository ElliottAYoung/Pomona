require "pomona/version"

module Pomona
  def self.names_by_ids(tree_array, ids, names=[])
    tree_array.each do |hash_val|
      if ids.empty?
        return names
      elsif ids.include?(hash_val[:id])
        names << hash_val[:name]
        ids.delete(hash_val[:id])
      end

      if hash_val[:children].any?
        Pomona.names_by_ids(hash_val[:children], ids, names)
      end
    end

    names
  end

  def self.get_all_by_keys(tree_array = [], keys = [], values = [])
    tree_array.each do |hash_val|
      values << hash_val.values_at(*keys)
      if hash_val[:children].any?
        Pomona.get_all_by_keys(hash_val[:children], keys, values)
      end
    end

    values
  end
end
