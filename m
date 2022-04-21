Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0985C1FA1
	for <linux-staging@lists.linux.dev>; Thu, 21 Apr 2022 08:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650528601; x=1682064601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cLE6xmcyejVNPvTSv0CwIrdK3A7MUJeex/f7C9SJaSE=;
  b=PDSWOyiKmWakGbxnekvrcXUnM/G72bkPu/IW+bIvWjhRBiYO9dA6JyfR
   SlF1uBQi13yr84an7e5IJ0h1Yxg4jFQVjray9mtP1PyMvFJENPVpdDYpw
   osn51B6lpiJdHxevaOgIpjtLoPaAb2D4s1jE28FjWkqOx6dsmFmcMuuFH
   emygGrCQ1VTlCDXBjJyNTXt3xzXamBydgz6Cf9DV+dJLcWUfLvH+NJ0+0
   FOMMEdwBJOyZcmv4ZfkeFBy3+6zc16qo/UOB2EbBJt277T3lq0aVe0lXj
   ehOnVlKuPHB6RvjOfx9NOb2vEwbJn6OwF6Uc4nFunprXKfQlgvEMEOovk
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="244208427"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="244208427"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 01:10:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="614783287"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 21 Apr 2022 01:09:58 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhRt0-00086k-7D;
	Thu, 21 Apr 2022 08:09:58 +0000
Date: Thu, 21 Apr 2022 16:09:48 +0800
From: kernel test robot <lkp@intel.com>
To: Haowen Bai <baihaowen@meizu.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kbuild-all@lists.01.org, Haowen Bai <baihaowen@meizu.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4] staging: rtl8192e: Fix signedness bug in
 rtllib_rx_assoc_resp()
Message-ID: <202204211558.TapLZO4j-lkp@intel.com>
References: <1650504854-17576-1-git-send-email-baihaowen@meizu.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1650504854-17576-1-git-send-email-baihaowen@meizu.com>

Hi Haowen,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v5.18-rc3]
[also build test ERROR on next-20220421]
[cannot apply to staging/staging-testing]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Haowen-Bai/staging-rtl8192e-Fix-signedness-bug-in-rtllib_rx_assoc_resp/20220421-093531
base:    b2d229d4ddb17db541098b83524d901257e93845
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20220421/202204211558.TapLZO4j-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e1395cdafd4dea7a368f2d9599832636035a03d2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Haowen-Bai/staging-rtl8192e-Fix-signedness-bug-in-rtllib_rx_assoc_resp/20220421-093531
        git checkout e1395cdafd4dea7a368f2d9599832636035a03d2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/staging/rtl8192e/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/staging/rtl8192e/rtllib_softmac.c: In function 'auth_parse':
>> drivers/staging/rtl8192e/rtllib_softmac.c:1792:29: error: 'ieee' undeclared (first use in this function)
    1792 |                 netdev_info(ieee->dev, "auth_parse() failed");
         |                             ^~~~
   drivers/staging/rtl8192e/rtllib_softmac.c:1792:29: note: each undeclared identifier is reported only once for each function it appears in


vim +/ieee +1792 drivers/staging/rtl8192e/rtllib_softmac.c

  1766	
  1767	static inline int auth_parse(struct net_device *dev, struct sk_buff *skb,
  1768				     u8 **challenge, int *chlen)
  1769	{
  1770		struct rtllib_authentication *a;
  1771		u8 *t;
  1772	
  1773		if (skb->len <  (sizeof(struct rtllib_authentication) -
  1774		    sizeof(struct rtllib_info_element))) {
  1775			netdev_dbg(dev, "invalid len in auth resp: %d\n", skb->len);
  1776			return -EINVAL;
  1777		}
  1778		*challenge = NULL;
  1779		a = (struct rtllib_authentication *) skb->data;
  1780		if (skb->len > (sizeof(struct rtllib_authentication) + 3)) {
  1781			t = skb->data + sizeof(struct rtllib_authentication);
  1782	
  1783			if (*(t++) == MFIE_TYPE_CHALLENGE) {
  1784				*chlen = *(t++);
  1785				*challenge = kmemdup(t, *chlen, GFP_ATOMIC);
  1786				if (!*challenge)
  1787					return -ENOMEM;
  1788			}
  1789		}
  1790	
  1791		if (a->status) {
> 1792			netdev_info(ieee->dev, "auth_parse() failed");
  1793			return -EINVAL;
  1794		}
  1795	
  1796		return 0;
  1797	}
  1798	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
