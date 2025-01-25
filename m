Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8812B225D6;
	Sat, 25 Jan 2025 14:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737816493; cv=none; b=Ae5jAx3L9PuBLsIJrZftCK6BzvOfx56qEozPZ+qOWwGEAjETCxN6rROOnT4grByKLVzoy72YLAbOl7B+u5U39oHL5/PewPfXY1pt0IV7B5zMpfcp+ZgLGPNswI6Ub6COxL7AhqwaGpGthsyWse/fF4fSHdLkhZYUcMc+bb0fg+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737816493; c=relaxed/simple;
	bh=Cc05fd+Cu5i+ny7KLdUkVlJ9XkfyoL8lUF11X6ku7RE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pq7IMyXFOmRoPzibg2+4q3kwoyk24ztuTJFXW1OKFBl0KYz7+TvovJ6IVvDoEXBx8pc+yJsg767rUMikPianfDDjH2byIF84f+pVFpzV91WqVFEiyP+Jq6CkD41rV92+JiGBfR9l/33w4gQqi5ovqZIdjSAb8mAkW6aiCbpvT5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ADVR9Ewr; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ADVR9Ewr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737816491; x=1769352491;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cc05fd+Cu5i+ny7KLdUkVlJ9XkfyoL8lUF11X6ku7RE=;
  b=ADVR9EwrCH5yFQdxNtbX5m8HwTJTtbDg+B2O/w4kHxicQET3lPnR6fN7
   9+58kQmez3NQycZ78kP6fQNjPU3AN+gspLYDojbsRZ/RKjmNHc9mQSwD2
   mdEE512tYkJq4hSV2xgIGoDw+a7mi4DaxEREN3WVjkbn19h7QRgHNI/9e
   H6GWpxou93qFWFSDtkIw4r4s1IG37mXQrxwdQ2PNkmUFTWDkrI/LslyCQ
   EE/g3MhQxIUvvo22szOtx4m4R91b70BUd9hf6A2bthC0drY/MDSq27UT0
   S7hmPBUo50d2xXQ2IR8dM5ubblaJBS4PCxSevR16NV9BX1UpfUBH1SEpf
   A==;
X-CSE-ConnectionGUID: ns0u/wMPTjua3JClsDAbVg==
X-CSE-MsgGUID: VG5QaU7JQVyOXF2BsdQFgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="38364261"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="38364261"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 06:48:10 -0800
X-CSE-ConnectionGUID: kdltp9SSQSKu/zfQsQp6Yw==
X-CSE-MsgGUID: qE3vprVQSlmLer1BymxcMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108458614"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Jan 2025 06:48:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbhSA-000dtb-0b;
	Sat, 25 Jan 2025 14:48:06 +0000
Date: Sat, 25 Jan 2025 22:47:53 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Penkler <dpenkler@gmail.com>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Dave Penkler <dpenkler@gmail.com>
Subject: Re: [PATCH 3/3] staging: gpib: Remove depends on BROKEN
Message-ID: <202501252201.OmgbVCva-lkp@intel.com>
References: <20250124105900.27592-4-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124105900.27592-4-dpenkler@gmail.com>

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Penkler/staging-gpib-Fix-pr_err-format-warning/20250124-190232
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20250124105900.27592-4-dpenkler%40gmail.com
patch subject: [PATCH 3/3] staging: gpib: Remove depends on BROKEN
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250125/202501252201.OmgbVCva-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501252201.OmgbVCva-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501252201.OmgbVCva-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: drivers/staging/gpib/hp_82341/hp_82341.o: in function `read_and_clear_event_status':
>> (.text+0x1400): multiple definition of `read_and_clear_event_status'; drivers/staging/gpib/agilent_82350b/agilent_82350b.o:(.text+0x13c0): first defined here
   alpha-linux-ld: drivers/staging/gpib/hp_82341/hp_82341.o: in function `read_transfer_counter':
>> (.text+0x1480): multiple definition of `read_transfer_counter'; drivers/staging/gpib/agilent_82350b/agilent_82350b.o:(.text+0x1440): first defined here
   alpha-linux-ld: drivers/staging/gpib/hp_82341/hp_82341.o: in function `set_transfer_counter':
>> (.text+0x1510): multiple definition of `set_transfer_counter'; drivers/staging/gpib/agilent_82350b/agilent_82350b.o:(.text+0x14d0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
