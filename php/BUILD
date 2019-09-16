load("@rules_foreign_cc//tools/build_defs:configure.bzl", "configure_make")
load("@rules_foreign_cc//tools/build_defs:make.bzl", "make")
load("@rules_foreign_cc//tools/build_defs:cmake.bzl", "cmake_external")

configure_make(
    name = "gnu_libiconv",
    lib_source = "@gnu_libiconv//:all",
    static_libraries = [
        "libcharset.a",
    ],
    shared_libraries = [
        "libcharset.dylib",
        "libiconv.dylib"
    ],
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
    shared_libraries = [
        "libcrypto.dylib",
        "libssl.dylib"
    ],
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
    shared_libraries = [
        "libcurl.dylib"
    ],
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
        "--with-iconv=\"$$EXT_BUILD_DEPS$$/gnu_libiconv\"",
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
        "--enable-mbstring"
    ],
    deps = [
        ":gnu_libiconv",
        ":openssl",
        ":bzip2",
        ":curl",
        ":zlib",
        ":gettext",
        ":libzip"
    ]
)
