Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C6214A0A3;
	Thu, 26 Dec 2024 23:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735256015; cv=none; b=qgvaj6/neH2JuEiq1HK/qos+GW2PVFEIcuyp8b+4a4w2gi+ZGWn/Gs2VuJ7HXV1PiTvEs3vSNCKGmVN/0TVcI26cRw+NmzmOaB7gnQKqOPxWmnRyhod9nN6ck8ehfAi2oRer89LpmKo3vq1/eHpGR9dgz4pTyeamUa8n0pLFzAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735256015; c=relaxed/simple;
	bh=e8L/FcJAcngqHp+Vq6AA1zZh8CFRUiI1I192bTq9bS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y5gb5Jv2Qr4V7y6W4FpCrcq7Afvpbi7Ahg9D62Rg7EXtFNBt36hcyJc62+G0tyYJ2ZsOmWKC/SSn1nG8BXOYnRKIilPkwzsglfmNi3IEOdUQK8DrdVwffyR97J+2yc+SNV6Y81ntECoi2BZXKlekgkhpcC0K2REaYUF5S+3vX7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FtYk1zRT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FtYk1zRT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735256013; x=1766792013;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e8L/FcJAcngqHp+Vq6AA1zZh8CFRUiI1I192bTq9bS8=;
  b=FtYk1zRTw4Q3rXkn4VNTWUQvnaoA5QX6lOHwTJxlvWlM6HxriT8YGxp5
   f8xwjZAe9gZWS2gTHXOoA7C9XVbo4cNf2AlGkOYLCp24Z4Uh9XETFN+hX
   VQoN+0l9/Gg/0HCDtFDEQYBbAeUkrCFZ1jANjUQPqf2/gsekdxSWOuZJ1
   zHY1HbM/JeKBUnxMT/v37k3Bs8XwqOZWm1ZnlBsCzyV9VJTaxqfJhacVV
   axYX6Qr40nDHaG/nKbj21JSb7T2QC0VNKS/cSIEksYWMWljzOo9uEH/zw
   XdshEm5jjAI18ey31YZYLLwYxGSHfCCI3+jFd13SmiurWwFss/CSmswN5
   A==;
X-CSE-ConnectionGUID: hDN+XNoiSEm5yM6ZR6kJng==
X-CSE-MsgGUID: lpWx1P5aR1yW7G8ZhgfxNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="35901618"
X-IronPort-AV: E=Sophos;i="6.12,267,1728975600"; 
   d="scan'208";a="35901618"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 15:33:32 -0800
X-CSE-ConnectionGUID: Rpmn7W0zSe+lSCGVkSAm/Q==
X-CSE-MsgGUID: xFTe4qVBRtOBwIV5v2FXVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,267,1728975600"; 
   d="scan'208";a="104996822"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Dec 2024 15:33:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQxM7-0002qs-2Q;
	Thu, 26 Dec 2024 23:33:27 +0000
Date: Fri, 27 Dec 2024 07:32:59 +0800
From: kernel test robot <lkp@intel.com>
To: Nihar Chaithanya <niharchaithanya@gmail.com>, dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, dan.carpenter@linaro.org,
	skhan@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: Re: [PATCH v4 07/15] staging: gpib: fmh: Handle
 gpib_register_driver() errors
