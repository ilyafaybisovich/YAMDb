require 'rails_helper'

describe Movie, type: :model do

  it {is_expected.to have_db_column 'title'}
  it {is_expected.to have_db_column 'description'}
  it {is_expected.to validate_uniqueness_of 'title'}

end