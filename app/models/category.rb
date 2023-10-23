class Category < ActiveHash::Base
  self.data = [
    { id: 1, category: '---' },
    { id: 2, category: 'シュート' },
    { id: 3, category: 'ドリブル' },
    { id: 4, category: 'ショートパス' },
    { id: 5, category: 'ロングパス' },
    { id: 6, category: 'ヘディング' },
    { id: 7, category: 'トラップ' },
    { id: 8, category: 'ディフェンス' },
    { id: 9, category: 'リフティング' },
    { id: 10, category: 'セービング' },
    { id: 11, category: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end