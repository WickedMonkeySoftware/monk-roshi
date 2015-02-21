var maincalled = false;

main = function() {
    if (maincalled) {
        throw new Error("already called main, doofus");
    }

    CLI.executeCommand();
};