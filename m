Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A03A2C81
	for <linux-staging@lists.linux.dev>; Fri, 26 Nov 2021 08:54:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="222501685"
X-IronPort-AV: E=Sophos;i="5.87,265,1631602800"; 
   d="scan'208";a="222501685"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 00:54:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,265,1631602800"; 
   d="scan'208";a="741486503"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 26 Nov 2021 00:54:21 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mqWzt-0007rh-0M; Fri, 26 Nov 2021 08:54:21 +0000
Date: Fri, 26 Nov 2021 16:54:14 +0800
From: kernel test robot <lkp@intel.com>
To: Zoeb Mithaiwala <zoebm@google.com>, trivial@kernel.org
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, Zoeb Mithaiwala <zoebm@google.com>
Subject: Re: [PATCH] Staging: rtl8712: rtl871x_security: fixed a camel case
 variable name coding style issue
Message-ID: <202111261635.wXZz1PMT-lkp@intel.com>
References: <20211120080658.1070907-1-zoebm@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211120080658.1070907-1-zoebm@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Zoeb,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/0day-ci/linux/commits/Zoeb-Mithaiwala/Staging-rtl8712-rtl871x_security-fixed-a-camel-case-variable-name-coding-style-issue/20211120-160918
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git 1189d2fb15a4b09b2e8dd01d60a0817d985d933d
config: m68k-randconfig-r026-20211121 (https://download.01.org/0day-ci/archive/20211126/202111261635.wXZz1PMT-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/8c1ab61206da180488d1d32547a73288052736cd
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Zoeb-Mithaiwala/Staging-rtl8712-rtl871x_security-fixed-a-camel-case-variable-name-coding-style-issue/20211120-160918
        git checkout 8c1ab61206da180488d1d32547a73288052736cd
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=m68k SHELL=/bin/bash drivers/staging/rtl8712/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/staging/rtl8712/rtl871x_security.c: In function 'secmicappendbyte':
>> drivers/staging/rtl8712/rtl871x_security.c:288:51: error: 'struct mic_data' has no member named 'n_bytes_in_m'; did you mean 'nbytes_in_m'?
     288 |         pmicdata->M |= ((u32)b) << (8 * pmicdata->n_bytes_in_m);
         |                                                   ^~~~~~~~~~~~
         |                                                   nbytes_in_m


vim +288 drivers/staging/rtl8712/rtl871x_security.c

   284	
   285	static void secmicappendbyte(struct mic_data *pmicdata, u8 b)
   286	{
   287		/* Append the byte to our word-sized buffer */
 > 288		pmicdata->M |= ((u32)b) << (8 * pmicdata->n_bytes_in_m);
   289		pmicdata->nbytes_in_m++;
   290		/* Process the word if it is full. */
   291		if (pmicdata->nbytes_in_m >= 4) {
   292			pmicdata->L ^= pmicdata->M;
   293			pmicdata->R ^= ROL32(pmicdata->L, 17);
   294			pmicdata->L += pmicdata->R;
   295			pmicdata->R ^= ((pmicdata->L & 0xff00ff00) >> 8) |
   296				       ((pmicdata->L & 0x00ff00ff) << 8);
   297			pmicdata->L += pmicdata->R;
   298			pmicdata->R ^= ROL32(pmicdata->L, 3);
   299			pmicdata->L += pmicdata->R;
   300			pmicdata->R ^= ROR32(pmicdata->L, 2);
   301			pmicdata->L += pmicdata->R;
   302			/* Clear the buffer */
   303			pmicdata->M = 0;
   304			pmicdata->nbytes_in_m = 0;
   305		}
   306	}
   307	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
