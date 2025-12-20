Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CDC218845;
	Sat, 20 Dec 2025 13:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766237759; cv=none; b=Y1wYtaOd10LwwJtJlPThqPlmtSKCqOOQAcE86qyzMTKVhQDUrZ/TBkiYNTHQmPsjqMqGt12P/pA1dIy8zH1FMjZex99WJUL8rqqL63F0/8KQTVzvx25pPnkEp0qpTN2coHKsDfbFHm38Fp5jxS1Y77PmwCx8+m3OyNNhYN8CITE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766237759; c=relaxed/simple;
	bh=ezskSz0sv7K80z23n0Tip2Rc9GWmtbbYwI9uNkg5LOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fEvvuiGkcRwEbwArNGPBSLKiXDSagv8rxVaka+/OZYStZb01UNI2GSd/pK0w7ukJZCklFSSQs64qKjqqk6Nc0++4Lep5iVYU8v1ou5F6vUGZnq2Ix30NTD1NM7tk8nbYbTc2UkVPThtk4Iko2Fu5la+IW+5VL2Ryh9zRUFCrAq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fq2EpVKR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fq2EpVKR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766237758; x=1797773758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ezskSz0sv7K80z23n0Tip2Rc9GWmtbbYwI9uNkg5LOQ=;
  b=Fq2EpVKRo39/3weByz+IQ1mk0KkWYE3pA7FwSiUQNAlY2dQ1trHQb5UJ
   /eAVFagUyAbyISH4hJBEzMKNeEOvA30N/XGO9BpHv93QaXckRSf5QKKmu
   Lchn9VXcGZyyiYPF1UvWyRcnbe8Mkz3kXNkTbmDaxqHaah34PMAYvOatV
   rh6HPzZg/Wbsdf3KHugKXXsB2FnCE2gCnD4sKboXQYlRbtEiDjwghsf3s
   P4dpWQP7ITnitCLMJDPFOJ502OszrGCMOwsYfGJkLAXeVblt3u7gwE98w
   U0y3QyCNhEMhp3eiEZp6ppqbpc+QByUYewG1YeV2+R2NNPAzzOSROwTgb
   w==;
X-CSE-ConnectionGUID: ZZjDTLurTj2mkhJ9jDpgGQ==
X-CSE-MsgGUID: YTmGMfzIRMChUwps9QaXRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="67371181"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="67371181"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 05:35:56 -0800
X-CSE-ConnectionGUID: 03wkJFNkR/mGIr9S7WRaUQ==
X-CSE-MsgGUID: ijjdsMViRjGA1kk4akL3Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="204039160"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Dec 2025 05:35:53 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWx7f-000000004Yv-39vv;
	Sat, 20 Dec 2025 13:35:51 +0000
Date: Sat, 20 Dec 2025 21:35:47 +0800
From: kernel test robot <lkp@intel.com>
To: Arjun Changla <arjunchangla7@gmail.com>, andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Arjun Changla <arjunchangla7@gmail.com>
Subject: Re: [PATCH] staging: fbtft: fix spacing before close parenthesis
Message-ID: <202512202155.mVhDoKTO-lkp@intel.com>
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
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20251220/202512202155.mVhDoKTO-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202155.mVhDoKTO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202155.mVhDoKTO-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/fbtft/fbtft-bus.c:65:53: error: macro 'define_fbtft_write_reg' requires 4 arguments, but only 3 given
      65 | define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
         |                                                     ^
   drivers/staging/fbtft/fbtft-bus.c:14:9: note: macro 'define_fbtft_write_reg' defined here
      14 | #define define_fbtft_write_reg(func, buffer_type, data_type, modifier)        \
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/fbtft/fbtft-bus.c:65:23: error: expected ';' before 'void'
      65 | define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
         |                       ^
         |                       ;


vim +65 drivers/staging/fbtft/fbtft-bus.c

    64	
  > 65	define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
    66	define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
    67	define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
