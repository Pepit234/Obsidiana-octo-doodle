plugins {
    id("fabric-loom") version "1.10.5"
    `maven-publish`
}

group = project.property("maven_group")!!
version = project.property("version")!!

dependencies {
    minecraft("com.mojang:minecraft:1.21.8")
    mappings("net.fabricmc:yarn:1.21.8+build.1:v2")
    modImplementation("net.fabricmc:fabric-loader:0.16.14")
    modImplementation("net.fabricmc.fabric-api:fabric-api:0.133.4+1.21.8")
    modCompileOnly(files("libs/meteor-client-1.21.8-69.jar"))
}

java {
    toolchain.languageVersion.set(JavaLanguageVersion.of(21))
}

tasks.processResources {
    inputs.property("version", project.version)
    filesMatching("fabric.mod.json") {
        expand("version" to project.version)
    }
}
