Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC214207E18;
	Sat, 25 Jan 2025 11:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737805198; cv=none; b=h1jR/aBEsvYaVYYxOk5PX4n+eptS64QkVLqKj00e/HN6rKQjmwmywPNfoxggCJ3FpPFKsbIJw/NYik88Aw4yhJrW26w+66vpaMYWYXSLhQotTef6YY0Gi+Pb0KREIjuKmSrJYDjuqB7O1O1JnlUGVJlODcAgmlSlKe86wkQG8Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737805198; c=relaxed/simple;
	bh=4QAY/y/wJlA0mFqOlmvD657QMVqEsk2CaZfnS9j6VyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+XocRfQnHwbaZbQ4OgHLC7Qzu28gFdYxR2w7QVden7dxDS3eH1XH2EAcAtLIlwCH44OSk1XRjxmH/OLWMQa2Bog1PhqSAfWlF/OLZPi+nebgYhJKOu2VWR927QTjmIWbywyn/TRpFBcnk/zOajMmTqpqTXpCvx5sNiWlBf14dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YpO27pqi; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YpO27pqi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737805197; x=1769341197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4QAY/y/wJlA0mFqOlmvD657QMVqEsk2CaZfnS9j6VyU=;
  b=YpO27pqiCzUFByWlm4ZyTcoxerUn8YXvQEuv776YNQNqErXR2YK9Wgsy
   5GnCKgGXCnPTtYtq15waEtQo5zzl5hS9CSQeANF68u7oKmfa2A8BUpD25
   li5gl0onGgJNLyVeluQ+nutTeN6n+E+BU1VB8TzpYMhWB/V50SlHzo8eg
   wqbtJFQjTia0a6dVGDOLoRwWdwjMttC0aX2hXEO1QoAWjvUECvyDPEYVs
   v0d5KlMj3gH1eAs8f5OEReINhA0aCMAcQl9VnRGdV88WeSTHXLUxo9a8f
   QYZTYfmilCK5oh0qsMowvSTCtlsQySLlvUzVJpSVkxp5uwKhl8LA3aNA6
   Q==;
X-CSE-ConnectionGUID: ac693Yr3QfaTDFekBf6umQ==
X-CSE-MsgGUID: aGNdkT1ZQ0uT1YH5BNnNiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="42092163"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="42092163"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 03:39:53 -0800
X-CSE-ConnectionGUID: z10jFQ24RbSt0fNf94lOYw==
X-CSE-MsgGUID: yy4wZeHZR2uOIHVOcnr8og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="145241021"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Jan 2025 03:39:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbeVx-000dlf-0n;
	Sat, 25 Jan 2025 11:39:49 +0000
Date: Sat, 25 Jan 2025 19:39:08 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Penkler <dpenkler@gmail.com>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Dave Penkler <dpenkler@gmail.com>
Subject: Re: [PATCH 3/3] staging: gpib: Remove depends on BROKEN
Message-ID: <202501251944.Wgt3u1Gx-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Penkler/staging-gpib-Fix-pr_err-format-warning/20250124-190232
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20250124105900.27592-4-dpenkler%40gmail.com
patch subject: [PATCH 3/3] staging: gpib: Remove depends on BROKEN
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250125/202501251944.Wgt3u1Gx-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501251944.Wgt3u1Gx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501251944.Wgt3u1Gx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/gpib/hp_82341/hp_82341.c:802:35: warning: 'hp_82341_pnp_table' defined but not used [-Wunused-const-variable=]
     802 | static const struct pnp_device_id hp_82341_pnp_table[] = {
         |                                   ^~~~~~~~~~~~~~~~~~


vim +/hp_82341_pnp_table +802 drivers/staging/gpib/hp_82341/hp_82341.c

6d4f8749cd5da8 Dave Penkler 2024-09-18  801  
6d4f8749cd5da8 Dave Penkler 2024-09-18 @802  static const struct pnp_device_id hp_82341_pnp_table[] = {
6d4f8749cd5da8 Dave Penkler 2024-09-18  803  	{.id = "HWP1411"},
6d4f8749cd5da8 Dave Penkler 2024-09-18  804  	{.id = ""}
6d4f8749cd5da8 Dave Penkler 2024-09-18  805  };
6d4f8749cd5da8 Dave Penkler 2024-09-18  806  MODULE_DEVICE_TABLE(pnp, hp_82341_pnp_table);
6d4f8749cd5da8 Dave Penkler 2024-09-18  807  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
