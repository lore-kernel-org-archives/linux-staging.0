Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9283282866;
	Sun,  8 Feb 2026 03:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770522127; cv=none; b=M9B1BekiJzon84ssfKg0ny6lFdpWZHRUB2Mth6NvPsHXH0+pwn+mL2ggXDk6Wg0+mT7I41QrxH8A8n7Lk13PD8uHgSzGJk5wHoJBPGgxw6OMPyO/0xXeH695lXDGDSNEBB8vhgurYmKB/TpYxRD4nWEpuDb+xl8JuA3pa+f3xDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770522127; c=relaxed/simple;
	bh=amCmmIzpRirfKoxks7a4CZ+1HL+M6Zm8saSh2bY/doc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XaD+InWh6xBLuuqpfcPPdGoQflZqVxXLbw0T7GdCdsDPSRdknK0o4slhOEJV4VtX6fShiRyKExUs6agoVbC4v3xGBX5V5MKMxynG9wmRa74U7c31xsqZabElXCBOZdqWVWn093+qUYqI7GMm+iuvXUoFHyOPF4x/nN7xiwW03HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EkkW9YO8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EkkW9YO8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770522126; x=1802058126;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=amCmmIzpRirfKoxks7a4CZ+1HL+M6Zm8saSh2bY/doc=;
  b=EkkW9YO8fhouF8byf+6K6V1RwbO5A7SK1DOLYkrCOf+nxqzKaMhI8m91
   WY79ai1I90TYIScOZbI0Nouy88bdqi8oQrUwrnoC17FT9yggVV/y6Lafd
   0cElAsI4yQAtFmhXXxBmuwS4Fk6Itlf35ELpH+3KTikn1gh5k5YHs8W0F
   lZyPAsLSa/SUBu86hb4dubHIYeiMm4CW30M1kykERsKEVuZUBTCEi1I7s
   Js2ljpJlV2qjkz5mYhC68Xk8xso5Gy1E6I8vYLo/3Tjn5xh+vRGvc8rZ1
   7KBvpLeZ20cVScYTgDlhRrteRsncGHQ+4V3Ymtoq+gjmuTe2Ij4xaXxvl
   Q==;
X-CSE-ConnectionGUID: uKSpOywgQ7GPdA96x64lsw==
X-CSE-MsgGUID: YcNH4pjyTb6bsHXTac31qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11694"; a="59245372"
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; 
   d="scan'208";a="59245372"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 19:42:06 -0800
X-CSE-ConnectionGUID: sv1C1DEoQe+/S5TXQ4fTSQ==
X-CSE-MsgGUID: M+olCeSwRDiJGeigoO8C6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; 
   d="scan'208";a="241892352"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Feb 2026 19:42:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vovgP-00000000m2K-2uP4;
	Sun, 08 Feb 2026 03:42:01 +0000
Date: Sun, 8 Feb 2026 11:42:00 +0800
From: kernel test robot <lkp@intel.com>
To: Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>,
	parthiban.veerasooran@microchip.com, christian.gromm@microchip.com
Cc: oe-kbuild-all@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>
Subject: Re: [PATCH] staging: most: dim2: remove unused header includes
Message-ID: <202602081112.RJSlxpwj-lkp@intel.com>
References: <20260207212354.51694-1-rajveer.chaudhari.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207212354.51694-1-rajveer.chaudhari.linux@gmail.com>

Hi Rajveer,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Rajveer-Chaudhari/staging-most-dim2-remove-unused-header-includes/20260208-052613
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260207212354.51694-1-rajveer.chaudhari.linux%40gmail.com
patch subject: [PATCH] staging: most: dim2: remove unused header includes
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260208/202602081112.RJSlxpwj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260208/202602081112.RJSlxpwj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602081112.RJSlxpwj-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/most/dim2/hal.c: In function 'alloc_dbr':
>> drivers/staging/most/dim2/hal.c:114:36: error: implicit declaration of function 'DIV_ROUND_UP' [-Wimplicit-function-declaration]
     114 |                 u32 const blocks = DIV_ROUND_UP(size, DBR_BLOCK_SIZE);
         |                                    ^~~~~~~~~~~~


vim +/DIV_ROUND_UP +114 drivers/staging/most/dim2/hal.c

ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24   95  
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24   96  /**
51ca97af82af8a drivers/staging/most/dim2/hal.c          Lee Jones       2021-04-14   97   * alloc_dbr() - Allocates DBR memory.
7af9b4444fab2e drivers/staging/most/dim2/hal.c          Lee Jones       2021-04-14   98   * @size: Allocating memory size.
51ca97af82af8a drivers/staging/most/dim2/hal.c          Lee Jones       2021-04-14   99   * Returns: Offset in DBR memory by success or DBR_SIZE if out of memory.
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  100   */
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  101  static int alloc_dbr(u16 size)
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  102  {
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  103  	int mask_size;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  104  	int i, block_idx = 0;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  105  
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  106  	if (size <= 0)
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  107  		return DBR_SIZE; /* out of memory */
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  108  
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  109  	mask_size = dbr_get_mask_size(size);
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  110  	if (mask_size == 0)
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  111  		return DBR_SIZE; /* out of memory */
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  112  
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  113  	for (i = 0; i < DBR_MAP_SIZE; i++) {
bdc58e3bef647b drivers/staging/most/hdm-dim2/dim2_hal.c simran singhal  2017-02-22 @114  		u32 const blocks = DIV_ROUND_UP(size, DBR_BLOCK_SIZE);
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  115  		u32 mask = ~((~(u32)0) << blocks);
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  116  
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  117  		do {
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  118  			if ((g.dbr_map[i] & mask) == 0) {
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  119  				g.dbr_map[i] |= mask;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  120  				return block_idx * DBR_BLOCK_SIZE;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  121  			}
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  122  			block_idx += mask_size;
9158d33a5d38d1 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-10-15  123  			/* do shift left with 2 steps in case mask_size == 32 */
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  124  			mask <<= mask_size - 1;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  125  		} while ((mask <<= 1) != 0);
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  126  	}
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  127  
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  128  	return DBR_SIZE; /* out of memory */
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  129  }
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  130  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
