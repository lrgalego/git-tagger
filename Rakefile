require 'git-tagger'

task :install do
  sh %{gem build git-tagger.gemspec}
  sh %{ls *.gem | xargs gem install}
end
