Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6251DF73A;
	Mon, 19 Jan 2026 04:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768797314; cv=none; b=VY457lWu5euiiacWOvqJhjVcPtgIj4y0VOvSVpN6JPrJjxcYOjD4exz2JvVNgOFM5GMRXeWYJkN4Mv4qNEaVNHoue4eZY6W986R6cC3xQsGgJwhCHO52onj+Jjn6kYAoIMS2dpk6lBLBVzhLaFLG3wMOrzRJCIYY4avIR9JeDEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768797314; c=relaxed/simple;
	bh=14AFX2XXFJWmVmlBx2JfYykQ+kgmXPU4GCLN78GgGcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hUmoeeU3nnSlQoC5ufYCPQFmQkOHeg23Fr9dcugUv4Z6Y7mAQdzQThdXOlArDreSD2LPP58GysaWbcyrJJjiiCPacifXPYYhBj82YFQ8r3q5iM2jregqJMHp9u3UBO88tVFytvpR/rUPwp/9jQ8nDg4L5KdBpBob3AQQdhlVQsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESwzi+8N; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESwzi+8N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768797312; x=1800333312;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=14AFX2XXFJWmVmlBx2JfYykQ+kgmXPU4GCLN78GgGcM=;
  b=ESwzi+8NXbO5FmJA4+BM+HRkehLfnzc/O04CGEwjMbuVBnky+odFxN15
   Poe3e0tKB/4eI+Mu1lq37ebYY3UVv4L0FdxagkQXQp7TN7KcmmCkDb49j
   h+VpmcnioL6qxeMXpKnPiIH6tJBjepVpUrdGSjKBg27cSJMNdZOf+oQOf
   snIxNXCyZKRo77RVjfY0pAV3aMuhDcNKJtk7Cf3FDETEFNE4zhcVea57q
   wzAUkp9uHl8xjrupTLit07B1pTcgtkuoV7iQXlEOBi/cKIcV5CY95GQiU
   3bazhRlzFa7nHr2EVlln+NLIjqsXXIjFKrDQ4kVCFPESSTGurApPagqCr
   Q==;
X-CSE-ConnectionGUID: I+Z7mkpOQdKrYWjG5m21qQ==
X-CSE-MsgGUID: LKqljLkhSZ+2lZoNRPkPqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="81448592"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="81448592"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 20:35:11 -0800
X-CSE-ConnectionGUID: U3hAF+izSkmEz5zzo3uZ5Q==
X-CSE-MsgGUID: i6IWpNEGQX20ZJjfRevncA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="206196079"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Jan 2026 20:35:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhgyo-00000000NSf-3oZ3;
	Mon, 19 Jan 2026 04:35:06 +0000
