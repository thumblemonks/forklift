Gem::Specification.new do |s|
  s.name     = "forklift"
  s.version  = "0.1.0"
  s.date     = "2008-12-05"
  s.summary  = "IT'S FORKLIFT DUMMY"
  s.email    = %w[gus@gusg.us gabriel.gironda@gmail.com]
  s.homepage = "http://github.com/thumblemonks/forklift/tree/master"
  s.description = "Testing tool that allows for transactionless fixture data within specific contexts (useful in Shoulda and Factory Girl)"
  s.authors  = %w[Justin\ Knowlden Gabriel\ Gironda]

  s.has_rdoc = false
  s.rdoc_options = ["--main", "README.markdown"]
  s.extra_rdoc_files = ["HISTORY.txt", "README.markdown"]

  # run git ls-files to get an updated list
  s.files = %w[
    HISTORY.txt
    MIT-LICENSE
    README.markdown
    Rakefile
    init.rb
    install.rb
    lib/forklift.rb
    rails/context_extensions.rb
    rails/fixture_loading_callbacks.rb
    rails/init.rb
    tasks/forklift_tasks.rake
  ]
  
  s.test_files = %w[
    test/gem/forklift_test.rb
    test/model_factory.rb
    test/rails/fixture_transactions_test.rb
    test/schema.rb
    test/test_helper.rb
  ]
end