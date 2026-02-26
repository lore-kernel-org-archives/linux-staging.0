Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F79DF9C0;
	Thu, 26 Feb 2026 21:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772141823; cv=none; b=rl4geYQwrZoVTUlrDirszWvFbzaINCjUPiwAVHKjX+df4SNzYGE+xAQ1l87E/Ue+o/8VjTTLSfR+fzToi+djC055+UHTQPYYhvT3nuTcSEFP5jGTIW/9TFK2Of7uh1jWOGeQWqso36334E0+2MPjCg4qoCB2c12HmubBizCaHFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772141823; c=relaxed/simple;
	bh=n/uXtIE/7Q8NvOvfZpt0TUHV791gQBLA+O3rf+O+rAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jcjms2mpsH3axKUYd29FnqRz8jhDc+9r+TTqakh5vZNEPHZ4zu8fY26HZCEaq2YDs4D1+z4wsHtsQBrnSYKgKByumo5lozbWu7EzAkL8B1fGMcqzJ5slduViaQuEsafRBT6+icJAjaE+nluawu6Rb3CYHQnnKOjGtXN3WWr0bdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QskwLMso; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QskwLMso"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772141821; x=1803677821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n/uXtIE/7Q8NvOvfZpt0TUHV791gQBLA+O3rf+O+rAc=;
  b=QskwLMsoMMYng0MwjkBZ/NVUX8ZMhnDnu5g/aOcJmK9AaFQW6TppG+UE
   OZMdXfi1YYqG3gtlU9LqsU3uQqYsSkczWmwRG/FozKbEOcXb7uwqaqsTe
   cCeewiiLu4LOdSgkwz9krbhpiJBSaPjJMuoJasdQBV9tYJYp+dvGkkPiP
   rSjRLyjpxKPkVbHyCoI9fBvvwh9vLYAKhr+6SO9TAX0RFLZojF8heb04Y
   yuiwmfxGIbteBCiJZcclpYoYo/2oB8qXzm4lASXruaQNaDoH55hJ5evQQ
   RCi65I86J7Oe9ZeEkYdgyVURwrbh7m0+TKj4C9/HkB8pU18dze4LKpLCU
   g==;
X-CSE-ConnectionGUID: 48wdM1DEQrSC2aoyg5v3gw==
X-CSE-MsgGUID: itDvSgmUQq+dsjC/4VzqHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="72250776"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="72250776"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 13:36:59 -0800
X-CSE-ConnectionGUID: bmecPqJLSHu3mefQpv3h0Q==
X-CSE-MsgGUID: 9v+KlnlaRJiTHTlfgCQytQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="215386016"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 26 Feb 2026 13:36:57 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvj2U-000000009tX-3HN7;
	Thu, 26 Feb 2026 21:36:54 +0000
Date: Fri, 27 Feb 2026 05:36:47 +0800
From: kernel test robot <lkp@intel.com>
To: dhyan19022009@gmail.com, Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, Jason Donenfeld <Jason@zx2c4.com>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dhyan K Prajapati <dhyan19022009@gmail.com>
Subject: Re: [PATCH] staging: fbtft: fix macro whitespace errors
Message-ID: <202602270527.UlXqo4xH-lkp@intel.com>
References: <20260226172531.13714-1-dhyan19022009@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226172531.13714-1-dhyan19022009@gmail.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/dhyan19022009-gmail-com/staging-fbtft-fix-macro-whitespace-errors/20260227-021646
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260226172531.13714-1-dhyan19022009%40gmail.com
patch subject: [PATCH] staging: fbtft: fix macro whitespace errors
config: parisc-randconfig-001-20260227 (https://download.01.org/0day-ci/archive/20260227/202602270527.UlXqo4xH-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602270527.UlXqo4xH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602270527.UlXqo4xH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/fbtft/fbtft-bus.c:65:53: error: macro "define_fbtft_write_reg" requires 4 arguments, but only 3 given
    define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
                                                        ^
>> drivers/staging/fbtft/fbtft-bus.c:65:23: error: expected ';' before 'void'
    define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
                          ^
                          ;
   drivers/staging/fbtft/fbtft-bus.c:67:57: error: macro "define_fbtft_write_reg" requires 4 arguments, but only 3 given
    define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
                                                            ^
   drivers/staging/fbtft/fbtft-bus.c:67:23: error: expected ';' before 'void'
    define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
                          ^
                          ;
   drivers/staging/fbtft/fbtft-bus.c:69:1:
    void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
    ~~~~                   


vim +/define_fbtft_write_reg +65 drivers/staging/fbtft/fbtft-bus.c

    64	
  > 65	define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
    66	define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
    67	define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
