/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2018 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min.h"
#include <regex>

#ifdef MAC_VERSION
#include <Carbon/Carbon.h>
#include <sys/utsname.h>

#include <IOKit/IOKitLib.h>
#include <IOKit/network/IOEthernetInterface.h>
#include <IOKit/network/IONetworkInterface.h>
#include <IOKit/network/IOEthernetController.h>
#include <CoreFoundation/CoreFoundation.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

// Returns an iterator containing the primary (built-in) Ethernet interface. The caller is responsible for
// releasing the iterator after the caller is done with it.
static kern_return_t FindEthernetInterfaces(io_iterator_t* matchingServices) {
	kern_return_t          kernResult;
	CFMutableDictionaryRef matchingDict;
	CFMutableDictionaryRef propertyMatchDict;

	// Ethernet interfaces are instances of class kIOEthernetInterfaceClass.
	// IOServiceMatching is a convenience function to create a dictionary with the key kIOProviderClassKey and
	// the specified value.
	matchingDict = IOServiceMatching(kIOEthernetInterfaceClass);

	// Note that another option here would be:
	// matchingDict = IOBSDMatching("en0");
	// but en0: isn't necessarily the primary interface, especially on systems with multiple Ethernet ports.

	if (NULL == matchingDict) {
		printf("IOServiceMatching returned a NULL dictionary.\n");
	}
	else {
		// Each IONetworkInterface object has a Boolean property with the key kIOPrimaryInterface. Only the
		// primary (built-in) interface has this property set to TRUE.

		// IOServiceGetMatchingServices uses the default matching criteria defined by IOService. This considers
		// only the following properties plus any family-specific matching in this order of precedence
		// (see IOService::passiveMatch):
		//
		// kIOProviderClassKey (IOServiceMatching)
		// kIONameMatchKey (IOServiceNameMatching)
		// kIOPropertyMatchKey
		// kIOPathMatchKey
		// kIOMatchedServiceCountKey
		// family-specific matching
		// kIOBSDNameKey (IOBSDNameMatching)
		// kIOLocationMatchKey

		// The IONetworkingFamily does not define any family-specific matching. This means that in
		// order to have IOServiceGetMatchingServices consider the kIOPrimaryInterface property, we must
		// add that property to a separate dictionary and then add that to our matching dictionary
		// specifying kIOPropertyMatchKey.

		propertyMatchDict
			= CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);

		if (NULL == propertyMatchDict) {
			printf("CFDictionaryCreateMutable returned a NULL dictionary.\n");
		}
		else {
			// Set the value in the dictionary of the property with the given key, or add the key
			// to the dictionary if it doesn't exist. This call retains the value object passed in.
			CFDictionarySetValue(propertyMatchDict, CFSTR(kIOPrimaryInterface), kCFBooleanTrue);

			// Now add the dictionary containing the matching value for kIOPrimaryInterface to our main
			// matching dictionary. This call will retain propertyMatchDict, so we can release our reference
			// on propertyMatchDict after adding it to matchingDict.
			CFDictionarySetValue(matchingDict, CFSTR(kIOPropertyMatchKey), propertyMatchDict);
			CFRelease(propertyMatchDict);
		}
	}

	// IOServiceGetMatchingServices retains the returned iterator, so release the iterator when we're done with it.
	// IOServiceGetMatchingServices also consumes a reference on the matching dictionary so we don't need to release
	// the dictionary explicitly.
	kernResult = IOServiceGetMatchingServices(kIOMasterPortDefault, matchingDict, matchingServices);
	if (KERN_SUCCESS != kernResult) {
		printf("IOServiceGetMatchingServices returned 0x%08x\n", kernResult);
	}

	return kernResult;
}


