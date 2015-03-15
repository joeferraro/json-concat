###
Run script for Grunt, task runner

The MIT License (MIT)
Copyright (c) 2014-2015 GochoMugo <mugo@forfuture.co.ke>
###


exports = module.exports = (grunt) ->
    "use strict"

    grunt.initConfig
        coffee:
            src:
                expand: true,
                flatten: false,
                ext: ".js"
                extDot: "last",
                cwd: "src/",
                src: ["**/*.coffee"],
                dest: "dist/"
            test:
                expand: true,
                flatten: false,
                ext: ".js"
                extDot: "last",
                cwd: "test/",
                src: ["**/*.coffee"],
                dest: "_test/"
        copy:
            dist:
                expand: true,
                src: ["LICENSE", "README.md", "package.json"],
                dest: "dist/"
            test:
                expand: true,
                cwd: "test/",
                src: ["data/**/*", "!data/**/*.coffee"],
                dest: "_test/"
        mochaTest:
            test:
                options:
                    reporter: 'spec',
                    quiet: false,
                    clearRequireCache: false
                src: ['_test/test.*.js']

    grunt.loadNpmTasks("grunt-contrib-coffee")
    grunt.loadNpmTasks("grunt-contrib-copy")
    grunt.loadNpmTasks("grunt-mocha-test")

    grunt.registerTask("default", ["coffee:src", "copy:dist"])
    grunt.registerTask("_test", ["coffee:test", "copy:test"])
    grunt.registerTask("test", ["default", "_test", "mochaTest"])