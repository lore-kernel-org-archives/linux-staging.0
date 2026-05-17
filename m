Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7601C84BC;
	Sun, 17 May 2026 19:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779044452; cv=none; b=rQNcGFIeVafuePV/01iDdueH1v4NBN4f4P1OLIBZCqrm+8TWwH78DkrpYiJddLA+Q8fldv81JqaAEMK0f/XG9iboMwn7b7QdCcJiB4ZfG1V3U8W7SNB/4D10RHzfMmlq8MCeF+eglA2zlA8t/nOzNWKLN0wfPu71U8qmOd17KrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779044452; c=relaxed/simple;
	bh=STObEROyoT4+wLR/jIvqjJqwLhTr0Y6ltjsbAQ6M4Y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HAmOxWARCQ2BqYOM/iIIHv8QWiKR3SfjQTOuhQ4EjY/tLsnX8WGsfJlMxmXW3au1A/mKqSsOA8ICMOxwvTzo3UU/ISLZoXdjPq9ehom7yY2FjJ8lZkHfVL9EmXy3vo5dCmCv4Mp1YjpjtTAFKQRJuYn+CVRbD47i/ZOjNG69eLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lbrhUKmg; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lbrhUKmg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779044451; x=1810580451;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=STObEROyoT4+wLR/jIvqjJqwLhTr0Y6ltjsbAQ6M4Y4=;
  b=lbrhUKmgUlAZ8vvQuXigzXuK7MQnLw880BQaTVqSFtzpudj3o8eXuIPj
   D05W41NNGJMiX93q8EFydf44/dxbXH6wr8kg2gaSPIYComosYximtR6FG
   EG2mwxqdWU+HNNQqFL3Sb6wOAdlZe6oS7OjXD5dlV7IkXskjNwU8GJCbO
   R7c5Pt6TGtXQEwzL1oE7QLuXomSvJFDYF3HHpIVZ4x170D0KH2tPOZoWC
   Kl8pf7N7Vxt9OAuaWqbl7bRtdrLEOOFJQzHBSqO6lXhtFWKXCJDG5z/k0
   zUYowDH8oGgAo43Y+AcGLE5NT/o2YSe5ybgB2tju5tTmzBMIRZwIMmLy8
   A==;
X-CSE-ConnectionGUID: b29nRKuDTnKSmEZflvkPLQ==
X-CSE-MsgGUID: wikDFAnWRm+wLXFZvNQVkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="80031736"
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; 
   d="scan'208";a="80031736"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 12:00:50 -0700
X-CSE-ConnectionGUID: DD4UPBvLQ5C+z/MRBdp93Q==
X-CSE-MsgGUID: 1YK5O1uuTRCsKQeoD2Umfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; 
   d="scan'208";a="238229279"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 May 2026 12:00:49 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOgjF-000000001tK-498a;
	Sun, 17 May 2026 19:00:45 +0000
Date: Mon, 18 May 2026 03:00:22 +0800
From: kernel test robot <lkp@intel.com>
To: shayderrr <darknessshayder@gmail.com>, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pranav Bajjuri <darknessshayder@gmail.com>
Subject: Re: [PATCH] net: octeon: fix carrier state, null guard, and
 modernize phy ioctl
Message-ID: <202605180212.LjnBydnh-lkp@intel.com>
References: <20260517141955.79666-1-darknessshayder@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517141955.79666-1-darknessshayder@gmail.com>

Hi shayderrr,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]
[also build test ERROR on staging/staging-next staging/staging-linus linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/shayderrr/net-octeon-fix-carrier-state-null-guard-and-modernize-phy-ioctl/20260517-222121
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260517141955.79666-1-darknessshayder%40gmail.com
patch subject: [PATCH] net: octeon: fix carrier state, null guard, and modernize phy ioctl
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260518/202605180212.LjnBydnh-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605180212.LjnBydnh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605180212.LjnBydnh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/octeon/ethernet-mdio.c:91:6: error: conflicting types for 'cvm_oct_common_stop'; have 'void(struct net_device *)'
      91 | void cvm_oct_common_stop(struct net_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~
   In file included from drivers/staging/octeon/ethernet-mdio.c:15:
   drivers/staging/octeon/octeon-ethernet.h:90:5: note: previous declaration of 'cvm_oct_common_stop' with type 'int(struct net_device *)'
      90 | int cvm_oct_common_stop(struct net_device *dev);
         |     ^~~~~~~~~~~~~~~~~~~


vim +91 drivers/staging/octeon/ethernet-mdio.c

    90	
  > 91	void cvm_oct_common_stop(struct net_device *dev)
    92	{
    93		struct octeon_ethernet *priv = netdev_priv(dev);
    94		int interface = INTERFACE(priv->port);
    95		int index = INDEX(priv->port);
    96		union cvmx_helper_link_info link_info;
    97		union cvmx_gmxx_prtx_cfg gmx_cfg;
    98	
    99		gmx_cfg.u64 = cvmx_read_csr(CVMX_GMXX_PRTX_CFG(index, interface));
   100		gmx_cfg.s.en = 0;
   101		cvmx_write_csr(CVMX_GMXX_PRTX_CFG(index, interface), gmx_cfg.u64);
   102	
   103		priv->poll = NULL;
   104	
   105		netif_carrier_off(dev);
   106	
   107		if (dev->phydev)
   108			phy_disconnect(dev->phydev);
   109	
   110		if (priv->last_link) {
   111			link_info.u64	= 0;
   112			priv->link_info	= 0;
   113			priv->last_link	= 0;
   114	
   115			cvmx_helper_link_set(priv->port, link_info);
   116			cvm_oct_note_carrier(priv, link_info);
   117		}
   118	}
   119	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
