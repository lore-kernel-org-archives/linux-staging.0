Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8706A34028D;
	Wed, 18 Mar 2026 13:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773839111; cv=none; b=rNUQQEJ7gJ3z2PCCzAmjKAeVUAJB16cjL1vgZB1PvpKUI54zehSm5uMDEkNDnqEl82aVSjAWfRrqs79nDxxBkFFg+dg3yzTg3iiYbkYS3ZGfbEGF2Op7whvLaTi1FsUo/LbHT5nBpBZyKqYHCi6hVoHm8ZpIl6ZPfu+m55ypOpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773839111; c=relaxed/simple;
	bh=mn8XHdiVO428ddsTH1w/tEiDNSxWaXzq/dITfrJdySQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8B0wdyodxCuL74T/lTD0DZ4iefkBhBpBmr43Fk7E55MLSJ+t0y4etlnmcGy8ALVO+VtkyxYmcA6RLK56RhDuy6akQY4Yxgj3OxOwSsf8EhFJoKdGfATRzR04S9GJZ14hwH2mcA9OhgxYPkZALMd9JC4wMXCNIxN2XOkRY3AANA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KuXuh6Cu; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KuXuh6Cu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773839108; x=1805375108;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mn8XHdiVO428ddsTH1w/tEiDNSxWaXzq/dITfrJdySQ=;
  b=KuXuh6CuvqJr0HlF++6KfWyxFJ4qailUL5iKFNz2YQEtwcjGyjufxPYn
   /sFhNbA1aBZG4wMc77YpLrKqufvT7QxTGysxVU9tyn3Urq4n6dX5Fky6Y
   OSEmThy6TqRdbSRtcl2JdzhOubG9nm2d59mhLtCS24yIgs7POceaogVFn
   +ekHFaewAyKcx5YUupSeP7GQdfMacdnPz/T/U54EckzmGXpuC42VIUVSS
   PqNPh/zXtkTcwBTnb7QFxHr+jxx3p5klw/S0h9+VCp/R0nPLgkBKJ5oaD
   KqITmvG5kZ+BYSEvOywTBMsRNYZBt4TQU9KAcVs86VjnyMIkCjxW2Hdb6
   g==;
X-CSE-ConnectionGUID: Cq5vxZlLTmy5sCARTChmRA==
X-CSE-MsgGUID: NFrqk44VThKV8OSg5dWKrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="85521078"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="85521078"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 06:05:02 -0700
X-CSE-ConnectionGUID: +uVN0rS/TPqOLfaLu3KKrA==
X-CSE-MsgGUID: Rpwm8UFXTUKIE2rxyR6YwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="222833506"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Mar 2026 06:04:59 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2qa0-000000002vp-2gG8;
	Wed, 18 Mar 2026 13:04:56 +0000
Date: Wed, 18 Mar 2026 21:04:29 +0800
From: kernel test robot <lkp@intel.com>
To: Oskar Ray-Frayssinet <rayfraytech@gmail.com>,
	gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary braces in single
 statement blocks
Message-ID: <202603182051.NuXiZYrt-lkp@intel.com>
References: <20260317203715.7430-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317203715.7430-1-rayfraytech@gmail.com>

Hi Oskar,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Oskar-Ray-Frayssinet/staging-rtl8723bs-remove-unnecessary-braces-in-single-statement-blocks/20260318-121311
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260317203715.7430-1-rayfraytech%40gmail.com
patch subject: [PATCH] staging: rtl8723bs: remove unnecessary braces in single statement blocks
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260318/202603182051.NuXiZYrt-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603182051.NuXiZYrt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603182051.NuXiZYrt-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c: In function 'halbtc8723b2ant_WifiRssiState':
>> drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:131:25: error: expected '}' before 'else'
     131 |                         else
         |                         ^~~~


vim +131 drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c

    82	
    83	static u8 halbtc8723b2ant_WifiRssiState(
    84		struct btc_coexist *pBtCoexist,
    85		u8 index,
    86		u8 levelNum,
    87		u8 rssiThresh,
    88		u8 rssiThresh1
    89	)
    90	{
    91		s32 wifiRssi = 0;
    92		u8 wifiRssiState = pCoexSta->preWifiRssiState[index];
    93	
    94		pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_S4_WIFI_RSSI, &wifiRssi);
    95	
    96		if (levelNum == 2) {
    97			if (
    98				(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_LOW) ||
    99				(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_STAY_LOW)
   100			) {
   101				if (wifiRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT))
   102					wifiRssiState = BTC_RSSI_STATE_HIGH;
   103				else
   104					wifiRssiState = BTC_RSSI_STATE_STAY_LOW;
   105			} else {
   106				if (wifiRssi < rssiThresh)
   107					wifiRssiState = BTC_RSSI_STATE_LOW;
   108				else
   109					wifiRssiState = BTC_RSSI_STATE_STAY_HIGH;
   110			}
   111		} else if (levelNum == 3) {
   112			if (rssiThresh > rssiThresh1)
   113				return pCoexSta->preWifiRssiState[index];
   114	
   115			if (
   116				(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_LOW) ||
   117				(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_STAY_LOW)
   118			) {
   119				if (wifiRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT))
   120					wifiRssiState = BTC_RSSI_STATE_MEDIUM;
   121				else
   122					wifiRssiState = BTC_RSSI_STATE_STAY_LOW;
   123			} else if (
   124				(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_MEDIUM) ||
   125				(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_STAY_MEDIUM)
   126			) {
   127				if (wifiRssi >= (rssiThresh1 + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT))
   128					wifiRssiState = BTC_RSSI_STATE_HIGH;
   129				else if (wifiRssi < rssiThresh) {
   130					wifiRssiState = BTC_RSSI_STATE_LOW;
 > 131				else
   132					wifiRssiState = BTC_RSSI_STATE_STAY_MEDIUM;
   133			} else {
   134				if (wifiRssi < rssiThresh1)
   135					wifiRssiState = BTC_RSSI_STATE_MEDIUM;
   136				else
   137					wifiRssiState = BTC_RSSI_STATE_STAY_HIGH;
   138			}
   139		}
   140	
   141		pCoexSta->preWifiRssiState[index] = wifiRssiState;
   142	
   143		return wifiRssiState;
   144	}
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