Message-ID: <202412270718.ELKIIc5I-lkp@intel.com>
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
config: loongarch-randconfig-001-20241227 (https://download.01.org/0day-ci/archive/20241227/202412270718.ELKIIc5I-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241227/202412270718.ELKIIc5I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412270718.ELKIIc5I-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_t1_delay':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:262:(.text+0x388): undefined reference to `nec7210_t1_delay'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_serial_poll_status':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:211:(.text+0x3e0): undefined reference to `nec7210_serial_poll_status'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_secondary_address':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:133:(.text+0x3f0): undefined reference to `nec7210_secondary_address'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_primary_address':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:126:(.text+0x3fc): undefined reference to `nec7210_primary_address'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_update_status':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:119:(.text+0x408): undefined reference to `nec7210_update_status'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_parallel_poll_response':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:154:(.text+0x414): undefined reference to `nec7210_parallel_poll_response'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_parallel_poll':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:140:(.text+0x420): undefined reference to `nec7210_parallel_poll'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_parallel_poll_configure':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:147:(.text+0x42c): undefined reference to `nec7210_parallel_poll_configure'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_disable_eos':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:112:(.text+0x434): undefined reference to `nec7210_disable_eos'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_enable_eos':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:105:(.text+0x444): undefined reference to `nec7210_enable_eos'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_remote_enable':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:98:(.text+0x450): undefined reference to `nec7210_remote_enable'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_interface_clear':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:91:(.text+0x45c): undefined reference to `nec7210_interface_clear'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_request_system_control':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:84:(.text+0x468): undefined reference to `nec7210_request_system_control'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_go_to_standby':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:76:(.text+0x470): undefined reference to `nec7210_go_to_standby'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_take_control':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:69:(.text+0x47c): undefined reference to `nec7210_take_control'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_command':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:62:(.text+0x490): undefined reference to `nec7210_command'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_write':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:54:(.text+0x4a8): undefined reference to `nec7210_write'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_read':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:46:(.text+0x4c0): undefined reference to `nec7210_read'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_detach':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1512:(.text+0x63c): undefined reference to `nec7210_board_reset'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_internal_interrupt':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1166:(.text+0x720): undefined reference to `push_gpib_event'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1170:(.text+0x73c): undefined reference to `nec7210_interrupt_have_status'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_device_match':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1370:(.text+0x924): undefined reference to `gpib_match_device_path'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_dma_callback':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:363:(.text+0xeb8): undefined reference to `nec7210_set_reg_bits'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_fifo_write_countable':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:607:(.text+0xf88): undefined reference to `nec7210_set_reg_bits'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:608:(.text+0xf9c): undefined reference to `nec7210_set_reg_bits'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:631:(.text+0x1034): undefined reference to `nec7210_set_reg_bits'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:648:(.text+0x1140): undefined reference to `nec7210_set_reg_bits'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o:drivers/staging/gpib/fmh_gpib/fmh_gpib.c:649: more undefined references to `nec7210_set_reg_bits' follow
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_pci_detach':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1637:(.text+0x166c): undefined reference to `nec7210_board_reset'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_init':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1342:(.text+0x1978): undefined reference to `nec7210_board_reset'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1344:(.text+0x1998): undefined reference to `nec7210_set_handshake_mode'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1351:(.text+0x19c8): undefined reference to `nec7210_board_online'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_pci_attach_impl':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1545:(.text+0x1cbc): undefined reference to `gpib_pci_get_device'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_dma_write':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:426:(.text+0x1f20): undefined reference to `nec7210_set_reg_bits'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:427:(.text+0x1f34): undefined reference to `nec7210_set_reg_bits'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:453:(.text+0x2070): undefined reference to `nec7210_set_reg_bits'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_dma_read':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:761:(.text+0x23ac): undefined reference to `nec7210_set_reg_bits'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:762:(.text+0x23c0): undefined reference to `nec7210_set_reg_bits'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o:drivers/staging/gpib/fmh_gpib/fmh_gpib.c:787: more undefined references to `nec7210_set_reg_bits' follow
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_exit_module':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1734:(.exit.text+0x18): undefined reference to `gpib_unregister_driver'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1735:(.exit.text+0x20): undefined reference to `gpib_unregister_driver'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1736:(.exit.text+0x28): undefined reference to `gpib_unregister_driver'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1737:(.exit.text+0x30): undefined reference to `gpib_unregister_driver'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_init_module':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1700:(.init.text+0x70): undefined reference to `gpib_register_driver'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1704:(.init.text+0x88): undefined reference to `gpib_register_driver'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1708:(.init.text+0xa0): undefined reference to `gpib_register_driver'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1712:(.init.text+0xb4): undefined reference to `gpib_register_driver'
>> loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1719:(.init.text+0xc4): undefined reference to `gpib_unregister_driver'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1721:(.init.text+0xcc): undefined reference to `gpib_unregister_driver'
   loongarch64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1723:(.init.text+0xd4): undefined reference to `gpib_unregister_driver'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
