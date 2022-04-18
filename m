Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B1A3D61
	for <linux-staging@lists.linux.dev>; Mon, 18 Apr 2022 23:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650323961; x=1681859961;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=maYb/5Ezv8tvNfB+FhmofI1/kJ1xLqRda+v3VRNJtl8=;
  b=HfnHxhThzS9nj5AOCzPpw8tDrDnJ3IDisJH5wCuF/D4oGGCppVJhu3w/
   YVy2dXKxVNonKPSRNgT4aAIS0GenC0X6EFuTGAArN0GSDJIz4+RjG9cIR
   2gBJYy8VjC0CrILkazgZgMvM/33aFKxfqXbqcHfJQpj609lRFTJMW68OG
   /TY2bzcA9u0TBxOJ3nznPBiK4FAxCAM6NiiTmds5yeqRQr3YY5zueIXu1
   R5Y90Vo77Oc6vhGe/9e8PaNbBTNVrP50cDt/rqSj6NOYaGTOYrbC83pO7
   SeJLqvN4wx4g0OXJ3NRR0p9vg+erE8QeoDG7tYAA84CSHRoNm9DyqloVq
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10321"; a="245523437"
X-IronPort-AV: E=Sophos;i="5.90,271,1643702400"; 
   d="scan'208";a="245523437"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2022 16:19:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,271,1643702400"; 
   d="scan'208";a="554441668"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 18 Apr 2022 16:19:05 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ngae8-000554-S8;
	Mon, 18 Apr 2022 23:19:04 +0000
Date: Tue, 19 Apr 2022 07:19:00 +0800
From: kernel test robot <lkp@intel.com>
To: Tom Rix <trix@redhat.com>, nsaenz@kernel.org,
	bcm-kernel-feedback-list@broadcom.com, gregkh@linuxfoundation.org,
	stefan.wahren@i2se.com, gascoar@gmail.com, ojaswin98@gmail.com
Cc: kbuild-all@lists.01.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: Re: [PATCH] staging: vchiq_arm: change vchiq_platform_init from
 global to static
Message-ID: <202204190737.qhFLAafo-lkp@intel.com>
References: <20220418164356.3532969-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220418164356.3532969-1-trix@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Tom,

I love your patch! Perhaps something to improve:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Tom-Rix/staging-vchiq_arm-change-vchiq_platform_init-from-global-to-static/20220419-004611
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git bed6d200f8ca38e1ecbdd8fb7e0564884002abd1
config: parisc-buildonly-randconfig-r004-20220417 (https://download.01.org/0day-ci/archive/20220419/202204190737.qhFLAafo-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/192ca8cdfd692f17162557c64e8d533c816eccff
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tom-Rix/staging-vchiq_arm-change-vchiq_platform_init-from-global-to-static/20220419-004611
        git checkout 192ca8cdfd692f17162557c64e8d533c816eccff
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=parisc SHELL=/bin/bash drivers/staging/vc04_services/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:16:
   In function 'memcpy_to_page',
       inlined from 'free_pagelist' at drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:434:4:
>> include/linux/highmem.h:353:9: warning: argument 2 null where non-null expected [-Wnonnull]
     353 |         memcpy(to + offset, from, len);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/string.h:20,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:8:
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c: In function 'free_pagelist':
   arch/parisc/include/asm/string.h:9:8: note: in a call to function 'memcpy' declared 'nonnull'
       9 | void * memcpy(void * dest,const void *src,size_t count);
         |        ^~~~~~
   In file included from drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:16:
   In function 'memcpy_to_page',
       inlined from 'free_pagelist' at drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:441:4:
>> include/linux/highmem.h:353:9: warning: 'memcpy' offset 0 is out of the bounds [0, 0] [-Warray-bounds]
     353 |         memcpy(to + offset, from, len);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +353 include/linux/highmem.h

bb90d4bc7b6a53 Ira Weiny         2021-02-09  346  
bb90d4bc7b6a53 Ira Weiny         2021-02-09  347  static inline void memcpy_to_page(struct page *page, size_t offset,
bb90d4bc7b6a53 Ira Weiny         2021-02-09  348  				  const char *from, size_t len)
bb90d4bc7b6a53 Ira Weiny         2021-02-09  349  {
61b205f579911a Ira Weiny         2021-02-09  350  	char *to = kmap_local_page(page);
bb90d4bc7b6a53 Ira Weiny         2021-02-09  351  
ca18f6ea012bf3 Ira Weiny         2021-02-10  352  	VM_BUG_ON(offset + len > PAGE_SIZE);
bb90d4bc7b6a53 Ira Weiny         2021-02-09 @353  	memcpy(to + offset, from, len);
8dad53a11f8d94 Christoph Hellwig 2021-07-23  354  	flush_dcache_page(page);
61b205f579911a Ira Weiny         2021-02-09  355  	kunmap_local(to);
bb90d4bc7b6a53 Ira Weiny         2021-02-09  356  }
bb90d4bc7b6a53 Ira Weiny         2021-02-09  357  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
