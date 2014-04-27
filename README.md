Custom Cabal: installing before testing
===

On [some projects](https://github.com/gelisam/hawk/issues/107), it's not possible to run the tests without installing, because the tests expect the project to be already installed. But with cabal, even if the user does want to install your package, the tests will still fail because cabal's test phase runs before the installation phase.

    $ cabal install --enable-tests
    Configuring hello-0.1.0.0...
    Building hello-0.1.0.0...
    Failed to install hello-0.1.0.0
    [...output of the failed tests...]
    hello-0.1.0.0 failed during the tests phase. The exception was:
    ExitFailure 1

This project demonstrates how to configure the project's cabal file so that tests are run first. The secret? A custom `Setup.hs`.

    $ cabal install --enable-tests
    Configuring hello-0.1.0.0...
    Building hello-0.1.0.0...
    [...silently running the tests...]
    Installed hello-0.1.0.0
