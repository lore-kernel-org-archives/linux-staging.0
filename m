Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0505F3594B;
	Sat, 28 Dec 2024 09:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735377955; cv=none; b=fIWSwSqgbEr1YYV72BfxxIPlw2bK6ohN3MUbE7258En+BnxCF69SA5PW8oafXSj3O04Uo2ZUqpBmo40aJxrlTM2Wc/5UlJjg+F4+sy/npRGOkhOtyHGOl2NN7yb/Jgyde9nrnYxGFMRowITyJF27h9YrNW6p44g3DAnulzEtBwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735377955; c=relaxed/simple;
	bh=01OG14G8n6G4FAKknvuG9hmaChWHJ8M5WN75URSbU7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lGYt7B5mKcpgfY6lfCpjgihSufPRcOpupxnijLNmVBiRa1s5fgsf7hh3yIz9vMjmRuPHS8mi3FWlCkHEkJEsWeDobXUPp/HrxnlHJLC69cFjvo95/GTjqjMZjcj+RTuAMbLjz9kUkkm7jwPiSTAVrw2Sdl0Rqhu3J7io3ArnW+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HxaCkZ8V; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HxaCkZ8V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735377952; x=1766913952;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=01OG14G8n6G4FAKknvuG9hmaChWHJ8M5WN75URSbU7g=;
  b=HxaCkZ8VLEtouPuo5QqMyJSULSzTVK0dQon6khsatd5Z/pJhV701bnLm
   SnRN/gegYpnjy0s2imhve+ZLyA+wk6OFTLMvmi+EUEDTo6NK9zLD3+F+U
   4f3bsm8FhBwDYRvTYOFMGlM1+tlniiuBDFT9OFPACcquqxTCIk28KRx2C
   Rhl/mp2hvkZs+vPDVlCcQItPrqwYKu4naB8XoAjwnQsoaJBucwCxW+mCt
   qIwKCsMxUO6KLm2ZP6yvSzCaUK3UupvBn/2pwyPjLlp7vmyY5VtTvtfng
   bSnS4BrhManLvugJ2v3lHCRoCIyw9cF6LQQGUuqoZHoRLFRbhjpaIyDgz
   Q==;
X-CSE-ConnectionGUID: 3AsqjFuXQrC2qJJzhVNZZg==
X-CSE-MsgGUID: awLd7k6/TPyTX4p9KoeyYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35910817"
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="35910817"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 01:25:51 -0800
X-CSE-ConnectionGUID: 2RCTvvPQRPW6uE6Tyss85Q==
X-CSE-MsgGUID: TprlGC2WTi2QVvEP8P82iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="100460614"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Dec 2024 01:25:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRT4s-0003yO-2J;
	Sat, 28 Dec 2024 09:25:46 +0000
Date: Sat, 28 Dec 2024 17:24:51 +0800
From: kernel test robot <lkp@intel.com>
To: Nihar Chaithanya <niharchaithanya@gmail.com>, dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, dan.carpenter@linaro.org,
	skhan@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: Re: [PATCH v5 07/15] staging: gpib: fmh: Handle
 gpib_register_driver() errors
Message-ID: <202412281702.kUUcfCcI-lkp@intel.com>
References: <20241228060800.107653-8-niharchaithanya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241228060800.107653-8-niharchaithanya@gmail.com>