// Given an iterator across a set of Ethernet interfaces, return the MAC address of the last one.
// If no interfaces are found the MAC address is set to an empty string.
// In this sample the iterator should contain just the primary interface.
static kern_return_t GetMACAddress(io_iterator_t intfIterator, UInt8* MACAddress, UInt8 bufferSize) {
	io_object_t   intfService;
	io_object_t   controllerService;
	kern_return_t kernResult = KERN_FAILURE;

	// Make sure the caller provided enough buffer space. Protect against buffer overflow problems.
	if (bufferSize < kIOEthernetAddressSize) {
		return kernResult;
	}

	// Initialize the returned address
	bzero(MACAddress, bufferSize);

	// IOIteratorNext retains the returned object, so release it when we're done with it.
	while ((intfService = IOIteratorNext(intfIterator))) {
		CFTypeRef MACAddressAsCFData;

		// IONetworkControllers can't be found directly by the IOServiceGetMatchingServices call,
		// since they are hardware nubs and do not participate in driver matching. In other words,
		// registerService() is never called on them. So we've found the IONetworkInterface and will
		// get its parent controller by asking for it specifically.

		// IORegistryEntryGetParentEntry retains the returned object, so release it when we're done with it.
		kernResult = IORegistryEntryGetParentEntry(intfService, kIOServicePlane, &controllerService);

		if (KERN_SUCCESS != kernResult) {
			printf("IORegistryEntryGetParentEntry returned 0x%08x\n", kernResult);
		}
		else {
			// Retrieve the MAC address property from the I/O Registry in the form of a CFData
			MACAddressAsCFData = IORegistryEntryCreateCFProperty(controllerService, CFSTR(kIOMACAddress), kCFAllocatorDefault, 0);
			if (MACAddressAsCFData) {
				CFShow(MACAddressAsCFData);    // for display purposes only; output goes to stderr

				// Get the raw bytes of the MAC address from the CFData
				CFDataGetBytes((CFDataRef)MACAddressAsCFData, CFRangeMake(0, kIOEthernetAddressSize), MACAddress);
				CFRelease(MACAddressAsCFData);
			}

			// Done with the parent Ethernet controller object so we release it.
			(void)IOObjectRelease(controllerService);
		}

		// Done with the Ethernet interface object so we release it.
		(void)IOObjectRelease(intfService);
	}

	return kernResult;
}


#else    // WIN_VERSION
#include <strsafe.h>
#include <tchar.h>
//#pragma comment(lib, "User32.lib")

#define BUFSIZE 256

typedef void(WINAPI* PGNSI)(LPSYSTEM_INFO);
typedef BOOL(WINAPI* PGPI)(DWORD, DWORD, DWORD, DWORD, PDWORD);

