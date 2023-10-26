Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CDA944F;
	Thu, 26 Oct 2023 05:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XnBOoXhm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698296946; x=1729832946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xB8r1iCDvaAf81vie1lsCwaJjJd1upJo9dCecMfNqvI=;
  b=XnBOoXhm/3jjTOoCqbVdY151Th0UW9JqSlLh+wGDZuhdeBKg4Ymcc9nG
   c4VJz4tJlvk9YTp4ks/BDaVnUCTU1+LS/5rvHD82xl6OpNtPi2XF5T1kZ
   +Pb7zzfo/4raWFNUVBIYjY85yEmUO2n8DiMIWHlLYxOd2dnljKppgsDQX
   VKVgoC4MG74p1leHeGpr4n4wwnwGo2ZEuIH2fJ9jxciXmWX+rIMW6lvUe
   Pmcj1HIk6dAhlQzvOfAk6/Yvb2TdISVc0UVe59Jf+CbtyoFav68i3JLna
   Ednm7Uvol8itOkO3QA8k3TNaTxYWdHccmbgRH/DX0l5Tp+squtgrM3GpX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="265626"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="265626"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 22:09:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="829487672"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="829487672"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 25 Oct 2023 22:09:01 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvsc6-0009U5-0R;
	Thu, 26 Oct 2023 05:08:58 +0000
Date: Thu, 26 Oct 2023 13:08:17 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Rookard <garyrookard@fastmail.org>, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: Re: [PATCH v3] staging: rtl8192e: renamed variable TxCountToDataRate
Message-ID: <202310261254.JYIf89K5-lkp@intel.com>
References: <20231021215440.6584-1-garyrookard@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231021215440.6584-1-garyrookard@fastmail.org>

Hi Gary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Gary-Rookard/staging-rtl8192e-renamed-variable-TxCountToDataRate/20231022-061649
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20231021215440.6584-1-garyrookard%40fastmail.org
patch subject: [PATCH v3] staging: rtl8192e: renamed variable TxCountToDataRate
config: i386-buildonly-randconfig-002-20231026 (https://download.01.org/0day-ci/archive/20231026/202310261254.JYIf89K5-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310261254.JYIf89K5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310261254.JYIf89K5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/rtl8192e/rtl819x_HTProc.c:117:6: warning: no previous declaration for 'tx_count_to_data_rate' [-Wmissing-declarations]
    u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate)
         ^~~~~~~~~~~~~~~~~~~~~


vim +/tx_count_to_data_rate +117 drivers/staging/rtl8192e/rtl819x_HTProc.c

   116	
 > 117	u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate)
   118	{
   119		u16	CCKOFDMRate[12] = {0x02, 0x04, 0x0b, 0x16, 0x0c, 0x12, 0x18,
   120					   0x24, 0x30, 0x48, 0x60, 0x6c};
   121		u8	is40MHz = 0;
   122		u8	isShortGI = 0;
   123	
   124		if (nDataRate < 12)
   125			return CCKOFDMRate[nDataRate];
   126		if (nDataRate >= 0x10 && nDataRate <= 0x1f) {
   127			is40MHz = 0;
   128			isShortGI = 0;
   129		} else if (nDataRate >= 0x20  && nDataRate <= 0x2f) {
   130			is40MHz = 1;
   131			isShortGI = 0;
   132		} else if (nDataRate >= 0x30  && nDataRate <= 0x3f) {
   133			is40MHz = 0;
   134			isShortGI = 1;
   135		} else if (nDataRate >= 0x40  && nDataRate <= 0x4f) {
   136			is40MHz = 1;
   137			isShortGI = 1;
   138		}
   139		return MCS_DATA_RATE[is40MHz][isShortGI][nDataRate & 0xf];
   140	}
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
