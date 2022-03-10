Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F0F5A38
	for <linux-staging@lists.linux.dev>; Thu, 10 Mar 2022 21:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646947892; x=1678483892;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dEQEXfZpDDy+joKRUKFQ8Y/ONso7mcKQlN243kDuOBM=;
  b=dHWBjlejYb8hwxj5P/Q3AI+RUADNMoAgdIsjtmub+53Fs8TPWE/Rk1jH
   Bo91DdoadI6YEUN8Webf5j0FBu19yzVqfDLPrqlUKmRm0mjAdupCfXDdp
   VzBOZQpIZ/WIviiH1wVQjSyqh/9wDQxmaNo1P+fKZ3JFIIYnkaLMT5Lal
   ewimTVkL7X/ioO4VpUGgxdLLlklPj/dBxLJ0LiH42glOixycOj+p0lzW9
   i4gUgRAwwVo+rf+EB4XBAWdzcpNE4t3ltTfQyHt8uh1b9ibju5bnFjucB
   YYmLlmjEun0XQj2BOBWLekMF/BMRzb/cOuMknVgDudrc3CTie1sPT/nkh
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="316105642"
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; 
   d="scan'208";a="316105642"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2022 13:31:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; 
   d="scan'208";a="633146174"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Mar 2022 13:31:03 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nSQNC-0005Q8-RG; Thu, 10 Mar 2022 21:31:02 +0000
Date: Fri, 11 Mar 2022 05:30:51 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: kbuild-all@lists.01.org
Subject: Re: [PATCH 5/5] staging: vt6656: Remove unused rf_type in card.c
Message-ID: <202203110539.GOSgwFnJ-lkp@intel.com>
References: <e768dbb116e79349aa083747729213d2d1ca7af9.1646935331.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e768dbb116e79349aa083747729213d2d1ca7af9.1646935331.git.philipp.g.hortmann@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Philipp,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/0day-ci/linux/commits/Philipp-Hortmann/staging-vt6656-Remove-unused-5GHz-support/20220311-025658
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git b25c7dc13fb8842e8634bd846a7a96f2176f0244
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20220311/202203110539.GOSgwFnJ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/ddc1ba8087bf857aa6120e70814d4f161aba6cdc
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Philipp-Hortmann/staging-vt6656-Remove-unused-5GHz-support/20220311-025658
        git checkout ddc1ba8087bf857aa6120e70814d4f161aba6cdc
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=sh SHELL=/bin/bash drivers/staging/vt6656/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/staging/vt6656/card.c: In function 'vnt_set_bss_mode':
>> drivers/staging/vt6656/card.c:441:23: warning: variable 'bb_vga_0' set but not used [-Wunused-but-set-variable]
     441 |         unsigned char bb_vga_0 = 0x1c;
         |                       ^~~~~~~~


vim +/bb_vga_0 +441 drivers/staging/vt6656/card.c

92b96797118e58 Forest Bond  2009-06-13  435  
81969fd8abc104 Oscar Carter 2020-04-25  436  int vnt_set_bss_mode(struct vnt_private *priv)
92b96797118e58 Forest Bond  2009-06-13  437  {
35452e10610617 Oscar Carter 2020-04-29  438  	int ret;
91387f5eb9fc22 Oscar Carter 2020-04-29  439  	unsigned char type = priv->bb_type;
91387f5eb9fc22 Oscar Carter 2020-04-29  440  	unsigned char data = 0;
91387f5eb9fc22 Oscar Carter 2020-04-29 @441  	unsigned char bb_vga_0 = 0x1c;

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
