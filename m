Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DFC38E5D4;
	Mon,  9 Mar 2026 10:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773051479; cv=none; b=j6FdgxsHs/iPDkdKPnOg63IupL5kMj7eiDcFTZ9fH9+i4fFn/nwfSKMdftHDTTM+5tiNxm2CAvkaK48H1NNUHx1Lob0iAfT2i8BcW6RUf3VsdHAWnRjlYsslKgJlz5Pt54FATVnvCKR2YxdjWWWencdr7efPwKHJf88CU+KkgWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773051479; c=relaxed/simple;
	bh=PxwLcqfWeY+wdgC5BilMJKo54UiY4SgPOQcyeQm57Ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o6WEIjcMPfozvU5r58ydZeXHMVHqDDaOv2+R7iviwz89lX22pnv1JJpW6w5Vgvc7+pPphyRdvxo5YbSm6BGEXaMGsh+0GiXP8PzEyTGyTWougK1kem+CBE8hRqa/2GR1g1pbdn68G7wlW3iZpcInSTfdWYAKEQx2kk3h8SqJTJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lU3Qbo+5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lU3Qbo+5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773051478; x=1804587478;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PxwLcqfWeY+wdgC5BilMJKo54UiY4SgPOQcyeQm57Ao=;
  b=lU3Qbo+5RIYi7jRv1wQFllN3/y9E8gRUtZAmcif4SoxukTLlGXxtxc/R
   oo3VtsLA6t1r2kEHTezW6u1o6psPNS8Uh7HY3M8zRnTm5m+oD+JnIAcb+
   L7dtazk9HCSNqoXZusp9wJERXY5woLUhv/XreEt04mvVQUZ1UDKrMTtgg
   OiNBo3H+d6MQLvDI6PG3E5O+0XMk1x964exTKJLdVW/XGJ3+zl0KTqPzu
   8M8ohIrPhiqKI4ZX7s6nNGN2hLOGca4sN0ziQ1KmlxN8XtYV8J5ECKOIK
   ruOcIvyzlHnnC5FOXI7ULtU+ssUtIGrRDP9Hi3dA5rfAPamf4SWybQPXc
   Q==;
X-CSE-ConnectionGUID: eGctDIneShy3xwLHjrY9VA==
X-CSE-MsgGUID: RVaUGtE8QJWEwRwukLQk8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77672532"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="77672532"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 03:17:58 -0700
X-CSE-ConnectionGUID: hPuwX0g8Qb61x+hh0vrkzg==
X-CSE-MsgGUID: rEQv6OP3T1+na1iihp+mOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="219837360"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Mar 2026 03:17:56 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzXgO-0000000004C-212H;
	Mon, 09 Mar 2026 10:17:52 +0000
Date: Mon, 9 Mar 2026 18:17:38 +0800
From: kernel test robot <lkp@intel.com>
To: Laur <laurentiutopai2004@gmail.com>, hansg@kernel.org,
	mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, sakari.ailus@linux.intel.com,
	andy@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Laur <laurentiutopai2004@gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: comprehensive coding style
 cleanup
Message-ID: <202603091804.DdX2VxlO-lkp@intel.com>
References: <20260308215840.31197-1-laurentiutopai2004@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308215840.31197-1-laurentiutopai2004@gmail.com>

Hi Laur,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Laur/staging-media-atomisp-comprehensive-coding-style-cleanup/20260309-055945
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260308215840.31197-1-laurentiutopai2004%40gmail.com
patch subject: [PATCH] staging: media: atomisp: comprehensive coding style cleanup
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260309/202603091804.DdX2VxlO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603091804.DdX2VxlO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603091804.DdX2VxlO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/media/atomisp/pci/atomisp_cmd.c: In function 'copy_from_compatible':
>> drivers/staging/media/atomisp/pci/atomisp_cmd.c:2033:9: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
    2033 |         if (from_user)
         |         ^~
   In file included from include/linux/string.h:386,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/thread_info.h:12,
                    from include/linux/thread_info.h:62,
                    from include/linux/spinlock.h:60,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/firmware.h:8,
                    from drivers/staging/media/atomisp/pci/atomisp_cmd.c:10:
   include/linux/fortify-string.h:624:62: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
     624 |                              p_size_field, q_size_field, op) ({         \
         |                                                              ^
   include/linux/fortify-string.h:688:26: note: in expansion of macro '__fortify_memcpy_chk'
     688 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/atomisp_cmd.c:2036:17: note: in expansion of macro 'memcpy'
    2036 |                 memcpy(to, from, n);
         |                 ^~~~~~


vim +/if +2033 drivers/staging/media/atomisp/pci/atomisp_cmd.c

ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2029  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2030  static unsigned int long copy_from_compatible(void *to, const void *from,
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2031  	unsigned long n, bool from_user)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2032  {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19 @2033  	if (from_user)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2034  		return copy_from_user(to, (void __user *)from, n);
acede91286a8c6f drivers/staging/media/atomisp/pci/atomisp_cmd.c          Laur                  2026-03-08  2035  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2036  		memcpy(to, from, n);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2037  	return 0;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2038  }
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2039  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
