Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26942F3C0A;
	Fri, 14 Nov 2025 06:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763102825; cv=none; b=KVs/N64d1FgsWEFjB+91+y5NlPCqdURZZH4TbCmwA4gYMtYVr0RVs8xPaTcAZGjYklgnKS3WFT9wfeI7ALzB4frpfrMzsKoTRYxgpoBYX4Uid+T2X8D4DWCn2wMeUlnk5QF+Q6feUnawVxOm2KfEEhXLDKDmsTu8ul1WhlI0rVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763102825; c=relaxed/simple;
	bh=WvID/mrXFHc3SnDQsz76WhjlxnE2gWiAQy51XZNn5DU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dTZMkdH4DfJKdUoZuJJiGS9f0vyn/6cXdoe4i73H0j3pb9j/fyugF56DLxgozjoRkimvoCQ14VyftSowMxF/C0jCP02E42tjLKmWVZFwvECDMz92WBdcuyLHI3nqjDKnlu7g/z4EeD/abnjlnxIzfbRX4LsNDsysRdFXXp4J7wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DnScZJi3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DnScZJi3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763102822; x=1794638822;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WvID/mrXFHc3SnDQsz76WhjlxnE2gWiAQy51XZNn5DU=;
  b=DnScZJi3Nz3F+EPCthy/oOZHcVFwAkrXdOWJYnbshovLn7cbrbKsYtP0
   /mkkqFDawR4k7jiFuFXtBUMNoGQ4joBYnIh/mJUaFNmw1tKW9OTy3Hr6P
   n/zcbgsAaYKR5R0PanQH9MoSAspnZKT8kJhCvJ+oJiD6LLlcbRDAopMXQ
   cXc4zIWEWa2QRHLa2cGA4m0XzIV5WO++JBk6ZSJBaFYCT/FlyGmOvsFCq
   IfPvHT+Oe+7ynbSvEx7yCXSyAh0XpW9a+BN4Uu3LeQT2j0U+k+QO7vtsz
   t+obaKdSvaw3rqvZTVT03RA2ehEuoV7F+gblUbo4HonTQi5npvxbd4lCu
   w==;
X-CSE-ConnectionGUID: iHunQP/mTtaXCsg6CY18jg==
X-CSE-MsgGUID: QCSFyiDOSWWHXCCFb21EHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65227560"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="65227560"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 22:47:01 -0800
X-CSE-ConnectionGUID: FwEMrvUERXu4G9aXYDZ25Q==
X-CSE-MsgGUID: yaGYoQWZS0uedWVb7dxMsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="193824047"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Nov 2025 22:47:00 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJnaD-0006F1-0B;
	Fri, 14 Nov 2025 06:46:57 +0000
