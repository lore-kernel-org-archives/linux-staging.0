Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBCCCA7A;
	Mon, 11 Mar 2024 06:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710139181; cv=none; b=KhUnjGQPdHoCU8gTfa79i6f9AK4Qk4ebllrFpMzrYPJnexy7nyiClRJN6hQqR9V3bmwwRCwx8T+XkjEb9nn1KxuoOg7YcE9fQTR+j5fr6ppuo786RD9jYsprRDmWwlShijlkoSieeQtaI7H967jQFw7nAtfBRVF9UoicYINhtUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710139181; c=relaxed/simple;
	bh=WV29oSS7njjlFofmlCWy4/o2MpaODabHjhMD14BzaiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+/AP3CYDBBC67R6BRW7iDZXqT8omWsyc+xNVy0PPrBsUuwTO6TdOdYTgkNZyxOioUlug3vjpkMnWUnxnbWpkrAcQ+CqUh53VezhziLHmIXaY5cuITyqrPnzLc8cALy27OI+8OO5SAmz2BQpuBhphTKSVpFMZIpoOmrWKcSZmJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lv+3/1jt; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lv+3/1jt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710139178; x=1741675178;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WV29oSS7njjlFofmlCWy4/o2MpaODabHjhMD14BzaiA=;
  b=lv+3/1jtDwndH80I3j5FmKwUjQuFbosZ2zbalN7xPalz52EbGcEkvXso
   0QwO4u5fjDvYb65TLuLFhsHDYdH0wLRX/svno2x5DAGnS+vdS5xzOl28U
   Gx7AzNiMA0Hbw5WJWPAM99hADpHLug1myVyMFkaEOIB0phrgyfJHHm9qk
   cG10y5OfleBaD4zdGHd7hFNCbSv3hAdPTV1Ozw0MkkDAHiXKmismdrHt5
   NVS29e7Nav6/BY5BQPQLzbCfRUkwbvvw56UsUm/dnzhLCNwDe753Ohlkw
   jpND+8u7zoozIz7lLWBw6ZJTGSee+Qg0f1PaCZZtC1Uvao5+zS1kuGFhf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="15345921"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="15345921"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 23:39:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="10948469"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Mar 2024 23:39:35 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjZJs-0008xf-2b;
	Mon, 11 Mar 2024 06:39:32 +0000
Date: Mon, 11 Mar 2024 14:39:24 +0800
From: kernel test robot <lkp@intel.com>
To: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com, anjan@momi.ca
Cc: oe-kbuild-all@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Tree Davies <tdavies@darkphysics.net>
Subject: Re: [PATCH 11/11] Staging: rtl8192e: Implement BIT macro for bit
 shift ops
Message-ID: <202403111451.mwNy2vqG-lkp@intel.com>
References: <20240310235552.4217-12-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240310235552.4217-12-tdavies@darkphysics.net>

Hi Tree,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Tree-Davies/Staging-rtl8192e-Rename-variable-ReturnPoint/20240311-075949
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20240310235552.4217-12-tdavies%40darkphysics.net
patch subject: [PATCH 11/11] Staging: rtl8192e: Implement BIT macro for bit shift ops
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240311/202403111451.mwNy2vqG-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403111451.mwNy2vqG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403111451.mwNy2vqG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/staging/rtl8192e/rtllib_module.c:35:
>> drivers/staging/rtl8192e/rtllib.h:422: warning: "WLAN_CAPABILITY_ESS" redefined
     422 | #define WLAN_CAPABILITY_ESS BIT(0)
         | 
   In file included from include/net/cfg80211.h:23,
                    from drivers/staging/rtl8192e/rtllib.h:40:
   include/linux/ieee80211.h:3218: note: this is the location of the previous definition
    3218 | #define WLAN_CAPABILITY_ESS             (1<<0)
         | 
>> drivers/staging/rtl8192e/rtllib.h:423: warning: "WLAN_CAPABILITY_IBSS" redefined
     423 | #define WLAN_CAPABILITY_IBSS BIT(1)
         | 
   include/linux/ieee80211.h:3219: note: this is the location of the previous definition
    3219 | #define WLAN_CAPABILITY_IBSS            (1<<1)
         | 
