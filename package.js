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
    api.versionsFrom('1.1.0.2');
    api.use('coffeescript');
    api.use('underscore');
    api.use(['practicalmeteor:chai']);

    api.export('Cio', ['server','client']);
    api.addFiles('ContextIOClient.coffee');
});

Package.onTest(function (api) {
    api.use('rapito:contextio');
    api.use('practicalmeteor:munit');
    api.use('coffeescript');

    api.addFiles('tests/Tests.coffee');
    api.addFiles('tests/ContextIOClientTests.coffee');
});
