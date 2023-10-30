Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FE3182C6;
	Mon, 30 Oct 2023 23:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nNGV9xNp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698708053; x=1730244053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LynUxohCCjaRiA0g/AavoK34cqlxiIsfBx03A+JRPgs=;
  b=nNGV9xNpQaSfznonrBkqokYdj0AD+fs1Md1y/5gIY4ju6hZvaIosob2n
   bcCTTMnHPNLM3TJYbjQy39VSLZxICakE339nKPt+a5ZCIUeuzob2NdGsZ
   Z/My7YfGLjs1pJOVSc8x/xM4rnLH+W/KvbdIkkXQH+32cO8K+UX6WS5bg
   JkCQB9R3gUmdE31FwmlSSaVyJFzGHhSqY0Aedd4nmyVVuADfvDv5hliyC
   NreDUnjBYAoKXbDOvCSQJ1dMswRenlmIMAUEZlOsFDc3jxaJM1UbIARwz
   yS3QnyhbfM8/UxlLCtR7+jsUMVCxlQUwtvrkbPb4y8V7uXhuioaDxf3Lg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="387999072"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="387999072"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 16:20:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="736893754"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="736893754"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 Oct 2023 16:20:50 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxbYt-000DeF-2S;
	Mon, 30 Oct 2023 23:20:47 +0000
Date: Tue, 31 Oct 2023 07:20:10 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Rookard <garyrookard@fastmail.org>, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: Re: [PATCH v3] staging: rtl8192e: renamed variable TxCountToDataRate
Message-ID: <202310310745.6B9DzSi5-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Gary-Rookard/staging-rtl8192e-renamed-variable-TxCountToDataRate/20231022-061649
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20231021215440.6584-1-garyrookard%40fastmail.org
patch subject: [PATCH v3] staging: rtl8192e: renamed variable TxCountToDataRate
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20231031/202310310745.6B9DzSi5-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310310745.6B9DzSi5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310310745.6B9DzSi5-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/rtl8192e/rtllib_softmac_wx.c: In function 'rtllib_wx_get_rate':
>> drivers/staging/rtl8192e/rtllib_softmac_wx.c:211:20: error: implicit declaration of function 'tx_count_to_data_rate'; did you mean 'tx_count_data_rate'? [-Werror=implicit-function-declaration]
     211 |         tmp_rate = tx_count_to_data_rate(ieee,
         |                    ^~~~~~~~~~~~~~~~~~~~~
         |                    tx_count_data_rate
   cc1: some warnings being treated as errors


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
