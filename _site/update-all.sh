#! bash

# update the Pinboard RSS feed
# for the /links pages
cd _includes/links/rawdog
pwd
rawdog -d . -vuw
cd -
