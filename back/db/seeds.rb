include FactoryBot::Syntax::Methods

2.times { create(:user) }
20.times { create(:training_item) }