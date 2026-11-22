# Credits

Pholio stands on the work of many open source projects and open data providers. Thank you to all of them.

## Open source libraries

Libraries shipped inside Pholio, with their license.

- **[Spring Boot](https://spring.io/projects/spring-boot)**, **[Spring Framework](https://spring.io/projects/spring-framework)** and **[Spring Data JDBC](https://spring.io/projects/spring-data-jdbc)** — Apache License 2.0
- **[OpenJFX](https://openjfx.io)** — GPL v2 with Classpath Exception
- **[AtlantaFX](https://github.com/mkpaz/atlantafx)** — MIT
- **[AtlantaFX Themes](https://github.com/dlsc-software-consulting-gmbh/themes)**, **[GemsFX](https://github.com/dlsc-software-consulting-gmbh/GemsFX)** and **[PickerFX](https://github.com/dlsc-software-consulting-gmbh/PickerFX)** by DLSC — Apache License 2.0
- **[ControlsFX](https://controlsfx.github.io)** — BSD 3-Clause
- **[ValidatorFX](https://github.com/effad/ValidatorFX)** — BSD 3-Clause
- **[Ikonli](https://github.com/kordamp/ikonli)**, with the Material Design icon packs — Apache License 2.0
- **[DevToolsFX](https://github.com/mkpaz/devtoolsfx)** — MIT
- **[Spring AI](https://github.com/spring-projects/spring-ai)**, which serves Pholio's MCP server — Apache License 2.0
- **[MCP Java SDK](https://github.com/modelcontextprotocol/java-sdk)** — MIT
- **[ACP Java SDK](https://github.com/agentclientprotocol/java-sdk)**, which talks to an AI agent — Apache License 2.0
- **[Google Antigravity](https://antigravity.google)**'s agent, downloaded on request, not shipped with Pholio — Google's own terms ([antigravity.google/terms](https://antigravity.google/terms))
- **[GitHub Copilot CLI](https://github.com/github/copilot-cli)**, fetched by npm on request, not shipped with Pholio — GitHub's own licence ([LICENSE.md](https://github.com/github/copilot-cli/blob/main/LICENSE.md))
- **[Node.js](https://nodejs.org)**, downloaded on request to run Codex's and GitHub Copilot's agents, not shipped with Pholio — MIT License
- **[Simple Icons](https://simpleicons.org)**, the logos of the AI agents — CC0 1.0; Claude, OpenAI, Mistral AI and GitHub Copilot are trademarks of their owners
- **[H2 Database](https://h2database.com)** — MPL 2.0 / EPL 1.0
- **[Flyway](https://github.com/flyway/flyway)** — Apache License 2.0
- **[Jackson](https://github.com/FasterXML/jackson)** — Apache License 2.0
- **[MapStruct](https://mapstruct.org)** — Apache License 2.0
- **[picocli](https://picocli.info)** — Apache License 2.0
- **[Caffeine](https://github.com/ben-manes/caffeine)** — Apache License 2.0
- **[metadata-extractor](https://github.com/drewnoakes/metadata-extractor)** — Apache License 2.0
- **[Apache Commons Imaging](https://commons.apache.org/proper/commons-imaging/)** and **[Apache Commons Codec](https://commons.apache.org/proper/commons-codec/)** — Apache License 2.0
- **[Adobe XMPCore](https://github.com/adobe/XMP-Toolkit-SDK)** — BSD 3-Clause
- **[TwelveMonkeys ImageIO](https://github.com/haraldk/TwelveMonkeys)** — BSD 3-Clause
- **[libjpeg-turbo](https://libjpeg-turbo.org)** — BSD 3-Clause, IJG License and zlib License
- **[imageio-native](https://github.com/ghosthack/imageio-native)** and **[panama-media](https://github.com/ghosthack/panama-media)** — MIT
- **[ONNX Runtime](https://onnxruntime.ai)** — MIT
- **[FFmpeg](https://ffmpeg.org)** 8.1.2, which plays Live Photos and videos — LGPL v3 or later: shipped unmodified, as
  separate libraries you may replace; its source code is at [ffmpeg.org](https://ffmpeg.org/download.html) and in the
  build used, [bytedeco's JavaCPP Presets](https://github.com/bytedeco/javacpp-presets/tree/master/ffmpeg)
- **[JavaCPP](https://github.com/bytedeco/javacpp)** and its FFmpeg presets — Apache License 2.0
- **[Byte Buddy](https://bytebuddy.net)** — Apache License 2.0
- **[Java Native Access](https://github.com/java-native-access/jna)** — Apache License 2.0 / LGPL 2.1
- **[OSHI](https://github.com/oshi/oshi)** — MIT
- **[jSystemThemeDetector](https://github.com/Dansoftowner/jSystemThemeDetector)** and **[JFA](https://github.com/0x4a616e/jfa)** — Apache License 2.0
- **[ThreeTen-Extra](https://www.threeten.org/threeten-extra/)** — BSD 3-Clause
- **[Gatherers4j](https://github.com/tginsberg/gatherers4j)** — Apache License 2.0
- **[JSpecify](https://jspecify.dev)** — Apache License 2.0
- **[SLF4J](https://www.slf4j.org)** — MIT, and **[Logback](https://logback.qos.ch)** — EPL 2.0 / LGPL 2.1

Built with, but not shipped: **[Lombok](https://projectlombok.org)** (MIT) and **[Jilt](https://github.com/skinny85/jilt)** (Apache License 2.0).

## Recognition models

Face and animal recognition run entirely on your computer, with these models, used exactly as published.

- **[YuNet](https://github.com/opencv/opencv_zoo/tree/main/models/face_detection_yunet)** face detection, from OpenCV Zoo — MIT
- **[SFace](https://github.com/opencv/opencv_zoo/tree/main/models/face_recognition_sface)** face recognition, from OpenCV Zoo — Apache License 2.0
- **[YOLOX-S and YOLOX-Nano](https://github.com/Megvii-BaseDetection/YOLOX)** object detection, by Megvii — Apache License 2.0
- **[SigLIP 2](https://github.com/google-research/big_vision)** B/32 at 256 px, scene recognition, by Google — Apache License 2.0;
  its image encoder alone, weights stored in half precision

## Map and place data

- Offline place names come from **[GeoNames](https://www.geonames.org)**, licensed under [Creative Commons Attribution 4.0](https://creativecommons.org/licenses/by/4.0/).
- The offline world map's countries come from **[Natural Earth](https://www.naturalearthdata.com)**, in the public domain.
- Map tiles © **[OpenStreetMap](https://www.openstreetmap.org/copyright)** contributors, available under the Open Database License (ODbL).
- When configured, online place search is provided by **[LocationIQ](https://locationiq.com)**.

## Holiday dates

- The days of Chinese New Year, Diwali, Hanukkah and Holi come from the tables of **[python-holidays](https://github.com/vacanza/holidays)** — MIT
