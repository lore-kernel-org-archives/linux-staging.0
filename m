Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6844C2594B9;
	Mon, 19 Jan 2026 06:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768805301; cv=none; b=WQGaxpJ+T3JeYQE4X7ehQlQ5JCmfNw5wdacYE1UL5QNq67O00QbZCbMtNsixApbTgY9q8OZEZTkXvmueV93AaqJcWUvnRRzgvgCh2Da0bPV0YOt93Dj6r6n7Gfa9o4qOxWGpggkMF0BrgUYsfiTUF9YAlvQMWUKb3idrlJhzbJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768805301; c=relaxed/simple;
	bh=97Xp5AHPqf0KIZiCtga/l4M5I8KzJ+rj+lgbJJdP/Ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rrEP8XqP0GDkdD+lawswEFp7vGwj+4advKfVaE1RNBpsfhYhAeJc+6WsEKKqgg79DR//f8MJmSz3jjdWjMIn5DvZq8xDxo8fu+PoximrxizEZIExE5AK84Jit3Zaw9Z+XnJDPcTY9QvTY1OO0K4xcDm4D5FR/DIYyNP6Q9kcDnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XerAHR7H; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XerAHR7H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768805299; x=1800341299;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=97Xp5AHPqf0KIZiCtga/l4M5I8KzJ+rj+lgbJJdP/Ug=;
  b=XerAHR7HOtbFgTAns8qmzhjAQasrvTNm0lPRH+3sQfgftzJX/Y+WhTkx
   nWal7Uwy0ZITYKWVqwq7AGQhg0Ar5lFDJkiVrurW0Woc/tEqyHzFmgRs4
   Ze87iLQPoqrKxlvUU70vhV1FpUVFKo9KeZaG9eX5NdIp0bUW71ZLaJTAP
   PumpuafS+HTMvPk2/vW42A9TToRIW+KOIoPlt7MqGjvDlhtwIw6qlISEB
   jj0r2V0aOHnPVGETqozmNbiHXtSRS1TTpbJz1lsIwzdhMd7bxt0aAjMFA
   Yr+eG+V9KXfoGfLS7wN5S+fQMc5LI1wdFFwLn4xD0AluOhad2UnnwC7BK
   A==;
X-CSE-ConnectionGUID: Gdd6/C1dTXCqTRiMSpg6gQ==
X-CSE-MsgGUID: 1RezqcTPQIC7IJq+S008pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="80310951"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="80310951"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 22:48:17 -0800
X-CSE-ConnectionGUID: k0r0QDBWRMymyxCYKpVq5g==
X-CSE-MsgGUID: HCWiTRO+Td2hbDdl08EqkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="204936290"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Jan 2026 22:48:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhj3c-00000000NXB-2rLS;
	Mon, 19 Jan 2026 06:48:12 +0000
Date: Mon, 19 Jan 2026 14:48:04 +0800
From: kernel test robot <lkp@intel.com>
To: Karthikey Kadati <karthikey3608@gmail.com>, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, karthikey3608@gmail.com
Subject: Re: [PATCH v6] staging: octeon: Remove port status typedefs
Message-ID: <202601191419.5dXVi1FL-lkp@intel.com>
References: <20260118171348.54963-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260118171348.54963-1-karthikey3608@gmail.com>

