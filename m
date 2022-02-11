Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DE97F
	for <linux-staging@lists.linux.dev>; Fri, 11 Feb 2022 23:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644623900; x=1676159900;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/DO8dz5a+fECO1lF8HkYAWxQJzTmxnoMcSf/ITjLVKU=;
  b=Goza0BOrsKAbYsJYnB8zwcaYQci0+ty7ayX1dukaaFKq4lMUrZcEHQp0
   tf9AAJmpnIDYsW8OyMdq2e36xMGYH2ce8A3qHiwcTzRQUA/4O4dIJzHoF
   HS/LJZfRIhrqZUnU/pd/MReMtS3EAxyOAWTFVdNL3RkgfFajPuAz3oLaq
   GIWmZBxKMIBS2onO7+bEF15HanrsB7Y0DzFLU6ZvfFPXAH0gKAuzdUrTJ
   eNwokCNPHbb7ZF8dQ9qgD37571vYpAYdHpHgABqIGsCcUOEFjASVtTdcG
   bTVRU8moxPFvjsw9X7YyedXMLT3wCTc6eLk87+kiosY6033UmL2+x/ZeP
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10255"; a="247425111"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="247425111"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2022 15:58:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="500937959"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 11 Feb 2022 15:58:14 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nIfnq-0005No-5A; Fri, 11 Feb 2022 23:58:14 +0000
Date: Sat, 12 Feb 2022 07:57:39 +0800
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
Message-ID: <202202120715.pWMiLjja-lkp@intel.com>
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20220212/202202120715.pWMiLjja-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/18a307fb15879832a050d12ae32bd9d94a9e5c91
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jacopo-Mondi/media-De-stage-imx7-mipi-csis-c/20220212-020342
        git checkout 18a307fb15879832a050d12ae32bd9d94a9e5c91
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=alpha SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> make[5]: *** No rule to make target 'drivers/media/platform/imx/imx7-mipi-csis.o', needed by 'drivers/media/platform/imx/built-in.a'.
   make[5]: Target '__build' not remade because of errors.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
