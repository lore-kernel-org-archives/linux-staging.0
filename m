Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AE32F39CB;
	Fri, 14 Nov 2025 06:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763102824; cv=none; b=d4C0kcvidmLyA4uxNWOS90XL0Y9+WoYyIXQ44t/KlXhpIv9olys2zOXB0X3Upno+EYLtSlZJ9eyVN8tkMRHF+AD0E5jqrNfatmisHi9B0cG/yQzuX6nfF70cQ9ec2XIi7KkeKy26DMG/5FUWnasFW1/Ma0MGFZmZOe7jFALTMKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763102824; c=relaxed/simple;
	bh=nhNsDUBajFij1ewJsdsI7rLGlim1SzcIBjZT/q+THTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gflMdWX/22Bl646HjPl84PEeQqdOthxSvD5SIhIgu4AswoubJsJT22dEg0kRvn+orRhWFP/EgTbGU+MywCGWyIvfNsWJwv4xFimFJcn21TmzPK0OTtq7/5lcrHHwwYqXwZsIvjTe3aS9A4kbDFqRPnH9aZODhplsbnBHPiYlXKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kottX5MT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kottX5MT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763102822; x=1794638822;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nhNsDUBajFij1ewJsdsI7rLGlim1SzcIBjZT/q+THTM=;
  b=kottX5MTfAHLRhuk1tmk18cOof+oxsDIoJuYx0HbybkqQTjkbzT0jKZ8
   T/Bk1WRL0cjoR0OQ20rrNdeKKEZBZlTknDbK1/FBDe0gpNli0yuCmegmK
   wMeqJeWhCHBD/S8eb4ZYgC7uItowvPSEhBCl2O0a7utglyfBOQ/tF7113
   xwDYH2svZeCPFgq6bZW6s5hEOPSF7TrdOGvjPXtNuZL/GK3j9wSeJYZVF
   WueHmzkgJ7yudagmsEZ9VPVd94Py9gFhXg2P8u7Sqy+Vn6ynXPdO4RMEI
   uvMc7ki9USAlnTpR4XnK5lAKO+BCIounCKuXRFp28uFKTMCUpHLVpqi6j
   Q==;
X-CSE-ConnectionGUID: 57Pacj7rSx6fa/qm5GT0tw==
X-CSE-MsgGUID: Q/I1ZpfdQZqISau15G1uxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65227551"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="65227551"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 22:47:01 -0800
X-CSE-ConnectionGUID: UKKfYKbxQnaR7DbQ8q/Wkw==
X-CSE-MsgGUID: FTefAIOcQQiZkxAkw52GMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="193824048"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Nov 2025 22:47:00 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJnaD-0006F3-0H;
	Fri, 14 Nov 2025 06:46:57 +0000
Date: Fri, 14 Nov 2025 14:46:03 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Penkler <dpenkler@gmail.com>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, johan@kernel.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: Re: [PATCH V3 6/6] gpib: Destage gpib
Message-ID: <202511141035.1unt5Lt7-lkp@intel.com>
References: <20251113104543.5875-7-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113104543.5875-7-dpenkler@gmail.com>

Hi Dave,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]
[also build test WARNING on staging/staging-next staging/staging-linus linus/master v6.18-rc5 next-20251113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Penkler/staging-Remove-gpib-build-from-staging/20251113-185632
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20251113104543.5875-7-dpenkler%40gmail.com
patch subject: [PATCH V3 6/6] gpib: Destage gpib
config: nios2-allyesconfig (https://download.01.org/0day-ci/archive/20251114/202511141035.1unt5Lt7-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511141035.1unt5Lt7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511141035.1unt5Lt7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpib/common/iblib.c:165:12: warning: 'autospoll_thread' defined but not used [-Wunused-function]
     165 | static int autospoll_thread(void *board_void)
         |            ^~~~~~~~~~~~~~~~


vim +/autospoll_thread +165 drivers/gpib/common/iblib.c

9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  164  
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18 @165  static int autospoll_thread(void *board_void)
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  166  {
840459da1574db drivers/staging/gpib/common/iblib.c Michael Rubin 2025-03-19  167  	struct gpib_board *board = board_void;
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  168  	int retval = 0;
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  169  
a836d4ec8f83bb drivers/staging/gpib/common/iblib.c Dave Penkler  2024-11-04  170  	dev_dbg(board->gpib_dev, "entering autospoll thread\n");
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  171  
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  172  	while (1) {
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  173  		wait_event_interruptible(board->wait,
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  174  					 kthread_should_stop() ||
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  175  					 autospoll_wait_should_wake_up(board));
a836d4ec8f83bb drivers/staging/gpib/common/iblib.c Dave Penkler  2024-11-04  176  		dev_dbg(board->gpib_dev, "autospoll wait satisfied\n");
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  177  		if (kthread_should_stop())
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  178  			break;
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  179  
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  180  		mutex_lock(&board->big_gpib_mutex);
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  181  		/* make sure we are still good after we have lock */
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  182  		if (board->autospollers <= 0 || board->master == 0) {
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  183  			mutex_unlock(&board->big_gpib_mutex);
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  184  			continue;
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  185  		}
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  186  		mutex_unlock(&board->big_gpib_mutex);
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  187  
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  188  		if (try_module_get(board->provider_module)) {
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  189  			retval = autopoll_all_devices(board);
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  190  			module_put(board->provider_module);
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  191  		} else {
141765729ea7c8 drivers/staging/gpib/common/iblib.c Dave Penkler  2025-02-14  192  			dev_err(board->gpib_dev, "try_module_get() failed!\n");
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  193  		}
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  194  		if (retval <= 0) {
141765729ea7c8 drivers/staging/gpib/common/iblib.c Dave Penkler  2025-02-14  195  			dev_err(board->gpib_dev, "stuck SRQ\n");
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  196  
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  197  			atomic_set(&board->stuck_srq, 1);	// XXX could be better
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  198  			set_bit(SRQI_NUM, &board->status);
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  199  		}
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  200  	}
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  201  	return retval;
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  202  }
9dde4559e93955 drivers/staging/gpib/common/iblib.c Dave Penkler  2024-09-18  203  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
