Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4A67F;
	Fri, 23 Jun 2023 00:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687479956; x=1719015956;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xWb6G7Cg4aCmo6Vqc7o2CYZbvqZ1NqGkHb/WQ0tI0zo=;
  b=cCwZd1Xggt2wU70nBwz9n64HvAfFLyhQbAJJmGuTQXIX3ry+vYlkzDJu
   VmxAOoOY5aEen2ws9usigLVT3lUfFcDRJziEfbkw77tXIMY/47qqb46oN
   ZWxtEaU0F6NE+MPGd1EiWO20BY3nLQSIVtOKkaqiLZiqBtiyTno4HyDWr
   pLjqlsYbyNqMzAe+P14jbZlcCvxZ6cYpX8T3gFzrNVVjKJAB79dCRc0/F
   FHnpGniRtHse0rga8NlFyEypTORu30k3Fh6klNvp826pSafz8294XCE8n
   SmVIhtBXfOffAC/X7f4EZwgXzrolEpoFVx6JRERn41LzoU2MwMIMYahcc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="426630066"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="426630066"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 17:25:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="839254554"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="839254554"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 22 Jun 2023 17:25:50 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCUcX-0007qN-2K;
	Fri, 23 Jun 2023 00:25:49 +0000
Date: Fri, 23 Jun 2023 08:25:37 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
	tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v3 10/11] media: v4l2: Add DELETE_BUF ioctl
Message-ID: <202306230822.0CCLmVt5-lkp@intel.com>
References: <20230622131349.144160-11-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622131349.144160-11-benjamin.gaignard@collabora.com>

Hi Benjamin,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linus/master v6.4-rc7]
[cannot apply to next-20230622]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gaignard/media-videobuf2-Access-vb2_queue-bufs-array-through-helper-functions/20230622-214122
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230622131349.144160-11-benjamin.gaignard%40collabora.com
patch subject: [PATCH v3 10/11] media: v4l2: Add DELETE_BUF ioctl
config: i386-randconfig-i012-20230622 (https://download.01.org/0day-ci/archive/20230623/202306230822.0CCLmVt5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230822.0CCLmVt5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306230822.0CCLmVt5-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "vb2_core_delete_buf" [drivers/media/common/videobuf2/videobuf2-v4l2.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
