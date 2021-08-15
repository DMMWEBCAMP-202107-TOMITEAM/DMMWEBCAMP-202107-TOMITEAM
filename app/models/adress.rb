class Adress < ApplicationRecord

  eunm production_status:{
    "販売中": 0,
    "売り切れ": 1
  }

  belouns_to :client
end
