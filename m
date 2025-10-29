Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3313043D1;
	Wed, 29 Oct 2025 15:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761752858; cv=none; b=WJqsRd9j6N3mLvz+Z1/dwj2PKv5y/y/SukTW6+HaO7yZdYR/3Dn2Yp3NKjvySaeyXRYKi3INcbRfAQi96Q5WsnNVGwb8b0k6c9A9s0gqkm5vhm8/a3vtMuIQJq9ufq+YK+jLPNFD1ME7DfsNMbfMjWon9NzTtBmSXz9n38xcMHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761752858; c=relaxed/simple;
	bh=1RxTURaC5/3lKAY9GwnYfHnLdtM97jiWEo2uWYSN4+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Amu63UaTwh2gfp1aLnlopx6FUFMqNVknZSg69YLO6JkSf6ZtGQfQQINM21q3w5cqGOvrsDt90tLqj80aUl2K+511urqh6DW+IHPA0jZU5CAtugZM4vCBJoiWg6HTfQoP2MxmUN2LtUg+mWf1hITVsnfcaAfaZOZcxlKdeoKd/HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hG7zicuh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hG7zicuh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761752857; x=1793288857;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1RxTURaC5/3lKAY9GwnYfHnLdtM97jiWEo2uWYSN4+U=;
  b=hG7zicuhVkRFJBf2OHTcrrHFQZPSzfEMdQSDDw07ycVbLpLu3RFPb9X2
   /2ste9fO/C8q5+32ZkFXNPBsZuRuAFfEUvdUZ91UdayAfYELm1PT8s4zw
   9ZPkXoeE7+KEQF9b/qNDrBrmu1oErHOeLDofwgDSIOhSnmCu1W7T2Q279
   07YYlqfJOmYzVvvpel0RpS1uofFUJEBbkAHsZ6zMc1Gi09ufR/ctU3ed0
   qqeLFlV12qeObEMz6x/KNq4K2O5AcRxH9r2qVI1Zx0mqv0r0OCucw12f7
   sH+oEqUph4AzanjLIqQlgsxRm89395K/ntA/LKtvY369bKelWcPfwR5Kp
   Q==;
X-CSE-ConnectionGUID: x+X0imFkQCC5+OJnMXc8AA==
X-CSE-MsgGUID: QC2gBCnASaycrRtBPGqpBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="64028194"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="64028194"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 08:47:36 -0700
X-CSE-ConnectionGUID: m47uE1yzSyqYMdfnjfQHGw==
X-CSE-MsgGUID: JBZgz1C/SUuiy/znPKHOqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="186049178"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 29 Oct 2025 08:47:33 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE8OX-000Kk5-0g;
	Wed, 29 Oct 2025 15:47:29 +0000
Date: Wed, 29 Oct 2025 23:46:32 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Del Gobbo <cristiandelgobbo87@gmail.com>,
	sudip.mukherjee@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Cristian Del Gobbo <cristiandelgobbo87@gmail.com>,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] staging: sm750fb: style fixes: align call and split
 chained assignment
Message-ID: <202510292220.5YKTkjfH-lkp@intel.com>
References: <20251029022002.5812-1-cristiandelgobbo87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029022002.5812-1-cristiandelgobbo87@gmail.com>

Hi Cristian,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Cristian-Del-Gobbo/staging-sm750fb-style-fixes-align-call-and-split-chained-assignment/20251029-102311
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20251029022002.5812-1-cristiandelgobbo87%40gmail.com
patch subject: [PATCH v2] staging: sm750fb: style fixes: align call and split chained assignment
config: sparc-randconfig-001-20251029 (https://download.01.org/0day-ci/archive/20251029/202510292220.5YKTkjfH-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510292220.5YKTkjfH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510292220.5YKTkjfH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/sm750fb/sm750.c: In function 'lynxfb_ops_setcolreg':
   drivers/staging/sm750fb/sm750.c:541:3: error: expected expression before 'int'
      int y = (red * 77 + green * 151 + blue * 28) >> 8;
      ^~~
   drivers/staging/sm750fb/sm750.c:540:2: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
     if (info->var.grayscale)
     ^~
   drivers/staging/sm750fb/sm750.c:543:3: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
      red = y;
      ^~~
>> drivers/staging/sm750fb/sm750.c:543:9: error: 'y' undeclared (first use in this function)
      red = y;
            ^
   drivers/staging/sm750fb/sm750.c:543:9: note: each undeclared identifier is reported only once for each function it appears in


vim +/y +543 drivers/staging/sm750fb/sm750.c

   517	
   518	static int lynxfb_ops_setcolreg(unsigned int regno,
   519					unsigned int red,
   520					unsigned int green,
   521					unsigned int blue,
   522					unsigned int transp,
   523					struct fb_info *info)
   524	{
   525		struct lynxfb_par *par;
   526		struct lynxfb_crtc *crtc;
   527		struct fb_var_screeninfo *var;
   528		int ret;
   529	
   530		par = info->par;
   531		crtc = &par->crtc;
   532		var = &info->var;
   533		ret = 0;
   534	
   535		if (regno > 256) {
   536			pr_err("regno = %d\n", regno);
   537			return -EINVAL;
   538		}
   539	
   540		if (info->var.grayscale)
   541			int y = (red * 77 + green * 151 + blue * 28) >> 8;
   542	
 > 543			red = y;
   544			green = y;
   545			blue = y;
   546	
   547		if (var->bits_per_pixel == 8 &&
   548		    info->fix.visual == FB_VISUAL_PSEUDOCOLOR) {
   549			red >>= 8;
   550			green >>= 8;
   551			blue >>= 8;
   552			ret = hw_sm750_set_col_reg(crtc, regno, red, green, blue);
   553			goto exit;
   554		}
   555	
   556		if (info->fix.visual == FB_VISUAL_TRUECOLOR && regno < 256) {
   557			u32 val;
   558	
   559			if (var->bits_per_pixel == 16 ||
   560			    var->bits_per_pixel == 32 ||
   561			    var->bits_per_pixel == 24) {
   562				val = chan_to_field(red, &var->red);
   563				val |= chan_to_field(green, &var->green);
   564				val |= chan_to_field(blue, &var->blue);
   565				par->pseudo_palette[regno] = val;
   566				goto exit;
   567			}
   568		}
   569	
   570		ret = -EINVAL;
   571	
   572	exit:
   573		return ret;
   574	}
   575	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
