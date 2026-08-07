allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

// Some plugins (e.g. file_picker) ship an older compileSdk than a
// transitive dependency (flutter_plugin_android_lifecycle) requires,
// which fails the AAR metadata check. Force every Android library module
// up to a compileSdk known to satisfy all current plugins, rather than
// pinning each plugin version individually. Must be registered before
// evaluationDependsOn below, which eagerly evaluates ":app" and would
// make a later afterEvaluate() call on it throw.
subprojects {
    afterEvaluate {
        extensions.findByType(com.android.build.gradle.LibraryExtension::class.java)?.let { android ->
            if ((android.compileSdk ?: 0) < 36) {
                android.compileSdk = 36
            }
        }
    }
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
