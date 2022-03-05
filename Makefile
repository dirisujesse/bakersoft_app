.PHONY: clean build_android build_ios build deploy_android deploy_ios deploy

update_icons:
	fvm flutter pub run flutter_launcher_icons:main
	
run_gen:
	fvm flutter pub run build_runner build --delete-conflicting-outputs