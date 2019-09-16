load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

all_content = """filegroup(name = "all", srcs = glob(["**"]), visibility = ["//visibility:public"])"""

def rules_php_dependencies():
    _rules_foreign_cc()

    _iconv()
    _openssl()
    _bzip2()
    _curl()
    _zlib()
    _gettext()
    _libzip()
    _net_php()

def _rules_foreign_cc():
    http_archive(
       name = "rules_foreign_cc",
       sha256 = "ad38f7990bfd009cc1b25e08066792159a84331aba706a49dfcda144b678b794",
       strip_prefix = "rules_foreign_cc-master",
       urls = [
           "https://mirror.bazel.build/github.com/bazelbuild/rules_foreign_cc/archive/master.zip",
           "https://github.com/bazelbuild/rules_foreign_cc/archive/master.zip"
       ]
    )

# PHP and its deps

def _libzip():
    http_archive(
        name = "libzip",
        sha256 = "be694a4abb2ffe5ec02074146757c8b56084dbcebf329123c84b205417435e15",
        strip_prefix = "libzip-1.5.2",
        urls = [
            "https://mirror.bazel.build/libzip.org/download/libzip-1.5.2.tar.gz",
            "https://libzip.org/download/libzip-1.5.2.tar.gz"
        ],
        build_file_content = all_content
    )

def _gettext():
    http_archive(
        name = "gettext",
        sha256 = "66415634c6e8c3fa8b71362879ec7575e27da43da562c798a8a2f223e6e47f5c",
        strip_prefix = "gettext-0.20.1",
        urls = [
            "https://mirror.bazel.build/ftp.gnu.org/pub/gnu/gettext/gettext-0.20.1.tar.gz",
            "https://ftp.gnu.org/pub/gnu/gettext/gettext-0.20.1.tar.gz"
        ],
        build_file_content = all_content
    )

def _zlib():
    http_archive(
        name = "zlib",
        sha256 = "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
        strip_prefix = "zlib-1.2.11",
        urls = [
            "https://mirror.bazel.build/www.zlib.net/zlib-1.2.11.tar.gz",
            "https://www.zlib.net/zlib-1.2.11.tar.gz"
        ],
        build_file_content = all_content
    )

def _curl():
    http_archive(
        name = "curl",
        sha256 = "d0393da38ac74ffac67313072d7fe75b1fa1010eb5987f63f349b024a36b7ffb",
        strip_prefix = "curl-7.66.0",
        urls = [
            "https://mirror.bazel.build/curl.haxx.se/download/curl-7.66.0.tar.gz",
            "https://curl.haxx.se/download/curl-7.66.0.tar.gz"
        ],
        build_file_content = all_content
    )

def _bzip2():
    http_archive(
        name = "bzip2",
        sha256 = "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269",
        strip_prefix = "bzip2-1.0.8",
        urls = [
            "https://mirror.bazel.build/www.sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz",
            "https://www.sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz"
        ],
        build_file_content = all_content
    )


def _iconv():
    http_archive(
        name = "gnu_libiconv",
        sha256 = "e6a1b1b589654277ee790cce3734f07876ac4ccfaecbee8afa0b649cf529cc04",
        strip_prefix = "libiconv-1.16",
        urls = [
            "https://mirror.bazel.build/ftp.gnu.org/pub/gnu/libiconv/libiconv-1.16.tar.gz",
            "https://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.16.tar.gz"
        ],
        build_file_content = all_content
    )

def _openssl():
    http_archive(
        name = "openssl",
        sha256 = "1e3a91bc1f9dfce01af26026f856e064eab4c8ee0a8f457b5ae30b40b8b711f2",
        strip_prefix = "openssl-1.1.1d",
        urls = [
            "https://mirror.bazel.build/www.openssl.org/source/openssl-1.1.1d.tar.gz",
            "https://www.openssl.org/source/openssl-1.1.1d.tar.gz"
        ],
        build_file_content = all_content
    )

def _net_php():
    http_archive(
       name = "php",
       sha256 = "5ecc1b1ad7228ed2e99a970c45358871644fcab1d9fd079a7b129326a7bde42d",
       strip_prefix = "php-7.3.9",
       urls = [
           "https://mirror.bazel.build/www.php.net/distributions/php-7.3.9.tar.gz",
           "https://www.php.net/distributions/php-7.3.9.tar.gz"
       ],
       build_file = "@//php/repositories:net_php.BUILD"
    )

