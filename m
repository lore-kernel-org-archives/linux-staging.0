Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4FB14A86;
	Sun, 27 Aug 2023 23:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693180450; x=1724716450;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0unl+7UGLoLsPdQGQFRqLyo3PBIGt5rJmUDQfglf4X8=;
  b=LS4I+B9WcmjZrTAyintydixLM/ex91Y62vysa3/MNRUB9k2FvUUZyDMh
   0XnISFeojcy0dDB3QXwdB1sWwjbETlIIB93KaW9M7XrwvzQaySI1ZWIHR
   OkJAfScCrKc+yYRoqDtz+23b5y1NTc7ifVWg/cL16awCkH0HvMPzhcpwF
   S4sZdc/4+esYdvXbtkDfSTuu/6Aj/4SvjSoQq0FXNcgsCGM+jnQ78QtlG
   DYlcfqbdWvnUY5uS3BGECqNep1V7bGnc8OGodE3Dy9I7fR7OAwTJSSE5g
   BSWwKhG7ESLG36k7eDPaTDqs2d2xwNIOuH+Sk0qPQurFMyKuKXmh1j1Wv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="359974690"
X-IronPort-AV: E=Sophos;i="6.02,206,1688454000"; 
   d="scan'208";a="359974690"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 16:54:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="1068846851"
X-IronPort-AV: E=Sophos;i="6.02,206,1688454000"; 
   d="scan'208";a="1068846851"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 27 Aug 2023 16:54:06 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaPa2-0006KR-0M;
	Sun, 27 Aug 2023 23:54:06 +0000
Date: Mon, 28 Aug 2023 07:53:15 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Crumrine <ozlinux@hotmail.com>, gregkh@linuxfoundation.org,
	colin.i.king@gmail.com, sumitraartsy@gmail.com,
	u.kleine-koenig@pengutronix.de, geert@linux-m68k.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 6/6] staging: octeon: clean up the octeon ethernet driver
Message-ID: <202308280707.qz6xetpa-lkp@intel.com>
References: <PH7PR11MB7643F9F5DBB6781022CC4F4DBCE1A@PH7PR11MB7643.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH7PR11MB7643F9F5DBB6781022CC4F4DBCE1A@PH7PR11MB7643.namprd11.prod.outlook.com>

Hi Oliver,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Oliver-Crumrine/staging-octeon-clean-up-the-octeon-ethernet-driver/20230828-051802
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/PH7PR11MB7643F9F5DBB6781022CC4F4DBCE1A%40PH7PR11MB7643.namprd11.prod.outlook.com
patch subject: [PATCH 6/6] staging: octeon: clean up the octeon ethernet driver
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230828/202308280707.qz6xetpa-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308280707.qz6xetpa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308280707.qz6xetpa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/octeon/ethernet.c: In function 'cvm_oct_common_get_stats':
   drivers/staging/octeon/ethernet.c:204:39: error: storage size of 'rx_status' isn't known
     204 |         struct cvmx_pip_port_status_t rx_status;
         |                                       ^~~~~~~~~
>> drivers/staging/octeon/ethernet.c:204:39: warning: unused variable 'rx_status' [-Wunused-variable]


vim +/rx_status +204 drivers/staging/octeon/ethernet.c

   195	
   196	/**
   197	 * cvm_oct_common_get_stats - get the low level ethernet statistics
   198	 * @dev:    Device to get the statistics from
   199	 *
   200	 * Returns Pointer to the statistics
   201	 */
   202	static struct net_device_stats *cvm_oct_common_get_stats(struct net_device *dev)
   203	{
 > 204		struct cvmx_pip_port_status_t rx_status;
   205		cvmx_pko_port_status_t tx_status;
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