>> drivers/staging/rtl8192e/rtllib.h:424: warning: "WLAN_CAPABILITY_PRIVACY" redefined
     424 | #define WLAN_CAPABILITY_PRIVACY BIT(4)
         | 
   include/linux/ieee80211.h:3231: note: this is the location of the previous definition
    3231 | #define WLAN_CAPABILITY_PRIVACY         (1<<4)
         | 
>> drivers/staging/rtl8192e/rtllib.h:425: warning: "WLAN_CAPABILITY_SHORT_PREAMBLE" redefined
     425 | #define WLAN_CAPABILITY_SHORT_PREAMBLE BIT(5)
         | 
   include/linux/ieee80211.h:3232: note: this is the location of the previous definition
    3232 | #define WLAN_CAPABILITY_SHORT_PREAMBLE  (1<<5)
         | 
>> drivers/staging/rtl8192e/rtllib.h:426: warning: "WLAN_CAPABILITY_SHORT_SLOT_TIME" redefined
     426 | #define WLAN_CAPABILITY_SHORT_SLOT_TIME BIT(10)
         | 
   include/linux/ieee80211.h:3239: note: this is the location of the previous definition
    3239 | #define WLAN_CAPABILITY_SHORT_SLOT_TIME (1<<10)
         | 
--
   In file included from drivers/staging/rtl8192e/rtllib_rx.c:36:
>> drivers/staging/rtl8192e/rtllib.h:422: warning: "WLAN_CAPABILITY_ESS" redefined
     422 | #define WLAN_CAPABILITY_ESS BIT(0)
         | 
   In file included from include/net/cfg80211.h:23,
                    from drivers/staging/rtl8192e/rtllib.h:40:
   include/linux/ieee80211.h:3218: note: this is the location of the previous definition
    3218 | #define WLAN_CAPABILITY_ESS             (1<<0)
         | 
>> drivers/staging/rtl8192e/rtllib.h:423: warning: "WLAN_CAPABILITY_IBSS" redefined
     423 | #define WLAN_CAPABILITY_IBSS BIT(1)
         | 
   include/linux/ieee80211.h:3219: note: this is the location of the previous definition
    3219 | #define WLAN_CAPABILITY_IBSS            (1<<1)
         | 
>> drivers/staging/rtl8192e/rtllib.h:424: warning: "WLAN_CAPABILITY_PRIVACY" redefined
     424 | #define WLAN_CAPABILITY_PRIVACY BIT(4)
         | 
   include/linux/ieee80211.h:3231: note: this is the location of the previous definition
    3231 | #define WLAN_CAPABILITY_PRIVACY         (1<<4)
         | 
>> drivers/staging/rtl8192e/rtllib.h:425: warning: "WLAN_CAPABILITY_SHORT_PREAMBLE" redefined
     425 | #define WLAN_CAPABILITY_SHORT_PREAMBLE BIT(5)
         | 
   include/linux/ieee80211.h:3232: note: this is the location of the previous definition
    3232 | #define WLAN_CAPABILITY_SHORT_PREAMBLE  (1<<5)
         | 
>> drivers/staging/rtl8192e/rtllib.h:426: warning: "WLAN_CAPABILITY_SHORT_SLOT_TIME" redefined
     426 | #define WLAN_CAPABILITY_SHORT_SLOT_TIME BIT(10)
         | 
   include/linux/ieee80211.h:3239: note: this is the location of the previous definition
    3239 | #define WLAN_CAPABILITY_SHORT_SLOT_TIME (1<<10)
         | 
   during RTL pass: mach
   drivers/staging/rtl8192e/rtllib_rx.c: In function 'rtllib_rx_decrypt':
   drivers/staging/rtl8192e/rtllib_rx.c:1141:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9703
    1141 | }
         | ^
   0x5b78c1 arc_ifcvt
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/config/arc/arc.cc:9703
   0xe431b4 arc_reorg
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/config/arc/arc.cc:8552
   0xaed299 execute
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/reorg.cc:3927
   Please submit a full bug report, with preprocessed source (by using -freport-bug).
   Please include the complete backtrace with any bug report.
   See <https://gcc.gnu.org/bugs/> for instructions.
