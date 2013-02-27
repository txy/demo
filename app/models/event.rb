class Event < ActiveRecord::Base
  attr_accessible :capacity, :description, :is_public, :name
  validates_presence_of :name #必填
  has_many :attendees #一个Event对应多个attendees
  belongs_to :category ##多个Event对应一个category
  #允許 @event.category 是 nil
  delegate :name, :to => :category, :prefix => true, :allow_nil => true
  has_one :location # 一个Event对应一个location
  #更新Event时，自动更新对应的location allow_destroy是說我們可以在表單中多放一個_destroy核選塊來表示刪除  :reject_if表示說在什麼條件下，就當做沒有要真的動作
  accepts_nested_attributes_for :location, :allow_destroy => true, :reject_if => :all_blank
end
