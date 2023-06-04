require 'test_helper'

class BulletinsControllerTest < ActiveSupport::TestCase
  test 'show Bulletins index' do
    bulletin1 = bulletins('bulletin_1')
    assert bulletin1.id == 1
    assert bulletin1.title == 'Bulletin 1'
    assert bulletin1.body == 'Bulletin Body 1'
    assert bulletin1.published == true
  end
end
