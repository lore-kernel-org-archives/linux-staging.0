Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4663913C809;
	Tue, 31 Dec 2024 04:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735618427; cv=none; b=a9EYeiNne2M01uLVYXyUttJwACNTkyPu/8BNjSMAMFKvbl8CEvD7kZaw5mIiG5N7VoaJhFQFyNYVc9O06s0KKgU2wok9qMIaqL9zeQLFQrvlTUYbZVwo2qZnu4ttYZY2T+fKpzFI8Y7Tg5ilUmMiCp9fSs4/S7VjzAPz0jznzSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735618427; c=relaxed/simple;
	bh=CF1FyKHPU9tCey1Wx87/yZ1TgsUFSA8vGKFsDJyJ7ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jKqWsHQg+ifl3BgYB1ROLEf37W9rJn5eGjK9SN+CQmBRgCYyabp99g94SjN1sgXomWRPI9LsqzsZIOjbzDnvXNIGIR3SrbnsIqxmKC7cG8XDcwRX2gV3EwHrRcUh0n1Ne034+mRNaKK9nnbewT+Kj7Qn3BAvPannXHmjIynTA7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Db1lnRRB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Db1lnRRB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735618425; x=1767154425;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CF1FyKHPU9tCey1Wx87/yZ1TgsUFSA8vGKFsDJyJ7ww=;
  b=Db1lnRRBst2WogA1SEKs+TEUo6I9U2KaiXj+FsZl+BlNlYx85fSiGVdG
   BACEZSa358MkqNd2t8nx1mzXLvvobUcn7gMQR9DFI7vkAi7kPzHpNIJC6
   XakSsJkznL7WZloKyvwJZ/j4ETQmf4yxTOYCTPL545NTqsC/UNwf1/dv5
   RDHp7QG9DWHuQr97P59vMH2EUfRvvDWv3oxKAhKP47Zm11EF1yDnsE3ST
   AFatNPHGRMaAd9mcuHG52M3uxg9ry2D3Da0iltwV4jUZlS5yxaIjmmKoe
   mtCRx16HVrEM2T8L+5W068ZFlF7beVW5vUV68d9x+LopKf48wgsmkrpdB
   g==;
X-CSE-ConnectionGUID: CkMomJqUTFa4tTnlPldqaA==
X-CSE-MsgGUID: roPfg3GnRBaxaTMunQBL0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="36059783"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="36059783"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 20:13:44 -0800
X-CSE-ConnectionGUID: 4EgRbZ4KSQqmthtoqKfbHA==
X-CSE-MsgGUID: WqO3SB4iQtOMSwBKYb30Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="100814438"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Dec 2024 20:13:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSTdT-0006hX-0M;
	Tue, 31 Dec 2024 04:13:39 +0000
Date: Tue, 31 Dec 2024 12:13:03 +0800
From: kernel test robot <lkp@intel.com>
To: Nihar Chaithanya <niharchaithanya@gmail.com>, dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, dan.carpenter@linaro.org,
	skhan@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: Re: [PATCH v6 07/15] staging: gpib: fmh: Handle
 gpib_register_driver() errors
Message-ID: <202412311213.Dcj8Nucn-lkp@intel.com>
References: <20241230185633.175690-8-niharchaithanya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230185633.175690-8-niharchaithanya@gmail.com>

