from conan import ConanFile
from conan.tools.cmake import CMakeToolchain

class FooRecipe(ConanFile):
    name = "foo"
    version = "1.0"
    description = "A basic recipe to test the support of tricore architectures in Conan"
    license = "MIT"
    settings = "os", "arch", "compiler", "build_type"
    generators = "CMakeDeps"

    def requirements(self):
        self.requires("zlib/1.2.13")

    def build_requirements(self):
        # self.requires("tricore-elf-gcc/11.3.1")
        pass

    def generate(self):
        tc = CMakeToolchain(self)
        tc.user_presets_path = False
        tc.generator = "Ninja Multi-Config"
        tc.generate()
