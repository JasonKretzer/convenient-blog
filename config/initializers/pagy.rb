Pagy::DEFAULT[:items] = 10 # items per page
Pagy::DEFAULT[:size] = [1, 4, 4, 1] # nav bar links

require "pagy/extras/overflow"
# redirect to the first page if someone puts in a page that is higher than our last page
Pagy::DEFAULT[:overflow] = :first_page

Pagy::DEFAULT.freeze