--
   In file included from drivers/staging/rtl8192e/rtl819x_BAProc.c:10:
>> drivers/staging/rtl8192e/rtllib.h:422: warning: "WLAN_CAPABILITY_ESS" redefined
     422 | #define WLAN_CAPABILITY_ESS BIT(0)
         | 
   In file included from include/net/cfg80211.h:23,
                    from drivers/staging/rtl8192e/rtllib.h:40:
   include/linux/ieee80211.h:3218: note: this is the location of the previous definition
    3218 | #define WLAN_CAPABILITY_ESS             (1<<0)
         | 
>> drivers/staging/rtl8192e/rtllib.h:423: warning: "WLAN_CAPABILITY_IBSS" redefined
     423 | #define WLAN_CAPABILITY_IBSS BIT(1)
         | 
   include/linux/ieee80211.h:3219: note: this is the location of the previous definition
    3219 | #define WLAN_CAPABILITY_IBSS            (1<<1)
         | 
>> drivers/staging/rtl8192e/rtllib.h:424: warning: "WLAN_CAPABILITY_PRIVACY" redefined
     424 | #define WLAN_CAPABILITY_PRIVACY BIT(4)
         | 
   include/linux/ieee80211.h:3231: note: this is the location of the previous definition
    3231 | #define WLAN_CAPABILITY_PRIVACY         (1<<4)
         | 
>> drivers/staging/rtl8192e/rtllib.h:425: warning: "WLAN_CAPABILITY_SHORT_PREAMBLE" redefined
     425 | #define WLAN_CAPABILITY_SHORT_PREAMBLE BIT(5)
         | 
   include/linux/ieee80211.h:3232: note: this is the location of the previous definition
    3232 | #define WLAN_CAPABILITY_SHORT_PREAMBLE  (1<<5)
         | 
>> drivers/staging/rtl8192e/rtllib.h:426: warning: "WLAN_CAPABILITY_SHORT_SLOT_TIME" redefined
     426 | #define WLAN_CAPABILITY_SHORT_SLOT_TIME BIT(10)
         | 
   include/linux/ieee80211.h:3239: note: this is the location of the previous definition
    3239 | #define WLAN_CAPABILITY_SHORT_SLOT_TIME (1<<10)
         | 
   during RTL pass: mach
   drivers/staging/rtl8192e/rtl819x_BAProc.c: In function 'rtllib_send_DELBA':
   drivers/staging/rtl8192e/rtl819x_BAProc.c:212:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9703
     212 | }
         | ^
   0x5b78c1 arc_ifcvt
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/config/arc/arc.cc:9703
   0xe431b4 arc_reorg
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/config/arc/arc.cc:8552
   0xaed299 execute
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/reorg.cc:3927
   Please submit a full bug report, with preprocessed source (by using -freport-bug).
   Please include the complete backtrace with any bug report.
   See <https://gcc.gnu.org/bugs/> for instructions.
--
   In file included from drivers/staging/rtl8192e/rtllib_crypt_ccmp.c:17:
>> drivers/staging/rtl8192e/rtllib.h:422: warning: "WLAN_CAPABILITY_ESS" redefined
     422 | #define WLAN_CAPABILITY_ESS BIT(0)
         | 
   In file included from include/net/cfg80211.h:23,
                    from drivers/staging/rtl8192e/rtllib.h:40:
   include/linux/ieee80211.h:3218: note: this is the location of the previous definition
    3218 | #define WLAN_CAPABILITY_ESS             (1<<0)
         | 
>> drivers/staging/rtl8192e/rtllib.h:423: warning: "WLAN_CAPABILITY_IBSS" redefined
     423 | #define WLAN_CAPABILITY_IBSS BIT(1)
         | 
   include/linux/ieee80211.h:3219: note: this is the location of the previous definition
    3219 | #define WLAN_CAPABILITY_IBSS            (1<<1)
         | 