Date: Fri, 14 Nov 2025 14:45:58 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Penkler <dpenkler@gmail.com>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, johan@kernel.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: Re: [PATCH V3 6/6] gpib: Destage gpib
Message-ID: <202511140903.9SwzxDDp-lkp@intel.com>
References: <20251113104543.5875-7-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251113104543.5875-7-dpenkler@gmail.com>

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]
[also build test ERROR on staging/staging-next staging/staging-linus linus/master v6.18-rc5 next-20251113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Penkler/staging-Remove-gpib-build-from-staging/20251113-185632
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20251113104543.5875-7-dpenkler%40gmail.com
patch subject: [PATCH V3 6/6] gpib: Destage gpib
config: s390-randconfig-001-20251114 (https://download.01.org/0day-ci/archive/20251114/202511140903.9SwzxDDp-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511140903.9SwzxDDp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511140903.9SwzxDDp-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpib/eastwood/fluke_gpib.c: In function 'fluke_attach_impl':
>> drivers/gpib/eastwood/fluke_gpib.c:1002:23: error: implicit declaration of function 'ioremap'; did you mean 'iounmap'? [-Werror=implicit-function-declaration]
     nec_priv->mmiobase = ioremap(e_priv->gpib_iomem_res->start,
                          ^~~~~~~
                          iounmap
>> drivers/gpib/eastwood/fluke_gpib.c:1002:21: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     nec_priv->mmiobase = ioremap(e_priv->gpib_iomem_res->start,
                        ^
   drivers/gpib/eastwood/fluke_gpib.c:1036:33: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     e_priv->write_transfer_counter = ioremap(e_priv->write_transfer_counter_res->start,
                                    ^
   cc1: some warnings being treated as errors


vim +1002 drivers/gpib/eastwood/fluke_gpib.c

55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   962  
4800ec89999049 drivers/staging/gpib/eastwood/fluke_gpib.c Michael Rubin 2025-04-08   963  static int fluke_attach_impl(struct gpib_board *board, const struct gpib_board_config *config,
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   964  			     unsigned int handshake_mode)
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   965  {
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   966  	struct fluke_priv *e_priv;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   967  	struct nec7210_priv *nec_priv;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   968  	int isr_flags = 0;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   969  	int retval;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   970  	int irq;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   971  	struct resource *res;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   972  	dma_cap_mask_t dma_cap;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   973  
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   974  	if (!fluke_gpib_pdev) {
f2bda0b660bd37 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2025-02-14   975  		dev_err(board->gpib_dev, "No fluke device was found, attach failed.\n");
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   976  		return -ENODEV;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   977  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   978  
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   979  	retval = fluke_generic_attach(board);
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   980  	if (retval)
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   981  		return retval;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   982  
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   983  	e_priv = board->private_data;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   984  	nec_priv = &e_priv->nec7210_priv;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   985  	nec_priv->offset = fluke_reg_offset;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   986  	board->dev = &fluke_gpib_pdev->dev;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   987  
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   988  	res = platform_get_resource(fluke_gpib_pdev, IORESOURCE_MEM, 0);
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   989  	if (!res) {
f2bda0b660bd37 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2025-02-14   990  		dev_err(&fluke_gpib_pdev->dev, "Unable to locate mmio resource\n");
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   991  		return -ENODEV;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   992  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   993  
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   994  	if (request_mem_region(res->start,
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   995  			       resource_size(res),
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   996  			       fluke_gpib_pdev->name) == NULL) {
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   997  		dev_err(&fluke_gpib_pdev->dev, "cannot claim registers\n");
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   998  		return -ENXIO;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18   999  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1000  	e_priv->gpib_iomem_res = res;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1001  
baf8855c916007 drivers/staging/gpib/eastwood/fluke_gpib.c Arnd Bergmann 2024-12-13 @1002  	nec_priv->mmiobase = ioremap(e_priv->gpib_iomem_res->start,
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1003  				     resource_size(e_priv->gpib_iomem_res));
baf8855c916007 drivers/staging/gpib/eastwood/fluke_gpib.c Arnd Bergmann 2024-12-13  1004  	if (!nec_priv->mmiobase) {
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1005  		dev_err(&fluke_gpib_pdev->dev, "Could not map I/O memory\n");
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1006  		return -ENOMEM;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1007  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1008  
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1009  	res = platform_get_resource(fluke_gpib_pdev, IORESOURCE_MEM, 1);
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1010  	if (!res) {
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1011  		dev_err(&fluke_gpib_pdev->dev, "Unable to locate mmio resource for gpib dma port\n");
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1012  		return -ENODEV;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1013  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1014  	if (request_mem_region(res->start,
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1015  			       resource_size(res),
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1016  			       fluke_gpib_pdev->name) == NULL) {
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1017  		dev_err(&fluke_gpib_pdev->dev, "cannot claim registers\n");
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1018  		return -ENXIO;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1019  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1020  	e_priv->dma_port_res = res;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1021  
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1022  	res = platform_get_resource(fluke_gpib_pdev, IORESOURCE_MEM, 2);
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1023  	if (!res) {
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1024  		dev_err(&fluke_gpib_pdev->dev, "Unable to locate mmio resource for write transfer counter\n");
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1025  		return -ENODEV;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1026  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1027  
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1028  	if (request_mem_region(res->start,
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1029  			       resource_size(res),
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1030  			       fluke_gpib_pdev->name) == NULL) {
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1031  		dev_err(&fluke_gpib_pdev->dev, "cannot claim registers\n");
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1032  		return -ENXIO;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1033  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1034  	e_priv->write_transfer_counter_res = res;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1035  
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1036  	e_priv->write_transfer_counter = ioremap(e_priv->write_transfer_counter_res->start,
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1037  						 resource_size(e_priv->write_transfer_counter_res));
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1038  	if (!e_priv->write_transfer_counter) {
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1039  		dev_err(&fluke_gpib_pdev->dev, "Could not map I/O memory\n");
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1040  		return -ENOMEM;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1041  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1042  
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1043  	irq = platform_get_irq(fluke_gpib_pdev, 0);
51ab134daf5b9b drivers/staging/gpib/eastwood/fluke_gpib.c Chen Ni       2025-04-07  1044  	if (irq < 0)
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1045  		return -EBUSY;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1046  	retval = request_irq(irq, fluke_gpib_interrupt, isr_flags, fluke_gpib_pdev->name, board);
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1047  	if (retval) {
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1048  		dev_err(&fluke_gpib_pdev->dev,
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1049  			"cannot register interrupt handler err=%d\n",
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1050  			retval);
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1051  		return retval;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1052  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1053  	e_priv->irq = irq;
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1054  
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1055  	dma_cap_zero(dma_cap);
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1056  	dma_cap_set(DMA_SLAVE, dma_cap);
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1057  	e_priv->dma_channel = dma_request_channel(dma_cap, gpib_dma_channel_filter, NULL);
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1058  	if (!e_priv->dma_channel) {
f2bda0b660bd37 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2025-02-14  1059  		dev_err(board->gpib_dev, "failed to allocate a dma channel.\n");
073b54f342be3e drivers/staging/gpib/eastwood/fluke_gpib.c Paul Retourné 2025-04-11  1060  		/*
073b54f342be3e drivers/staging/gpib/eastwood/fluke_gpib.c Paul Retourné 2025-04-11  1061  		 * we don't error out here because unaccel interface will still
073b54f342be3e drivers/staging/gpib/eastwood/fluke_gpib.c Paul Retourné 2025-04-11  1062  		 * work without dma
073b54f342be3e drivers/staging/gpib/eastwood/fluke_gpib.c Paul Retourné 2025-04-11  1063  		 */
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1064  	}
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1065  
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1066  	return fluke_init(e_priv, board, handshake_mode);
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1067  }
55936779f49612 drivers/staging/gpib/eastwood/fluke_gpib.c Dave Penkler  2024-09-18  1068  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
