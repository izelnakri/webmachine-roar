require 'pg'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'izel_roar'
)

ActiveRecord::Schema.define do
  create_table :artists, force: true do |t|
    t.string :name
    t.boolean :active
    t.datetime :since

    t.timestamps
  end

  create_table :albums, force: true do |t|
    t.string :name
    t.datetime :released_at

    t.belongs_to :artists, index: true
    t.belongs_to :ratings, polymorphic: true

    t.timestamps
  end

  create_table :songs, force: true do |t|
    t.string :name
    t.decimal :price
    t.datetime :released_at # songs could be single

    t.belongs_to :albums, index: true
    t.belongs_to :artist # songs might be single

    t.timestamps
  end

  # Polymorphic association fanciness:
  create_table :ratings, force: true do |t|
    t.decimal :rating # not very good name but ok

    t.references :details, polymorphic: true, index: true

    t.timestamps
  end

  create_table :users, force: true do |t|
    t.string :email
    t.string :auth_token

    t.datetime :last_request

    t.timestamps
  end
end

# Seed data:
