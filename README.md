# Dadaist

Dadaist is a tool for randomly generating short stories, perhaps for Twitter

"Why would one want such a thing?", I hear you ask. Well, some of *my* favourite
twitter accounts are actually scripts that generate random content. They might
be composed for reasons of creativity, humour or mystical reasons. For example:

* [Clickbait Robot](https://twitter.com/clickbaitrobot)
* [Magical Realism Bot](https://twitter.com/MagicRealismBot)

The inspiration for me writing this was to follow in their tracks a little.
Early one Sunday morning, I lay in a state of almost-sleep listening to the rain
tap against the windows of my home, a flat on a sleepy West London cul-de-sac.
The grey and uninspiring dawn peeked through the curtain, so my mind moved to
magical things, specifically the writing of Jorge Luis Borges. I remembered his
[Book of Imaginary Beings](https://en.wikipedia.org/wiki/Book_of_Imaginary_Beings)
and started to create and imagine beings of my own.

Something fired in my head, I got out of bed, and I started writing this code.
Some 10 hours later, my first Twitter bot using this was live, and I now have a
framework for randomised creativity, and so do you too.

It does not have to be used for the creation of magical beasts as the examples
will show in due course.

All I ask is that whatever you use it for, it should be something that makes
people feel good. Make them feel entertained, make them laugh, make them
inspired, make them warm and fuzzy inside. Do not use this to cause hatred,
division, to attack or to lie. Twitter has enough of that already, it doesn't
need you using this to do more.

## Where is it being used?

Right now dadaist powers https://twitter.com/imaginedbeings

More will follow.

## Installation

Add this line to your application's Gemfile:

    ruby gem 'dadaist'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dadaist

## Usage

To see it at work, you can give it a story file and a place to find "things":

    bin/dadaist --templates=examples/imagined_beings/stories.json --sources=examples/imagined_beings

Likewise once you've set the relevant ENV vars for Twitter access you can tweet with:

    bin/tweet --templates=examples/imagined_beings/stories.json --sources=examples/imagined_beings

## Creating stories

Looking in the examples directory is the fastest way to see how to get started.

In simplest terms, stories are a collection of ERB strings in a JSON array.

For example, the `examples/imagined_beings` directory has a file called
 `stories.json` that shows how this works.

You can test a phrase by providing a source directory and a sample string:

    bin/test_phrase examples/imagined_beings "Let's check for a <%= person %>"

This will cause the source directory to be searched for a file called `person.json`
which should be a JSON array of strings, or if you wish to have attributes you may
reference `<%= person.attribute %>` and then in your file:

```
[
    {
        "name": "Name",
        "attribute": "tall"
    }
]
```

This will cause `tall` to be substituted in the string. If there is more than one
element in the array (which we would hope for), one will be randomly chosen.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/p7r/dadaist.
