class Category < ActiveHash::Base
  self.data = [
    { id: 1, category: '---' },
    { id: 2, category: 'シュート' },
    { id: 3, category: 'ドリブル' },
    { id: 4, category: 'パス' },
    { id: 5, category: 'リフティング' },
    { id: 6, category: 'トラップ' },
    { id: 7, category: 'ディフェンス' },
    { id: 8, category: 'セービング' },
    { id: 9, category: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end