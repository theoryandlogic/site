ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => 'db/main.db')

begin
  ActiveRecord::Schema.define do 
    create_table :contacts do |t|
      t.string :name, :null => false
      t.string :email, :null => false
      t.string :website
      t.text :message, :null => false
      t.timestamps
    end
  end
rescue ActiveRecord::StatementInvalid
end

class Contact < ActiveRecord::Base
  validates_presence_of :name, :email, :message

end