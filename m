Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0631823741;
	Tue, 24 Feb 2026 00:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771892779; cv=none; b=MJDnUPvkeDAuSg1EIUXHenHL+ih4CS94rfELPZ/lUHdSrRQpt9r6Lc6u+T9atFllb18N1jBnloeURG47/dWTVhTO6kDdo7VYchzQu6mIRZ4d6Nca34inx/f5aXyfPh/tSKgSL9F0TsITUXLJQpx4R1MwEHPpCe8uWkt72vGAfxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771892779; c=relaxed/simple;
	bh=KbDXPitIiKNIbQrISW2QXtIgQoDgCLmDkbFpkFQizKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jilj+eVz5yrqxgNmzkug1ZGreBE7W+s6GcUJz+Y10K5jKN1HuoRzgs8F0qy4OYjeEnYP6QLbTqsib4NjGy9UtDsOzQBsFBnaVEnN/kKiOu6kfjF5ZVUjtUWpdHVz7h1UsKmiypwULCfPueqX9yyhDrwh3HGVos2rOVJfvcVg5Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cDUo55Jt; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cDUo55Jt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771892777; x=1803428777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KbDXPitIiKNIbQrISW2QXtIgQoDgCLmDkbFpkFQizKA=;
  b=cDUo55JtUtUp6zTQsVBuojW2KiIMkM65ANVgbBF4WMjkLtKIpaxXUyuu
   QkqIxo+hlhudJq5FoBH2TBRrwUe0N2EwuygaZpGWLd45kkJd2RE0Qyju8
   bpAhixd3zAeUQq7qZCFDopTIvNhEVUm0rlqWO1L3WnGFBkYLmXQf68Aph
   HvufXoht1UV2xsmPlnUSt/v2/NpudgFQyJA+DUiG8oKKLzNLhI8xZ6spg
   Le09ra/DjeHLCYSQrhyozDL4OLb3p8p1z9/MmGSloqjnIKtQ6mUb/IEpu
   EfEQjzaEotQ3/ZydJ9x6SslRp8LMcrvFmlIdn3HURWKh8TrzHJiam7QRq
   g==;
X-CSE-ConnectionGUID: HkFiuZABQ6WLj/j04DtOMA==
X-CSE-MsgGUID: beucQCjLSt6xWbLMu3bd+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="90483698"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="90483698"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 16:26:16 -0800
X-CSE-ConnectionGUID: 79fk+RHISReDR0f/UqaJtA==
X-CSE-MsgGUID: JfvAiziGQtWF4rPKDYrVOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="214964906"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 23 Feb 2026 16:26:14 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vugFf-0000000011h-1yKQ;
	Tue, 24 Feb 2026 00:26:11 +0000
Date: Tue, 24 Feb 2026 08:25:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, vaibhav.sr@gmail.com,
	mgreer@animalcreek.com
Cc: oe-kbuild-all@lists.linux.dev, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: move topology allocation to codec probe
Message-ID: <202602240818.4lyiDRiD-lkp@intel.com>
References: <20260223195939.71151-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223195939.71151-1-azpijr@gmail.com>

