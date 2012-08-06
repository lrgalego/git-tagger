GIT-TAGGER
==========

Nifty rake tasks to simplify your git tagging.

How to use
----------

Create a Rakefile
require git-tagger
``` ruby
require 'git-tagger'
```

It's it. Now you have usefull rake tasks.

To create a new tag.

    $ rake tagger

If you desire to destroy an already created release.

    $ rake tagger:rollback

Authors
-------

* Lucas Rosa Galego :: lucas@galego.me :: @lrgalego
* Paulo Vitor Ragonha :: paulo@ragonha.me :: @pirelenito
