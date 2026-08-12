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
                "Libmpv", "_FFmpeg",
            ],
            path: "Sources/_MPVKit",
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreAudio"),
            ]
        ),
        // ENGINE-2 (dynamic): the engine is 9 dylib frameworks — Libmpv, the seven
        // libav*, and MoltenVK (Apache-2.0) as its own mach-o. Every other third-party
        // library is statically absorbed into the dylib that uses it (shaderc's static
        // build hides its C API and cannot be a dylib — see the app's ADR-0001).
        .target(
            name: "_FFmpeg",
            dependencies: [
                "Libavcodec", "Libavdevice", "Libavfilter", "Libavformat", "Libavutil", "Libswresample", "Libswscale",
                "MoltenVK",
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
            name: "MoltenVK",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.4/MoltenVK.xcframework.zip",
            checksum: "560b251b064899aebe342361ec8165c239de34141e17b9ae4c09ad3d8c074c1b"
        ),

        .binaryTarget(
            name: "Libavcodec",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.4/Libavcodec.xcframework.zip",
            checksum: "8fa76193b53caf692e8cd92ce04e842d57efd467a4e67e9605214dd5bcf5b3fa"
        ),
        .binaryTarget(
            name: "Libavdevice",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.4/Libavdevice.xcframework.zip",
            checksum: "6586bef9496e8968b54b55372147717b7991b69782549fd845fa64adce64574a"
        ),
        .binaryTarget(
            name: "Libavformat",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.4/Libavformat.xcframework.zip",
            checksum: "e71cb23e872f9cda4b6c05fba76f82ed9c64199f08e0e4cb26958ca1deb8dfd9"
        ),
        .binaryTarget(
            name: "Libavfilter",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.4/Libavfilter.xcframework.zip",
            checksum: "d0923672f5c5328115073ea8a992b56ef52651df2474baa12c13dc6025487f91"
        ),
        .binaryTarget(
            name: "Libavutil",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.4/Libavutil.xcframework.zip",
            checksum: "5a58d5990985a0a2c53fb215d82c9254e7c9a1a955a7616ba37174f143b81b52"
        ),
        .binaryTarget(
            name: "Libswresample",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.4/Libswresample.xcframework.zip",
            checksum: "4526b58b95fd57e3314a440c4e2f2a9e9a39f9783427ba0e3419d53c3e95eacc"
        ),
        .binaryTarget(
            name: "Libswscale",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.4/Libswscale.xcframework.zip",
            checksum: "2cedf3cbfaf6aeedc9ae25d85545ccb6edb03e122333c3005fc44b0b4d9229f1"
        ),

        .binaryTarget(
            name: "Libmpv",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.4/Libmpv.xcframework.zip",
            checksum: "402ab5221a2e044e57725b053820ec06cf65dbeca37df2a6e09adfea05245f4f"
        ),
        //AUTO_GENERATE_TARGETS_END//
    ]
)
