load("@rules_foreign_cc//tools/build_defs:configure.bzl", "configure_make")
load("@rules_foreign_cc//tools/build_defs:make.bzl", "make")
load("@rules_foreign_cc//tools/build_defs:cmake.bzl", "cmake_external")

configure_make(
    name = "gnu_libiconv",
    lib_source = "@gnu_libiconv//:all",
    configure_options = [
        "--enable-static=yes"
    ],
    static_libraries = [
        "libcharset.a",
        "libiconv.a",
    ],
    shared_libraries = select({
        "@bazel_tools//src/conditions:windows": [
            "libcharset.dll",
            "libiconv.dll"
        ],
        "@bazel_tools//src/conditions:darwin": [
            "libcharset.dylib",
            "libiconv.dylib"
        ],
        "//conditions:default": [
            "libcharset.so",
            "libiconv.so"
        ],
    }),
    binaries = [
        "iconv"
    ]
)

configure_make(
    name="openssl",
    configure_command = "config",
    lib_source = "@openssl//:all",
    static_libraries = [
        "libcrypto.a",
        "libssl.a",
    ],
    # shared_libraries = [
    #     "libcrypto.dylib",
    #     "libssl.dylib"
    # ],
    binaries = [
        "c_rehash",
        "openssl"
    ]
)

make(
    name = "bzip2",
    lib_source = "@bzip2//:all",
    static_libraries = [
        "libbz2.a",
    ],
    binaries = [
        "bunzip2",
        "bzcat",
        "bzdiff",
        "bzgrep",
        "bzip2",
        "bzip2recover",
        "bzmore"
    ]
)

configure_make(
    name = "curl",
    lib_source = "@curl//:all",
    static_libraries = [
        "libcurl.a"
    ],
    # shared_libraries = [
    #     "libcurl.dylib"
    # ],
    binaries = [
        "curl"
    ]
)

configure_make(
    name = "zlib",
    lib_source = "@zlib//:all",
    static_libraries = [
        "libz.a"
    ]
)

configure_make(
    name = "gettext",
    lib_source = "@gettext//:all",
    static_libraries = [
        "libasprintf.a",
        "libgettextpo.a",
        "libintl.a",
        "libtextstyle.a",
    ],
    binaries = [
        "autopoint",
        "envsubst",
        "gettext",
        "gettext.sh",
        "gettextize",
        "msgattrib",
        "msgcat",
        "msgcmp",
        "msgcomm",
        "msgconv",
        "msgen",
        "msgexec",
        "msgfilter",
        "msgfmt",
        "msggrep",
        "msginit",
        "msgmerge",
        "msgunfmt",
        "msguniq",
        "ngettext",
        "recode-sr-latin",
        "xgettext",
    ]
)

cmake_external(
    name = "libzip",
    lib_source = "@libzip//:all",
    binaries = [
        "zipmerge",
        "ziptool",
        "zipcmp",
    ]
)

configure_make(
    name = "php",
    lib_source = "@php//:all",
    configure_options = [
        "--with-iconv-dir=\"$$EXT_BUILD_DEPS$$/gnu_libiconv\"",
        "--with-iconv=shared,\"$$EXT_BUILD_DEPS$$/gnu_libiconv\"",
        "--with-openssl=\"$$EXT_BUILD_DEPS$$/openssl\"",
        "--with-bz2=\"$$EXT_BUILD_DEPS$$/bzip2\"",
        "--with-curl=\"$$EXT_BUILD_DEPS$$/curl\"",
        "--with-zlib-dir=\"$$EXT_BUILD_DEPS$$/zlib\"",
        "--with-gettext=\"$$EXT_BUILD_DEPS$$/gettext\"",
        "--with-libzip=\"$$EXT_BUILD_DEPS$$/libzip\"",
        "--with-zlib",
        "--with-pcre-regex",
        "--with-xsl",
        "--with-pdo-mysql",
        "--enable-fpm",
        "--enable-pcntl",
        "--with-mysqli",
        "--enable-bcmath",
        "--enable-cli",
        "--enable-ftp",
        "--enable-hash",
        "--enable-json",
        "--enable-maintainer",
        "--enable-mysqlnd",
        "--enable-opcache",
        "--enable-session",
        "--enable-simplexml",
        "--enable-soap",
        "--enable-xml",
        "--enable-zip",
        "--enable-mbstring",
        "CFLAGS='-Dredacted=\"redacted\"'"
    ],
    deps = [
        ":gnu_libiconv",
        ":openssl",
        ":bzip2",
        ":curl",
        ":zlib",
        ":gettext",
        ":libzip"
    ],
    # make_commands = [
    #     "ORIG_EXTRA_CFLAGS=$EXTRA_CFLAGS",
    #     "export EXTRA_CFLAGS=$EXTRA_CFLAGS\ $$EXT_BUILD_DEPS$$/gnu_libiconv/lib/libiconv.a",
    #     "make",
    #     "make install",
    #     "EXTRA_CFLAGS=$ORIG_EXTRA_CFLAGS",
    #     "unset ORIG_EXTRA_CFLAGS"
    # ],
    binaries = [
        "pear",
        "peardev",
        "pecl",
        "phar",
        "phar.phar",
        "php",
        "php-cgi",
        "php-config",
        "php-config-e",
        "phpdbg",
        "phpize"
    ]
)
