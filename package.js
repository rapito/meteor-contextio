Package.describe({
    summary: "A lightweight toolkit to add support for Context.io to your Meteor App.",
    version: "0.0.0",
    name: "rapito:contextio",
    git: "https://github.com/rapito/meteor-contextio.git"
});

Npm.depends({
    "contextio": "0.4.0"
});

Package.onUse(function (api) {
    var both = ['client', 'server'];

    api.versionsFrom('1.1.0.2');
    api.use('reactive-var');
    api.use('coffeescript');
    api.use('underscore');
    api.use('practicalmeteor:chai');

    api.use('standard-app-packages', both);
    api.use('templating', 'client');

    // API
    api.export('Cio', 'server');
    api.addFiles('server/lib/ContextIOClient.coffee', 'server');
    api.addFiles('both/lib/methods/ContextIOClient.coffee', 'server');

    // UI
    api.addFiles('client/lib/templates/buttons.html', 'client');
    api.addFiles('client/lib/templates/buttons.coffee', 'client');


});

Package.onTest(function (api) {
    api.use('rapito:contextio');
    api.use('practicalmeteor:munit');
    api.use('coffeescript');

    api.addFiles('tests/MethodsTests.coffee');
    api.addFiles('tests/ContextIOClientTests.coffee', 'server');
});
