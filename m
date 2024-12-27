Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F281E4A1D;
	Fri, 27 Dec 2024 02:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735267924; cv=none; b=FohvBZyn6+/DChLM1GJ/u34dYBPPq6smr2F4rPnyaYjoPg1S1/eEIVY3WZXnX8Iq21yUhIU5R4cdIxD4kzbJKX+B/ZJaJ7IfJoNx7bCKy7lxpwyTyAyopykrW+8rhTj0msQ8JOxQWZegMyFWJAvy6nSczAEBcdKg26gcbXHrgm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735267924; c=relaxed/simple;
	bh=j1WCWRzUu60a4hzc4uZ+thlTJCu3j0/eUzmkt5rhJwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rkBZCw3Ei3O27+flpkB+i+VyId5Clfap1CYeyfy83rVFbFUujIoQgrz2gbH8+rcmMCwt0ikoq1Kjb05zq/5dgXIXweIT/IHpokDieVS4CgSLSsnp/BU6kJfK79Sg9QcJOohbttripkSTHaJ7WnrRgc3kwqZnFB4kcuN8Owg61yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LNbpbpUw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LNbpbpUw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735267921; x=1766803921;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j1WCWRzUu60a4hzc4uZ+thlTJCu3j0/eUzmkt5rhJwI=;
  b=LNbpbpUwtuczBQwHnii13ikCr72gWSFm5Qo+iePLNN6LymmjCFpTUavE
   hzwW+rGmcxzfBS31NRctN3eOxsRB3Vc1DlckSRu1AcFRkZPxkafoa1m57
   5Hj+Ok8RvXE4xDWQD+OS7EuWzn0bb8EX0OUolEQsu4s8SRMBexnLBBO1+
   /LObCJkoWKvbJ5/UfyIl8riliUp1Yr3dkmuY+o/Ftmf42bha47SosaOnL
   W8KHabdQPaU04bWFnkaoDPKfZ7N82QgSJ1Uum41QuDiMH0SEBNlXr3pCh
   wnB/f+9MtNdMiK/8UXgVXJaPAMnAdvgw9yhPDs1jzYtKyOPgZdXvL3ceC
   A==;
X-CSE-ConnectionGUID: c3+UUydZTdOiOyW4vvHciQ==
X-CSE-MsgGUID: m+OfjDpWSwWOkVNdOXZD7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="34988301"
X-IronPort-AV: E=Sophos;i="6.12,268,1728975600"; 
   d="scan'208";a="34988301"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 18:52:00 -0800
X-CSE-ConnectionGUID: GNT3ef1TRFKuudmD2cGTyw==
X-CSE-MsgGUID: KHSuq87/TM2bBDkuQbTuTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105063403"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Dec 2024 18:51:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tR0SB-0002ve-39;
	Fri, 27 Dec 2024 02:51:55 +0000
Date: Fri, 27 Dec 2024 10:51:53 +0800
From: kernel test robot <lkp@intel.com>
To: Nihar Chaithanya <niharchaithanya@gmail.com>, dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, dan.carpenter@linaro.org,
	skhan@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: Re: [PATCH v4 07/15] staging: gpib: fmh: Handle
 gpib_register_driver() errors
Message-ID: <202412271054.Oy0QXjPZ-lkp@intel.com>
References: <20241226193637.241049-8-niharchaithanya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226193637.241049-8-niharchaithanya@gmail.com>