Hi Nihar,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Nihar-Chaithanya/staging-gpib-Modify-gpib_register_driver-to-return-error-if-it-fails/20241231-031406
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20241230185633.175690-8-niharchaithanya%40gmail.com
patch subject: [PATCH v6 07/15] staging: gpib: fmh: Handle gpib_register_driver() errors
config: xtensa-randconfig-001-20241231 (https://download.01.org/0day-ci/archive/20241231/202412311213.Dcj8Nucn-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412311213.Dcj8Nucn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412311213.Dcj8Nucn-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o:(.init.literal+0x38): undefined reference to `gpib_register_driver'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o:(.init.literal+0x40): undefined reference to `gpib_register_driver'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o:(.init.literal+0x48): undefined reference to `gpib_register_driver'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o:(.init.literal+0x50): undefined reference to `gpib_register_driver'
>> xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o:(.init.literal+0x58): undefined reference to `gpib_unregister_driver'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o:(.init.literal+0x5c): undefined reference to `gpib_unregister_driver'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o:(.init.literal+0x60): undefined reference to `gpib_unregister_driver'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `lacs_or_read_ready':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:286:(.text+0x2c4): undefined reference to `nec7210_t1_delay'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_t1_delay':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:262:(.text+0x2de): undefined reference to `nec7210_t1_delay'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:271:(.text+0x318): undefined reference to `nec7210_serial_poll_status'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_serial_poll_status':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:211:(.text+0x328): undefined reference to `nec7210_secondary_address'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_secondary_address':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:133:(.text+0x33c): undefined reference to `nec7210_primary_address'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_primary_address':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:126:(.text+0x34c): undefined reference to `nec7210_update_status'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_update_status':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:119:(.text+0x35c): undefined reference to `nec7210_parallel_poll_response'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_parallel_poll_response':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:154:(.text+0x36c): undefined reference to `nec7210_parallel_poll'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_parallel_poll':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:140:(.text+0x37c): undefined reference to `nec7210_parallel_poll_configure'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_parallel_poll_configure':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:147:(.text+0x390): undefined reference to `nec7210_disable_eos'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_disable_eos':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:112:(.text+0x3a0): undefined reference to `nec7210_enable_eos'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_enable_eos':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:105:(.text+0x3b4): undefined reference to `nec7210_remote_enable'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_remote_enable':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:98:(.text+0x3c4): undefined reference to `nec7210_interface_clear'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_interface_clear':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:91:(.text+0x3d4): undefined reference to `nec7210_request_system_control'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_request_system_control':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:84:(.text+0x3e4): undefined reference to `nec7210_go_to_standby'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_go_to_standby':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:76:(.text+0x3f4): undefined reference to `nec7210_take_control'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_take_control':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:69:(.text+0x404): undefined reference to `nec7210_command'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_command':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:62:(.text+0x41c): undefined reference to `nec7210_write'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_write':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:54:(.text+0x434): undefined reference to `nec7210_read'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `wait_for_read':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:305:(.text+0x668): undefined reference to `gpib_match_device_path'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_device_match':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1370:(.text+0x68a): undefined reference to `gpib_match_device_path'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_return_to_local':
   drivers/staging/gpib/include/nec7210.h:59:(.text+0x808): undefined reference to `nec7210_board_reset'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_detach':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1512:(.text+0x86a): undefined reference to `nec7210_board_reset'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_attach_holdoff_end':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1493:(.text+0xc1c): undefined reference to `nec7210_board_reset'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_pci_detach':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1637:(.text+0xc7e): undefined reference to `nec7210_board_reset'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1649:(.text+0xd44): undefined reference to `gpib_pci_get_device'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_pci_attach_impl':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1545:(.text+0xd9f): undefined reference to `gpib_pci_get_device'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_all_bytes_are_sent':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:387:(.text+0x1004): undefined reference to `push_gpib_event'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_internal_interrupt':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1166:(.text+0x107f): undefined reference to `push_gpib_event'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_all_bytes_are_sent':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:387:(.text+0x1008): undefined reference to `nec7210_interrupt_have_status'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_internal_interrupt':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1170:(.text+0x1096): undefined reference to `nec7210_interrupt_have_status'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_interrupt':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1251:(.text+0x1244): undefined reference to `nec7210_set_reg_bits'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_dma_callback':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:363:(.text+0x127b): undefined reference to `nec7210_set_reg_bits'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_dma_callback':
   include/linux/spinlock.h:406:(.text+0x1324): undefined reference to `nec7210_set_reg_bits'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_dma_read':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:761:(.text+0x14e4): undefined reference to `nec7210_set_reg_bits'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_dma_callback':
   include/linux/spinlock.h:406:(.text+0x1328): undefined reference to `nec7210_set_reg_bits'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o:drivers/staging/gpib/fmh_gpib/fmh_gpib.c:762: more undefined references to `nec7210_set_reg_bits' follow
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_init_module':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1704:(.init.text+0x4b): undefined reference to `gpib_register_driver'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1710:(.init.text+0x6b): undefined reference to `gpib_register_driver'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1716:(.init.text+0x8b): undefined reference to `gpib_register_driver'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1722:(.init.text+0xab): undefined reference to `gpib_register_driver'
>> xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1731:(.init.text+0xc3): undefined reference to `gpib_unregister_driver'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1733:(.init.text+0xcc): undefined reference to `gpib_unregister_driver'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1735:(.init.text+0xd5): undefined reference to `gpib_unregister_driver'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o:(.text.unlikely+0x0): undefined reference to `nec7210_board_reset'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_init':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1342:(.text.unlikely+0x3e): undefined reference to `nec7210_board_reset'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o:(.text.unlikely+0x4): undefined reference to `nec7210_set_handshake_mode'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_init':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1344:(.text.unlikely+0x56): undefined reference to `nec7210_set_handshake_mode'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o:(.text.unlikely+0xc): undefined reference to `nec7210_board_online'
   xtensa-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_init':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1351:(.text.unlikely+0x87): undefined reference to `nec7210_board_online'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
