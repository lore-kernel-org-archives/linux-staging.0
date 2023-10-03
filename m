Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E9E23C9;
	Tue,  3 Oct 2023 23:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696375466; x=1727911466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZIJaTXdQoK+Tc9rKwmO+j/pkBSYtbKY2aE/ScAzMB3c=;
  b=HOQ/bm44T/Td75eZncIdWxnUxYBRjrKND7fgt/08fn59uEnPTSkZzHMo
   eVIKlAEQQUz2sMifQZKIBHRjyIvEESBxjwX/ypii6MpzsCesiWN806pKm
   KcjjGGojNhhR1B8QEEIvdpERvKSdkOMV+gszG15FiMpmZyAlGWdc4wH99
   c1vh2rACLCj84Ro4L4XQNgyalNopuveWU7JNFxiLoW5Ao6ESr5vlJyZHy
   s69z0lVeRIL2g3tCwj0Hw8JILRtvgKm/L3Nt4HCpUGntQlIyPSk/aeunZ
   N1cPcj9NhWJ2POIkN4Cyjdsa1sLSfX7y1SaQ8c1jtsJMdKvmsArhtJoKG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="449493735"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="449493735"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 16:24:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="874853647"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="874853647"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 03 Oct 2023 16:24:13 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnokN-0009j4-1G;
	Tue, 03 Oct 2023 23:24:11 +0000
Date: Wed, 4 Oct 2023 07:23:20 +0800
From: kernel test robot <lkp@intel.com>
To: David Lechner <dlechner@baylibre.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-staging@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev, David Lechner <david@lechnology.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Axel Haslam <ahaslam@baylibre.com>,
	Philip Molloy <pmolloy@baylibre.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 25/27] staging: iio: resolver: ad2s1210: rename DOS
 reset min/max attrs
Message-ID: <202310040601.lZjvyOu7-lkp@intel.com>
References: <20230929-ad2s1210-mainline-v3-25-fa4364281745@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929-ad2s1210-mainline-v3-25-fa4364281745@baylibre.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5e99f692d4e32e3250ab18d511894ca797407aec]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Lechner/dt-bindings-iio-resolver-add-devicetree-bindings-for-ad2s1210/20230930-014031
base:   5e99f692d4e32e3250ab18d511894ca797407aec
patch link:    https://lore.kernel.org/r/20230929-ad2s1210-mainline-v3-25-fa4364281745%40baylibre.com
patch subject: [PATCH v3 25/27] staging: iio: resolver: ad2s1210: rename DOS reset min/max attrs
config: i386-randconfig-062-20231003 (https://download.01.org/0day-ci/archive/20231004/202310040601.lZjvyOu7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231004/202310040601.lZjvyOu7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310040601.lZjvyOu7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/staging/iio/resolver/ad2s1210.c:900:1: sparse: sparse: symbol 'iio_const_attr_in_phase0_mag_value_available' was not declared. Should it be static?
   drivers/staging/iio/resolver/ad2s1210.c:905:1: sparse: sparse: symbol 'iio_const_attr_in_altvoltage0_thresh_falling_value_available' was not declared. Should it be static?
   drivers/staging/iio/resolver/ad2s1210.c:906:1: sparse: sparse: symbol 'iio_const_attr_in_altvoltage0_thresh_rising_value_available' was not declared. Should it be static?
   drivers/staging/iio/resolver/ad2s1210.c:907:1: sparse: sparse: symbol 'iio_const_attr_in_altvoltage0_mag_value_available' was not declared. Should it be static?
>> drivers/staging/iio/resolver/ad2s1210.c:908:1: sparse: sparse: symbol 'iio_dev_attr_in_altvoltage0_mag_reset_max' was not declared. Should it be static?
>> drivers/staging/iio/resolver/ad2s1210.c:911:1: sparse: sparse: symbol 'iio_const_attr_in_altvoltage0_mag_reset_max_available' was not declared. Should it be static?
>> drivers/staging/iio/resolver/ad2s1210.c:912:1: sparse: sparse: symbol 'iio_dev_attr_in_altvoltage0_mag_reset_min' was not declared. Should it be static?
>> drivers/staging/iio/resolver/ad2s1210.c:915:1: sparse: sparse: symbol 'iio_const_attr_in_altvoltage0_mag_reset_min_available' was not declared. Should it be static?
   drivers/staging/iio/resolver/ad2s1210.c:916:1: sparse: sparse: symbol 'iio_dev_attr_in_angl1_thresh_rising_value_available' was not declared. Should it be static?
   drivers/staging/iio/resolver/ad2s1210.c:917:1: sparse: sparse: symbol 'iio_dev_attr_in_angl1_thresh_rising_hysteresis_available' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
