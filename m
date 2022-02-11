Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306447D
	for <linux-staging@lists.linux.dev>; Fri, 11 Feb 2022 22:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644617775; x=1676153775;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=De4kpkwjAxf3Iw6joK4cg/rV1mv94Kpw+nSPSFmgfzM=;
  b=NwfZ035SBPH9zhS/g/2l1IJNhLb+cK2M+VFsoKq5HcMNy47HWAIROW7R
   HLwJnmuMAYFTM29623oa+daGJZw3S1dy+3Tsp3nz5GOlIaK54nEe+Bo87
   CUh8ZWafXIGVeihPqRBE8SzPre+jXacoVhj0QSPQh3scUwcN5l7sQXI/n
   JazRX+E14H7SI+acRbIHhlB7oEIlpQHluvHMsUhMOG/Q9mr+AKTPl26Od
   Y15+7m0elCmqN08PoGVehhnZO61zVUg6ZI7kJNeyE524Ge71CqKGSgHdJ
   sOOQIdSflTSCEFGH+OvJ2M7iYyZQvmXdVGCgmG1Bc+RvnPNoCnGz9k3X8
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10255"; a="250026501"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="250026501"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2022 14:16:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="623344971"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Feb 2022 14:16:10 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nIeD3-0005GC-K5; Fri, 11 Feb 2022 22:16:09 +0000
Date: Sat, 12 Feb 2022 06:15:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jacopo Mondi <jacopo@jmondi.org>, slongerbeam@gmail.com,
	p.zabel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
	festevam@gmail.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	laurent.pinchart@ideasonboard.com, martin.kepplinger@puri.sm,
	rmfrfs@gmail.com, xavier.roumegue@oss.nxp.com
Cc: kbuild-all@lists.01.org, kernel@pengutronix.de, linux-imx@nxp.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 2/3] media: imx: Rename imx7-mipi-csis.c to
 imx-mipi-csis.c
Message-ID: <202202120641.u7xFAEMc-lkp@intel.com>
References: <20220211180216.290133-3-jacopo@jmondi.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211180216.290133-3-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Jacopo,

I love your patch! Yet something to improve:

[auto build test ERROR on media-tree/master]
[also build test ERROR on shawnguo/for-next pza/reset/next linus/master v5.17-rc3 next-20220211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jacopo-Mondi/media-De-stage-imx7-mipi-csis-c/20220212-020342
base:   git://linuxtv.org/media_tree.git master
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20220212/202202120641.u7xFAEMc-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/18a307fb15879832a050d12ae32bd9d94a9e5c91
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jacopo-Mondi/media-De-stage-imx7-mipi-csis-c/20220212-020342
        git checkout 18a307fb15879832a050d12ae32bd9d94a9e5c91
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=sh SHELL=/bin/bash M=drivers/media

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'drivers/media/platform/imx/imx7-mipi-csis.o', needed by 'drivers/media/platform/imx/imx7-mipi-csis.mod'.
   make[4]: Target '__build' not remade because of errors.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
