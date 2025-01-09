Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EE518C34B;
	Thu,  9 Jan 2025 14:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736434150; cv=none; b=e2XlZheynG1TVcNbNDIDAywBg/+sE+KNLHlD+3Eq6tAm+XOY+kzsvAxs+tBdKE9V+SKQWrrDTs2lxTiolG9vMcGKBASp5N6Q+k+uRh2D4FcjGEjAwg5PUFrYRvZIb/YKRdTdYyBXkr1lexoLALUpj3sS8higHZX4K2OT6Ae77K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736434150; c=relaxed/simple;
	bh=O6fsU0JZahUF5E1dAq6GkWvSrB2t14Uj/4mxy9yau1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNR+g3bE89m+7y0Oi2f5d8B55gyNXTjZyRaXmzZatRmdhm/NSp7OuetxI60BkArQqggDFGw/NYGZYme4oTVFEhlDaw0Igu7t+b83pTMzbRX0+SLiXmviPQ2vqDtEbATFZDB/6xF9Kef2L2hVhXDMAQfoUsVUYGQrNMf0fotTsME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hm0VYv25; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hm0VYv25"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736434148; x=1767970148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O6fsU0JZahUF5E1dAq6GkWvSrB2t14Uj/4mxy9yau1Y=;
  b=Hm0VYv25f/ACydUiPiC8lOuY8UbVP0AFMYvkCvmtx/AXnP9X1D2qDbgy
   466NDslVJlvC0N5wMPqDtA0DZ7C1v/N4mCLJaoMRV+eMB7dc7F66+Mn8X
   XtiIJ9ay0uPmBKR2sH8rT7JUEnh87OmbGwWKPOrCcdu4dvKlLA4YFq4RC
   Ilejo3QdQWJzm32viy8zTuSnTDkllqWSpJWI/DYV+0oA40MSBCrn1J9tk
   TgRWooPixZXtCYCDqxK8FDXbDvdhJZ2E9m+pc/kBr1yjLtDk4QlK5+1L3
   ZfXXZ4BhIySfGZlNYawQItPXuxT//Uf0L4sJECoowWQGwYj4FPXfWQhO2
   A==;
X-CSE-ConnectionGUID: xwmsQh5dRdGZSVm6pX2wRA==
X-CSE-MsgGUID: SimEP/nLQlSyFv8PDD7xCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36578876"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="36578876"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 06:49:08 -0800
X-CSE-ConnectionGUID: TbmdtFvrTUuTDTtJCsBQrg==
X-CSE-MsgGUID: 8s0WCBz2SKGUDc+9+/fsig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140742904"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Jan 2025 06:49:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVtqK-000Hgp-0o;
	Thu, 09 Jan 2025 14:49:04 +0000
Date: Thu, 9 Jan 2025 22:48:28 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Penkler <dpenkler@gmail.com>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Dave Penkler <dpenkler@gmail.com>
Subject: Re: [PATCH v2] staging: gpib: Modernize gpib_interface_t
 initialization and make static
Message-ID: <202501092221.k9rTlGeN-lkp@intel.com>
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
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250109/202501092221.k9rTlGeN-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501092221.k9rTlGeN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501092221.k9rTlGeN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/gpib/cb7210/cb7210.c: In function 'cb7210_line_status':
   drivers/staging/gpib/cb7210/cb7210.c:383:30: warning: variable 'nec_priv' set but not used [-Wunused-but-set-variable]
     383 |         struct nec7210_priv *nec_priv;
         |                              ^~~~~~~~
   drivers/staging/gpib/cb7210/cb7210.c: In function 'cb_gpib_config':
   drivers/staging/gpib/cb7210/cb7210.c:1265:28: warning: variable 'dev' set but not used [-Wunused-but-set-variable]
    1265 |         struct local_info *dev;
         |                            ^~~
   drivers/staging/gpib/cb7210/cb7210.c:1264:31: warning: variable 'handle' set but not used [-Wunused-but-set-variable]
    1264 |         struct pcmcia_device *handle;
         |                               ^~~~~~
   drivers/staging/gpib/cb7210/cb7210.c: At top level:
