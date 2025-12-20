Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCAA296BD5;
	Sat, 20 Dec 2025 14:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766241313; cv=none; b=o9r6FCh6FWEsneLLxh6RXDOPHcamiY/9mnW5ka/WmDbAIi+qxzeymtUvJDDPi67it0zDgX3GbV+e5/UzaSHG4uIM0Le/sxTW8y8g6iNBlo6mppwkwjp1W7rD+efNI3WhLXja7kyEfO6jFs4JqeTuoZ0v9Fbl/lvNolGQTDhJ9a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766241313; c=relaxed/simple;
	bh=2+ESbQOp1tL3mXSKzq6nAnjpDq5WfXCoBt6oeAzOvHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FRWpbXgii5FAJBMuxiEoXJGngcrR/WrbkVpXU6c0BkZs6EUeNJ50ME+gyR9FuLo0WxHPNkQh+RuIVUNZSHEzaXQHg1SoHfnxyKFi2bMkENPByccd70//Sfu29OHDybsShU41o51n3Geuln2el8nttpIWVr9NR7g0E8HM36x12AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IzqU39ke; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IzqU39ke"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766241311; x=1797777311;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2+ESbQOp1tL3mXSKzq6nAnjpDq5WfXCoBt6oeAzOvHQ=;
  b=IzqU39keaw2+MT0SGd9Z04CfnUFty4QYxurtWWC9sNlqoDzgII8D+JNV
   arEvBKCnaZ0FAS1R+ABq4U71Ek6OutPx0m49BhHh4bUp2Bwu6XidO+OEj
   E6n0NuXiwY7XKuPWxT86ZmMEF94zpPlvzL5M/AjeXRvsooFrqjUsHVYna
   YO5pIDFxMF0TrhpRzUL8yzm/rEAeZ054kkOl16SUgDR7rq5c6TBTqFMwZ
   6ofU05JKquGtZktECrf3cs4YxCVCtToc0SkCiS+qB2tIfhF5Xu7BCUDIO
   ALC41VNxDrPK7owyVrL0BHlornYqxZs3118N/HbepYscRrgo1s0XodgMt
   w==;
X-CSE-ConnectionGUID: T/tka9kuS3G2Sk3lko/Wag==
X-CSE-MsgGUID: IVaRnKO0TPmA3tfdnxZ2jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="93649994"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="93649994"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 06:35:09 -0800
X-CSE-ConnectionGUID: y9x4ULWtQqamFlHOImGcYw==
X-CSE-MsgGUID: b//WKfloS+mq6haUem+7Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199023542"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Dec 2025 06:35:07 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWy2z-000000004eF-0EeA;
	Sat, 20 Dec 2025 14:35:05 +0000
Date: Sat, 20 Dec 2025 22:34:49 +0800
From: kernel test robot <lkp@intel.com>
To: Arjun Changla <arjunchangla7@gmail.com>, andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Arjun Changla <arjunchangla7@gmail.com>
Subject: Re: [PATCH] staging: fbtft: fix spacing before close parenthesis
Message-ID: <202512202133.HE4EhjjS-lkp@intel.com>
References: <20251218061406.8043-1-arjunchangla7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218061406.8043-1-arjunchangla7@gmail.com>

Hi Arjun,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Arjun-Changla/staging-fbtft-fix-spacing-before-close-parenthesis/20251218-141736
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20251218061406.8043-1-arjunchangla7%40gmail.com
patch subject: [PATCH] staging: fbtft: fix spacing before close parenthesis
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20251220/202512202133.HE4EhjjS-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202133.HE4EhjjS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202133.HE4EhjjS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/fbtft/fbtft-bus.c:65:53: error: macro 'define_fbtft_write_reg' requires 4 arguments, but only 3 given
      65 | define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
         |                                                     ^
   drivers/staging/fbtft/fbtft-bus.c:14:9: note: macro 'define_fbtft_write_reg' defined here
      14 | #define define_fbtft_write_reg(func, buffer_type, data_type, modifier)        \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft-bus.c:65:23: error: expected ';' before 'void'
      65 | define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
         |                       ^
         |                       ;


vim +/define_fbtft_write_reg +65 drivers/staging/fbtft/fbtft-bus.c

    64	
  > 65	define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
    66	define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
    67	define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
