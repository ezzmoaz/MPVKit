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
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.2/MoltenVK.xcframework.zip",
            checksum: "4ba9d8bba9321fad302d16ad3f5917f0a9e86469252e5ff43a116b4f954290c0"
        ),

        .binaryTarget(
            name: "Libavcodec",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.2/Libavcodec.xcframework.zip",
            checksum: "ddb5d5b56bbe974742901d67d729053bc5ac150a633a9fe093b648a63746f778"
        ),
        .binaryTarget(
            name: "Libavdevice",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.2/Libavdevice.xcframework.zip",
            checksum: "f93d886f83080eaf107cae66e5ee09c267ad22ad7bf63dee1b3887fbc134f4de"
        ),
        .binaryTarget(
            name: "Libavformat",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.2/Libavformat.xcframework.zip",
            checksum: "efc48ad216ecffeb9f404dacf06735f9172991496baffdc5499ed5b1150c61e1"
        ),
        .binaryTarget(
            name: "Libavfilter",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.2/Libavfilter.xcframework.zip",
            checksum: "cab91146c4b0a0228c67ff98870e43c9e90ca1807513529a43430faed69bd698"
        ),
        .binaryTarget(
            name: "Libavutil",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.2/Libavutil.xcframework.zip",
            checksum: "d0dae538926da67a2d940d49a6c88b0e5f6a31b6cdef1d383a7491358b864e43"
        ),
        .binaryTarget(
            name: "Libswresample",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.2/Libswresample.xcframework.zip",
            checksum: "0bd87068e8528c711077e9ac7f2971c6d0bea5db4d2c88b007b815853c645360"
        ),
        .binaryTarget(
            name: "Libswscale",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.2/Libswscale.xcframework.zip",
            checksum: "e7c87972764eb8a7975b41be81ea1d081f1b635a1497a303aea6a6e93154bc9e"
        ),

        .binaryTarget(
            name: "Libmpv",
            url: "https://github.com/ezzmoaz/MPVKit/releases/download/0.41.0-n8.1.2-lgpl21.2/Libmpv.xcframework.zip",
            checksum: "62b48e972d2b531b7f04bdde6a3df007e664cbfaa8d21898dcb50800458a3605"
        ),
        //AUTO_GENERATE_TARGETS_END//
    ]
)
