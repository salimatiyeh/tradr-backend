class TradeItem < ApplicationRecord
  belongs_to :trade
  belongs_to :listing
  belongs_to :owner
end
