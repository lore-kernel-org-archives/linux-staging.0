Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB2129D297;
	Fri, 20 Feb 2026 23:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771631449; cv=none; b=OuqCVXnjO5WtRFF2VzjH8vIpEgPquzZZk6+GTWcM6IGYcbe2AKA8k2+sg6pb30ckC1XwMI/PEhNea6Gyi3cmH2AJrxr00G9WKmMrhX6YqYzUa6alq/TPMICFn5PfmEFmZl+kIe40FdyU7zFlmkeHeMWjkLAaWwUFQDPFV7EW+wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771631449; c=relaxed/simple;
	bh=edSJNWiv3Umy5PdvGwSMn+4sBEnPRB97VF9XavlDRQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBYpvDKLiRhi+Awfdymv5JYrD7T7dCPybT/NKJD9i8EI78KQUX3fIbRTNUtxaGvQT/gdwc6947cjOezJi2jseQiK9IO8bdobiy32VyfSviYzuMM0v0E6WG+of3dGMJWWlwQlULtFHmSgmSqdN93NYXCLXJFRsNXzw+oSpZlQy0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n2U/dujZ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n2U/dujZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771631445; x=1803167445;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=edSJNWiv3Umy5PdvGwSMn+4sBEnPRB97VF9XavlDRQE=;
  b=n2U/dujZL69DN0X7NDU+q6kegcNc+aOeP3tkbTpxTCKo6M6JbDHqaJLv
   2AAJTesfpSHWrE/2lWNnUQSi/SZWfiO8oKkY60qjtzwFvU9EuDPY64T2N
   3ryacrTbm1bEkrAqFBw7S5+2ic8qctztfm85ZjG50ycCgu1KupUszrrAI
   JoMT1Y1+gxqcBEJrfVtLY5GP01RuC3xz7DkFuwQLLeafI9XuYnnf6tKx1
   F450B9AZFNzbw4Zzwg1SrJOkh+Qg4cH5/VyI44xhXBLR/NsBWaKO54yDB
   ENp72SMbV9X1RGRvvkNXFuLkbh6Qn+1VtpIYVrtTaiNHbi1uif3BuLET5
   A==;
X-CSE-ConnectionGUID: bKRMWv2rScyk3zTr1ehRjw==
X-CSE-MsgGUID: RxWPWxhaTCSkRE0eKXVCAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72634708"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="72634708"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 15:50:37 -0800
X-CSE-ConnectionGUID: fxGjBIYaTsmxYh3wIXihZg==
X-CSE-MsgGUID: DvmeZH4YSGmwaG172fCCsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="243378971"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Feb 2026 15:50:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtaGW-000000014Z2-0IXW;
	Fri, 20 Feb 2026 23:50:32 +0000
Date: Sat, 21 Feb 2026 07:50:27 +0800
From: kernel test robot <lkp@intel.com>
To: Priit Laes <plaes@plaes.org>
Cc: oe-kbuild-all@lists.linux.dev, Priit Laes <plaes@plaes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	Navaneeth K <knavaneeth786@gmail.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/11] staging: rtl8723bs: rtw_ieee80211: Reduce global
 symbols
Message-ID: <202602210753.KgjGQB2w-lkp@intel.com>
References: <20260220173104.2410217-1-plaes@plaes.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220173104.2410217-1-plaes@plaes.org>

Hi Priit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Priit-Laes/staging-rtl8723bs-Remove-unused-BIT32-BIT36-definitions/20260221-013719
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260220173104.2410217-1-plaes%40plaes.org
patch subject: [PATCH 11/11] staging: rtl8723bs: rtw_ieee80211: Reduce global symbols
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260221/202602210753.KgjGQB2w-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602210753.KgjGQB2w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602210753.KgjGQB2w-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/rtl8723bs/core/rtw_ieee80211.c:27:17: warning: 'RSN_CIPHER_SUITE_WRAP' defined but not used [-Wunused-const-variable=]
      27 | static const u8 RSN_CIPHER_SUITE_WRAP[] = { 0x00, 0x0f, 0xac, 3 };
         |                 ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/rtl8723bs/core/rtw_ieee80211.c:19:17: warning: 'WPA_CIPHER_SUITE_WRAP' defined but not used [-Wunused-const-variable=]
      19 | static const u8 WPA_CIPHER_SUITE_WRAP[] = { 0x00, 0x50, 0xf2, 3 };
         |                 ^~~~~~~~~~~~~~~~~~~~~


vim +/RSN_CIPHER_SUITE_WRAP +27 drivers/staging/rtl8723bs/core/rtw_ieee80211.c

    14	
    15	#define WPA_SELECTOR_LEN 4
    16	static const u8 WPA_CIPHER_SUITE_NONE[] = { 0x00, 0x50, 0xf2, 0 };
    17	static const u8 WPA_CIPHER_SUITE_WEP40[] = { 0x00, 0x50, 0xf2, 1 };
    18	static const u8 WPA_CIPHER_SUITE_TKIP[] = { 0x00, 0x50, 0xf2, 2 };
  > 19	static const u8 WPA_CIPHER_SUITE_WRAP[] = { 0x00, 0x50, 0xf2, 3 };
    20	static const u8 WPA_CIPHER_SUITE_CCMP[] = { 0x00, 0x50, 0xf2, 4 };
    21	static const u8 WPA_CIPHER_SUITE_WEP104[] = { 0x00, 0x50, 0xf2, 5 };
    22	
    23	#define RSN_SELECTOR_LEN 4
    24	static const u8 RSN_CIPHER_SUITE_NONE[] = { 0x00, 0x0f, 0xac, 0 };
    25	static const u8 RSN_CIPHER_SUITE_WEP40[] = { 0x00, 0x0f, 0xac, 1 };
    26	static const u8 RSN_CIPHER_SUITE_TKIP[] = { 0x00, 0x0f, 0xac, 2 };
  > 27	static const u8 RSN_CIPHER_SUITE_WRAP[] = { 0x00, 0x0f, 0xac, 3 };
    28	static const u8 RSN_CIPHER_SUITE_CCMP[] = { 0x00, 0x0f, 0xac, 4 };
    29	static const u8 RSN_CIPHER_SUITE_WEP104[] = { 0x00, 0x0f, 0xac, 5 };
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
