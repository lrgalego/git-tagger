# encoding: utf-8

task :tagger => [:'tagger:tag_name', :'tagger:tag']

namespace :tagger do

  task :tag_name do
    puts "Last tag:"
    sh %{git tag | tail -1}
    puts "Enter new tag:"
    @tag_name = "#{STDIN.gets.to_s.chomp}"
  end

  task :tag => :tag_name do
    sh %{git checkout -b release-#{@tag_name}}
    sh %{echo #{@tag_name} > VERSION_NAME}
    sh %{git add VERSION_NAME}
    sh %{git commit -m 'release #{@tag_name}'}
    sh %{git tag #{@tag_name}}
    sh %{git push origin release-#{@tag_name}}
    sh %{git push --tags}
    sh %{git checkout master}
  end

  task :rollback do
    puts "Tag to destroy:"
    tag_name = "#{STDIN.gets.to_s.chomp}"
    sh %{git push origin :refs/tags/#{tag_name}}
    sh %{git tag -d #{tag_name}}
    sh %{git push origin :release-#{tag_name}}
    sh %{git branch -D release-#{tag_name}}
  end

end