Hi Nihar,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Nihar-Chaithanya/staging-gpib-Modify-gpib_register_driver-to-return-error-if-it-fails/20241227-035743
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20241226193637.241049-8-niharchaithanya%40gmail.com
patch subject: [PATCH v4 07/15] staging: gpib: fmh: Handle gpib_register_driver() errors
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241227/202412271054.Oy0QXjPZ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241227/202412271054.Oy0QXjPZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412271054.Oy0QXjPZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_t1_delay':
   fmh_gpib.c:(.text+0x512): undefined reference to `nec7210_t1_delay'
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_serial_poll_status':
   fmh_gpib.c:(.text+0x606): undefined reference to `nec7210_serial_poll_status'
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_secondary_address':
   fmh_gpib.c:(.text+0xa56): undefined reference to `nec7210_secondary_address'
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_primary_address':
   fmh_gpib.c:(.text+0xb0e): undefined reference to `nec7210_primary_address'
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_update_status':
   fmh_gpib.c:(.text+0xb8e): undefined reference to `nec7210_update_status'
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_parallel_poll_response':
   fmh_gpib.c:(.text+0xc0e): undefined reference to `nec7210_parallel_poll_response'
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_parallel_poll':
   fmh_gpib.c:(.text+0xc8e): undefined reference to `nec7210_parallel_poll'
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_parallel_poll_configure':
   fmh_gpib.c:(.text+0xd0e): undefined reference to `nec7210_parallel_poll_configure'
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_disable_eos':
   fmh_gpib.c:(.text+0xd86): undefined reference to `nec7210_disable_eos'
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_enable_eos':
   fmh_gpib.c:(.text+0xe16): undefined reference to `nec7210_enable_eos'
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_remote_enable':
   fmh_gpib.c:(.text+0xece): undefined reference to `nec7210_remote_enable'
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_interface_clear':
   fmh_gpib.c:(.text+0xf4e): undefined reference to `nec7210_interface_clear'
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_request_system_control':
   fmh_gpib.c:(.text+0xfce): undefined reference to `nec7210_request_system_control'
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_go_to_standby':
   fmh_gpib.c:(.text+0x1046): undefined reference to `nec7210_go_to_standby'
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_take_control':
   fmh_gpib.c:(.text+0x10ce): undefined reference to `nec7210_take_control'
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_command':
   fmh_gpib.c:(.text+0x115a): undefined reference to `nec7210_command'
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_write':
   fmh_gpib.c:(.text+0x1224): undefined reference to `nec7210_write'
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_read':
   fmh_gpib.c:(.text+0x12e4): undefined reference to `nec7210_read'
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_device_match':
   fmh_gpib.c:(.text+0x146c): undefined reference to `gpib_match_device_path'
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_init.isra.0':
   fmh_gpib.c:(.text+0x25d6): undefined reference to `nec7210_board_reset'
   s390-linux-ld: fmh_gpib.c:(.text+0x260a): undefined reference to `nec7210_set_handshake_mode'
   s390-linux-ld: fmh_gpib.c:(.text+0x2722): undefined reference to `nec7210_board_online'
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_pci_attach_impl':
   fmh_gpib.c:(.text+0x28f2): undefined reference to `gpib_pci_get_device'
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_pci_detach':
   fmh_gpib.c:(.text+0x386c): undefined reference to `nec7210_board_reset'
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_detach':
   fmh_gpib.c:(.text+0x3b8e): undefined reference to `nec7210_board_reset'
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_fifo_read_countable':
   fmh_gpib.c:(.text+0x4452): undefined reference to `nec7210_set_reg_bits'
   s390-linux-ld: fmh_gpib.c:(.text+0x4468): undefined reference to `nec7210_set_reg_bits'
   s390-linux-ld: fmh_gpib.c:(.text+0x47c8): undefined reference to `nec7210_set_reg_bits'
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_fifo_write_countable':
   fmh_gpib.c:(.text+0x5294): undefined reference to `nec7210_set_reg_bits'
   s390-linux-ld: fmh_gpib.c:(.text+0x52aa): undefined reference to `nec7210_set_reg_bits'
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o:fmh_gpib.c:(.text+0x52fe): more undefined references to `nec7210_set_reg_bits' follow
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_internal_interrupt':
   fmh_gpib.c:(.text+0x6012): undefined reference to `push_gpib_event'
   s390-linux-ld: fmh_gpib.c:(.text+0x6040): undefined reference to `nec7210_interrupt_have_status'
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_dma_callback':
   fmh_gpib.c:(.text+0x6564): undefined reference to `nec7210_set_reg_bits'
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_fifo_read':
   fmh_gpib.c:(.text+0x66d6): undefined reference to `nec7210_set_reg_bits'
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_dma_write':
   fmh_gpib.c:(.text+0x6f62): undefined reference to `nec7210_set_reg_bits'
   s390-linux-ld: fmh_gpib.c:(.text+0x6f78): undefined reference to `nec7210_set_reg_bits'
   s390-linux-ld: fmh_gpib.c:(.text+0x744c): undefined reference to `nec7210_set_reg_bits'
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o:fmh_gpib.c:(.text+0x8142): more undefined references to `nec7210_set_reg_bits' follow
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_exit_module':
   fmh_gpib.c:(.exit.text+0x2e): undefined reference to `gpib_unregister_driver'
   s390-linux-ld: fmh_gpib.c:(.exit.text+0x3a): undefined reference to `gpib_unregister_driver'
   s390-linux-ld: fmh_gpib.c:(.exit.text+0x46): undefined reference to `gpib_unregister_driver'
   s390-linux-ld: fmh_gpib.c:(.exit.text+0x52): undefined reference to `gpib_unregister_driver'
   s390-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_init_module':
   fmh_gpib.c:(.init.text+0x9e): undefined reference to `gpib_register_driver'
   s390-linux-ld: fmh_gpib.c:(.init.text+0xce): undefined reference to `gpib_register_driver'
   s390-linux-ld: fmh_gpib.c:(.init.text+0x102): undefined reference to `gpib_register_driver'
   s390-linux-ld: fmh_gpib.c:(.init.text+0x132): undefined reference to `gpib_register_driver'
>> s390-linux-ld: fmh_gpib.c:(.init.text+0x15c): undefined reference to `gpib_unregister_driver'
   s390-linux-ld: fmh_gpib.c:(.init.text+0x16e): undefined reference to `gpib_unregister_driver'
   s390-linux-ld: fmh_gpib.c:(.init.text+0x180): undefined reference to `gpib_unregister_driver'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
