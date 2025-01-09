Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DEF21D5A3;
	Thu,  9 Jan 2025 15:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736437580; cv=none; b=oxojKw02k5EEfMmQ69A4ABZZGI4G5h38YzstsGBmqMerypBdrg6nBsiojFjpbQV5GEfT9wpm4z8V8ZdqrRZgtzvUcn7J6r4tXqCYXI5ZAN1JaATLC6DUwKJXhJE3Ezt61v2PqUSqBShL/EKA+UlifFUln0vN5JmsdgEJko0IgGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736437580; c=relaxed/simple;
	bh=UpzsEPgeOoWdOhu1DNZHjh8t4dAN6kynKhs6VZwxps8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QNOWpmyk1PN9Z1F3zp0h3H3StqlTvC+shlazk+ILb13dtaYwET+QeFoCvw5ad6GLrgz4t+OuRS2FQFxGYZou2z3TNC2+oeUeFmZAhc2DvEnawMDVbDCjg8c8+8NXNHClQAUDxbAqvlSA9LVh0xVZQppYFwfKlgBdGuGcQ8SFfG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z6Oqv/Xe; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z6Oqv/Xe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736437579; x=1767973579;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UpzsEPgeOoWdOhu1DNZHjh8t4dAN6kynKhs6VZwxps8=;
  b=Z6Oqv/Xe2Ddk03V93MXtwfv3afDwUG1EHzSkleklNL4UDLv5y7iRb5br
   ivCDj+IHcvLV/QieaNXberuBob7LV3ESTPN7LHBn6gQhEjxjmLBRoO0Po
   nM8jlASh9KWtPVCh0ADBdEbylzysVwF+unQs4e7RNiA1HTkloQVcwW7v5
   rfN3KEk94TqCwC0Ao7mx8R870IJRTdonr5DZDhKPAM3eKt1RFQOVwckii
   Q/B3Mn7qo9KJuwVH0NNPOe3VfUIaW1IUHpLtjK2kvDhvjkS5lsGUFZK+e
   6IkUhreCtc+537MAU0ARnAkPEhpkAeRqQlb0VYbnoEaof4TVaA/qamD7N
   w==;
X-CSE-ConnectionGUID: VjK4ErGSTbGjpD5qhh6sNg==
X-CSE-MsgGUID: Zrh8dUgaT2qK0axWOhH4SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="35930852"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="35930852"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 07:46:18 -0800
X-CSE-ConnectionGUID: PAnHJLOnSUWH+6dUpoJbCw==
X-CSE-MsgGUID: QF9/XboEQtuthA8KWtlYOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134340521"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Jan 2025 07:46:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVujf-000HlT-0b;
	Thu, 09 Jan 2025 15:46:15 +0000
Date: Thu, 9 Jan 2025 23:46:11 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Penkler <dpenkler@gmail.com>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Dave Penkler <dpenkler@gmail.com>
Subject: Re: [PATCH v2] staging: gpib: Modernize gpib_interface_t
 initialization and make static
Message-ID: <202501092356.ElX5uvEq-lkp@intel.com>
References: <20250108174121.23044-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108174121.23044-1-dpenkler@gmail.com>

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Penkler/staging-gpib-Modernize-gpib_interface_t-initialization-and-make-static/20250109-014247
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20250108174121.23044-1-dpenkler%40gmail.com
patch subject: [PATCH v2] staging: gpib: Modernize gpib_interface_t initialization and make static
config: x86_64-randconfig-077-20250109 (https://download.01.org/0day-ci/archive/20250109/202501092356.ElX5uvEq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501092356.ElX5uvEq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501092356.ElX5uvEq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/gpib/hp_82335/hp82335.c:175:25: error: static declaration of 'hp82335_interface' follows non-static declaration
     175 | static gpib_interface_t hp82335_interface = {
         |                         ^~~~~~~~~~~~~~~~~
   In file included from drivers/staging/gpib/hp_82335/hp82335.c:11:
   drivers/staging/gpib/hp_82335/hp82335.h:21:25: note: previous declaration of 'hp82335_interface' with type 'gpib_interface_t' {aka 'struct gpib_interface_struct'}
      21 | extern gpib_interface_t hp82335_interface;
         |                         ^~~~~~~~~~~~~~~~~


vim +/hp82335_interface +175 drivers/staging/gpib/hp_82335/hp82335.c

   174	
 > 175	static gpib_interface_t hp82335_interface = {
   176		.name = "hp82335",
   177		.attach = hp82335_attach,
   178		.detach = hp82335_detach,
   179		.read = hp82335_read,
   180		.write = hp82335_write,
   181		.command = hp82335_command,
   182		.request_system_control = hp82335_request_system_control,
   183		.take_control = hp82335_take_control,
   184		.go_to_standby = hp82335_go_to_standby,
   185		.interface_clear = hp82335_interface_clear,
   186		.remote_enable = hp82335_remote_enable,
   187		.enable_eos = hp82335_enable_eos,
   188		.disable_eos = hp82335_disable_eos,
   189		.parallel_poll = hp82335_parallel_poll,
   190		.parallel_poll_configure = hp82335_parallel_poll_configure,
   191		.parallel_poll_response = hp82335_parallel_poll_response,
   192		.local_parallel_poll_mode = NULL, // XXX
   193		.line_status = hp82335_line_status,
   194		.update_status = hp82335_update_status,
   195		.primary_address = hp82335_primary_address,
   196		.secondary_address = hp82335_secondary_address,
   197		.serial_poll_response = hp82335_serial_poll_response,
   198		.serial_poll_status = hp82335_serial_poll_status,
   199		.t1_delay = hp82335_t1_delay,
   200		.return_to_local = hp82335_return_to_local,
   201	};
   202	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
