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
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.3/MoltenVK.xcframework.zip",
            checksum: "02a7f9dfda68883d3fc8b2e165a77124f5110da43860b22e4daa2d252292f112"
        ),

        .binaryTarget(
            name: "Libavcodec",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.3/Libavcodec.xcframework.zip",
            checksum: "111b9b3b7dd6930d17b12a1b8dd15e9bdcaa3561d4f24200101deef9c8a58bf5"
        ),
        .binaryTarget(
            name: "Libavdevice",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.3/Libavdevice.xcframework.zip",
            checksum: "b078a516710ab9af3ddeee02a266aea1bc8ee397efb28305669d7f0e4afd5492"
        ),
        .binaryTarget(
            name: "Libavformat",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.3/Libavformat.xcframework.zip",
            checksum: "44f6853e2bdb4034a51882eaf7d00896f44d48fe41af4a5448fb48053322a623"
        ),
        .binaryTarget(
            name: "Libavfilter",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.3/Libavfilter.xcframework.zip",
            checksum: "d6bb853def4951e55da1d5d7808d62e28ab5857296ee9b804e78c32bfe679197"
        ),
        .binaryTarget(
            name: "Libavutil",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.3/Libavutil.xcframework.zip",
            checksum: "28a1be0535679705e7b10841f629306abdaeb818a1efe9ac365db605bd9f3c3a"
        ),
        .binaryTarget(
            name: "Libswresample",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.3/Libswresample.xcframework.zip",
            checksum: "1621c7ca7354e1f22d7810df066b9057bcda0231f3e745a3b68fadba9651c92e"
        ),
        .binaryTarget(
            name: "Libswscale",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.3/Libswscale.xcframework.zip",
            checksum: "a08bb98b814afc40ec65ec9d2efced354a798b7e6023e5e66145c056ff5b30fc"
        ),

        .binaryTarget(
            name: "Libmpv",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.3/Libmpv.xcframework.zip",
            checksum: "01c921773fbfaff27030faf0260d5f5a99942ff58cd4ac9ca422cb0c02b1d5fc"
        ),
        //AUTO_GENERATE_TARGETS_END//
    ]
)
