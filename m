Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05FA1552FC;
	Sun, 22 Dec 2024 07:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734851199; cv=none; b=OcHNSlQgxGzP4w7xBc6isd2+19VO7yR6bILGeeFlpkGzqmNlhOq2O+ch478DTJL2Ok5j+oA7/wHemQAuBPOA8+TFxP+NTIBfZWqay/l1EglvV4JSrkg2mDFHbd0NsqBb2wm6wlmr5ljmLxkOz3o+0yMvrxH5aosiLcMnN9fld2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734851199; c=relaxed/simple;
	bh=4i1cwzddxMMkWbWAkSKKnngqY6O2DWkwe5H0ohBszOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AP2o6/HxlFPtcKiTvuMLyMW8qHSg1HLpz2nSiBzAy+jZmus58dN0Y6oczI0hl3iI9YZq5K/92M+vxnwpV+c+OCvE/OExZSo+1FenwGG/8N1KQSC2raEtTXx36xqhZsXIyIiz7Igx1FXliK9+vCVfhGcb/PwCAKm20BjMTC4AX8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g7Fibj08; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g7Fibj08"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734851198; x=1766387198;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4i1cwzddxMMkWbWAkSKKnngqY6O2DWkwe5H0ohBszOM=;
  b=g7Fibj086zkHUmDPB7Fee44tdSsZZqoluI7JBglYF1ihj3KetuVC3rAk
   dBsWSe9JKX3hhFs6Ob6r+3E7NkSHv9471RqeyRETVfn+ONse2tUCDnveq
   rLI88rPZMidwM67tmBfj6oKg3h1R+wo/PwtJWqhHToJCD5ucaRBAr/pI+
   gHRc9/UroTdFi0C34zIHRhsTM03qE7qRGUht1T7wEuTK3HAaAPQYJxaps
   NykWyez5ZmfQ1kQEP5kEIBd8asMU1aVzc4nWWHi18pdYxncB+rIsGdx8+
   Pe6b7ewlrAfCcIF973+8yRgzcY2Ozif70y4nYIKjuL9qwhpG7Atmd0TJw
   w==;
X-CSE-ConnectionGUID: DzfY/DIOQzuiDkd+W+bQmg==
X-CSE-MsgGUID: MJMr+5XBQS67/lRKywa+3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="60730266"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="60730266"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 23:06:37 -0800
X-CSE-ConnectionGUID: YbqBnCyaTDC0m22yVVYZ4g==
X-CSE-MsgGUID: 8iSf5lBrSju+bsbJnet1dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="103769251"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Dec 2024 23:06:34 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPG2p-0002mB-2d;
	Sun, 22 Dec 2024 07:06:31 +0000
Date: Sun, 22 Dec 2024 15:06:22 +0800
From: kernel test robot <lkp@intel.com>
To: Nihar Chaithanya <niharchaithanya@gmail.com>, dpenkler@gmail.com,
	gregkh@linuxfoundation.org, roheetchavan@gmail.com, arnd@arndb.de,
	dan.carpenter@linaro.org, kees@ijzerbout.nl,
	m.omerfarukbulut@gmail.com, skhan@linuxfoundation.org,
	everestkc@everestkc.com.np, dominik.karol.piatkowski@protonmail.com,
	nathan@kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] staging: gpib: Add error handling
Message-ID: <202412221424.WIjKFIPf-lkp@intel.com>
References: <20241221214822.163667-1-niharchaithanya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241221214822.163667-1-niharchaithanya@gmail.com>

Hi Nihar,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Nihar-Chaithanya/staging-gpib-Add-error-handling/20241222-060646
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20241221214822.163667-1-niharchaithanya%40gmail.com
patch subject: [PATCH v3] staging: gpib: Add error handling
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241222/202412221424.WIjKFIPf-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221424.WIjKFIPf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412221424.WIjKFIPf-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/gpib/fmh_gpib/fmh_gpib.c: In function 'fmh_gpib_init_module':
>> drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1694:17: error: label 'err_platform_driver' used but not defined
    1694 |                 goto err_platform_driver;
         |                 ^~~~


vim +/err_platform_driver +1694 drivers/staging/gpib/fmh_gpib/fmh_gpib.c

  1687	
  1688	static int __init fmh_gpib_init_module(void)
  1689	{
  1690		int result;
  1691	
  1692		result = platform_driver_register(&fmh_gpib_platform_driver);
  1693		if (result)
> 1694			goto err_platform_driver;
  1695	
  1696		result = pci_register_driver(&fmh_gpib_pci_driver);
  1697		if (result)
  1698			goto err_pci_driver;
  1699	
  1700		result = gpib_register_driver(&fmh_gpib_unaccel_interface, THIS_MODULE);
  1701		if (result)
  1702			goto err_unaccel;
  1703	
  1704		result = gpib_register_driver(&fmh_gpib_interface, THIS_MODULE);
  1705		if (result)
  1706			goto err_interface;
  1707	
  1708		result = gpib_register_driver(&fmh_gpib_pci_unaccel_interface, THIS_MODULE);
  1709		if (result)
  1710			goto err_pci_unaccel;
  1711	
  1712		result = gpib_register_driver(&fmh_gpib_pci_interface, THIS_MODULE);
  1713		if (result)
  1714			goto err_pci;
  1715	
  1716		return 0;
  1717	
  1718	err_pci:
  1719		gpib_unregister_driver(&fmh_gpib_pci_unaccel_interface);
  1720	err_pci_unaccel:
  1721		gpib_unregister_driver(&fmh_gpib_interface);
  1722	err_interface:
  1723		gpib_unregister_driver(&fmh_gpib_unaccel_interface);
  1724	err_unaccel:
  1725		pci_unregister_driver(&fmh_gpib_pci_driver);
  1726	err_pci_driver:
  1727		platform_driver_unregister(&fmh_gpib_platform_driver);
  1728	
  1729		return result;
  1730	}
  1731	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
