module PageObject
  module Platforms
    module WatirWebDriver
      module TableRow

        #
        # Return the PageObject::Elements::TableCell for the index provided.  Index
        # is zero based.  If the index provided is a String then it
        # will be matched with the text from the columns in the first row.
        #
        def [](idx)
          idx = find_index_by_title(idx) if idx.kind_of?(String)
          Object::PageObject::Elements::TableCell.new(element[idx], :platform => :watir_webdriver)
        end

        #
        # Returns the number of columns in the table.
        #
        def columns
          element.wd.find_elements(:xpath, child_xpath).size
        end

        private

        def find_index_by_title(title)
          table = element.parent
          first_row = table[0]
          first_row.cells.find_index {|column| column.text == title}
        end

      end
    end
  end
end
