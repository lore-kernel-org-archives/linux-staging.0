Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45804352036;
	Sat, 13 Jun 2026 03:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781320999; cv=none; b=TnuFDD+Bss77wH+6hrbHGEx0/5A9mHn8j+RoHeiDcsyeeqtxxQ5ItAdKyjClv/xriryakEGHYo+F046jywJ0QZLkLYgcmoA82Tymu7PmS5d1yUM3JHDnoBm9KLKIL6WtCMqt03DwoJ+Pk/3gSMYecjjTaZq73H8jnGIhYMRxV8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781320999; c=relaxed/simple;
	bh=VIeCqJULNXjQC0PwezokR1+7ONIXNJgl/fmXqrs+RTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c3bzAX9fezzSNK1ezqrIYaLvxIdKrU3hwm7eAa/eXN/PlikGKHlyKxA3aTi0UWsMzbRFbc/AKXcpT/sQa/OGNwtQstkHCEq6sLF7cwCekuWUtpx2UUPqFYiKFpoLlRtE/jpV52H8e6HwQ5Hkl4Xp9WYA7lT/EIlJ+rn7chLtWiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OdGLYqee; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OdGLYqee"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781320998; x=1812856998;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VIeCqJULNXjQC0PwezokR1+7ONIXNJgl/fmXqrs+RTg=;
  b=OdGLYqeeAyElMXG68iqpRP6zRXXntlBan1XCUyKD2uHdoOpc6IsqfRHE
   JDL8dNscRvdhtlaUDHUJXr4V9iFqfzKfITCsU+67EGcMynAdavK3ZkF1x
   /zUppQGqklt0wNn+e8zc5Vpc5gfCDSd15XCDNfuzF3hMV5cV4Q61fpReE
   DfpA15U5qUYxZW2bl5Op2fFecxeUx/wiHwXAARvvUQ/Koeb35Pk66cDgp
   m+wVlJBlwiWEHXcMl4G8OAUNuxV9aUoUASnq0cn0tNsEAft9+p2LNBHeW
   ETpZ2t59gfcpYFqDJ0kKEFgkoZwm+c4ffSg0Uakix5EtM2VrQiev2Zvx5
   g==;
X-CSE-ConnectionGUID: bUu/bINDS8mrSr6Sw5s/TQ==
X-CSE-MsgGUID: 8tNmTSYvRVaeEhXj1pBbBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="85786899"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="85786899"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 20:23:18 -0700
X-CSE-ConnectionGUID: xoJYbXBNRFKJWFaWBnxHOA==
X-CSE-MsgGUID: mjsf5w3CQ2mWiOM7nR7lGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="270651185"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 12 Jun 2026 20:23:16 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYExm-000000004Pt-07dF;
	Sat, 13 Jun 2026 03:23:14 +0000
Date: Sat, 13 Jun 2026 05:22:18 +0200
From: kernel test robot <lkp@intel.com>
To: Gabriel Ramos Barbosa Mota <maguraa53@gmail.com>,
	gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Gabriel Ramos Barbosa Mota <maguraa53@gmail.com>
Subject: Re: [PATCH] staging: vme_user: remove obsolete VMEbus driver
Message-ID: <202606130547.TsvyPMvB-lkp@intel.com>
References: <20260612193729.579790-1-maguraa53@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612193729.579790-1-maguraa53@gmail.com>

Hi Gabriel,

kernel test robot noticed the following build errors:

[auto build test ERROR on char-misc/char-misc-testing]
[also build test ERROR on char-misc/char-misc-next char-misc/char-misc-linus staging/staging-linus linus/master v7.1-rc7]
[cannot apply to staging/staging-testing staging/staging-next next-20260612]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gabriel-Ramos-Barbosa-Mota/staging-vme_user-remove-obsolete-VMEbus-driver/20260613-034236
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20260612193729.579790-1-maguraa53%40gmail.com
patch subject: [PATCH] staging: vme_user: remove obsolete VMEbus driver
config: x86_64-rhel-9.4-rust (attached as .config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606130547.TsvyPMvB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606130547.TsvyPMvB-lkp@intel.com/

All errors (new ones prefixed by >>):

   WARN /zdci/src/lkp/lib/log.sh:131:in `log_warn': /opt/cross/rustc-1.96.0-bindgen-0.72.1 doesn't exist
     from /zdci/src/kernel-tests/lib/debug.sh:164: kbuild_log_warn
     from /zdci/src/kernel-tests/lib/kbuild.sh:3371: export_rust_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3361: export_compiler_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3840: invoke_make
     from /zdci/src/kernel-tests/lib/kbuild.sh:4022: make
     from /zdci/src/kernel-tests/lib/kbuild.sh:5519: make_config_allyes
     from /zdci/src/kernel-tests/common.sh:202: redirect_error_to_screen
     from /zdci/src/kernel-tests/common.sh:210: redirect_command_errors
     from /zdci/src/kernel-tests/lib/kbuild.sh:5526: make_config
     from /zdci/src/kernel-tests/lib/kbuild.sh:6385: compile_one_config
     from /zdci/src/kernel-tests/lib/builder/base.sh:88: builder_compile
     from /zdci/src/kernel-tests/bisect-test-build-error.sh:102: main
>> drivers/staging/Kconfig:49: can't open file "drivers/staging/vme_user/Kconfig"
   make[3]: *** [scripts/kconfig/Makefile:85: oldconfig] Error 1
   make[2]: *** [Makefile:757: oldconfig] Error 2
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'oldconfig' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
   WARN /zdci/src/lkp/lib/log.sh:131:in `log_warn': /opt/cross/rustc-1.96.0-bindgen-0.72.1 doesn't exist
     from /zdci/src/kernel-tests/lib/debug.sh:164: kbuild_log_warn
     from /zdci/src/kernel-tests/lib/kbuild.sh:3371: export_rust_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3361: export_compiler_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3840: invoke_make
     from /zdci/src/kernel-tests/lib/kbuild.sh:4022: make
     from /zdci/src/kernel-tests/lib/kbuild.sh:5519: make_config_allyes
     from /zdci/src/kernel-tests/common.sh:202: redirect_error_to_screen
     from /zdci/src/kernel-tests/common.sh:210: redirect_command_errors
     from /zdci/src/kernel-tests/lib/kbuild.sh:5526: make_config
     from /zdci/src/kernel-tests/lib/kbuild.sh:6381: compile_one_config
     from /zdci/src/kernel-tests/lib/builder/base.sh:88: builder_compile
     from /zdci/src/kernel-tests/bisect-test-build-error.sh:102: main
>> drivers/staging/Kconfig:49: can't open file "drivers/staging/vme_user/Kconfig"
   make[3]: *** [scripts/kconfig/Makefile:85: olddefconfig] Error 1
   make[2]: *** [Makefile:757: olddefconfig] Error 2
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'olddefconfig' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.


vim +49 drivers/staging/Kconfig

4a965c5f89decd Jacob Feder          2018-07-22  48  
e36c9c00188458 Bruno Moreira-Guedes 2022-04-21 @49  source "drivers/staging/vme_user/Kconfig"
adebf457179f18 Bruno Moreira-Guedes 2022-04-21  50  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
