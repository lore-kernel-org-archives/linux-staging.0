Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B64D34F46A;
	Tue, 13 Jan 2026 04:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768277138; cv=none; b=FrJnSZx68AmdG83fJapw9RdFqWqtyFqknkxHsfu4sD9k55eXTwUb6Enu7zmm0vHRayBdld+S8sK3WGiwpleoaqlKzgSMem7TGDey2SXDfOdsIFU7enE9Mjh+sVb7UEyHOxpRaDkQ1oj10e6GIym/j6p+d0HDx4kyx4Ed0AalSYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768277138; c=relaxed/simple;
	bh=JAvD42DEp/J+hq/XcUocuUDb7ccfeSPR/tkE5oQzvwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uwud6MslewYo6tW7gIgNVt+J7xdrDxQ2Tl8DRF4Tr+S0JoLQotN7uf7o6FGkyMqKmBdMziAECM/SYs6u6JeESvL9BogMVUpJy4mZo/dz1rLoQPTsqpZe+yXGU69WP7CULtVzXhgZvxhV9cnFbj5Cpf7cYFZWplcgxSL/IcBgon0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QSOn21mo; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QSOn21mo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768277137; x=1799813137;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JAvD42DEp/J+hq/XcUocuUDb7ccfeSPR/tkE5oQzvwQ=;
  b=QSOn21monE6JfTF7ljQE3l+heZN1caOZAAZN7YtETihqS53XY4WVwREz
   SsTjrUoLRlTmnqxPdUYu9XIjNvAZugoL0Ofkq46orSW/woJZEG9xBZcl3
   KSFJSaw17akKXKC6DgWHWv6T1iEEhy3wxPviYUOLlGxWQaqruIVpXBMVf
   Gm1zJeAdgqwU2Qr/heaiuAmzSxLUa5wR79TzfbKlw6fvGGgMY+7LAlOPi
   HX+F3leLVmOXNDTjlOiJvUaUOgcU5G9b06Zi8796usA5rmRfr8NhgOjSI
   zrLTMlkH7yv9Mc/slEmuM6Q6Wp8ZpLvvaEbvwZqjhS0vJLofEd8RcKg90
   g==;
X-CSE-ConnectionGUID: TrG1ovwRREGM2kVboAODuA==
X-CSE-MsgGUID: Q21elZ1uR3iE358fXqzyZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80201919"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80201919"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 20:05:35 -0800
X-CSE-ConnectionGUID: SBoXRcZtT8CkM66bXqIZeg==
X-CSE-MsgGUID: wiZNVPtrQN6+mRcLYjnVOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204173413"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jan 2026 20:05:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfVet-00000000EC4-2dKX;
	Tue, 13 Jan 2026 04:05:31 +0000
Date: Tue, 13 Jan 2026 12:04:55 +0800
From: kernel test robot <lkp@intel.com>
To: Karthikey Kadati <karthikey3608@gmail.com>, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey Kadati <karthikey3608@gmail.com>
Subject: Re: [PATCH v2] staging: octeon: Remove port status typedefs
Message-ID: <202601131108.A90iCRFi-lkp@intel.com>
References: <20260112103843.22925-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112103843.22925-1-karthikey3608@gmail.com>

Hi Karthikey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Karthikey-Kadati/staging-octeon-Remove-port-status-typedefs/20260112-184331
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260112103843.22925-1-karthikey3608%40gmail.com
patch subject: [PATCH v2] staging: octeon: Remove port status typedefs
config: mips-cavium_octeon_defconfig (https://download.01.org/0day-ci/archive/20260113/202601131108.A90iCRFi-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131108.A90iCRFi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131108.A90iCRFi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/octeon/ethernet.c: In function 'cvm_oct_common_get_stats':
   drivers/staging/octeon/ethernet.c:204:37: error: storage size of 'rx_status' isn't known
     204 |         struct cvmx_pip_port_status rx_status;
         |                                     ^~~~~~~~~
   drivers/staging/octeon/ethernet.c:205:37: error: storage size of 'tx_status' isn't known
     205 |         struct cvmx_pko_port_status tx_status;
         |                                     ^~~~~~~~~
>> drivers/staging/octeon/ethernet.c:205:37: warning: unused variable 'tx_status' [-Wunused-variable]
>> drivers/staging/octeon/ethernet.c:204:37: warning: unused variable 'rx_status' [-Wunused-variable]
     204 |         struct cvmx_pip_port_status rx_status;
         |                                     ^~~~~~~~~


vim +/tx_status +205 drivers/staging/octeon/ethernet.c

   195	
   196	/**
   197	 * cvm_oct_common_get_stats - get the low level ethernet statistics
   198	 * @dev:    Device to get the statistics from
   199	 *
   200	 * Returns Pointer to the statistics
   201	 */
   202	static struct net_device_stats *cvm_oct_common_get_stats(struct net_device *dev)
   203	{
 > 204		struct cvmx_pip_port_status rx_status;
 > 205		struct cvmx_pko_port_status tx_status;
   206		struct octeon_ethernet *priv = netdev_priv(dev);
   207	
   208		if (priv->port < CVMX_PIP_NUM_INPUT_PORTS) {
   209			if (octeon_is_simulation()) {
   210				/* The simulator doesn't support statistics */
   211				memset(&rx_status, 0, sizeof(rx_status));
   212				memset(&tx_status, 0, sizeof(tx_status));
   213			} else {
   214				cvmx_pip_get_port_status(priv->port, 1, &rx_status);
   215				cvmx_pko_get_port_status(priv->port, 1, &tx_status);
   216			}
   217	
   218			dev->stats.rx_packets += rx_status.inb_packets;
   219			dev->stats.tx_packets += tx_status.packets;
   220			dev->stats.rx_bytes += rx_status.inb_octets;
   221			dev->stats.tx_bytes += tx_status.octets;
   222			dev->stats.multicast += rx_status.multicast_packets;
   223			dev->stats.rx_crc_errors += rx_status.inb_errors;
   224			dev->stats.rx_frame_errors += rx_status.fcs_align_err_packets;
   225			dev->stats.rx_dropped += rx_status.dropped_packets;
   226		}
   227	
   228		return &dev->stats;
   229	}
   230	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
