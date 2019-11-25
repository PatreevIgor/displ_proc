require 'pry'

class DisplProc
  def initialize(collection)
    @collection = collection
    @processed_data = {}
  end

  def puts_current_percent(collection_element)
    processed_data.merge!(collection_element)
    puts curr_percent(processed_data)
  end

  private

  attr_accessor :processed_data
  attr_reader :collection

  def curr_percent(processed_data)
    100 - ((collection.size - processed_data.size) * 100 / collection.size)
  end
end

class SomeClass
  def some_method
    collection = { 1 => 's1', 2 => 's2', 3 => 's3', 4 => 's4', 5 => 's5', 6 =>'s6', 7 => 's7', 8 => 's8', 9 => 's9',
                   10 => 's10', 11 => 's11', 12 => 's12', 13 => 's13', 14 => 's14', 15 => 's15' }
    collection.each do |k, v|
      collection_element = { k => v }

      memo_displ_proc(collection).puts_current_percent(collection_element)
    end
  end

  private

  def memo_displ_proc(collection)
    @displ_proc ||= DisplProc.new(collection)
  end
end


SomeClass.new.some_method

