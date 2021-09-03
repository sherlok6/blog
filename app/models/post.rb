class Post < ApplicationRecord
    has_many :comments
    #валидация форм presence:true,т.е. валидация возникает автоматически
    validates :title, presence: true, length: {minimum:5,maximum: 50}
    validates :content, presence: true, length: {minimum:1,maximum: 300}
end
