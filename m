Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096A329CA
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 08:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643099316; x=1674635316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PJYavozYdAkdPl4SALbJVcV0klynjxDcedKqP+BV1no=;
  b=KBAfsBCqJQbNBH/iiqGcYeOhxjO4Vet3WNLnt4B3cSAl3bh1+HQKkEF6
   V1s/KKPh1QiJ+byLxeOd9RFSFMVlAFz+jW44JYsPF7B/mXibyWyyUBVS2
   XfXDQXUs27UrLhlZBweGKj/vrsYISpUv2o9ZMxZn5FxX2Z+52eycM+ih9
   D0iGGm27rGM6/yYakzTt8AZapp/1QgER9A84EkLC5sxFGWVGz2/3+4BzX
   Bmy8GBvMlrAO9Im6HPjnw+eHwZONAZkhwX4Kg/Ueel3iSgXyUJF8g02+d
   xavcrtb1myAHApMsOUhyiv2wXmFLdDvHLMY4Lgggw17lpkQ0DsMevEj1s
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="233622235"
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; 
   d="scan'208";a="233622235"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2022 00:28:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; 
   d="scan'208";a="479409002"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 25 Jan 2022 00:28:31 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nCHBn-000JZc-7p; Tue, 25 Jan 2022 08:28:31 +0000
Date: Tue, 25 Jan 2022 16:27:32 +0800
From: kernel test robot <lkp@intel.com>
To: Phillip Potter <phil@philpotter.co.uk>, gregkh@linuxfoundation.org
Cc: kbuild-all@lists.01.org, dan.carpenter@oracle.com,
	Larry.Finger@lwfinger.net, straube.linux@gmail.com,
	martin@kaiser.cx, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, paskripkin@gmail.com
Subject: Re: [PATCH 04/10] staging: r8188eu: remove all DBG_88E calls from
 hal dir
Message-ID: <202201251642.5tYQO4Fb-lkp@intel.com>
References: <20220124224415.831-5-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124224415.831-5-phil@philpotter.co.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Phillip,

I love your patch! Perhaps something to improve:

[auto build test WARNING on staging/staging-testing]
[also build test WARNING on v5.17-rc1 next-20220124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Phillip-Potter/Cleanup-and-removal-of-DBG_88E-macro/20220125-125206
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git fa783154524a71ab74e293cd8251155e5971952b
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20220125/202201251642.5tYQO4Fb-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/041fe115dad9245f83646e7674341f28094d62a5
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Phillip-Potter/Cleanup-and-removal-of-DBG_88E-macro/20220125-125206
        git checkout 041fe115dad9245f83646e7674341f28094d62a5
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arc SHELL=/bin/bash drivers/staging/r8188eu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/staging/r8188eu/hal/rtl8188e_cmd.c: In function 'rtl8188e_set_FwMediaStatus_cmd':
>> drivers/staging/r8188eu/hal/rtl8188e_cmd.c:195:20: warning: variable 'macid' set but not used [-Wunused-but-set-variable]
     195 |         u8 opmode, macid;
         |                    ^~~~~
>> drivers/staging/r8188eu/hal/rtl8188e_cmd.c:195:12: warning: variable 'opmode' set but not used [-Wunused-but-set-variable]
     195 |         u8 opmode, macid;
         |            ^~~~~~


vim +/macid +195 drivers/staging/r8188eu/hal/rtl8188e_cmd.c

8cd574e6af5463 Phillip Potter 2021-07-28  192  
8cd574e6af5463 Phillip Potter 2021-07-28  193  void rtl8188e_set_FwMediaStatus_cmd(struct adapter *adapt, __le16 mstatus_rpt)
8cd574e6af5463 Phillip Potter 2021-07-28  194  {
8cd574e6af5463 Phillip Potter 2021-07-28 @195  	u8 opmode, macid;
8cd574e6af5463 Phillip Potter 2021-07-28  196  	u16 mst_rpt = le16_to_cpu(mstatus_rpt);
8cd574e6af5463 Phillip Potter 2021-07-28  197  	opmode = (u8)mst_rpt;
8cd574e6af5463 Phillip Potter 2021-07-28  198  	macid = (u8)(mst_rpt >> 8);
8cd574e6af5463 Phillip Potter 2021-07-28  199  
8cd574e6af5463 Phillip Potter 2021-07-28  200  	FillH2CCmd_88E(adapt, H2C_COM_MEDIA_STATUS_RPT, sizeof(mst_rpt), (u8 *)&mst_rpt);
8cd574e6af5463 Phillip Potter 2021-07-28  201  }
8cd574e6af5463 Phillip Potter 2021-07-28  202  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
