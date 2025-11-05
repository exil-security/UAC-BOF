CXX_x64 := x86_64-w64-mingw32-g++
CXX_x86 := i686-w64-mingw32-g++
CC_x64 := x86_64-w64-mingw32-gcc
CC_x86 := i686-w64-mingw32-gcc

all: bof standalone

bof:
	# SspiUACBypass
	mkdir -p SspiUacBypass/bin
	$(CXX_x64) -c SspiUacBypass/src/SspiUacBypassBOF.cpp -w -o SspiUacBypass/bin/SspiUacBypassBOF.x64.o
	$(CXX_x86) -c SspiUacBypass/src/SspiUacBypassBOF.cpp -w -o SspiUacBypass/bin/SspiUacBypassBOF.x86.o
	# TrustedPathDLLHijack
	mkdir -p TrustedPathDLLHijack/bin
	$(CC_x64) -c TrustedPathDLLHijack/src/TrustedPathDLLHijackBOF.c -w -o TrustedPathDLLHijack/bin/TrustedPathDLLHijackBOF.x64.o
	$(CC_x86) -c TrustedPathDLLHijack/src/TrustedPathDLLHijackBOF.c -w -o TrustedPathDLLHijack/bin/TrustedPathDLLHijackBOF.x86.o
	# RegistryShellCommand
	mkdir -p RegistryShellCommand/bin
	$(CC_x64) -c RegistryShellCommand/src/RegistryShellCommandBOF.c -w -o RegistryShellCommand/bin/RegistryShellCommandBOF.x64.o
	$(CC_x86) -c RegistryShellCommand/src/RegistryShellCommandBOF.c -w -o RegistryShellCommand/bin/RegistryShellCommandBOF.x86.o
	# SilentCleanupWinDir
	mkdir -p SilentCleanupWinDir/bin
	$(CC_x64) -c SilentCleanupWinDir/src/SilentCleanupWinDirBOF.c -w -o SilentCleanupWinDir/bin/SilentCleanupWinDirBOF.x64.o
	$(CC_x86) -c SilentCleanupWinDir/src/SilentCleanupWinDirBOF.c -w -o SilentCleanupWinDir/bin/SilentCleanupWinDirBOF.x86.o
	# CmstpElevatedCOM
	mkdir -p CmstpElevatedCOM/bin
	$(CXX_x64) -c CmstpElevatedCOM/src/CmstpElevatedCOMBOF.cpp -w -o CmstpElevatedCOM/bin/CmstpElevatedCOMBOF.x64.o
	$(CXX_x86) -c CmstpElevatedCOM/src/CmstpElevatedCOMBOF.cpp -w -o CmstpElevatedCOM/bin/CmstpElevatedCOMBOF.x86.o
	# ColorDataProxy
	mkdir -p ColorDataProxy/bin
	$(CXX_x64) -c ColorDataProxy/src/ColorDataProxyBOF.cpp -w -o ColorDataProxy/bin/ColorDataProxyBOF.x64.o
	$(CXX_x86) -c ColorDataProxy/src/ColorDataProxyBOF.cpp -w -o ColorDataProxy/bin/ColorDataProxyBOF.x86.o
	# EditionUpgradeManager
	mkdir -p EditionUpgradeManager/bin
	$(CC_x64) -c EditionUpgradeManager/src/EditionUpgradeManagerBOF.c -w -o EditionUpgradeManager/bin/EditionUpgradeManagerBOF.x64.o
	$(CC_x86) -c EditionUpgradeManager/src/EditionUpgradeManagerBOF.c -w -o EditionUpgradeManager/bin/EditionUpgradeManagerBOF.x86.o

install: bof
	mkdir -p -m 700 ~/.sliver-client/extensions/uac-sspidatagram/
	cp SspiUacBypass/extension.json ~/.sliver-client/extensions/uac-sspidatagram/
	cp SspiUacBypass/bin/SspiUacBypassBOF.*.o ~/.sliver-client/extensions/uac-sspidatagram/
	
	mkdir -p -m 700 ~/.sliver-client/extensions/uac-trustedpath/
	cp TrustedPathDLLHijack/extension.json ~/.sliver-client/extensions/uac-trustedpath/
	cp TrustedPathDLLHijack/bin/TrustedPathDLLHijackBOF.*.o ~/.sliver-client/extensions/uac-trustedpath/
	
	mkdir -p -m 700 ~/.sliver-client/extensions/uac-registrycommand/
	cp RegistryShellCommand/extension.json ~/.sliver-client/extensions/uac-registrycommand/
	cp RegistryShellCommand/bin/RegistryShellCommandBOF.*.o ~/.sliver-client/extensions/uac-registrycommand/
	
	mkdir -p -m 700 ~/.sliver-client/extensions/uac-silentcleanup/
	cp SilentCleanupWinDir/extension.json ~/.sliver-client/extensions/uac-silentcleanup/
	cp SilentCleanupWinDir/bin/SilentCleanupWinDirBOF.*.o ~/.sliver-client/extensions/uac-silentcleanup/
	
	mkdir -p -m 700 ~/.sliver-client/extensions/uac-elevatedcom/
	cp CmstpElevatedCOM/extension.json ~/.sliver-client/extensions/uac-elevatedcom/
	cp CmstpElevatedCOM/bin/CmstpElevatedCOMBOF.*.o ~/.sliver-client/extensions/uac-elevatedcom/
	
	mkdir -p -m 700 ~/.sliver-client/extensions/uac-colordataproxy/
	cp ColorDataProxy/extension.json ~/.sliver-client/extensions/uac-colordataproxy/
	cp ColorDataProxy/bin/ColorDataProxyBOF.*.o ~/.sliver-client/extensions/uac-colordataproxy/

	mkdir -p -m 700 ~/.sliver-client/extensions/uac-editionupgrade/
	cp EditionUpgradeManager/extension.json ~/.sliver-client/extensions/uac-editionupgrade/
	cp EditionUpgradeManager/bin/EditionUpgradeManagerBOF.*.o ~/.sliver-client/extensions/uac-editionupgrade/
	

