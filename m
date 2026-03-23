Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99C6372B53;
	Mon, 23 Mar 2026 23:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774306806; cv=none; b=fNDVR6PO+SQg9/hSy/SSxD2CBpsA54rEvriJKmqL9XR3O1qMerdtEpmKSuscCLoRW6Kbu6XcnH3Bn+s96Kb8P3LPhFqHHeDoNK0utJepoHQJVRoSWsQvJxu7+fMkjLcHKel+36fgDlbCApl1Yv03M/F31+PDGBCxMN4enjdmWCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774306806; c=relaxed/simple;
	bh=yjw+TiNpqD1VfNeyGmRFivTYYT/3Wszr7TD9QVBIE0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FEk3B3Lyl/36EalzcaZgEViqyR1ig22CAV2C/DnFdAsDX7/HcHvK/qmPKIq0QMue8AvSFGrx71lr2FIPDkfs7Cb/exmWJvpEWusj3nciJ98nHZRRLXkh1UocziUPW+8Ij6LnFgDFeYheP+lQ+++yytJegrDpIrch9ts4oqqbJBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dneRFrsR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dneRFrsR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78087C4CEF7;
	Mon, 23 Mar 2026 23:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774306806;
	bh=yjw+TiNpqD1VfNeyGmRFivTYYT/3Wszr7TD9QVBIE0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dneRFrsReDtZ+oCcjhi6PJinnu3Kp8XC0zSxcJiSXo5YrPOY+BGndBJb+h5SMaeGw
	 9V6hq4VFHOXXCmQ8Nod6JWz1d17Zp+rsIzcY6g+4EiBrfqthFx0VXnMaBY+IAZhTZ9
	 lnKnTOnyONUKyJRktyUSi8puI1sd0KzdAIZ00E2spAwtqPnBKXgqOkiSrMmucQTBRr
	 I6UU/7qk+z9CZm7lkwWKFjx1SSVDtpaX7PExclJlK2wo/25/GbXwgYqbexWeZ0fT5Y
	 C5tFkN0z6XrwnTlmS4YLlLRLQG+h56w0CxA0dSRrUbFT6MNUEZrxFvVyOvaSOIlCla
	 cM2Ev7KSmPA0Q==
Date: Mon, 23 Mar 2026 16:00:00 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Message-ID: <20260323230000.GA2585066@ax162>
References: <20260321104001.46968-2-b9788213@gmail.com>
 <202603230240.3WRmMrTj-lkp@intel.com>
 <acD4ojjTnoBRbUpa@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acD4ojjTnoBRbUpa@ashevche-desk.local>

On Mon, Mar 23, 2026 at 10:24:02AM +0200, Andy Shevchenko wrote:
> On Mon, Mar 23, 2026 at 02:47:35AM +0800, kernel test robot wrote:
> > Hi Bera,
> > 
> > kernel test robot noticed the following build errors:
> 
> I can't reproduce this with clang 19:
> $ clang --version
> Debian clang version 19.1.7 (3+b1)
> Target: x86_64-pc-linux-gnu
> Thread model: posix
> InstalledDir: /usr/lib/llvm-19/bin
> 
> Bug in Clang? Or something happened to LKP?

This is reproducible with GCC 15.2.0 for me:

  $ curl -LSso .config https://download.01.org/0day-ci/archive/20260323/202603230240.3WRmMrTj-lkp@intel.com/config

  $ make -skj"$(nproc)" ARCH=i386 CROSS_COMPILE=i386-linux- olddefconfig all
  ERROR: modpost: "ODM_ReadAndConfig_MP_8723B_TXPWR_LMT" [drivers/staging/rtl8723bs/r8723bs.ko] undefined!
  make[4]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1

> +Cc: Nathan et alii.
> 
> Also, looking at the code I don't see how it's possible (yes, there is a
> dangling declaration which has to be removed, but shouldn't it be rather a
> compiler warning something near to declared-but-not-used?).

ODM_ReadAndConfig_MP_8723B_TXPWR_LMT() is used through READ_AND_CONFIG()
in drivers/staging/rtl8723bs/hal/odm_HWConfig.c:

  $ rg READ_AND_CONFIG drivers/staging/rtl8723bs/hal/odm_HWConfig.c
  10:#define READ_AND_CONFIG_MP(ic, txt) (ODM_ReadAndConfig_MP_##ic##txt(pDM_Odm))
  11:#define READ_AND_CONFIG     READ_AND_CONFIG_MP
  418:            READ_AND_CONFIG(8723B, _RadioA);
  420:            READ_AND_CONFIG(8723B, _TXPWR_LMT);
  428:            READ_AND_CONFIG(8723B, _TxPowerTrack_SDIO);
  438:            READ_AND_CONFIG(8723B, _PHY_REG);
  440:            READ_AND_CONFIG(8723B, _AGC_TAB);
  442:            READ_AND_CONFIG(8723B, _PHY_REG_PG);

> Bera, you need to remove the definition from
> drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.h.
> 
> > [auto build test ERROR on staging/staging-testing]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Bera-Y-zl/staging-rtl8723bs-remove-reduntant-functions/20260322-055430
> > base:   staging/staging-testing
> > patch link:    https://lore.kernel.org/r/20260321104001.46968-2-b9788213%40gmail.com
> > patch subject: [PATCH v2] staging: rtl8723bs: remove reduntant functions
> > config: i386-randconfig-051-20260322 (https://download.01.org/0day-ci/archive/20260323/202603230240.3WRmMrTj-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603230240.3WRmMrTj-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202603230240.3WRmMrTj-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > 
> > >> ERROR: modpost: "ODM_ReadAndConfig_MP_8723B_TXPWR_LMT" [drivers/staging/rtl8723bs/r8723bs.ko] undefined!
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