Hi Nihar,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Nihar-Chaithanya/staging-gpib-Modify-gpib_register_driver-to-return-error-if-it-fails/20241228-142936
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20241228060800.107653-8-niharchaithanya%40gmail.com
patch subject: [PATCH v5 07/15] staging: gpib: fmh: Handle gpib_register_driver() errors
config: sparc-randconfig-002-20241228 (https://download.01.org/0day-ci/archive/20241228/202412281702.kUUcfCcI-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412281702.kUUcfCcI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412281702.kUUcfCcI-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_t1_delay':
   fmh_gpib.c:(.text+0x280): undefined reference to `nec7210_t1_delay'
   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_serial_poll_status':
   fmh_gpib.c:(.text+0x2ec): undefined reference to `nec7210_serial_poll_status'
   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_secondary_address':
   fmh_gpib.c:(.text+0x3f0): undefined reference to `nec7210_secondary_address'
   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_primary_address':
   fmh_gpib.c:(.text+0x404): undefined reference to `nec7210_primary_address'
   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_update_status':
   fmh_gpib.c:(.text+0x418): undefined reference to `nec7210_update_status'
   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_parallel_poll_response':
   fmh_gpib.c:(.text+0x42c): undefined reference to `nec7210_parallel_poll_response'
   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_parallel_poll':
   fmh_gpib.c:(.text+0x440): undefined reference to `nec7210_parallel_poll'
   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_parallel_poll_configure':
   fmh_gpib.c:(.text+0x454): undefined reference to `nec7210_parallel_poll_configure'
   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_disable_eos':
   fmh_gpib.c:(.text+0x464): undefined reference to `nec7210_disable_eos'
   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_enable_eos':
   fmh_gpib.c:(.text+0x47c): undefined reference to `nec7210_enable_eos'
   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_remote_enable':
   fmh_gpib.c:(.text+0x490): undefined reference to `nec7210_remote_enable'
   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_interface_clear':
   fmh_gpib.c:(.text+0x4a4): undefined reference to `nec7210_interface_clear'
   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_request_system_control':
   fmh_gpib.c:(.text+0x4b8): undefined reference to `nec7210_request_system_control'
   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_go_to_standby':
   fmh_gpib.c:(.text+0x4c8): undefined reference to `nec7210_go_to_standby'
   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_take_control':
   fmh_gpib.c:(.text+0x4dc): undefined reference to `nec7210_take_control'
   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_command':
   fmh_gpib.c:(.text+0x4f8): undefined reference to `nec7210_command'
   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_write':
   fmh_gpib.c:(.text+0x518): undefined reference to `nec7210_write'
   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_read':
   fmh_gpib.c:(.text+0x538): undefined reference to `nec7210_read'
   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_detach':
   fmh_gpib.c:(.text+0x720): undefined reference to `nec7210_board_reset'
   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_internal_interrupt':
   fmh_gpib.c:(.text+0x82c): undefined reference to `push_gpib_event'
   sparc-linux-ld: fmh_gpib.c:(.text+0x840): undefined reference to `nec7210_interrupt_have_status'
   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_device_match':
   fmh_gpib.c:(.text+0xae4): undefined reference to `gpib_match_device_path'
   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_dma_callback':
   fmh_gpib.c:(.text+0x1058): undefined reference to `nec7210_set_reg_bits'
   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_fifo_write_countable':
   fmh_gpib.c:(.text+0x10e8): undefined reference to `nec7210_set_reg_bits'
   sparc-linux-ld: fmh_gpib.c:(.text+0x1100): undefined reference to `nec7210_set_reg_bits'
   sparc-linux-ld: fmh_gpib.c:(.text+0x1164): undefined reference to `nec7210_set_reg_bits'
   sparc-linux-ld: fmh_gpib.c:(.text+0x1290): undefined reference to `nec7210_set_reg_bits'
   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o:fmh_gpib.c:(.text+0x12a4): more undefined references to `nec7210_set_reg_bits' follow
   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_pci_detach':
   fmh_gpib.c:(.text+0x1820): undefined reference to `nec7210_board_reset'
   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_init.isra.0':
   fmh_gpib.c:(.text+0x1ae8): undefined reference to `nec7210_board_reset'
   sparc-linux-ld: fmh_gpib.c:(.text+0x1b08): undefined reference to `nec7210_set_handshake_mode'
   sparc-linux-ld: fmh_gpib.c:(.text+0x1b44): undefined reference to `nec7210_board_online'
   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_dma_write':
   fmh_gpib.c:(.text+0x1f24): undefined reference to `nec7210_set_reg_bits'
   sparc-linux-ld: fmh_gpib.c:(.text+0x1f38): undefined reference to `nec7210_set_reg_bits'
   sparc-linux-ld: fmh_gpib.c:(.text+0x2094): undefined reference to `nec7210_set_reg_bits'
   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_pci_attach_impl':
   fmh_gpib.c:(.text+0x2388): undefined reference to `gpib_pci_get_device'
   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_dma_read':
   fmh_gpib.c:(.text+0x26b0): undefined reference to `nec7210_set_reg_bits'
   sparc-linux-ld: fmh_gpib.c:(.text+0x26c4): undefined reference to `nec7210_set_reg_bits'
   sparc-linux-ld: fmh_gpib.c:(.text+0x27f0): undefined reference to `nec7210_set_reg_bits'
   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_exit_module':
   fmh_gpib.c:(.exit.text+0x8): undefined reference to `gpib_unregister_driver'
   sparc-linux-ld: fmh_gpib.c:(.exit.text+0x14): undefined reference to `gpib_unregister_driver'
   sparc-linux-ld: fmh_gpib.c:(.exit.text+0x20): undefined reference to `gpib_unregister_driver'
   sparc-linux-ld: fmh_gpib.c:(.exit.text+0x2c): undefined reference to `gpib_unregister_driver'
   sparc-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_init_module':
   fmh_gpib.c:(.init.text+0x4c): undefined reference to `gpib_register_driver'
   sparc-linux-ld: fmh_gpib.c:(.init.text+0x68): undefined reference to `gpib_register_driver'
   sparc-linux-ld: fmh_gpib.c:(.init.text+0x84): undefined reference to `gpib_register_driver'
   sparc-linux-ld: fmh_gpib.c:(.init.text+0xa0): undefined reference to `gpib_register_driver'
>> sparc-linux-ld: fmh_gpib.c:(.init.text+0xb4): undefined reference to `gpib_unregister_driver'
   sparc-linux-ld: fmh_gpib.c:(.init.text+0xbc): undefined reference to `gpib_unregister_driver'
   sparc-linux-ld: fmh_gpib.c:(.init.text+0xc4): undefined reference to `gpib_unregister_driver'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
