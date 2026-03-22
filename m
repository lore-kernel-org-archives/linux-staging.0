Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAE836657B;
	Sun, 22 Mar 2026 18:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774205839; cv=none; b=PcAHzppNQVz0rY/QtDaBFu1Q9QPkOLJNZb3h357b6MUaledRVFqx6GdPNanL/5hd9trNc4wnb7XOCPYYa3+dVdKcDqLJ1rdf95xvy7FOWkYBE3zrt842ERPqTEd8f5H8Y20TQ4OESUVUJKDE9mqC364ha3/pV+0In/4y3YD33kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774205839; c=relaxed/simple;
	bh=6bMF1jd77OIa1U6bagG4TUG6hns4FaJUZAPv3zMgyI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iZcgvi+sZ61gdvwK3mpN9eFxtAC/MU+Neqy+mjau17wBSZyZob92Kh5SSCw39jJLhsZLrGfC+4iHNkf7+rIWMyt9uEQPCPWVQJbkSC5wQzKJLI3FRQXlUCrmRmkqCliAXpxJGkOTPsIxj3JHZ4VPKdMsB25c9kMtdl9x1IEPXBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ExduaSaz; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ExduaSaz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774205838; x=1805741838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6bMF1jd77OIa1U6bagG4TUG6hns4FaJUZAPv3zMgyI8=;
  b=ExduaSaz3XiyriCYF4OBJzTjSiVjgkUZhXKrfJ8VIMgAHBWJv+6Htpfs
   zO1pWUjSEoVpsxz0hdLVc5TUPQGK5ZIIS8+pXvKUYjBcYi8LEsxjf9yr3
   8nH4o0Ewxi40QC2sEZEyTgB/jJq4yhmgPOsf8TmVsxRREvqzHmNxnbhVY
   eNiNCRXWnSPRyJyVasqS/xSJy8qQdYlneJRaNtPktSnn7Z/zCyMZR//xZ
   2ny2XdYfmBh5Octsxyunu/zrKLXsPQX55YA7UOyVpGu9Eu+8JncUwXA04
   VdKwXOxm0bHit2Wjx9YKoyYNlYPOWbEOLxXRHohrg1ZY72MWcubxiXm44
   w==;
X-CSE-ConnectionGUID: pacsuBB8RwaUaHcfOXFxwg==
X-CSE-MsgGUID: Ah6Vo/QLTHu/8lprKedMjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75412288"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="75412288"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 11:57:18 -0700
X-CSE-ConnectionGUID: LFA+eysyQEmTdcfjt/11Yg==
X-CSE-MsgGUID: oM0SIvIRRPyxK4i3BCsM/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="222899462"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 22 Mar 2026 11:57:15 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4NrS-000000002Wp-1dDY;
	Sun, 22 Mar 2026 18:49:34 +0000
Date: Mon, 23 Mar 2026 02:47:35 +0800
From: kernel test robot <lkp@intel.com>
To: Bera =?iso-8859-1?B?Wfx6bPw=?= <b9788213@gmail.com>,
	gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, Yeking@red54.com,
	andriy.shevchenko@linux.intel.com, ethantidmore06@gmail.com,
	hansg@kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, rayfraytech@gmail.com,
	straube.linux@gmail.com,
	Bera =?iso-8859-1?B?Wfx6bPw=?= <b9788213@gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: remove reduntant functions
Message-ID: <202603230240.3WRmMrTj-lkp@intel.com>
References: <20260321104001.46968-2-b9788213@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321104001.46968-2-b9788213@gmail.com>

Hi Bera,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Bera-Y-zl/staging-rtl8723bs-remove-reduntant-functions/20260322-055430
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260321104001.46968-2-b9788213%40gmail.com
patch subject: [PATCH v2] staging: rtl8723bs: remove reduntant functions
config: i386-randconfig-051-20260322 (https://download.01.org/0day-ci/archive/20260323/202603230240.3WRmMrTj-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603230240.3WRmMrTj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603230240.3WRmMrTj-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "ODM_ReadAndConfig_MP_8723B_TXPWR_LMT" [drivers/staging/rtl8723bs/r8723bs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
