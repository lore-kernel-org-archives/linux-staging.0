Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A0C1D0DEE;
	Wed,  1 Apr 2026 01:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775005863; cv=none; b=JdexBbcDSaCK/+R6dIRCx5dUjoFzFUHxGdlgAPcq8QPp8J1zo1rssXnJfXoGuwu/x5Shf6DUgDQDYVtW1ysXD3ZLK9hLjFP459gbLCH7BWP4GhbdX+13fhP8UDbUkjZraoVZmxg+r7IbGcDHflHIU6CMYBjT4WfDr4qB98do+jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775005863; c=relaxed/simple;
	bh=uXNNjYphoziRWjtPbo2+XTpUjwdIj4hCiEsYNEEo5Tw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejfBA3Z1UxKoS1GWNKk7sE4zgisS3DlkIYICgyIOddAZSVO5vLi+wWzzReVnkCG7/GHLhLdKhESVGxWCDAY/g6XtN4Qmsb/S4S+7VL8Q8CSApaOLxc8ywYB/FtRpCFeNVxytbbSrFMDSLtXxXIA1oQvVtRiqvU4lgw8MeoXUXFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mnmuR6YG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mnmuR6YG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775005861; x=1806541861;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uXNNjYphoziRWjtPbo2+XTpUjwdIj4hCiEsYNEEo5Tw=;
  b=mnmuR6YGdnceXu5ATBdfWcnbaiwL0U9Jwt/x9ta5tzfSI4sthOP+L2kK
   QVIgwSIcQu9nZtU5GjJ/e9e8smD3g/NNB55ae7QRJTH8lZX2g3wQJUw+7
   InIKlQNqvaS7ea7V35hugR0iCUopeCztopjO0ZMGsLIrIjycyob6L7Edy
   MUQIfi5m2/9zKTaFajGv8Vuy8oAsJkxBuPGzGkNGOMhKFxwdbD+Ilej2N
   AKiwrRto/TEUU4JXj/NpFPWRj/wcEHT0QTk9hNaUcUXS77vIWB98Sa8T0
   +u0pqsNzdSEnBQu/sD2SKNJthj0Dke8f9NGLDQjyxoOSlBP2vRXJPw/ad
   w==;
X-CSE-ConnectionGUID: a7gR3tXATNKiISLEU092MQ==
X-CSE-MsgGUID: 0Owu2CxyRduzXBt/b0XPBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="101487579"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="101487579"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 18:11:01 -0700
X-CSE-ConnectionGUID: PdKExb/uSL6kYy+NfPEohA==
X-CSE-MsgGUID: jgz0kaJ1QHWsKSJYAKeOJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="225525458"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Mar 2026 18:10:59 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7k6i-000000004Wj-3CbM;
	Wed, 01 Apr 2026 01:10:56 +0000
Date: Wed, 1 Apr 2026 09:10:50 +0800
From: kernel test robot <lkp@intel.com>
To: AyushMukkanwar <ayushmukkanwar@gmail.com>, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	AyushMukkanwar <ayushmukkanwar@gmail.com>
Subject: Re: [PATCH v2 2/2] staging: octeon: ethernet: replace pr_* with
 dev_* and netdev_*
Message-ID: <202604010854.Dg9b25Se-lkp@intel.com>
References: <20260331111757.110703-3-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331111757.110703-3-ayushmukkanwar@gmail.com>

Hi AyushMukkanwar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/AyushMukkanwar/staging-octeon-ethernet-spi-replace-pr_err-with-dev_err/20260331-194415
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260331111757.110703-3-ayushmukkanwar%40gmail.com
patch subject: [PATCH v2 2/2] staging: octeon: ethernet: replace pr_* with dev_* and netdev_*
config: parisc-randconfig-002-20260401 (https://download.01.org/0day-ci/archive/20260401/202604010854.Dg9b25Se-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010854.Dg9b25Se-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010854.Dg9b25Se-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/staging/octeon/ethernet-mem.c:47 function parameter 'dev' not described in 'cvm_oct_free_hw_skbuff'
>> Warning: drivers/staging/octeon/ethernet-mem.c:77 function parameter 'dev' not described in 'cvm_oct_fill_hw_memory'
>> Warning: drivers/staging/octeon/ethernet-mem.c:114 function parameter 'dev' not described in 'cvm_oct_free_hw_memory'
>> Warning: drivers/staging/octeon/ethernet-mem.c:47 function parameter 'dev' not described in 'cvm_oct_free_hw_skbuff'
>> Warning: drivers/staging/octeon/ethernet-mem.c:77 function parameter 'dev' not described in 'cvm_oct_fill_hw_memory'
>> Warning: drivers/staging/octeon/ethernet-mem.c:114 function parameter 'dev' not described in 'cvm_oct_free_hw_memory'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