>> drivers/staging/gpib/cb7210/cb7210.c:1360:25: error: static declaration of 'cb_pcmcia_unaccel_interface' follows non-static declaration
    1360 | static gpib_interface_t cb_pcmcia_unaccel_interface = {
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/staging/gpib/cb7210/cb7210.c:8:
   drivers/staging/gpib/cb7210/cb7210.h:42:25: note: previous declaration of 'cb_pcmcia_unaccel_interface' with type 'gpib_interface_t' {aka 'struct gpib_interface_struct'}
      42 | extern gpib_interface_t cb_pcmcia_unaccel_interface;
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/gpib/cb7210/cb7210.c:1388:25: error: static declaration of 'cb_pcmcia_interface' follows non-static declaration
    1388 | static gpib_interface_t cb_pcmcia_interface = {
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/staging/gpib/cb7210/cb7210.h:40:25: note: previous declaration of 'cb_pcmcia_interface' with type 'gpib_interface_t' {aka 'struct gpib_interface_struct'}
      40 | extern gpib_interface_t cb_pcmcia_interface;
         |                         ^~~~~~~~~~~~~~~~~~~
>> drivers/staging/gpib/cb7210/cb7210.c:1416:25: error: static declaration of 'cb_pcmcia_accel_interface' follows non-static declaration
    1416 | static gpib_interface_t cb_pcmcia_accel_interface = {
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/gpib/cb7210/cb7210.h:41:25: note: previous declaration of 'cb_pcmcia_accel_interface' with type 'gpib_interface_t' {aka 'struct gpib_interface_struct'}
      41 | extern gpib_interface_t cb_pcmcia_accel_interface;
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/cb_pcmcia_unaccel_interface +1360 drivers/staging/gpib/cb7210/cb7210.c

  1359	
> 1360	static gpib_interface_t cb_pcmcia_unaccel_interface = {
  1361		.name = "cbi_pcmcia_unaccel",
  1362		.attach = cb_pcmcia_attach,
  1363		.detach = cb_pcmcia_detach,
  1364		.read = cb7210_read,
  1365		.write = cb7210_write,
  1366		.command = cb7210_command,
  1367		.take_control = cb7210_take_control,
  1368		.go_to_standby = cb7210_go_to_standby,
  1369		.request_system_control = cb7210_request_system_control,
  1370		.interface_clear = cb7210_interface_clear,
  1371		.remote_enable = cb7210_remote_enable,
  1372		.enable_eos = cb7210_enable_eos,
  1373		.disable_eos = cb7210_disable_eos,
  1374		.parallel_poll = cb7210_parallel_poll,
  1375		.parallel_poll_configure = cb7210_parallel_poll_configure,
  1376		.parallel_poll_response = cb7210_parallel_poll_response,
  1377		.local_parallel_poll_mode = NULL, // XXX
  1378		.line_status = cb7210_line_status,
  1379		.update_status = cb7210_update_status,
  1380		.primary_address = cb7210_primary_address,
  1381		.secondary_address = cb7210_secondary_address,
  1382		.serial_poll_response = cb7210_serial_poll_response,
  1383		.serial_poll_status = cb7210_serial_poll_status,
  1384		.t1_delay = cb7210_t1_delay,
  1385		.return_to_local = cb7210_return_to_local,
  1386	};
  1387	
> 1388	static gpib_interface_t cb_pcmcia_interface = {
  1389		.name = "cbi_pcmcia",
  1390		.attach = cb_pcmcia_attach,
  1391		.detach = cb_pcmcia_detach,
  1392		.read = cb7210_accel_read,
  1393		.write = cb7210_accel_write,
  1394		.command = cb7210_command,
  1395		.take_control = cb7210_take_control,
  1396		.go_to_standby = cb7210_go_to_standby,
  1397		.request_system_control = cb7210_request_system_control,
  1398		.interface_clear = cb7210_interface_clear,
  1399		.remote_enable = cb7210_remote_enable,
  1400		.enable_eos = cb7210_enable_eos,
  1401		.disable_eos = cb7210_disable_eos,
  1402		.parallel_poll = cb7210_parallel_poll,
  1403		.parallel_poll_configure = cb7210_parallel_poll_configure,
  1404		.parallel_poll_response = cb7210_parallel_poll_response,
  1405		.local_parallel_poll_mode = NULL, // XXX
  1406		.line_status = cb7210_line_status,
  1407		.update_status = cb7210_update_status,
  1408		.primary_address = cb7210_primary_address,
  1409		.secondary_address = cb7210_secondary_address,
  1410		.serial_poll_response = cb7210_serial_poll_response,
  1411		.serial_poll_status = cb7210_serial_poll_status,
  1412		.t1_delay = cb7210_t1_delay,
  1413		.return_to_local = cb7210_return_to_local,
  1414	};
  1415	
> 1416	static gpib_interface_t cb_pcmcia_accel_interface = {
  1417		.name = "cbi_pcmcia_accel",
  1418		.attach = cb_pcmcia_attach,
  1419		.detach = cb_pcmcia_detach,
  1420		.read = cb7210_accel_read,
  1421		.write = cb7210_accel_write,
  1422		.command = cb7210_command,
  1423		.take_control = cb7210_take_control,
  1424		.go_to_standby = cb7210_go_to_standby,
  1425		.request_system_control = cb7210_request_system_control,
  1426		.interface_clear = cb7210_interface_clear,
  1427		.remote_enable = cb7210_remote_enable,
  1428		.enable_eos = cb7210_enable_eos,
  1429		.disable_eos = cb7210_disable_eos,
  1430		.parallel_poll = cb7210_parallel_poll,
  1431		.parallel_poll_configure = cb7210_parallel_poll_configure,
  1432		.parallel_poll_response = cb7210_parallel_poll_response,
  1433		.local_parallel_poll_mode = NULL, // XXX
  1434		.line_status = cb7210_line_status,
  1435		.update_status = cb7210_update_status,
  1436		.primary_address = cb7210_primary_address,
  1437		.secondary_address = cb7210_secondary_address,
  1438		.serial_poll_response = cb7210_serial_poll_response,
  1439		.serial_poll_status = cb7210_serial_poll_status,
  1440		.t1_delay = cb7210_t1_delay,
  1441		.return_to_local = cb7210_return_to_local,
  1442	};
  1443	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
