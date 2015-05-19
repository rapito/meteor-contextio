# Context.io - Meteor Package

** *cio: short for Context.io*

A lightweight toolkit to add support for Context.io to your Meteor App.

Includes:

- Wraps context.io node.js api client library [ContextIO-node](https://github.com/ContextIO/ContextIO-node)
- Utility methods for easy integration.
- UI controls to add *cio* ***accounts***
- UI controls to associate *cio* ***mailboxes*** to *cio* ***accounts***

If you are not yet familiar with Context.io, read their [documentation](https://context.io/docs/2.0)
first and play around a bit with their [**api explorer**](https://console.context.io/) and make sure
you understand [how-it-works](https://context.io/how-it-works/connecting-mailboxes).

## Disclaimer

Even though the package contains some utilities to make integration easier, it is still a wrapper of [ContextIO-node](https://github.com/ContextIO/ContextIO-node)
 which is still in beta (i think) so be sure to check it's documentation on it's own repo.

## Usage

- Initialize cio:
    - Use singleton by setting up credentials on settings.json as the library looks for ```Meteor.settings.services.contextio```. (read ```settings.example.json```)
    ``` var cio = Cio.get(); ```
    - Or Manually create the client:
    ``` var cio = Cio.get(apiKey,apiSecret); ```

- Create cio accounts:
    ```var userCioAccount = cio.createAccount(primaryEmailAddress,firstName,lastName);```

- Connecting mailboxes:

    ```
        Template.registerHelper('userCioAccount', function(){
            return userCioAccount;
        });
    ```

    ```{{> connectMailboxButton account=userCioAccountId}}```

- Use npm package directly:
    ``` var cioNode = cio.client; ```

## Templates

- connectMailboxButton: Adds a Button which initiates negotiation to [connect](https://context.io/docs/2.0/connect_tokens) a new mailbox. **(Hotmail or Gmail only)**
    - **required:** ```account``` account id to connect mailbox to.
    - *optional:* ```cio``` to specify wrapper to be used. *defaults to singleton*
    - *optional:* ```classes``` to override button style.
    - *optional:* ```label``` Button Label.

## Roadmap

- auto-sync meteor accounts: hook to create a user account on your *cio* account for each registered user.

## Examples

- Check out the ```examples/``` folder for simple use cases.
- App using this package:
    - [PictureWorm](http://github.com/rapito/pictureworm)

## Testing

- running examples: ```meteor --settings ../../settings.example.json``` 
- munit tests: ```meteor test-packages rapito:contextio --port 1234 --settings settings.example.json```

## Dependencies

- [Munit](https://github.com/practicalmeteor/munit)
- [Context.io - npm](https://github.com/ContextIO/ContextIO-node)
