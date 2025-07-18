Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFF31E1E0B;
	Fri, 18 Jul 2025 05:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752816214; cv=none; b=nFkmDKPfcQUvvEGzqj3R5tmA9BFZCUGmJ+k1IFbSw7tzlt+YEsfhss4tvgz2khLqDm95/a5pXSiTJa+xN153fGcQ7fgVWKjIItusTzXFQ0vzrumTgJJJSx3mcR3a2b91S0+F0LZu632UCL03rl+n/zbdMR5K5wWNUloIuQz4ZOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752816214; c=relaxed/simple;
	bh=BQJ7u5QzwImJwqXT1jKBzsgWbTNy67I2QOWlDIjq+GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NkqcbllFG1sqKHPj5VgVLM+3L4/i9D6upVyl0fUvgBBpft7srpYXlsqRRTa+en7tsdvQqZCIZHvfrEsvog/qPCsWZjwGyMR6sSSEMBtHQ9eREAuEDInM0iQBYbb4UV8+pOhLlruZrRkhQmTjjQLDzpB+fCneN3V672YhQmQ/5yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dQ5qYben; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dQ5qYben"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752816212; x=1784352212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BQJ7u5QzwImJwqXT1jKBzsgWbTNy67I2QOWlDIjq+GQ=;
  b=dQ5qYbenGiB81zq0u6H0EG2JQ2eTXVyZLykZUSjvcmv5G/xTiHJeOx6+
   raByJuc3upHniQDAe+FGUdtcO7pSp4aP6y0ADlNXX9M7rrSHOX4TwZjoG
   d8id4sN8lysDVFBZWaD4Aps2lB8/bXE6lSXv5uDtLOzS4hVnWqq2Cy6SD
   KU+9RbhDC7ws854DFwivmrrCorniF3NdmzrnSG4TINxUxSU7siPu9lnF6
   btthKKAh3Qm8QZRyaxOg5QGW+QXumGvQ7K0COsOpD+PwRkY/N7PhQNPio
   CDq2L9nkRh6RVGQ+bGWtdaqhPXd6Uyx8pqjfUD+Idgz8vl7VNQuf4sGJL
   g==;
X-CSE-ConnectionGUID: l02a9uJGSnKlmuU96nS8QQ==
X-CSE-MsgGUID: hhWPcCalTJ6RVTDmtrNJwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="66553132"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="66553132"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 22:23:29 -0700
X-CSE-ConnectionGUID: 9YZ4ahgLSm6fv/JuvQz3FA==
X-CSE-MsgGUID: 1ennyicLQFSBDdJbAUwcQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="158087118"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jul 2025 22:23:23 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucdZ2-000EKN-0K;
	Fri, 18 Jul 2025 05:23:20 +0000
Date: Fri, 18 Jul 2025 13:23:00 +0800
From: kernel test robot <lkp@intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 20/24] media: i2c: maxim-serdes: add MAX9296A driver
Message-ID: <202507181514.fwoTNxka-lkp@intel.com>
References: <20250716193111.942217-21-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716193111.942217-21-demonsingur@gmail.com>

Hi Cosmin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250716]
[also build test WARNING on v6.16-rc6]
[cannot apply to robh/for-next staging/staging-testing staging/staging-next staging/staging-linus arm64/for-next/core linus/master v6.16-rc6 v6.16-rc5 v6.16-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cosmin-Tanislav/media-mc-Add-INTERNAL-pad-flag/20250717-033901
base:   next-20250716
patch link:    https://lore.kernel.org/r/20250716193111.942217-21-demonsingur%40gmail.com
patch subject: [PATCH v6 20/24] media: i2c: maxim-serdes: add MAX9296A driver
config: i386-randconfig-063-20250718 (https://download.01.org/0day-ci/archive/20250718/202507181514.fwoTNxka-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507181514.fwoTNxka-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507181514.fwoTNxka-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/i2c/maxim-serdes/max9296a.c:1205:27: sparse: sparse: symbol 'max96714_rlms_reg_sequence' was not declared. Should it be static?

vim +/max96714_rlms_reg_sequence +1205 drivers/media/i2c/maxim-serdes/max9296a.c

  1199	
  1200	/*
  1201	 * These register writes are described as required in MAX96714 datasheet
  1202	 * Page 53, Section Register Map, to optimize link performance in 6Gbps
  1203	 * and 3Gbps links for all cable lengths.
  1204	 */
> 1205	const struct reg_sequence max96714_rlms_reg_sequence[] = {
  1206		{ MAX9296A_RLMS3E(0), 0xfd },
  1207		{ MAX9296A_RLMS3F(0), 0x3d },
  1208		{ MAX9296A_RLMS49(0), 0xf5 },
  1209		{ MAX9296A_RLMS7E(0), 0xa8 },
  1210		{ MAX9296A_RLMS7F(0), 0x68 },
  1211		{ MAX9296A_RLMSA3(0), 0x30 },
  1212		{ MAX9296A_RLMSA5(0), 0x70 },
  1213		{ MAX9296A_RLMSD8(0), 0x07 },
  1214	};
  1215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