>> drivers/staging/rtl8192e/rtllib.h:424: warning: "WLAN_CAPABILITY_PRIVACY" redefined
     424 | #define WLAN_CAPABILITY_PRIVACY BIT(4)
         | 
   include/linux/ieee80211.h:3231: note: this is the location of the previous definition
    3231 | #define WLAN_CAPABILITY_PRIVACY         (1<<4)
         | 
>> drivers/staging/rtl8192e/rtllib.h:425: warning: "WLAN_CAPABILITY_SHORT_PREAMBLE" redefined
     425 | #define WLAN_CAPABILITY_SHORT_PREAMBLE BIT(5)
         | 
   include/linux/ieee80211.h:3232: note: this is the location of the previous definition
    3232 | #define WLAN_CAPABILITY_SHORT_PREAMBLE  (1<<5)
         | 
>> drivers/staging/rtl8192e/rtllib.h:426: warning: "WLAN_CAPABILITY_SHORT_SLOT_TIME" redefined
     426 | #define WLAN_CAPABILITY_SHORT_SLOT_TIME BIT(10)
         | 
   include/linux/ieee80211.h:3239: note: this is the location of the previous definition
    3239 | #define WLAN_CAPABILITY_SHORT_SLOT_TIME (1<<10)
         | 
   during RTL pass: mach
   drivers/staging/rtl8192e/rtllib_crypt_ccmp.c: In function 'rtllib_ccmp_decrypt':
   drivers/staging/rtl8192e/rtllib_crypt_ccmp.c:310:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9703
     310 | }
         | ^
   0x5b78c1 arc_ifcvt
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/config/arc/arc.cc:9703
   0xe431b4 arc_reorg
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/config/arc/arc.cc:8552
   0xaed299 execute
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/reorg.cc:3927
   Please submit a full bug report, with preprocessed source (by using -freport-bug).
   Please include the complete backtrace with any bug report.
   See <https://gcc.gnu.org/bugs/> for instructions.
--
   In file included from drivers/staging/rtl8192e/rtllib_crypt_tkip.c:23:
>> drivers/staging/rtl8192e/rtllib.h:422: warning: "WLAN_CAPABILITY_ESS" redefined
     422 | #define WLAN_CAPABILITY_ESS BIT(0)
         | 
   In file included from include/net/cfg80211.h:23,
                    from drivers/staging/rtl8192e/rtllib.h:40:
   include/linux/ieee80211.h:3218: note: this is the location of the previous definition
    3218 | #define WLAN_CAPABILITY_ESS             (1<<0)
         | 
>> drivers/staging/rtl8192e/rtllib.h:423: warning: "WLAN_CAPABILITY_IBSS" redefined
     423 | #define WLAN_CAPABILITY_IBSS BIT(1)
         | 
   include/linux/ieee80211.h:3219: note: this is the location of the previous definition
    3219 | #define WLAN_CAPABILITY_IBSS            (1<<1)
         | 
>> drivers/staging/rtl8192e/rtllib.h:424: warning: "WLAN_CAPABILITY_PRIVACY" redefined
     424 | #define WLAN_CAPABILITY_PRIVACY BIT(4)
         | 
   include/linux/ieee80211.h:3231: note: this is the location of the previous definition
    3231 | #define WLAN_CAPABILITY_PRIVACY         (1<<4)
         | 
>> drivers/staging/rtl8192e/rtllib.h:425: warning: "WLAN_CAPABILITY_SHORT_PREAMBLE" redefined
     425 | #define WLAN_CAPABILITY_SHORT_PREAMBLE BIT(5)
         | 
   include/linux/ieee80211.h:3232: note: this is the location of the previous definition
    3232 | #define WLAN_CAPABILITY_SHORT_PREAMBLE  (1<<5)
         | 