standalone:
	# SspiUACBypass
	mkdir -p SspiUacBypass/bin/standalone
	$(CXX_x64) SspiUacBypass/src/standalone/SspiUacBypass.cpp SspiUacBypass/src/standalone/CreateSvcRpc.cpp -static -lsecur32 -s -w -o SspiUacBypass/bin/standalone/SspiUac.x64.exe
	$(CXX_x86) SspiUacBypass/src/standalone/SspiUacBypass.cpp SspiUacBypass/src/standalone/CreateSvcRpc.cpp -static -lsecur32 -s -w -o SspiUacBypass/bin/standalone/SspiUac.x86.exe
	# TrustedPathDLLHijack
	mkdir -p TrustedPathDLLHijack/bin/standalone
	$(CC_x64) TrustedPathDLLHijack/src/standalone/TrustedPathDLLHijack.c -static -s -w -loleaut32 -lshlwapi -lole32 -o TrustedPathDLLHijack/bin/standalone/TrustedPathDLLHijack.x64.exe
	$(CC_x86) TrustedPathDLLHijack/src/standalone/TrustedPathDLLHijack.c -static -s -w -loleaut32 -lshlwapi -lole32 -o TrustedPathDLLHijack/bin/standalone/TrustedPathDLLHijack.x86.exe
	# RegistryShellCommand
	mkdir -p RegistryShellCommand/bin/standalone
	$(CC_x64) RegistryShellCommand/src/standalone/RegistryShellCommand.c -static -s -w -lshlwapi -o RegistryShellCommand/bin/standalone/RegistryShellCommand.x64.exe
	$(CC_x86) RegistryShellCommand/src/standalone/RegistryShellCommand.c -static -s -w -lshlwapi -o RegistryShellCommand/bin/standalone/RegistryShellCommand.x86.exe
	# SilentCleanupWinDir
	mkdir -p SilentCleanupWinDir/bin/standalone
	$(CC_x64) SilentCleanupWinDir/src/standalone/SilentCleanupWinDir.c -static -s -w -loleaut32 -lole32 -o SilentCleanupWinDir/bin/standalone/SilentCleanupWinDir.x64.exe
	$(CC_x86) SilentCleanupWinDir/src/standalone/SilentCleanupWinDir.c -static -s -w -loleaut32 -lole32 -o SilentCleanupWinDir/bin/standalone/SilentCleanupWinDir.x86.exe
	# CmstpElevatedCOM
	mkdir -p CmstpElevatedCOM/bin/standalone
	$(CXX_x64) CmstpElevatedCOM/src/standalone/CmstpElevatedCOM.cpp -static -s -w -lole32 -lntdll -o CmstpElevatedCOM/bin/standalone/CmstpElevatedCOM.x64.exe
	$(CXX_x86) CmstpElevatedCOM/src/standalone/CmstpElevatedCOM.cpp -static -s -w -lole32 -lntdll -o CmstpElevatedCOM/bin/standalone/CmstpElevatedCOM.x86.exe
	# ColorDataProxy
	mkdir -p ColorDataProxy/bin/standalone
	$(CXX_x64) ColorDataProxy/src/standalone/ColorDataProxy.cpp -static -s -w -lole32 -lntdll -o ColorDataProxy/bin/standalone/ColorDataProxy.x64.exe
	$(CXX_x86) ColorDataProxy/src/standalone/ColorDataProxy.cpp -static -s -w -lole32 -lntdll -o ColorDataProxy/bin/standalone/ColorDataProxy.x86.exe
	# EditionUpgradeManager
	mkdir -p EditionUpgradeManager/bin/standalone
	$(CC_x64) EditionUpgradeManager/src/standalone/EditionUpgradeManager.c -static -s -w -lole32 -lntdll -o EditionUpgradeManager/bin/standalone/EditionUpgradeManager.x64.exe
	$(CC_x86) EditionUpgradeManager/src/standalone/EditionUpgradeManager.c -static -s -w -lole32 -lntdll -o EditionUpgradeManager/bin/standalone/EditionUpgradeManager.x86.exe

clean:
	rm -rf TrustedPathDLLHijack/bin
	rm -rf SspiUacBypass/bin
	rm -rf RegistryShellCommand/bin
	rm -rf SilentCleanupWinDir/bin
	rm -rf CmstpElevatedCOM/bin
	rm -rf ColorDataProxy/bin
	rm -rf EditionUpgradeManager/bin