// from: https://stackoverflow.com/questions/15246817/retrieving-os-name-of-ms-windows-platform
BOOL GetOSDisplayString(LPTSTR pszOS) {
	OSVERSIONINFOEX osvi;
	SYSTEM_INFO     si;
	PGNSI           pGNSI;
	PGPI            pGPI;
	BOOL            bOsVersionInfoEx;
	DWORD           dwType;

	ZeroMemory(&si, sizeof(SYSTEM_INFO));
	ZeroMemory(&osvi, sizeof(OSVERSIONINFOEX));

	osvi.dwOSVersionInfoSize = sizeof(OSVERSIONINFOEX);
	bOsVersionInfoEx         = GetVersionEx((OSVERSIONINFO*)&osvi);

	if (!bOsVersionInfoEx)
		return 1;

	// Call GetNativeSystemInfo if supported or GetSystemInfo otherwise.

	pGNSI = (PGNSI)GetProcAddress(GetModuleHandle(TEXT("kernel32.dll")), "GetNativeSystemInfo");
	if (NULL != pGNSI)
		pGNSI(&si);
	else
		GetSystemInfo(&si);

	if (VER_PLATFORM_WIN32_NT == osvi.dwPlatformId && osvi.dwMajorVersion > 4) {
		StringCchCopy(pszOS, BUFSIZE, TEXT("Microsoft "));

		// Test for the specific product.

		if (osvi.dwMajorVersion == 6) {
			if (osvi.dwMinorVersion == 0) {
				if (osvi.wProductType == VER_NT_WORKSTATION)
					StringCchCat(pszOS, BUFSIZE, TEXT("Windows Vista "));
				else
					StringCchCat(pszOS, BUFSIZE, TEXT("Windows Server 2008 "));
			}

			if (osvi.dwMinorVersion == 1 || osvi.dwMinorVersion == 2) {
				if (osvi.wProductType == VER_NT_WORKSTATION && osvi.dwMinorVersion == 1)
					StringCchCat(pszOS, BUFSIZE, TEXT("Windows 7 "));
				else if (osvi.wProductType == VER_NT_WORKSTATION && osvi.dwMinorVersion == 2)
					StringCchCat(pszOS, BUFSIZE, TEXT("Windows 8 "));
				else
					StringCchCat(pszOS, BUFSIZE, TEXT("Windows Server 2008 R2 "));
			}

			pGPI = (PGPI)GetProcAddress(GetModuleHandle(TEXT("kernel32.dll")), "GetProductInfo");

			pGPI(osvi.dwMajorVersion, osvi.dwMinorVersion, 0, 0, &dwType);

			switch (dwType) {
				case PRODUCT_ULTIMATE:
					StringCchCat(pszOS, BUFSIZE, TEXT("Ultimate Edition"));
					break;
				case PRODUCT_PROFESSIONAL:
					StringCchCat(pszOS, BUFSIZE, TEXT("Professional"));
					break;
				case PRODUCT_HOME_PREMIUM:
					StringCchCat(pszOS, BUFSIZE, TEXT("Home Premium Edition"));
					break;
				case PRODUCT_HOME_BASIC:
					StringCchCat(pszOS, BUFSIZE, TEXT("Home Basic Edition"));
					break;
				case PRODUCT_ENTERPRISE:
					StringCchCat(pszOS, BUFSIZE, TEXT("Enterprise Edition"));
					break;
				case PRODUCT_BUSINESS:
					StringCchCat(pszOS, BUFSIZE, TEXT("Business Edition"));
					break;
				case PRODUCT_STARTER:
					StringCchCat(pszOS, BUFSIZE, TEXT("Starter Edition"));
					break;
				case PRODUCT_CLUSTER_SERVER:
					StringCchCat(pszOS, BUFSIZE, TEXT("Cluster Server Edition"));
					break;
				case PRODUCT_DATACENTER_SERVER:
					StringCchCat(pszOS, BUFSIZE, TEXT("Datacenter Edition"));
					break;
				case PRODUCT_DATACENTER_SERVER_CORE:
					StringCchCat(pszOS, BUFSIZE, TEXT("Datacenter Edition (core installation)"));
					break;
				case PRODUCT_ENTERPRISE_SERVER:
					StringCchCat(pszOS, BUFSIZE, TEXT("Enterprise Edition"));
					break;
				case PRODUCT_ENTERPRISE_SERVER_CORE:
					StringCchCat(pszOS, BUFSIZE, TEXT("Enterprise Edition (core installation)"));
					break;
				case PRODUCT_ENTERPRISE_SERVER_IA64:
					StringCchCat(pszOS, BUFSIZE, TEXT("Enterprise Edition for Itanium-based Systems"));
					break;
				case PRODUCT_SMALLBUSINESS_SERVER:
					StringCchCat(pszOS, BUFSIZE, TEXT("Small Business Server"));
					break;
				case PRODUCT_SMALLBUSINESS_SERVER_PREMIUM:
					StringCchCat(pszOS, BUFSIZE, TEXT("Small Business Server Premium Edition"));
					break;
				case PRODUCT_STANDARD_SERVER:
					StringCchCat(pszOS, BUFSIZE, TEXT("Standard Edition"));
					break;
				case PRODUCT_STANDARD_SERVER_CORE:
					StringCchCat(pszOS, BUFSIZE, TEXT("Standard Edition (core installation)"));
					break;
				case PRODUCT_WEB_SERVER:
					StringCchCat(pszOS, BUFSIZE, TEXT("Web Server Edition"));
					break;
			}
		}

		if (osvi.dwMajorVersion == 5 && osvi.dwMinorVersion == 2) {
			if (GetSystemMetrics(SM_SERVERR2))
				StringCchCat(pszOS, BUFSIZE, TEXT("Windows Server 2003 R2, "));
			else if (osvi.wSuiteMask & VER_SUITE_STORAGE_SERVER)
				StringCchCat(pszOS, BUFSIZE, TEXT("Windows Storage Server 2003"));
			else if (osvi.wSuiteMask & VER_SUITE_WH_SERVER)
				StringCchCat(pszOS, BUFSIZE, TEXT("Windows Home Server"));
			else if (osvi.wProductType == VER_NT_WORKSTATION && si.wProcessorArchitecture == PROCESSOR_ARCHITECTURE_AMD64) {
				StringCchCat(pszOS, BUFSIZE, TEXT("Windows XP Professional x64 Edition"));
			}
			else
				StringCchCat(pszOS, BUFSIZE, TEXT("Windows Server 2003, "));

			// Test for the server type.
			if (osvi.wProductType != VER_NT_WORKSTATION) {
				if (si.wProcessorArchitecture == PROCESSOR_ARCHITECTURE_IA64) {
					if (osvi.wSuiteMask & VER_SUITE_DATACENTER)
						StringCchCat(pszOS, BUFSIZE, TEXT("Datacenter Edition for Itanium-based Systems"));
					else if (osvi.wSuiteMask & VER_SUITE_ENTERPRISE)
						StringCchCat(pszOS, BUFSIZE, TEXT("Enterprise Edition for Itanium-based Systems"));
				}

				else if (si.wProcessorArchitecture == PROCESSOR_ARCHITECTURE_AMD64) {
					if (osvi.wSuiteMask & VER_SUITE_DATACENTER)
						StringCchCat(pszOS, BUFSIZE, TEXT("Datacenter x64 Edition"));
					else if (osvi.wSuiteMask & VER_SUITE_ENTERPRISE)
						StringCchCat(pszOS, BUFSIZE, TEXT("Enterprise x64 Edition"));
					else
						StringCchCat(pszOS, BUFSIZE, TEXT("Standard x64 Edition"));
				}

				else {
					if (osvi.wSuiteMask & VER_SUITE_COMPUTE_SERVER)
						StringCchCat(pszOS, BUFSIZE, TEXT("Compute Cluster Edition"));
					else if (osvi.wSuiteMask & VER_SUITE_DATACENTER)
						StringCchCat(pszOS, BUFSIZE, TEXT("Datacenter Edition"));
					else if (osvi.wSuiteMask & VER_SUITE_ENTERPRISE)
						StringCchCat(pszOS, BUFSIZE, TEXT("Enterprise Edition"));
					else if (osvi.wSuiteMask & VER_SUITE_BLADE)
						StringCchCat(pszOS, BUFSIZE, TEXT("Web Edition"));
					else
						StringCchCat(pszOS, BUFSIZE, TEXT("Standard Edition"));
				}
			}
		}

		if (osvi.dwMajorVersion == 5 && osvi.dwMinorVersion == 1) {
			StringCchCat(pszOS, BUFSIZE, TEXT("Windows XP "));
			if (osvi.wSuiteMask & VER_SUITE_PERSONAL)
				StringCchCat(pszOS, BUFSIZE, TEXT("Home Edition"));
			else
				StringCchCat(pszOS, BUFSIZE, TEXT("Professional"));
		}

		if (osvi.dwMajorVersion == 5 && osvi.dwMinorVersion == 0) {
			StringCchCat(pszOS, BUFSIZE, TEXT("Windows 2000 "));

			if (osvi.wProductType == VER_NT_WORKSTATION) {
				StringCchCat(pszOS, BUFSIZE, TEXT("Professional"));
			}
			else {
				if (osvi.wSuiteMask & VER_SUITE_DATACENTER)
					StringCchCat(pszOS, BUFSIZE, TEXT("Datacenter Server"));
				else if (osvi.wSuiteMask & VER_SUITE_ENTERPRISE)
					StringCchCat(pszOS, BUFSIZE, TEXT("Advanced Server"));
				else
					StringCchCat(pszOS, BUFSIZE, TEXT("Server"));
			}
		}

		// Include service pack (if any) and build number.

		if (_tcslen(osvi.szCSDVersion) > 0) {
			StringCchCat(pszOS, BUFSIZE, TEXT(" "));
			StringCchCat(pszOS, BUFSIZE, osvi.szCSDVersion);
		}

		TCHAR buf[80];

		StringCchPrintf(buf, 80, TEXT(" (build %d)"), osvi.dwBuildNumber);
		StringCchCat(pszOS, BUFSIZE, buf);

		if (osvi.dwMajorVersion >= 6) {
			if (si.wProcessorArchitecture == PROCESSOR_ARCHITECTURE_AMD64)
				StringCchCat(pszOS, BUFSIZE, TEXT(", 64-bit"));
			else if (si.wProcessorArchitecture == PROCESSOR_ARCHITECTURE_INTEL)
				StringCchCat(pszOS, BUFSIZE, TEXT(", 32-bit"));
		}

		return TRUE;
	}

	else {
		printf("This sample does not support this version of Windows.\n");
		return FALSE;
	}
}

