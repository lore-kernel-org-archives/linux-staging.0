Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F2E269CE7;
	Tue, 13 Jan 2026 07:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768288475; cv=none; b=BPLhMcySeKi2CFaQZ77XFZ/R8vviY1UXvaaa3SO4uQpkwtIuXUuiPm7ad/0T13HDlcUyNcIZOTaEwrs8s8AxxFbS+5hCwZAjwxu3bw02MCPhf59GO+p/1o9/SH8bxYQSTZGDHlcbuuTg6pSsdKIZA1Gz7DkaQccOO87ezF96mWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768288475; c=relaxed/simple;
	bh=SEQo4oFqcKaUDpfslefebkQ2vYAUQX4b4Ra6yXGXT94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JLMh2LYVhN6BxRnT+xujJLKkp9UnARgquW8jt72mp4hv5WltEObmlrL7QdCaOeW2TO3CdNXwFqKirTMxhB7LGFZiPdjFxhmGY0q0cd1aiWHAdN5/oowqzDkv/Mi5n3qG/FZBgR52EVMumOHTthEFZGPXioCKtHfgvrJkHmanR+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DVJIK0cJ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DVJIK0cJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768288473; x=1799824473;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SEQo4oFqcKaUDpfslefebkQ2vYAUQX4b4Ra6yXGXT94=;
  b=DVJIK0cJp6j25/LCiZHmbnVolZJbInunvB6+HoqhiRf2zcil3DnS252L
   CfteaozK/R6jQJIFjUAV/NGDdjhhDpLFujG4L83aGR3qFraFaKpe/bB0K
   bfVwSN1M6Se//FHQxtN8TqX0uZ808WEwBbFR9QbFD5hWu5VXGf/wn9S/k
   lfz3xGcFdgROHayKszep6nBKZUFBwzXGxmgTXhjEYzDNUX6YT1wIQfxTg
   NM/TTD4n13QfslMdVtu41Bwvn4yu2PvXfusAsOD3uL1335KBMcDJEKkDR
   ilk5ExVGv8T6kYydvS6yYIhI+aISAyGgBPcSemS52dexccc+9y98I53rY
   Q==;
X-CSE-ConnectionGUID: PbUyh7X0SRiOchm1ftFj6A==
X-CSE-MsgGUID: lxiNgMmASQiD3STd8HR2ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69621876"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69621876"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:14:32 -0800
X-CSE-ConnectionGUID: k2JGKfvKQva50R0FF3oxmg==
X-CSE-MsgGUID: HvnbCXBDTrWlvfhei3TLHA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Jan 2026 23:14:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfYbk-00000000EMK-3usd;
	Tue, 13 Jan 2026 07:14:28 +0000
Date: Tue, 13 Jan 2026 15:14:15 +0800
From: kernel test robot <lkp@intel.com>
To: Karthikey Kadati <karthikey3608@gmail.com>, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey Kadati <karthikey3608@gmail.com>
Subject: Re: [PATCH v2] staging: octeon: Remove port status typedefs
Message-ID: <202601131457.WXtsu2Uh-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Karthikey-Kadati/staging-octeon-Remove-port-status-typedefs/20260112-184331
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260112103843.22925-1-karthikey3608%40gmail.com
patch subject: [PATCH v2] staging: octeon: Remove port status typedefs
config: mips-cavium_octeon_defconfig (https://download.01.org/0day-ci/archive/20260113/202601131457.WXtsu2Uh-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131457.WXtsu2Uh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131457.WXtsu2Uh-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/octeon/ethernet.c: In function 'cvm_oct_common_get_stats':
>> drivers/staging/octeon/ethernet.c:204:37: error: storage size of 'rx_status' isn't known
     204 |         struct cvmx_pip_port_status rx_status;
         |                                     ^~~~~~~~~
>> drivers/staging/octeon/ethernet.c:205:37: error: storage size of 'tx_status' isn't known
     205 |         struct cvmx_pko_port_status tx_status;
         |                                     ^~~~~~~~~
   drivers/staging/octeon/ethernet.c:205:37: warning: unused variable 'tx_status' [-Wunused-variable]
   drivers/staging/octeon/ethernet.c:204:37: warning: unused variable 'rx_status' [-Wunused-variable]
     204 |         struct cvmx_pip_port_status rx_status;
         |                                     ^~~~~~~~~


vim +204 drivers/staging/octeon/ethernet.c

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