Hi Jose,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Jose-A-Perez-de-Azpillaga/staging-greybus-move-topology-allocation-to-codec-probe/20260224-040440
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260223195939.71151-1-azpijr%40gmail.com
patch subject: [PATCH] staging: greybus: move topology allocation to codec probe
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260224/202602240818.4lyiDRiD-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260224/202602240818.4lyiDRiD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602240818.4lyiDRiD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/greybus/audio_gb.c:11:5: error: conflicting types for 'gb_audio_gb_get_topology'; have 'int(struct gb_connection *, struct gb_audio_topology *)'
      11 | int gb_audio_gb_get_topology(struct gb_connection *connection,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/staging/greybus/audio_gb.c:9:
   drivers/staging/greybus/audio_codec.h:181:5: note: previous declaration of 'gb_audio_gb_get_topology' with type 'int(struct gb_connection *, struct gb_audio_topology **)'
     181 | int gb_audio_gb_get_topology(struct gb_connection *connection,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:14,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/m68k/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/m68k/include/asm/bitops.h:569,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from include/linux/greybus.h:14,
                    from drivers/staging/greybus/audio_gb.c:8:
   drivers/staging/greybus/audio_gb.c: In function 'gb_audio_gb_get_topology':
   drivers/staging/greybus/audio_gb.c:15:64: error: 'struct gb_audio_topology' has no member named 'size'
      15 |                         NULL, 0, topology, le16_to_cpu(topology->size));
         |                                                                ^~
   include/uapi/linux/swab.h:105:38: note: in definition of macro '__swab16'
     105 |         (__u16)(__builtin_constant_p(x) ?       \
         |                                      ^
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/staging/greybus/audio_gb.c:15:44: note: in expansion of macro 'le16_to_cpu'
      15 |                         NULL, 0, topology, le16_to_cpu(topology->size));
         |                                            ^~~~~~~~~~~
   drivers/staging/greybus/audio_gb.c:15:64: error: 'struct gb_audio_topology' has no member named 'size'
      15 |                         NULL, 0, topology, le16_to_cpu(topology->size));
         |                                                                ^~
   include/uapi/linux/swab.h:106:9: note: in expansion of macro '___constant_swab16'
     106 |         ___constant_swab16(x) :                 \
         |         ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:37:26: note: in expansion of macro '__swab16'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/staging/greybus/audio_gb.c:15:44: note: in expansion of macro 'le16_to_cpu'
      15 |                         NULL, 0, topology, le16_to_cpu(topology->size));
         |                                            ^~~~~~~~~~~
   drivers/staging/greybus/audio_gb.c:15:64: error: 'struct gb_audio_topology' has no member named 'size'
      15 |                         NULL, 0, topology, le16_to_cpu(topology->size));
         |                                                                ^~
   include/uapi/linux/swab.h:16:19: note: in definition of macro '___constant_swab16'
      16 |         (((__u16)(x) & (__u16)0xff00U) >> 8)))
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:37:26: note: in expansion of macro '__swab16'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/staging/greybus/audio_gb.c:15:44: note: in expansion of macro 'le16_to_cpu'
      15 |                         NULL, 0, topology, le16_to_cpu(topology->size));
         |                                            ^~~~~~~~~~~
   drivers/staging/greybus/audio_gb.c:15:64: error: 'struct gb_audio_topology' has no member named 'size'
      15 |                         NULL, 0, topology, le16_to_cpu(topology->size));
         |                                                                ^~
   include/uapi/linux/swab.h:107:19: note: in definition of macro '__swab16'
     107 |         __fswab16(x))
         |                   ^
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/staging/greybus/audio_gb.c:15:44: note: in expansion of macro 'le16_to_cpu'
      15 |                         NULL, 0, topology, le16_to_cpu(topology->size));
         |                                            ^~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:18:
   drivers/staging/greybus/audio_gb.c: At top level:
   drivers/staging/greybus/audio_gb.c:17:19: error: conflicting types for 'gb_audio_gb_get_topology'; have 'int(struct gb_connection *, struct gb_audio_topology *)'
      17 | EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:76:28: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/staging/greybus/audio_gb.c:17:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
      17 | EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);
         | ^~~~~~~~~~~~~~~~~
   drivers/staging/greybus/audio_codec.h:181:5: note: previous declaration of 'gb_audio_gb_get_topology' with type 'int(struct gb_connection *, struct gb_audio_topology **)'
     181 | int gb_audio_gb_get_topology(struct gb_connection *connection,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~


vim +11 drivers/staging/greybus/audio_gb.c

184992e305f1de Mark Greer                 2016-01-13  10  
184992e305f1de Mark Greer                 2016-01-13 @11  int gb_audio_gb_get_topology(struct gb_connection *connection,
b554255ff0c003 Jose A. Perez de Azpillaga 2026-02-23  12  			     struct gb_audio_topology *topology)
184992e305f1de Mark Greer                 2016-01-13  13  {
b554255ff0c003 Jose A. Perez de Azpillaga 2026-02-23  14  	return gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY,
b554255ff0c003 Jose A. Perez de Azpillaga 2026-02-23  15  			NULL, 0, topology, le16_to_cpu(topology->size));
184992e305f1de Mark Greer                 2016-01-13  16  }
184992e305f1de Mark Greer                 2016-01-13  17  EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);
184992e305f1de Mark Greer                 2016-01-13  18  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
