Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF9F68
	for <linux-staging@lists.linux.dev>; Sat, 27 Nov 2021 01:05:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10180"; a="234462474"
X-IronPort-AV: E=Sophos;i="5.87,267,1631602800"; 
   d="scan'208";a="234462474"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 17:05:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,267,1631602800"; 
   d="scan'208";a="555675152"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 26 Nov 2021 17:05:23 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mqm9a-0008rT-HM; Sat, 27 Nov 2021 01:05:22 +0000
Date: Sat, 27 Nov 2021 09:04:26 +0800
From: kernel test robot <lkp@intel.com>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: kbuild-all@lists.01.org, Rob Herring <robh+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 1/3] staging: zynpu: Add driver support for ARM(China)
 ZHOUYI AI accelerator
Message-ID: <202111270803.ZnISXirc-lkp@intel.com>
References: <20211124084620.628-2-caihuoqing@baidu.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211124084620.628-2-caihuoqing@baidu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Cai,

I love your patch! Yet something to improve:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/0day-ci/linux/commits/Cai-Huoqing/staging-zynpu-Add-driver-support-for-ARM-China-ZHOUYI-AI-accelerator/20211124-164741
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git 1189d2fb15a4b09b2e8dd01d60a0817d985d933d
config: x86_64-randconfig-r013-20211126 (https://download.01.org/0day-ci/archive/20211127/202111270803.ZnISXirc-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/95965c589ea2e279e082e3c9aa18c2ddd8494d64
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Cai-Huoqing/staging-zynpu-Add-driver-support-for-ARM-China-ZHOUYI-AI-accelerator/20211124-164741
        git checkout 95965c589ea2e279e082e3c9aa18c2ddd8494d64
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "z2_platform_priv" [drivers/staging/zynpu/zhouyi_npu.ko] undefined!

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
