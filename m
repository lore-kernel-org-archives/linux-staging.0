Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A4BA2C;
	Sat, 21 Oct 2023 22:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cUrXvT9n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697928089; x=1729464089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QTNy210PlMgi9Xz7qHUpyj2N+7s0EoG6ehIJFJZwxkY=;
  b=cUrXvT9n4LYwJ+zRYtOcAO7mJn4ua/n+qJQSJ6IdW4Km02Nfx86lxeu5
   I2i63zdjyUh7atT7yfQ6HJfGliWsB6SGqsBy26je1W0T3GqAfHF2JVXaX
   cOnS9P71qf9l7yXb9CtuWsAuUgZgQlmx3SV1UyOm/1Hj34upCF/EgB5dR
   6yJneYVtxjS3p3Tta6rr1ZRQOa4AI4RW+y+acWAacxwi1VWvLboEtq8XP
   eTwVBMeePJ4HpkhkHkht3nD6S7H96aZzId7MqrNjKrgQ/mihb6e8dk6Vp
   TPOPQf1+bz5V60aGnqNBg9wghDMVaEX0PPrys2DPpB0o26IINrW6Ck/QH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="383867174"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="383867174"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 15:41:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="1004922657"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="1004922657"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 21 Oct 2023 15:41:26 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quKeq-0005Il-2e;
	Sat, 21 Oct 2023 22:41:24 +0000
Date: Sun, 22 Oct 2023 06:41:16 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Rookard <garyrookard@fastmail.org>, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: Re: [PATCH v2] staging: rtl8192e: renamed variable TxCountToDataRate
Message-ID: <202310220613.ecHUnU2j-lkp@intel.com>
References: <20231021213202.6244-1-garyrookard@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231021213202.6244-1-garyrookard@fastmail.org>

Hi Gary,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Gary-Rookard/staging-rtl8192e-renamed-variable-TxCountToDataRate/20231022-053516
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20231021213202.6244-1-garyrookard%40fastmail.org
patch subject: [PATCH v2] staging: rtl8192e: renamed variable TxCountToDataRate
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231022/202310220613.ecHUnU2j-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310220613.ecHUnU2j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310220613.ecHUnU2j-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/staging/rtl8192e/rtllib_softmac_wx.c: In function 'rtllib_wx_get_rate':
>> drivers/staging/rtl8192e/rtllib_softmac_wx.c:211:20: error: implicit declaration of function 'tx_count_to_data_rate'; did you mean 'tx_count_data_rate'? [-Werror=implicit-function-declaration]
     211 |         tmp_rate = tx_count_to_data_rate(ieee,
         |                    ^~~~~~~~~~~~~~~~~~~~~
         |                    tx_count_data_rate
   cc1: some warnings being treated as errors
--
>> drivers/staging/rtl8192e/rtl819x_HTProc.c:117:6: warning: no previous prototype for 'tx_count_to_data_rate' [-Wmissing-prototypes]
     117 | u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate)
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +211 drivers/staging/rtl8192e/rtllib_softmac_wx.c

   204	
   205	int rtllib_wx_get_rate(struct rtllib_device *ieee,
   206				     struct iw_request_info *info,
   207				     union iwreq_data *wrqu, char *extra)
   208	{
   209		u32 tmp_rate;
   210	
 > 211		tmp_rate = tx_count_to_data_rate(ieee,
   212					     ieee->softmac_stats.CurrentShowTxate);
   213		wrqu->bitrate.value = tmp_rate * 500000;
   214	
   215		return 0;
   216	}
   217	EXPORT_SYMBOL(rtllib_wx_get_rate);
   218	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