>> drivers/staging/rtl8192e/rtllib.h:426: warning: "WLAN_CAPABILITY_SHORT_SLOT_TIME" redefined
     426 | #define WLAN_CAPABILITY_SHORT_SLOT_TIME BIT(10)
         | 
   include/linux/ieee80211.h:3239: note: this is the location of the previous definition
    3239 | #define WLAN_CAPABILITY_SHORT_SLOT_TIME (1<<10)
         | 
   during RTL pass: mach
   drivers/staging/rtl8192e/rtllib_crypt_tkip.c: In function 'rtllib_tkip_decrypt':
   drivers/staging/rtl8192e/rtllib_crypt_tkip.c:437:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9703
     437 | }
         | ^
   0x5b78c1 arc_ifcvt
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/config/arc/arc.cc:9703
   0xe431b4 arc_reorg
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/config/arc/arc.cc:8552
   0xaed299 execute
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/reorg.cc:3927
   Please submit a full bug report, with preprocessed source (by using -freport-bug).
   Please include the complete backtrace with any bug report.
   See <https://gcc.gnu.org/bugs/> for instructions.
--
   In file included from drivers/staging/rtl8192e/rtl8192e/rtl_core.h:35,
                    from drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c:10:
>> drivers/staging/rtl8192e/rtl8192e/../rtllib.h:422: warning: "WLAN_CAPABILITY_ESS" redefined
     422 | #define WLAN_CAPABILITY_ESS BIT(0)
         | 
   In file included from include/net/cfg80211.h:23,
                    from drivers/staging/rtl8192e/rtl8192e/../rtllib.h:40:
   include/linux/ieee80211.h:3218: note: this is the location of the previous definition
    3218 | #define WLAN_CAPABILITY_ESS             (1<<0)
         | 
>> drivers/staging/rtl8192e/rtl8192e/../rtllib.h:423: warning: "WLAN_CAPABILITY_IBSS" redefined
     423 | #define WLAN_CAPABILITY_IBSS BIT(1)
         | 
   include/linux/ieee80211.h:3219: note: this is the location of the previous definition
    3219 | #define WLAN_CAPABILITY_IBSS            (1<<1)
         | 
>> drivers/staging/rtl8192e/rtl8192e/../rtllib.h:424: warning: "WLAN_CAPABILITY_PRIVACY" redefined
     424 | #define WLAN_CAPABILITY_PRIVACY BIT(4)
         | 
   include/linux/ieee80211.h:3231: note: this is the location of the previous definition
    3231 | #define WLAN_CAPABILITY_PRIVACY         (1<<4)
         | 
>> drivers/staging/rtl8192e/rtl8192e/../rtllib.h:425: warning: "WLAN_CAPABILITY_SHORT_PREAMBLE" redefined
     425 | #define WLAN_CAPABILITY_SHORT_PREAMBLE BIT(5)
         | 
   include/linux/ieee80211.h:3232: note: this is the location of the previous definition
    3232 | #define WLAN_CAPABILITY_SHORT_PREAMBLE  (1<<5)
         | 
>> drivers/staging/rtl8192e/rtl8192e/../rtllib.h:426: warning: "WLAN_CAPABILITY_SHORT_SLOT_TIME" redefined
     426 | #define WLAN_CAPABILITY_SHORT_SLOT_TIME BIT(10)
         | 
   include/linux/ieee80211.h:3239: note: this is the location of the previous definition
    3239 | #define WLAN_CAPABILITY_SHORT_SLOT_TIME (1<<10)
         | 


vim +/WLAN_CAPABILITY_ESS +422 drivers/staging/rtl8192e/rtllib.h

   421	
 > 422	#define WLAN_CAPABILITY_ESS BIT(0)
 > 423	#define WLAN_CAPABILITY_IBSS BIT(1)
 > 424	#define WLAN_CAPABILITY_PRIVACY BIT(4)
 > 425	#define WLAN_CAPABILITY_SHORT_PREAMBLE BIT(5)
 > 426	#define WLAN_CAPABILITY_SHORT_SLOT_TIME BIT(10)
   427	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
