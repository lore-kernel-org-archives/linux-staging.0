Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F18D1E9B35;
	Mon, 23 Mar 2026 08:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774254250; cv=none; b=DdOwy+YIaattb7zYCknSgiTuOmb1O8Yyl7aC+x8i5zMrqk2F9BtACbGjU3mVpOs0A2L6hL8OdWXxyepUTeTerfEv44Um2QAHa13dqF0RZFUEaGwq7NCD2IP4gcPa/bQOtBc+H6zZhe4udwp6JGJdDOF9G1sTzp8HW/nFa2T78s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774254250; c=relaxed/simple;
	bh=4QNl5k7rOGV7aHFaLliev2eWiiuQ0yNGt8IqcglZeTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YnWvrtb7lBWXay7I9gvFwCjCRUqTpBLRZL/Ny3k1L7jxn5uEMzspaWO/Mh39RII0IZhSCS4QWStMOxdRJa2PTEciHohsWCF2py5K2zCejr2DGuxWYIWn57LO3UhoLdFTz4ct+fAVyjcIRbB+6IJ4CsyTTXZCriI+Mwz8mX+zkaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H9lNvv25; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H9lNvv25"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774254249; x=1805790249;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4QNl5k7rOGV7aHFaLliev2eWiiuQ0yNGt8IqcglZeTk=;
  b=H9lNvv250H8RoKL+2qGTIgbYbmKntnJP6gN0xpwV/9EQGh0t/TzPOZx9
   wkBc1fpK7nJ5gOc4KfURTeWlFdn5jRUetU68P3H9gi4RN0tGoz61BNjAE
   SjTJ4J4A2E9Jm+bfWn8E6eJfMYVZy6n4CKtYLxYbKsLYDo5ama5ZsBJF2
   WroTXijoyU0f5j2jcs6D6RCj6q6fAJaMRqHfVH/4pYPxoZ8mTJBLh2hcQ
   izDcSNE0KFlmiTrfoAXgrM0YrHi/5VMM4NqLZ4mgcs7W0sbnJfwkq35jX
   hMCJGd3lMlQRG5vFVImy8P+35SwjD7g8TW5WyeCqlQyENqibvGDw+Rk+q
   Q==;
X-CSE-ConnectionGUID: lQlZomRARGKwPkKZVMnr4w==
X-CSE-MsgGUID: 3IxMgmx/SJmrALbm8ww9kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75152685"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="75152685"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 01:24:08 -0700
X-CSE-ConnectionGUID: TeVOrQisTuG8jvm8MuTbiw==
X-CSE-MsgGUID: bDrH2HSKQoqLGEdMfbbfiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="223157106"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 01:24:05 -0700
Date: Mon, 23 Mar 2026 10:24:02 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: Bera =?iso-8859-1?B?Wfx6bPw=?= <b9788213@gmail.com>,
	gregkh@linuxfoundation.org, oe-kbuild-all@lists.linux.dev,
	Yeking@red54.com, ethantidmore06@gmail.com, hansg@kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	rayfraytech@gmail.com, straube.linux@gmail.com
Subject: Re: [PATCH v2] staging: rtl8723bs: remove reduntant functions
Message-ID: <acD4ojjTnoBRbUpa@ashevche-desk.local>
References: <20260321104001.46968-2-b9788213@gmail.com>
 <202603230240.3WRmMrTj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202603230240.3WRmMrTj-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Mar 23, 2026 at 02:47:35AM +0800, kernel test robot wrote:
> Hi Bera,
> 
> kernel test robot noticed the following build errors:

I can't reproduce this with clang 19:
$ clang --version
Debian clang version 19.1.7 (3+b1)
Target: x86_64-pc-linux-gnu
Thread model: posix
InstalledDir: /usr/lib/llvm-19/bin

Bug in Clang? Or something happened to LKP?

+Cc: Nathan et alii.

Also, looking at the code I don't see how it's possible (yes, there is a
dangling declaration which has to be removed, but shouldn't it be rather a
compiler warning something near to declared-but-not-used?).

Bera, you need to remove the definition from
drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.h.

> [auto build test ERROR on staging/staging-testing]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Bera-Y-zl/staging-rtl8723bs-remove-reduntant-functions/20260322-055430
> base:   staging/staging-testing
> patch link:    https://lore.kernel.org/r/20260321104001.46968-2-b9788213%40gmail.com
> patch subject: [PATCH v2] staging: rtl8723bs: remove reduntant functions
> config: i386-randconfig-051-20260322 (https://download.01.org/0day-ci/archive/20260323/202603230240.3WRmMrTj-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603230240.3WRmMrTj-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603230240.3WRmMrTj-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> ERROR: modpost: "ODM_ReadAndConfig_MP_8723B_TXPWR_LMT" [drivers/staging/rtl8723bs/r8723bs.ko] undefined!

-- 
With Best Regards,
Andy Shevchenko


