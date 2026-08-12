// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "MPVKit",
    platforms: [.macOS(.v11), .iOS(.v14), .tvOS(.v14), .visionOS(.v1)],
    products: [
        // LGPL-2.1-only fork: the upstream "MPVKit-GPL" product (libsmbclient, GPL
        // binaries) is deliberately absent so it can never be selected by mistake.
        .library(
            name: "MPVKit",
            targets: ["_MPVKit"]
        ),
    ],
    targets: [
        .target(
            name: "_MPVKit",
            dependencies: [
                "Libmpv", "_FFmpeg", "Libuchardet",
            ],
            path: "Sources/_MPVKit",
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreAudio"),
            ]
        ),
        .target(
            name: "_FFmpeg",
            dependencies: [
                "Libavcodec", "Libavdevice", "Libavfilter", "Libavformat", "Libavutil", "Libswresample", "Libswscale",
                "Libass", "Libfreetype", "Libfribidi", "Libharfbuzz",
                "MoltenVK", "Libshaderc_combined", "lcms2", "Libplacebo", "Libdovi", "Libunibreak",
                "Libdav1d", "Libuavs3d"
            ],
            path: "Sources/_FFmpeg",
            linkerSettings: [
                .linkedFramework("AudioToolbox"),
                .linkedFramework("CoreVideo"),
                .linkedFramework("CoreFoundation"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("Metal"),
                .linkedFramework("VideoToolbox"),
                // SecureTransport (FFmpeg's TLS backend in this fork) lives in Security.framework.
                .linkedFramework("Security"),
                .linkedLibrary("bz2"),
                .linkedLibrary("iconv"),
                .linkedLibrary("expat"),
                .linkedLibrary("resolv"),
                .linkedLibrary("xml2"),
                .linkedLibrary("z"),
                .linkedLibrary("c++"),
            ]
        ),
        //AUTO_GENERATE_TARGETS_BEGIN//

        .binaryTarget(
            name: "Libunibreak",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.1/Libunibreak.xcframework.zip",
            checksum: "940d9833cf4477d0a260d9f2b4066125bc0ff7bbc111ac3c90e774765b77a559"
        ),

        .binaryTarget(
            name: "Libfreetype",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.1/Libfreetype.xcframework.zip",
            checksum: "496ca62488530e14b1e4624d20ee2b237c0bd675cd70c19da578a5768302d02d"
        ),

        .binaryTarget(
            name: "Libfribidi",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.1/Libfribidi.xcframework.zip",
            checksum: "bc15e097b892f2f90424e4a27ba287070cc2f98a74a4da10e6d2481d15cf5ff9"
        ),

        .binaryTarget(
            name: "Libharfbuzz",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.1/Libharfbuzz.xcframework.zip",
            checksum: "aa8e0b9ca0387dac74e3e93c86e34d11982bb013b28022d0e6966a8427a35b2e"
        ),

        .binaryTarget(
            name: "Libass",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.1/Libass.xcframework.zip",
            checksum: "3f4c576d2818ceb4544aa2a20e1f55846511c5e706fd19adc3ea9fd842270498"
        ),

        .binaryTarget(
            name: "Libuavs3d",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.1/Libuavs3d.xcframework.zip",
            checksum: "1e69250279be9334cd2f6849abdc884c8e4bb29212467b6f071fdc1ac2010b6b"
        ),

        .binaryTarget(
            name: "Libdovi",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.1/Libdovi.xcframework.zip",
            checksum: "e693e239808350868e79c5448ef9f02e2716bc822dd8632a41a368a1eae5ca7d"
        ),

        .binaryTarget(
            name: "MoltenVK",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.1/MoltenVK.xcframework.zip",
            checksum: "9bd1ca1e4563bacd25d6e55d37b10341d50b2601bc2684bc332188e79daa2b79"
        ),

        .binaryTarget(
            name: "Libshaderc_combined",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.1/Libshaderc_combined.xcframework.zip",
            checksum: "758047b615708575b580eb960a2d083f760a29dc462d6eaa360416c946ce433b"
        ),

        .binaryTarget(
            name: "lcms2",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.1/lcms2.xcframework.zip",
            checksum: "dc0dce0606f6ab6841a8ec5a6bd4448e2f3ef00661a050460f806c9393dc6982"
        ),

        .binaryTarget(
            name: "Libplacebo",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.1/Libplacebo.xcframework.zip",
            checksum: "2fa3d54cb81f302d6f11c7b2f509af30944381c3b11ee9d35096eb4637a6e2dd"
        ),

        .binaryTarget(
            name: "Libdav1d",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.1/Libdav1d.xcframework.zip",
            checksum: "8a8b78e23e28ecc213232805f3c1936141fc9befe113e87234f4f897f430a532"
        ),

        .binaryTarget(
            name: "Libavcodec",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.1/Libavcodec.xcframework.zip",
            checksum: "423ef449ca021d14c4ac426c0dbd758a094e4049c341e4deaedd86232477961b"
        ),
        .binaryTarget(
            name: "Libavdevice",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.1/Libavdevice.xcframework.zip",
            checksum: "9309d9da3cb5df8eb7e4bdbf207ca31a27826ec9e676d2579fa36904aff6eb92"
        ),
        .binaryTarget(
            name: "Libavformat",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.1/Libavformat.xcframework.zip",
            checksum: "d28286c44219ec86e34bc73d98c4174f729f980f8b8c29c6c829873271205321"
        ),
        .binaryTarget(
            name: "Libavfilter",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.1/Libavfilter.xcframework.zip",
            checksum: "4aa08aadef9040d6431065de8e4662b4f4442c23b9405dc66bfbf210147d2c5e"
        ),
        .binaryTarget(
            name: "Libavutil",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.1/Libavutil.xcframework.zip",
            checksum: "e5aac79225a7273c2b5d3c07ba80d11bd2e90ca722cde3278a5ec63be1ff9e9a"
        ),
        .binaryTarget(
            name: "Libswresample",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.1/Libswresample.xcframework.zip",
            checksum: "02d41f93fe6ecfe5d9afd8e01ebf25a4642eae8569e59cace8b8ced82ead9502"
        ),
        .binaryTarget(
            name: "Libswscale",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.1/Libswscale.xcframework.zip",
            checksum: "dce8ddd75164935113433bd7bc33afd0d4f2b53549354f83915ccde6ed130a9a"
        ),

        .binaryTarget(
            name: "Libuchardet",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.1/Libuchardet.xcframework.zip",
            checksum: "503202caa0dafb6996b2443f53408a713b49f6c2d4a26d7856fd6143513a50d7"
        ),

        .binaryTarget(
            name: "Libmpv",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.1/Libmpv.xcframework.zip",
            checksum: "73a5352ef1647f38b0efa368e28d85421d138738fef0d5c3c62056e9f298f51f"
        ),
        //AUTO_GENERATE_TARGETS_END//
    ]
)