Hi Karthikey,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Karthikey-Kadati/staging-octeon-Remove-port-status-typedefs/20260119-011605
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260118171348.54963-1-karthikey3608%40gmail.com
patch subject: [PATCH v6] staging: octeon: Remove port status typedefs
config: mips-randconfig-r063-20260119 (https://download.01.org/0day-ci/archive/20260119/202601191419.5dXVi1FL-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601191419.5dXVi1FL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601191419.5dXVi1FL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/mips/cavium-octeon/executive/cvmx-helper.c:39:
   arch/mips/include/asm/octeon/cvmx-pip.h:183:1: warning: typedef requires a name [-Wmissing-declarations]
     183 | typedef struct {
         | ^~~~~~~
   arch/mips/include/asm/octeon/cvmx-pip.h:368:17: warning: declaration of 'struct cvmx_pip_port_status' will not be visible outside of this function [-Wvisibility]
     368 |                                             struct cvmx_pip_port_status *status)
         |                                                    ^
>> arch/mips/include/asm/octeon/cvmx-pip.h:406:8: error: incomplete definition of type 'struct cvmx_pip_port_status'
     406 |         status->dropped_octets = stat0.s.drp_octs;
         |         ~~~~~~^
   arch/mips/include/asm/octeon/cvmx-pip.h:368:17: note: forward declaration of 'struct cvmx_pip_port_status'
     368 |                                             struct cvmx_pip_port_status *status)
         |                                                    ^
   arch/mips/include/asm/octeon/cvmx-pip.h:407:8: error: incomplete definition of type 'struct cvmx_pip_port_status'
     407 |         status->dropped_packets = stat0.s.drp_pkts;
         |         ~~~~~~^
   arch/mips/include/asm/octeon/cvmx-pip.h:368:17: note: forward declaration of 'struct cvmx_pip_port_status'
     368 |                                             struct cvmx_pip_port_status *status)
         |                                                    ^
   arch/mips/include/asm/octeon/cvmx-pip.h:408:8: error: incomplete definition of type 'struct cvmx_pip_port_status'
     408 |         status->octets = stat1.s.octs;
         |         ~~~~~~^
   arch/mips/include/asm/octeon/cvmx-pip.h:368:17: note: forward declaration of 'struct cvmx_pip_port_status'
     368 |                                             struct cvmx_pip_port_status *status)
         |                                                    ^
   arch/mips/include/asm/octeon/cvmx-pip.h:409:8: error: incomplete definition of type 'struct cvmx_pip_port_status'
     409 |         status->pci_raw_packets = stat2.s.raw;
         |         ~~~~~~^
   arch/mips/include/asm/octeon/cvmx-pip.h:368:17: note: forward declaration of 'struct cvmx_pip_port_status'
     368 |                                             struct cvmx_pip_port_status *status)
         |                                                    ^
   arch/mips/include/asm/octeon/cvmx-pip.h:410:8: error: incomplete definition of type 'struct cvmx_pip_port_status'
     410 |         status->packets = stat2.s.pkts;
         |         ~~~~~~^
   arch/mips/include/asm/octeon/cvmx-pip.h:368:17: note: forward declaration of 'struct cvmx_pip_port_status'
     368 |                                             struct cvmx_pip_port_status *status)
         |                                                    ^
   arch/mips/include/asm/octeon/cvmx-pip.h:411:8: error: incomplete definition of type 'struct cvmx_pip_port_status'
     411 |         status->multicast_packets = stat3.s.mcst;
         |         ~~~~~~^
   arch/mips/include/asm/octeon/cvmx-pip.h:368:17: note: forward declaration of 'struct cvmx_pip_port_status'
     368 |                                             struct cvmx_pip_port_status *status)
         |                                                    ^
   arch/mips/include/asm/octeon/cvmx-pip.h:412:8: error: incomplete definition of type 'struct cvmx_pip_port_status'
     412 |         status->broadcast_packets = stat3.s.bcst;
         |         ~~~~~~^
   arch/mips/include/asm/octeon/cvmx-pip.h:368:17: note: forward declaration of 'struct cvmx_pip_port_status'
     368 |                                             struct cvmx_pip_port_status *status)
         |                                                    ^
   arch/mips/include/asm/octeon/cvmx-pip.h:413:8: error: incomplete definition of type 'struct cvmx_pip_port_status'
     413 |         status->len_64_packets = stat4.s.h64;
         |         ~~~~~~^
   arch/mips/include/asm/octeon/cvmx-pip.h:368:17: note: forward declaration of 'struct cvmx_pip_port_status'
     368 |                                             struct cvmx_pip_port_status *status)
         |                                                    ^
   arch/mips/include/asm/octeon/cvmx-pip.h:414:8: error: incomplete definition of type 'struct cvmx_pip_port_status'
     414 |         status->len_65_127_packets = stat4.s.h65to127;
         |         ~~~~~~^
   arch/mips/include/asm/octeon/cvmx-pip.h:368:17: note: forward declaration of 'struct cvmx_pip_port_status'
     368 |                                             struct cvmx_pip_port_status *status)
         |                                                    ^
   arch/mips/include/asm/octeon/cvmx-pip.h:415:8: error: incomplete definition of type 'struct cvmx_pip_port_status'
     415 |         status->len_128_255_packets = stat5.s.h128to255;
         |         ~~~~~~^
   arch/mips/include/asm/octeon/cvmx-pip.h:368:17: note: forward declaration of 'struct cvmx_pip_port_status'
     368 |                                             struct cvmx_pip_port_status *status)
         |                                                    ^
   arch/mips/include/asm/octeon/cvmx-pip.h:416:8: error: incomplete definition of type 'struct cvmx_pip_port_status'
     416 |         status->len_256_511_packets = stat5.s.h256to511;
         |         ~~~~~~^
   arch/mips/include/asm/octeon/cvmx-pip.h:368:17: note: forward declaration of 'struct cvmx_pip_port_status'
     368 |                                             struct cvmx_pip_port_status *status)
         |                                                    ^
   arch/mips/include/asm/octeon/cvmx-pip.h:417:8: error: incomplete definition of type 'struct cvmx_pip_port_status'
     417 |         status->len_512_1023_packets = stat6.s.h512to1023;
         |         ~~~~~~^
   arch/mips/include/asm/octeon/cvmx-pip.h:368:17: note: forward declaration of 'struct cvmx_pip_port_status'
     368 |                                             struct cvmx_pip_port_status *status)
         |                                                    ^
   arch/mips/include/asm/octeon/cvmx-pip.h:418:8: error: incomplete definition of type 'struct cvmx_pip_port_status'
     418 |         status->len_1024_1518_packets = stat6.s.h1024to1518;
         |         ~~~~~~^
   arch/mips/include/asm/octeon/cvmx-pip.h:368:17: note: forward declaration of 'struct cvmx_pip_port_status'
     368 |                                             struct cvmx_pip_port_status *status)
         |                                                    ^
   arch/mips/include/asm/octeon/cvmx-pip.h:419:8: error: incomplete definition of type 'struct cvmx_pip_port_status'
     419 |         status->len_1519_max_packets = stat7.s.h1519;
         |         ~~~~~~^
   arch/mips/include/asm/octeon/cvmx-pip.h:368:17: note: forward declaration of 'struct cvmx_pip_port_status'
     368 |                                             struct cvmx_pip_port_status *status)
         |                                                    ^
   arch/mips/include/asm/octeon/cvmx-pip.h:420:8: error: incomplete definition of type 'struct cvmx_pip_port_status'
     420 |         status->fcs_align_err_packets = stat7.s.fcs;
         |         ~~~~~~^
   arch/mips/include/asm/octeon/cvmx-pip.h:368:17: note: forward declaration of 'struct cvmx_pip_port_status'
     368 |                                             struct cvmx_pip_port_status *status)
         |                                                    ^
   arch/mips/include/asm/octeon/cvmx-pip.h:421:8: error: incomplete definition of type 'struct cvmx_pip_port_status'
     421 |         status->runt_packets = stat8.s.undersz;
         |         ~~~~~~^
   arch/mips/include/asm/octeon/cvmx-pip.h:368:17: note: forward declaration of 'struct cvmx_pip_port_status'
     368 |                                             struct cvmx_pip_port_status *status)
         |                                                    ^
   arch/mips/include/asm/octeon/cvmx-pip.h:422:8: error: incomplete definition of type 'struct cvmx_pip_port_status'
     422 |         status->runt_crc_packets = stat8.s.frag;
         |         ~~~~~~^
   arch/mips/include/asm/octeon/cvmx-pip.h:368:17: note: forward declaration of 'struct cvmx_pip_port_status'
     368 |                                             struct cvmx_pip_port_status *status)