#endif

using namespace c74::min;


class environment : public object<environment> {
public:
	MIN_DESCRIPTION {"Get info about the current max environment."};
	MIN_TAGS {"math"};
	MIN_AUTHOR {"Cycling '74"};
	MIN_RELATED {"gestalt"};

	inlet<>  in {this, "(bang) get info about the current max environment"};
	outlet<> out_platform {this, "(symbol) platform"};
	outlet<> out_arch {this, "(symbol) architecture"};
	outlet<> out_os {this, "(symbol) operating system version"};
	outlet<> out_macaddr {this, "(symbol) primary MAC address"};


	const char* osversionstring() {
		static char version[512];
#ifdef MAC_VERSION
		SInt32         versionMajor = 0, versionMinor = 0, versionBugFix = 0;
		struct utsname un;
		uname(&un);
		Gestalt(gestaltSystemVersionMajor, &versionMajor);
		Gestalt(gestaltSystemVersionMinor, &versionMinor);
		Gestalt(gestaltSystemVersionBugFix, &versionBugFix);
		snprintf(
			version, sizeof(version), "Mac OS X Version %i.%i.%i %s", (int)versionMajor, (int)versionMinor, (int)versionBugFix, un.machine);
#endif
#ifdef WIN_VERSION
		if (!GetOSDisplayString(version)) {
			// if we get here it is an unexpected version of windows
			snprintf(version, sizeof(version), "Unexpected version of Microsoft Windows");
		}
#endif
		return version;
	}


