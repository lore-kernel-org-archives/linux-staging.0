Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D067B
	for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 02:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660963885; x=1692499885;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lIWdGRlLgC6lsdpl02nzxXz9mnLvLDWzqkX7ahVNpIg=;
  b=QD8+qPBhpLwTHwbU8u+m1U1YMhVMDwzvzAYhVeUW3pgQul8JN3f6V3Lz
   ROfQkqG6gSmIut3BguHwyqZoVA2L3iIT9MbMNyH28ty4G6nRjjaqHAgFC
   CRJH3mIIU+x+U2v2TWvNtS6jMyvknjptDDcy3kb8OMqIvSfXdAKsXI5Rn
   wd3BVDNsBRhf3sxtttPf6uEhVn7fsMOarKQoUIDc1f6CzBw1Qk0sF1aBR
   nEqcBb+KDA4ipmhbuusbC09NmM0HPOVfizue1QewknT6zfXXv3u2VhTO/
   Qgx4ZcOqXOXeco2W8SyH3QVQuEL65C8iWgT9kOd2hwiQoI0qvWXK9TtQe
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10444"; a="290704754"
X-IronPort-AV: E=Sophos;i="5.93,249,1654585200"; 
   d="scan'208";a="290704754"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2022 19:51:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,249,1654585200"; 
   d="scan'208";a="750716616"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Aug 2022 19:51:21 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oPEa1-00023D-0F;
	Sat, 20 Aug 2022 02:51:21 +0000
Date: Sat, 20 Aug 2022 10:50:26 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Cao <namcaov@gmail.com>, gregkh@linuxfoundation.org
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, namcaov@gmail.com,
	hdegoede@redhat.com, Larry.Finger@lwfinger.net
Subject: Re: [PATCH 3/3] staging: rtl8723bs: remove odm_NoiseMonitor.h and
 odm_NoiseMonitor.c
Message-ID: <202208201056.675rcXqe-lkp@intel.com>
References: <3d6124867c546368b961a30f85b56ee6c2600441.1660901124.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d6124867c546368b961a30f85b56ee6c2600441.1660901124.git.namcaov@gmail.com>

Hi Nam,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Nam-Cao/staging-rtl8723bs-remove-useless-files/20220819-173916
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git 8379cf83fe6d57a12952de6dcaf7a7fbd7b364fc
config: ia64-allmodconfig (https://download.01.org/0day-ci/archive/20220820/202208201056.675rcXqe-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0fdeb2305c40b79975f2c6b683ee5225b3aedf08
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nam-Cao/staging-rtl8723bs-remove-useless-files/20220819-173916
        git checkout 0fdeb2305c40b79975f2c6b683ee5225b3aedf08
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/staging/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   make[4]: *** [scripts/Makefile.build:249: drivers/staging/rtl8723bs/core/rtw_ieee80211.o] Error 1
   make[4]: *** [scripts/Makefile.build:249: drivers/staging/rtl8723bs/core/rtw_pwrctrl.o] Error 1
   make[4]: *** [scripts/Makefile.build:249: drivers/staging/rtl8723bs/core/rtw_mlme_ext.o] Error 1
>> make[4]: *** No rule to make target 'drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.o', needed by 'drivers/staging/rtl8723bs/r8723bs.o'.
   make[4]: *** [scripts/Makefile.build:249: drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.o] Error 1
   make[4]: *** [scripts/Makefile.build:249: drivers/staging/rtl8723bs/os_dep/sdio_intf.o] Error 1
   make[4]: *** [scripts/Makefile.build:249: drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.o] Error 1
   make[4]: *** [scripts/Makefile.build:249: drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.o] Error 1
   make[4]: Target '__build' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