vim +406 arch/mips/include/asm/octeon/cvmx-pip.h

80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  359  
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  360  /**
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  361   * Get the status counters for a port.
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  362   *
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  363   * @port_num: Port number to get statistics for.
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  364   * @clear:    Set to 1 to clear the counters after they are read
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  365   * @status:   Where to put the results.
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  366   */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  367  static inline void cvmx_pip_get_port_status(uint64_t port_num, uint64_t clear,
716d4b538311a3a arch/mips/include/asm/octeon/cvmx-pip.h Karthikey Kadati 2026-01-18  368  					    struct cvmx_pip_port_status *status)
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  369  {
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  370  	union cvmx_pip_stat_ctl pip_stat_ctl;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  371  	union cvmx_pip_stat0_prtx stat0;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  372  	union cvmx_pip_stat1_prtx stat1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  373  	union cvmx_pip_stat2_prtx stat2;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  374  	union cvmx_pip_stat3_prtx stat3;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  375  	union cvmx_pip_stat4_prtx stat4;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  376  	union cvmx_pip_stat5_prtx stat5;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  377  	union cvmx_pip_stat6_prtx stat6;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  378  	union cvmx_pip_stat7_prtx stat7;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  379  	union cvmx_pip_stat8_prtx stat8;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  380  	union cvmx_pip_stat9_prtx stat9;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  381  	union cvmx_pip_stat_inb_pktsx pip_stat_inb_pktsx;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  382  	union cvmx_pip_stat_inb_octsx pip_stat_inb_octsx;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  383  	union cvmx_pip_stat_inb_errsx pip_stat_inb_errsx;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  384  
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  385  	pip_stat_ctl.u64 = 0;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  386  	pip_stat_ctl.s.rdclr = clear;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  387  	cvmx_write_csr(CVMX_PIP_STAT_CTL, pip_stat_ctl.u64);
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  388  
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  389  	stat0.u64 = cvmx_read_csr(CVMX_PIP_STAT0_PRTX(port_num));
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  390  	stat1.u64 = cvmx_read_csr(CVMX_PIP_STAT1_PRTX(port_num));
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  391  	stat2.u64 = cvmx_read_csr(CVMX_PIP_STAT2_PRTX(port_num));
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  392  	stat3.u64 = cvmx_read_csr(CVMX_PIP_STAT3_PRTX(port_num));
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  393  	stat4.u64 = cvmx_read_csr(CVMX_PIP_STAT4_PRTX(port_num));
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  394  	stat5.u64 = cvmx_read_csr(CVMX_PIP_STAT5_PRTX(port_num));
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  395  	stat6.u64 = cvmx_read_csr(CVMX_PIP_STAT6_PRTX(port_num));
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  396  	stat7.u64 = cvmx_read_csr(CVMX_PIP_STAT7_PRTX(port_num));
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  397  	stat8.u64 = cvmx_read_csr(CVMX_PIP_STAT8_PRTX(port_num));
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  398  	stat9.u64 = cvmx_read_csr(CVMX_PIP_STAT9_PRTX(port_num));
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  399  	pip_stat_inb_pktsx.u64 =
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  400  	    cvmx_read_csr(CVMX_PIP_STAT_INB_PKTSX(port_num));
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  401  	pip_stat_inb_octsx.u64 =
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  402  	    cvmx_read_csr(CVMX_PIP_STAT_INB_OCTSX(port_num));
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  403  	pip_stat_inb_errsx.u64 =
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  404  	    cvmx_read_csr(CVMX_PIP_STAT_INB_ERRSX(port_num));
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  405  
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05 @406  	status->dropped_octets = stat0.s.drp_octs;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  407  	status->dropped_packets = stat0.s.drp_pkts;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  408  	status->octets = stat1.s.octs;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  409  	status->pci_raw_packets = stat2.s.raw;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  410  	status->packets = stat2.s.pkts;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  411  	status->multicast_packets = stat3.s.mcst;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  412  	status->broadcast_packets = stat3.s.bcst;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  413  	status->len_64_packets = stat4.s.h64;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  414  	status->len_65_127_packets = stat4.s.h65to127;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  415  	status->len_128_255_packets = stat5.s.h128to255;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  416  	status->len_256_511_packets = stat5.s.h256to511;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  417  	status->len_512_1023_packets = stat6.s.h512to1023;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  418  	status->len_1024_1518_packets = stat6.s.h1024to1518;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  419  	status->len_1519_max_packets = stat7.s.h1519;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  420  	status->fcs_align_err_packets = stat7.s.fcs;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  421  	status->runt_packets = stat8.s.undersz;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  422  	status->runt_crc_packets = stat8.s.frag;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  423  	status->oversize_packets = stat9.s.oversz;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  424  	status->oversize_crc_packets = stat9.s.jabber;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  425  	status->inb_packets = pip_stat_inb_pktsx.s.pkts;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  426  	status->inb_octets = pip_stat_inb_octsx.s.octs;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  427  	status->inb_errors = pip_stat_inb_errsx.s.errs;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  428  
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  429  	if (cvmx_octeon_is_pass1()) {
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  430  		/*
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  431  		 * Kludge to fix Octeon Pass 1 errata - Drop counts
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  432  		 * don't work.
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  433  		 */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  434  		if (status->inb_packets > status->packets)
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  435  			status->dropped_packets =
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  436  			    status->inb_packets - status->packets;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  437  		else
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  438  			status->dropped_packets = 0;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  439  		if (status->inb_octets - status->inb_packets * 4 >
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  440  		    status->octets)
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  441  			status->dropped_octets =
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  442  			    status->inb_octets - status->inb_packets * 4 -
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  443  			    status->octets;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  444  		else
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  445  			status->dropped_octets = 0;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  446  	}
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  447  }
80ff0fd3ab64514 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  448  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
