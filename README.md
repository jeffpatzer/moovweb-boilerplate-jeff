## Installation

1. Clone this repo
1. Replace `example.com` with your target domain in `config.json` and `spec_helper.rb`
1. Install Growl: https://bitbucket.org/pmetzger/growl/downloads/Growl-1.2.2f1.dmg
1. Install Extras/growlnotify (in same dmg package)

Remember to put all domains you're going to hit in your `/etc/hosts`
or to run your server with the `-auto-hosts=true` option.

## Running the Server

1. To start the Moov server with Growl support, run `rake server`
1. To test the validity of the source site, run `rake test:endpoint`
1. To run your integration tests, run `rake test:integration`

## Development Checklist

* Start with the comp, the whole comp, and nothing but the comp
    - Ask for all screens which are missing and not obvious
    - Get screens showing state changes (menus opened etc)
    - Get screens showing error pages and the sad path
* Inform client about the cost of change
    - Ensure they know their site can't change during development without extra cost and delay
    - Explain how our automated tests will monitor their site around the clock and find changes
    - Ask them which people on their team should receive emails from our tests if things change
    - Ensure their project lead receives these emails as well
* Install mobile emulators on development machine
    - iOS 5.1 and 6
    - Android 2.2, 2.3 and 4
* Create living style guide
    - Identify common stylistic modules across the comp
    - For each module, create SCSS in `/assets/stylesheets/modules/[name].scss`
    - Add demonstration markup to `/assets/static/styleguide.html`
    - Follow SMACSS conventions: http://smacss.com
    - Feel free to logically and entirely restructure the dom structure compared to source pages
    - Use the features of SCSS, Bourbon and mixins
    - View `/styleguide` on all mobile emulators in all orientations
* Write endpoint tests
    - For every module in the styleguide create a new endpoint test in `/spec/endpoint/modules/[name]_spec.rb`
    - (Copy the logic in `foo_spec.rb` to get started)
    - Make your test verify that the source site provides all data necessary to populate the module
    - Ensure your test checks every page that must populate the module
    - Run endpoint tests in Jenkins-CI around the clock
    - Trigger emails to developers and the client in case of test failure
    - You can leave the monitoring system intact after launch as well for the client's peace of mind
* Write Tritium translation
    - Pull only data from the source, not chunks of dom
    - e.g. numbers, images, words, urls
    - Make the Tritium output conform exactly to your living styleguide structure
    - All xpath or css selectors mentioned in Tritium should be mentioned in an endpoint test
* Write integration tests for Tritium output
    - Design tests to follow links, fill out forms, log in a user, create a user, etc
    - Run integration tests on Sauce Labs to test across various mobile platforms at once
* Remove all client JavaScript
    - 100% of it -- I'm not joking. Do not let a single character of their scripts through
    - Reverse engineer their scripts and write your own if need be
    - When possible avoid scripts and fall back on HTML semantics
* Enable periodic snapshots of source site
    - Take site snapshot every time the endpoint tests are run
    - Archive the snapshots
    - They can help the client debug intermittent inconsistencies
