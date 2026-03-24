Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F3D3E1CF7;
	Tue, 24 Mar 2026 10:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774347767; cv=none; b=Y1DJ1N48+VlnCGTlel1CujJHQpZz1PWCH/+6wV/Sia40fQJJzEwtogDh0rhGKODp7wMQ2fFbbYX7BbQ0iMLha7T3rnoT+ojOIcMmY42mKpP64f80oNAbRzYs+jAne7VTFIJPumdkkg3tELxU3j7XZAEu/qpUVKezs13qqcXxA4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774347767; c=relaxed/simple;
	bh=Lt5xns3Ru5wSC7Jim0l9HFiD5OReMNf49dgQKSPgP/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bl7AzuozA8w2DENQJgrvXKKYLffifisMDEvePmdFCDD6O02nDgaYw2bHrY93cjzZ2OYgFMC9zZ+h7uyFng9l9rwtPTfxyqaFW+Fyy7Bvzvo2F+j5vsvK4090uTFkCaAPN3QTDC28QbOn01SidmKuE5pdILxzA+dLKpTfwl05y3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qy5GiMI3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qy5GiMI3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774347763; x=1805883763;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lt5xns3Ru5wSC7Jim0l9HFiD5OReMNf49dgQKSPgP/E=;
  b=Qy5GiMI3ppdJftcgBR9//f4noXiZ3Kk8B6sjIexmPzcK4QiqOQaa07W+
   xoNDaMbdmhrVKqck4PW03sfPZRieAfHVs7qbivBfs5Cm0dxlteZPxszD/
   eRHnGcdOFOrVl7oUyoEwEi5jdGLqdO2fs2sSu5allFi0CGiri9Gfsu0jz
   J5Th9PwTD2sKKBl1ANe0XM3PQ4Gq8OSBKtVrOLXuCL/p1LRWxrUWSJ78N
   /qkILWmFcDrkVR6W1yxuJqvT2x5+xX23K1BCSRu6PRH+3FbA65lRYWR9T
   k+kVhmnLukaz0gbrJR3Cn6/e7Q2oIDS5OQCi6xCfAiuK6hABkg7wBWLIQ
   w==;
X-CSE-ConnectionGUID: Im8sWF4cT3CnKmkSCeHurw==
X-CSE-MsgGUID: UfXr4UEHTR2nMwh2gAnplw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86433319"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86433319"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 03:22:42 -0700
X-CSE-ConnectionGUID: z/ezzN7wRte4jTYxiljZZA==
X-CSE-MsgGUID: cJqH1TOuTQColgej50XYlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="229058472"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 03:22:39 -0700
Date: Tue, 24 Mar 2026 12:22:37 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Bera =?iso-8859-1?B?Wfx6bPw=?= <b9788213@gmail.com>,
	gregkh@linuxfoundation.org, oe-kbuild-all@lists.linux.dev,
	Yeking@red54.com, ethantidmore06@gmail.com, hansg@kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	rayfraytech@gmail.com, straube.linux@gmail.com
Subject: Re: [PATCH v2] staging: rtl8723bs: remove reduntant functions
Message-ID: <acJl7bdk_KXm7TpR@ashevche-desk.local>
References: <20260321104001.46968-2-b9788213@gmail.com>
 <202603230240.3WRmMrTj-lkp@intel.com>
 <acD4ojjTnoBRbUpa@ashevche-desk.local>
 <20260323230000.GA2585066@ax162>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323230000.GA2585066@ax162>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Mar 23, 2026 at 04:00:00PM -0700, Nathan Chancellor wrote:
> On Mon, Mar 23, 2026 at 10:24:02AM +0200, Andy Shevchenko wrote:
> > On Mon, Mar 23, 2026 at 02:47:35AM +0800, kernel test robot wrote:
> > > Hi Bera,
> > > 
> > > kernel test robot noticed the following build errors:
> > 
> > I can't reproduce this with clang 19:
> > $ clang --version
> > Debian clang version 19.1.7 (3+b1)
> > Target: x86_64-pc-linux-gnu
> > Thread model: posix
> > InstalledDir: /usr/lib/llvm-19/bin
> > 
> > Bug in Clang? Or something happened to LKP?
> 
> This is reproducible with GCC 15.2.0 for me:
> 
>   $ curl -LSso .config https://download.01.org/0day-ci/archive/20260323/202603230240.3WRmMrTj-lkp@intel.com/config
> 
>   $ make -skj"$(nproc)" ARCH=i386 CROSS_COMPILE=i386-linux- olddefconfig all
>   ERROR: modpost: "ODM_ReadAndConfig_MP_8723B_TXPWR_LMT" [drivers/staging/rtl8723bs/r8723bs.ko] undefined!
>   make[4]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
> 
> > +Cc: Nathan et alii.
> > 
> > Also, looking at the code I don't see how it's possible (yes, there is a
> > dangling declaration which has to be removed, but shouldn't it be rather a
> > compiler warning something near to declared-but-not-used?).
> 
> ODM_ReadAndConfig_MP_8723B_TXPWR_LMT() is used through READ_AND_CONFIG()
> in drivers/staging/rtl8723bs/hal/odm_HWConfig.c:

Ah, It seems the question is the architecture, I used x86_64. Thanks for
pointing out this. So the patch in the current state is no go.

>   $ rg READ_AND_CONFIG drivers/staging/rtl8723bs/hal/odm_HWConfig.c
>   10:#define READ_AND_CONFIG_MP(ic, txt) (ODM_ReadAndConfig_MP_##ic##txt(pDM_Odm))
>   11:#define READ_AND_CONFIG     READ_AND_CONFIG_MP
>   418:            READ_AND_CONFIG(8723B, _RadioA);
>   420:            READ_AND_CONFIG(8723B, _TXPWR_LMT);
>   428:            READ_AND_CONFIG(8723B, _TxPowerTrack_SDIO);
>   438:            READ_AND_CONFIG(8723B, _PHY_REG);
>   440:            READ_AND_CONFIG(8723B, _AGC_TAB);
>   442:            READ_AND_CONFIG(8723B, _PHY_REG_PG);
> 
> > Bera, you need to remove the definition from
> > drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.h.
> > 
> > > [auto build test ERROR on staging/staging-testing]
> > > 
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Bera-Y-zl/staging-rtl8723bs-remove-reduntant-functions/20260322-055430
> > > base:   staging/staging-testing
> > > patch link:    https://lore.kernel.org/r/20260321104001.46968-2-b9788213%40gmail.com
> > > patch subject: [PATCH v2] staging: rtl8723bs: remove reduntant functions
> > > config: i386-randconfig-051-20260322 (https://download.01.org/0day-ci/archive/20260323/202603230240.3WRmMrTj-lkp@intel.com/config)
> > > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603230240.3WRmMrTj-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202603230240.3WRmMrTj-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > > 
> > > >> ERROR: modpost: "ODM_ReadAndConfig_MP_8723B_TXPWR_LMT" [drivers/staging/rtl8723bs/r8723bs.ko] undefined!

-- 
With Best Regards,
Andy Shevchenko


