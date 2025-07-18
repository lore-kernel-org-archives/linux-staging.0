Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059EF13DDAE;
	Fri, 18 Jul 2025 01:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752802685; cv=none; b=GetaspffAwZDdEWHtQrSPBFJPmPIjHqiI6zdba0dMGVwgF5JdGoHxMQT3WOn2m7NH7+fDrlNTDY+EbxFdKsb9FnOgB1iabvFF5ruDJtgo2vIdIZ4oiUoAYWs223d8jAxY409PHwKTw3nEQHY9I3e9iNXvrXf2OXg3wNb4s5zguE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752802685; c=relaxed/simple;
	bh=Gxsb4twQZ7MutHEiCFwLHr/tvz7swWwvohxSb9zPqnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTvx/gTDvGgQJuy+B0Zv+yJ2lYgPwWKF5qxbB+pZ3qvssSSHl5EsokqQmdSYtgtv4L/8geIkZtjV+vWrFv5k6072LgdoaiIuhONkFvnz6kAYuSJqo9VNXApLlNL39TUsvuoYAp9a0lGU4TB9eH92I11of/BEo7jA9Ixh/ybv3R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d/PQF8t0; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/PQF8t0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752802684; x=1784338684;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Gxsb4twQZ7MutHEiCFwLHr/tvz7swWwvohxSb9zPqnI=;
  b=d/PQF8t0bpoTQSP322Bg0W/+cfIv6VNKigFduxE6yncrM5zSss0KwUUO
   +tKBAPwuJIPOQym+tF8S3hmm1aNZJ9UqneUvAa1W0oGaoXmUsck6N/7EU
   l8hfAhB4gWkRMdjg0eOoofKpQn/Qv4kruV8/fjmCh37j/Y6aNo64dzdjz
   XrRPEECN1JuMWYF+7RmmeFxrrFhzqHoK2wU5+kRIs/dWYLlykDUJtDzho
   paYExppECppQ16P7r1WCbwibHKXUIg+0bOepkZMeSm9NrQXsbBZXfvb2+
   ZQgJcG3JPNqx48vPC+vsIunZq2lHmeTMgYZIw7poPdMrhH/jffozvxsXp
   g==;
X-CSE-ConnectionGUID: d0FcBTnhSZaLpaFH5rDy/w==
X-CSE-MsgGUID: XJISsi8MTBGDHvVpmnP3tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="72661781"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="72661781"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 18:38:03 -0700
X-CSE-ConnectionGUID: Z2UUVbOuQFuAmZyMGnYsEA==
X-CSE-MsgGUID: 5uXw69UySuOliODhA/VrLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="162216196"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Jul 2025 18:37:59 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uca2u-000ECp-2C;
	Fri, 18 Jul 2025 01:37:56 +0000
Date: Fri, 18 Jul 2025 09:37:14 +0800
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
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 15/24] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer framework
Message-ID: <202507180909.8Mnk3jkp-lkp@intel.com>
References: <20250716193111.942217-16-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716193111.942217-16-demonsingur@gmail.com>

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
patch link:    https://lore.kernel.org/r/20250716193111.942217-16-demonsingur%40gmail.com
patch subject: [PATCH v6 15/24] media: i2c: add Maxim GMSL2/3 serializer and deserializer framework
config: nios2-kismet-CONFIG_I2C_MUX-CONFIG_VIDEO_MAXIM_SERDES-0-0 (https://download.01.org/0day-ci/archive/20250718/202507180909.8Mnk3jkp-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250718/202507180909.8Mnk3jkp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507180909.8Mnk3jkp-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for I2C_MUX when selected by VIDEO_MAXIM_SERDES
   WARNING: unmet direct dependencies detected for I2C_MUX
     Depends on [n]: I2C [=n]
     Selected by [y]:
     - VIDEO_MAXIM_SERDES [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y]
   
   WARNING: unmet direct dependencies detected for I2C_ATR
     Depends on [n]: I2C [=n]
     Selected by [y]:
     - VIDEO_MAXIM_SERDES [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