Date: Mon, 19 Jan 2026 12:34:41 +0800
From: kernel test robot <lkp@intel.com>
To: Karthikey Kadati <karthikey3608@gmail.com>, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, karthikey3608@gmail.com
Subject: Re: [PATCH v6] staging: octeon: Remove port status typedefs
Message-ID: <202601191235.4xhLbfRC-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Karthikey-Kadati/staging-octeon-Remove-port-status-typedefs/20260119-011605
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260118171348.54963-1-karthikey3608%40gmail.com
patch subject: [PATCH v6] staging: octeon: Remove port status typedefs
config: mips-randconfig-r063-20260119 (https://download.01.org/0day-ci/archive/20260119/202601191235.4xhLbfRC-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601191235.4xhLbfRC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601191235.4xhLbfRC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/mips/cavium-octeon/executive/cvmx-helper.c:39:
>> arch/mips/include/asm/octeon/cvmx-pip.h:183:1: warning: typedef requires a name [-Wmissing-declarations]
     183 | typedef struct {
         | ^~~~~~~
>> arch/mips/include/asm/octeon/cvmx-pip.h:368:17: warning: declaration of 'struct cvmx_pip_port_status' will not be visible outside of this function [-Wvisibility]
     368 |                                             struct cvmx_pip_port_status *status)
         |                                                    ^
   arch/mips/include/asm/octeon/cvmx-pip.h:406:8: error: incomplete definition of type 'struct cvmx_pip_port_status'
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


vim +183 arch/mips/include/asm/octeon/cvmx-pip.h

80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  179  
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  180  /**
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  181   * Status statistics for a port
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  182   */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05 @183  typedef struct {
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  184  	/* Inbound octets marked to be dropped by the IPD */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  185  	uint32_t dropped_octets;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  186  	/* Inbound packets marked to be dropped by the IPD */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  187  	uint32_t dropped_packets;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  188  	/* RAW PCI Packets received by PIP per port */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  189  	uint32_t pci_raw_packets;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  190  	/* Number of octets processed by PIP */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  191  	uint32_t octets;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  192  	/* Number of packets processed by PIP */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  193  	uint32_t packets;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  194  	/*
3f79410c7c9c8e arch/mips/include/asm/octeon/cvmx-pip.h Maxime Jayat     2013-10-12  195  	 * Number of identified L2 multicast packets.	Does not
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  196  	 * include broadcast packets.  Only includes packets whose
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  197  	 * parse mode is SKIP_TO_L2
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  198  	 */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  199  	uint32_t multicast_packets;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  200  	/*
3f79410c7c9c8e arch/mips/include/asm/octeon/cvmx-pip.h Maxime Jayat     2013-10-12  201  	 * Number of identified L2 broadcast packets.	Does not
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  202  	 * include multicast packets.  Only includes packets whose
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  203  	 * parse mode is SKIP_TO_L2
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  204  	 */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  205  	uint32_t broadcast_packets;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  206  	/* Number of 64B packets */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  207  	uint32_t len_64_packets;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  208  	/* Number of 65-127B packets */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  209  	uint32_t len_65_127_packets;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  210  	/* Number of 128-255B packets */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  211  	uint32_t len_128_255_packets;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  212  	/* Number of 256-511B packets */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  213  	uint32_t len_256_511_packets;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  214  	/* Number of 512-1023B packets */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  215  	uint32_t len_512_1023_packets;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  216  	/* Number of 1024-1518B packets */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  217  	uint32_t len_1024_1518_packets;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  218  	/* Number of 1519-max packets */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  219  	uint32_t len_1519_max_packets;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  220  	/* Number of packets with FCS or Align opcode errors */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  221  	uint32_t fcs_align_err_packets;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  222  	/* Number of packets with length < min */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  223  	uint32_t runt_packets;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  224  	/* Number of packets with length < min and FCS error */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  225  	uint32_t runt_crc_packets;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  226  	/* Number of packets with length > max */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  227  	uint32_t oversize_packets;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  228  	/* Number of packets with length > max and FCS error */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  229  	uint32_t oversize_crc_packets;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  230  	/* Number of packets without GMX/SPX/PCI errors received by PIP */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  231  	uint32_t inb_packets;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  232  	/*
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  233  	 * Total number of octets from all packets received by PIP,
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  234  	 * including CRC
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  235  	 */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  236  	uint64_t inb_octets;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  237  	/* Number of packets with GMX/SPX/PCI errors received by PIP */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  238  	uint16_t inb_errors;
716d4b538311a3 arch/mips/include/asm/octeon/cvmx-pip.h Karthikey Kadati 2026-01-18  239  };
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  240  
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  241  /**
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  242   * Definition of the PIP custom header that can be prepended
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  243   * to a packet by external hardware.
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  244   */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  245  typedef union {
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  246  	uint64_t u64;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  247  	struct {
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  248  		/*
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  249  		 * Documented as R - Set if the Packet is RAWFULL. If
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  250  		 * set, this header must be the full 8 bytes.
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  251  		 */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  252  		uint64_t rawfull:1;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  253  		/* Must be zero */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  254  		uint64_t reserved0:5;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  255  		/* PIP parse mode for this packet */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  256  		uint64_t parse_mode:2;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  257  		/* Must be zero */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  258  		uint64_t reserved1:1;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  259  		/*
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  260  		 * Skip amount, including this header, to the
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  261  		 * beginning of the packet
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  262  		 */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  263  		uint64_t skip_len:7;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  264  		/* Must be zero */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  265  		uint64_t reserved2:6;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  266  		/* POW input queue for this packet */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  267  		uint64_t qos:3;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  268  		/* POW input group for this packet */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  269  		uint64_t grp:4;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  270  		/*
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  271  		 * Flag to store this packet in the work queue entry,
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  272  		 * if possible
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  273  		 */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  274  		uint64_t rs:1;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  275  		/* POW input tag type */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  276  		uint64_t tag_type:2;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  277  		/* POW input tag */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  278  		uint64_t tag:32;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  279  	} s;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  280  } cvmx_pip_pkt_inst_hdr_t;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  281  
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  282  /* CSR typedefs have been moved to cvmx-csr-*.h */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  283  
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  284  /**
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  285   * Configure an ethernet input port
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  286   *
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  287   * @port_num: Port number to configure
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  288   * @port_cfg: Port hardware configuration
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  289   * @port_tag_cfg:
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  290   *		   Port POW tagging configuration
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  291   */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  292  static inline void cvmx_pip_config_port(uint64_t port_num,
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  293  					union cvmx_pip_prt_cfgx port_cfg,
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  294  					union cvmx_pip_prt_tagx port_tag_cfg)
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  295  {
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  296  	cvmx_write_csr(CVMX_PIP_PRT_CFGX(port_num), port_cfg.u64);
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  297  	cvmx_write_csr(CVMX_PIP_PRT_TAGX(port_num), port_tag_cfg.u64);
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  298  }
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  299  #if 0
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  300  /**
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  301   * @deprecated	    This function is a thin wrapper around the Pass1 version
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  302   *		    of the CVMX_PIP_QOS_WATCHX CSR; Pass2 has added a field for
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  303   *		    setting the group that is incompatible with this function,
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  304   *		    the preferred upgrade path is to use the CSR directly.
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  305   *
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  306   * Configure the global QoS packet watchers. Each watcher is
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  307   * capable of matching a field in a packet to determine the
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  308   * QoS queue for scheduling.
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  309   *
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  310   * @watcher:	Watcher number to configure (0 - 3).
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  311   * @match_type: Watcher match type
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  312   * @match_value:
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  313   *		     Value the watcher will match against
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  314   * @qos:	QoS queue for packets matching this watcher
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  315   */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  316  static inline void cvmx_pip_config_watcher(uint64_t watcher,
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  317  					   cvmx_pip_qos_watch_types match_type,
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  318  					   uint64_t match_value, uint64_t qos)
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  319  {
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  320  	cvmx_pip_port_watcher_cfg_t watcher_config;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  321  
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  322  	watcher_config.u64 = 0;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  323  	watcher_config.s.match_type = match_type;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  324  	watcher_config.s.match_value = match_value;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  325  	watcher_config.s.qos = qos;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  326  
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  327  	cvmx_write_csr(CVMX_PIP_QOS_WATCHX(watcher), watcher_config.u64);
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  328  }
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  329  #endif
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  330  /**
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  331   * Configure the VLAN priority to QoS queue mapping.
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  332   *
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  333   * @vlan_priority:
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  334   *		 VLAN priority (0-7)
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  335   * @qos:    QoS queue for packets matching this watcher
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  336   */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  337  static inline void cvmx_pip_config_vlan_qos(uint64_t vlan_priority,
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  338  					    uint64_t qos)
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  339  {
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  340  	union cvmx_pip_qos_vlanx pip_qos_vlanx;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  341  	pip_qos_vlanx.u64 = 0;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  342  	pip_qos_vlanx.s.qos = qos;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  343  	cvmx_write_csr(CVMX_PIP_QOS_VLANX(vlan_priority), pip_qos_vlanx.u64);
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  344  }
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  345  
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  346  /**
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  347   * Configure the Diffserv to QoS queue mapping.
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  348   *
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  349   * @diffserv: Diffserv field value (0-63)
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  350   * @qos:      QoS queue for packets matching this watcher
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  351   */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  352  static inline void cvmx_pip_config_diffserv_qos(uint64_t diffserv, uint64_t qos)
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  353  {
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  354  	union cvmx_pip_qos_diffx pip_qos_diffx;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  355  	pip_qos_diffx.u64 = 0;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  356  	pip_qos_diffx.s.qos = qos;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  357  	cvmx_write_csr(CVMX_PIP_QOS_DIFFX(diffserv), pip_qos_diffx.u64);
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  358  }
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  359  
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  360  /**
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  361   * Get the status counters for a port.
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  362   *
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  363   * @port_num: Port number to get statistics for.
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  364   * @clear:    Set to 1 to clear the counters after they are read
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  365   * @status:   Where to put the results.
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  366   */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  367  static inline void cvmx_pip_get_port_status(uint64_t port_num, uint64_t clear,
716d4b538311a3 arch/mips/include/asm/octeon/cvmx-pip.h Karthikey Kadati 2026-01-18 @368  					    struct cvmx_pip_port_status *status)
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  369  {
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  370  	union cvmx_pip_stat_ctl pip_stat_ctl;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  371  	union cvmx_pip_stat0_prtx stat0;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  372  	union cvmx_pip_stat1_prtx stat1;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  373  	union cvmx_pip_stat2_prtx stat2;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  374  	union cvmx_pip_stat3_prtx stat3;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  375  	union cvmx_pip_stat4_prtx stat4;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  376  	union cvmx_pip_stat5_prtx stat5;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  377  	union cvmx_pip_stat6_prtx stat6;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  378  	union cvmx_pip_stat7_prtx stat7;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  379  	union cvmx_pip_stat8_prtx stat8;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  380  	union cvmx_pip_stat9_prtx stat9;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  381  	union cvmx_pip_stat_inb_pktsx pip_stat_inb_pktsx;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  382  	union cvmx_pip_stat_inb_octsx pip_stat_inb_octsx;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  383  	union cvmx_pip_stat_inb_errsx pip_stat_inb_errsx;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  384  
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  385  	pip_stat_ctl.u64 = 0;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  386  	pip_stat_ctl.s.rdclr = clear;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  387  	cvmx_write_csr(CVMX_PIP_STAT_CTL, pip_stat_ctl.u64);
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  388  
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  389  	stat0.u64 = cvmx_read_csr(CVMX_PIP_STAT0_PRTX(port_num));
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  390  	stat1.u64 = cvmx_read_csr(CVMX_PIP_STAT1_PRTX(port_num));
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  391  	stat2.u64 = cvmx_read_csr(CVMX_PIP_STAT2_PRTX(port_num));
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  392  	stat3.u64 = cvmx_read_csr(CVMX_PIP_STAT3_PRTX(port_num));
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  393  	stat4.u64 = cvmx_read_csr(CVMX_PIP_STAT4_PRTX(port_num));
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  394  	stat5.u64 = cvmx_read_csr(CVMX_PIP_STAT5_PRTX(port_num));
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  395  	stat6.u64 = cvmx_read_csr(CVMX_PIP_STAT6_PRTX(port_num));
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  396  	stat7.u64 = cvmx_read_csr(CVMX_PIP_STAT7_PRTX(port_num));
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  397  	stat8.u64 = cvmx_read_csr(CVMX_PIP_STAT8_PRTX(port_num));
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  398  	stat9.u64 = cvmx_read_csr(CVMX_PIP_STAT9_PRTX(port_num));
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  399  	pip_stat_inb_pktsx.u64 =
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  400  	    cvmx_read_csr(CVMX_PIP_STAT_INB_PKTSX(port_num));
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  401  	pip_stat_inb_octsx.u64 =
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  402  	    cvmx_read_csr(CVMX_PIP_STAT_INB_OCTSX(port_num));
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  403  	pip_stat_inb_errsx.u64 =
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  404  	    cvmx_read_csr(CVMX_PIP_STAT_INB_ERRSX(port_num));
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  405  
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  406  	status->dropped_octets = stat0.s.drp_octs;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  407  	status->dropped_packets = stat0.s.drp_pkts;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  408  	status->octets = stat1.s.octs;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  409  	status->pci_raw_packets = stat2.s.raw;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  410  	status->packets = stat2.s.pkts;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  411  	status->multicast_packets = stat3.s.mcst;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  412  	status->broadcast_packets = stat3.s.bcst;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  413  	status->len_64_packets = stat4.s.h64;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  414  	status->len_65_127_packets = stat4.s.h65to127;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  415  	status->len_128_255_packets = stat5.s.h128to255;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  416  	status->len_256_511_packets = stat5.s.h256to511;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  417  	status->len_512_1023_packets = stat6.s.h512to1023;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  418  	status->len_1024_1518_packets = stat6.s.h1024to1518;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  419  	status->len_1519_max_packets = stat7.s.h1519;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  420  	status->fcs_align_err_packets = stat7.s.fcs;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  421  	status->runt_packets = stat8.s.undersz;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  422  	status->runt_crc_packets = stat8.s.frag;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  423  	status->oversize_packets = stat9.s.oversz;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  424  	status->oversize_crc_packets = stat9.s.jabber;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  425  	status->inb_packets = pip_stat_inb_pktsx.s.pkts;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  426  	status->inb_octets = pip_stat_inb_octsx.s.octs;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  427  	status->inb_errors = pip_stat_inb_errsx.s.errs;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  428  
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  429  	if (cvmx_octeon_is_pass1()) {
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  430  		/*
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  431  		 * Kludge to fix Octeon Pass 1 errata - Drop counts
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  432  		 * don't work.
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  433  		 */
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  434  		if (status->inb_packets > status->packets)
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  435  			status->dropped_packets =
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  436  			    status->inb_packets - status->packets;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  437  		else
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  438  			status->dropped_packets = 0;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  439  		if (status->inb_octets - status->inb_packets * 4 >
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  440  		    status->octets)
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  441  			status->dropped_octets =
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  442  			    status->inb_octets - status->inb_packets * 4 -
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  443  			    status->octets;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  444  		else
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  445  			status->dropped_octets = 0;
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  446  	}
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  447  }
80ff0fd3ab6451 drivers/staging/octeon/cvmx-pip.h       David Daney      2009-05-05  448  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
