This code is used to add post to a blog hosted on **github pages** from an `md` file. The `md` file is supposed to have the title of the post as the first line and then the rest of the content. The script will create the front matter from this file, where the last modified time of the file will be taken as the day the post was written.

This contains 2 parts. One is a `bash` script, which takes through the flow and then a `ruby` script which will create the file in the repository. Then the bash script will open up `google-chrome` which I am using as a browser and open the server for the local repo. Once the changes are confirmed, going back to the bash script and entering `y` will commit the change and push to github. Entering anything else will reset the repo and quit the script.

The format is

    $ ./confirm_and_update_blog path_to_source_md_file path_to_repository
