# Pomona

Pomona is a simple, lightweight gem for creating and managing tree data structures in Ruby. It works using a custom data structure (the Tree) to contain small hashes of data (the Nodes) that can be queried and searched.

And of course it's a subtle, shameless [Harry Potter reference](http://harrypotter.wikia.com/wiki/Pomona_Sprout).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pomona'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install pomona

## Usage

###Basics

Using Pomona is simple - to create a new Tree simply run:

```ruby
tree = Tree.new

# Tree is now created as so:
{
   tree_array: []
}
```

Once you have your tree you can simply add any nodes to it by using ```#add_node``` like so:

```ruby
tree.add_node({ data: "Your Data"})
```
After creation your new Node will automatically have a unique auto-generated id and an empty ```children``` array added to it. It will now look like this:

```ruby
{
    tree_array: [
    	{ id: 1, data: "Your Data", children: [] }
    ]
}
```

You can now attach any additional (child) Nodes onto the one you've created by simply specifying the id when adding the Node.

```ruby
tree.add_node({ data: "New Data" }, 1)
```

This will attach the Node to your previously created one, making the tree look like this:

```ruby
{
    tree_array: [
    	{ id: 1, data: "Your Data", children: [
    		{ id: 2, data: "New Data", children: [] }
    	]}
    ]
}
```

###Searching the Tree
Given the following example tree:

```ruby
{
  tree_array: [
    { name: "Rickon Stark", id: 1, children: [
        { name: "Brandon Stark", id: 2, children: [] },
        { name: "Eddard Stark", id: 3, children: [
            { name: "Robb Stark", id: 6, children: [] },
            { name: "Sansa Stark", id: 7, children: [] },
            { name: "Arya Stark", id: 8, children: [] },
            { name: "Bran Stark", id: 9, children: [] },
            { name: "Rickon Stark II", id: 10, children: [] },
          ]
         },
         { name: "Lyanna Stark", id: 4, children: [
                { name: "Jon Snow", id: 11, children: [] },
            ]
         },
         { name: "Benjen Stark", id: 5, children: [] }
      ]
    }
  ]
}
```

We can search and aggregate any data from this by using the following commands:

#### #find(id)
Find will return the Node with the id you've passed as a paramater:

```ruby
tree.find(8)
 { name: "Arya Stark", id: 8, children: [] }
```

#### #values_at(keys)
Values_at works very similarly to its Hash counterpart with two primary differences:

1. It is able to take in an array of keys that it will search with, or a singular key you want to find.
2. It will return a nested Array if an array of keys is passed, or a flattened array if only one is passed.

```ruby
# Multiple Keys

tree.values_at([:id, :name])
[
   ["Rickon Stark", 1], ["Brandon Stark", 2], ["Eddard Stark", 3],
   ["Robb Stark", 6], ["Sansa Stark", 7], ["Arya Stark", 8],
   ["Bran Stark", 9], ["Rickon Stark II", 10], ["Lyanna Stark", 4],
   ["Jon Stark", 11], ["Benjen Stark", 5]
]

# One Key
tree.values_at(:id)
[
	1, 2, 3, 6, 7, 8, 9, 10, 4, 11, 5
]
```

###Deleteing from the Tree
To remove a Node from the tree simply use the ```remove_node``` method on your ```Tree``` object, specifying the id of the Node you wish to remove.

NOTE: This method will delete any children of the Node you've deleted as well, as they are now orphaned data.

```ruby
tree.remove_node(3)

{
  tree_array: [
    { name: "Rickon Stark", id: 1, children: [
         { name: "Brandon Stark", id: 2, children: [] },
	     { name: "Lyanna Stark", id: 4, children: [
	         { name: "Jon Snow", id: 11, children: [] },
	       ]
	     },
	     { name: "Benjen Stark", id: 5, children: [] }
      ]
    }
  ]
}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/pomona. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