	const char* macaddr() {
		static char macaddrstr[64];
#ifdef MAC_VERSION
		kern_return_t kernResult = KERN_SUCCESS;
		io_iterator_t intfIterator;
		UInt8         MACAddress[kIOEthernetAddressSize];

		kernResult = FindEthernetInterfaces(&intfIterator);
		if (KERN_SUCCESS != kernResult) {
			c74::max::object_post(nullptr, "FindEthernetInterfaces returned 0x%08x\n", kernResult);
		}
		else {
			kernResult = GetMACAddress(intfIterator, MACAddress, sizeof(MACAddress));
			if (KERN_SUCCESS == kernResult) {
				snprintf(macaddrstr, 64, "%02x:%02x:%02x:%02x:%02x:%02x", MACAddress[0], MACAddress[1], MACAddress[2], MACAddress[3],
					MACAddress[4], MACAddress[5]);
			}
			else
				macaddrstr[0] = 0;
		}
		IOObjectRelease(intfIterator);    // Release the iterator.
#endif
#ifdef WIN_VERSION

#endif
		return macaddrstr;
	}


	message<> bang {this, "bang", "Get info about the current max environment.",
		MIN_FUNCTION {
			out_macaddr.send(macaddr());
			out_os.send(osversionstring());

#ifdef C74_X64
			out_arch.send("x86_64");
#else    // 32-bit
			out_arch.send("i386");
#endif

#ifdef MAC_VERSION
			out_platform.send("mac");
#else    // WIN_VERSION
			out_platform.send("win");
#endif
			return {};
		}};
};

MIN_EXTERNAL(environment);
