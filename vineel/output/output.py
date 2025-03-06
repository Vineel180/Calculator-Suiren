import shutil
from pathlib import Path

def main():
    thisFile_path = Path(__file__).resolve()
    thisProjectRootFolder_path = thisFile_path.parents[3]
    outputFolder_path = thisFile_path.parent

    #Android (.apk)
    source = thisProjectRootFolder_path / "build" / "app" / "outputs" / "flutter-apk" / "app-release.apk"
    destination = outputFolder_path / "app-release.apk"
    if source.exists():
        try:
            shutil.copy2(source, destination)
            print(".apk file copied.")
        except Exception as e:
            print(f"Exception while copying .apk file: {e}")
    else:
        print("No .apk file found.")

    #Windows (.exe)
    source = thisProjectRootFolder_path / "build" / "windows" / "x64" / "runner" / "Release"
    destination = outputFolder_path / "Windows"
    if source.exists():
        try:
            if destination.exists():
                shutil.rmtree(destination)
            shutil.copytree(source, destination)
            print(".exe folder copied.")
        except Exception as e:
            print(f"Exception while copying .exe folder: {e}")
    else:
        print("No .exe folder found.")

    #Web
    source = thisProjectRootFolder_path / "build" / "web"
    destination = outputFolder_path / "Web"
    if source.exists():
        try:
            if destination.exists():
                shutil.rmtree(destination)
            shutil.copytree(source, destination)
            print("web folder copied.")
        except Exception as e:
            print(f"Exception while copying web folder: {e}")
    else:
        print("No web folder found.")

if __name__ == "__main__":
    main()
    input("\nPress Enter to exit.")
