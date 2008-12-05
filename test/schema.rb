ActiveRecord::Schema.suppress_messages do
  ActiveRecord::Schema.define(:version => 1) do
  
    create_table :poodles, :force => true do |t|
      t.string :name
    end
  
  end
end