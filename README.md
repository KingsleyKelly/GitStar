## GitStar

A better way to discover repos you love on github.

It creates a list of repos based on what you've starred and returns repos popular with the contributors.

Currently in early alpha.

Youll need to have rails installed, make sure to start delayed job with

```
rake jobs:work
```

You should then create a user with your github name.
Don't worry about authing the app.

Also set the environment variables GITHUB LOGIN and GITHUB_PASSWORD to auth your requests.

