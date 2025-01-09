Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9AC19FA8D;
	Thu,  9 Jan 2025 20:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736453417; cv=none; b=U4rqQG+x8D+B4MNDIA2+MN2lzpCmbdz12UyecO2KanyIgWIFoPpLVYdxqKRRULKjBcE78uOwyWQQJ+Nw0JciZOjUTAvjixsk1b4keK+WxxQo8JEz2ekp2hPFLCua/dxJktWtSVfEqMlcif83D81WwKz6rhDu/zuwlwTB9wRL0GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736453417; c=relaxed/simple;
	bh=oQfb3F0pVcxUgQtp9LJkUeU2vjR5JPbc2rXhgWVFeYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e0Wagzexo5OvC1+lO67J7GiAvUjv3Xc4nnP6KP0/Ci2OF5pRKhIBnlZbwZG3VPYouB/0SYrATWtFkqipbGMfNmmjd4As3fd5kY32vmNb+MoSHXptkDWFIpJZr+oHjOO2vbhyBz9oTjOtRagNrd4qYYN2BWOISRJyoOSSyR1p2rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TIaBnrfu; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TIaBnrfu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736453416; x=1767989416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oQfb3F0pVcxUgQtp9LJkUeU2vjR5JPbc2rXhgWVFeYY=;
  b=TIaBnrfuBL+pv59dt/DCS0WGGfbHnNxp8XBUmcQlgCiaGqbeoS5cATHg
   DuJqXNQK7AO1BJKRV10pgtTT8hsjscQH+qZxaRWOFyKCNnYmqvK4RBHAy
   FZQlTbCeM8Ki3sP9iDMqHZoYwLldwb2iplQwvC0W9WX+1g28l6xlB++oR
   PEGzqPuc0UDj9GL4HAN5MlaseRQcurrbQ/f65SCdgrLcaIAtSrPTWvXgz
   jlM7A9ZE0R4j/BVCXdLrwRZRxSJfMrUaAIt1z0fP1cMjSMqvKKekKPzw9
   6kY14OWe6GQ0+3x2BOqY+rDVIts+efn8zX5Y+bSinVEpvDLFeJhSf7sjy
   A==;
X-CSE-ConnectionGUID: sUuSkIlLQSSx2xhT+LCFsQ==
X-CSE-MsgGUID: j7kCmNRqR/+ttdhBb608WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="39557544"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="39557544"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 12:10:15 -0800
X-CSE-ConnectionGUID: 90/+vKSsQdyC+zCmOPjlOA==
X-CSE-MsgGUID: KqVA+1T+QdKcj+nHnfMB3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108611394"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Jan 2025 12:10:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVyr4-000I5n-0D;
	Thu, 09 Jan 2025 20:10:10 +0000
Date: Fri, 10 Jan 2025 04:09:12 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Penkler <dpenkler@gmail.com>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Dave Penkler <dpenkler@gmail.com>
Subject: Re: [PATCH v2] staging: gpib: Modernize gpib_interface_t
 initialization and make static
Message-ID: <202501100333.OSb7rYLy-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Penkler/staging-gpib-Modernize-gpib_interface_t-initialization-and-make-static/20250109-014247
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20250108174121.23044-1-dpenkler%40gmail.com
patch subject: [PATCH v2] staging: gpib: Modernize gpib_interface_t initialization and make static
config: alpha-randconfig-r113-20250109 (https://download.01.org/0day-ci/archive/20250110/202501100333.OSb7rYLy-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250110/202501100333.OSb7rYLy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501100333.OSb7rYLy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/staging/gpib/ines/ines_gpib.c:378:10: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:379:10: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:380:10: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:381:10: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:382:10: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:383:10: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:385:10: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:386:10: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:387:10: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:388:10: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:389:10: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:390:10: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:391:10: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1237:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1238:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1239:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1240:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1241:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1242:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1243:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1244:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1245:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1246:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1247:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1248:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1249:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1250:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1251:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1252:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1253:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1254:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1255:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1256:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1257:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1258:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1259:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1260:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1261:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1265:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1266:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1267:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1268:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1269:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1270:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1271:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1272:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1273:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1274:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1275:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1276:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1277:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1278:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1279:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1280:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1281:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1282:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1283:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1284:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1285:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1286:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1287:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1288:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1289:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1293:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1294:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1295:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1296:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1297:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1298:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1299:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1300:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1301:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1302:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1303:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1304:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1305:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1306:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1307:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1308:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1309:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1310:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1311:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1312:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1313:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1314:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1315:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1316:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:1317:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/ines/ines_gpib.c:801:36: sparse: sparse: Using plain integer as NULL pointer
   drivers/staging/gpib/ines/ines_gpib.c:1157:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *virt @@     got void [noderef] __iomem * @@
   drivers/staging/gpib/ines/ines_gpib.c:1157:14: sparse:     expected void *virt
   drivers/staging/gpib/ines/ines_gpib.c:1157:14: sparse:     got void [noderef] __iomem *
   drivers/staging/gpib/ines/ines_gpib.c:1158:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/ines/ines_gpib.c:1158:61: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/ines/ines_gpib.c:1158:61: sparse:     got void *
   drivers/staging/gpib/ines/ines_gpib.c:1159:18: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/ines/ines_gpib.c:1159:18: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/ines/ines_gpib.c:1159:18: sparse:     got void *
   drivers/staging/gpib/ines/ines_gpib.c:1346:82: sparse: sparse: Using plain integer as NULL pointer
>> drivers/staging/gpib/ines/ines_gpib.c:1236:18: sparse: sparse: symbol 'ines_pcmcia_unaccel_interface' was not declared. Should it be static?
>> drivers/staging/gpib/ines/ines_gpib.c:1264:18: sparse: sparse: symbol 'ines_pcmcia_accel_interface' was not declared. Should it be static?
>> drivers/staging/gpib/ines/ines_gpib.c:1292:18: sparse: sparse: symbol 'ines_pcmcia_interface' was not declared. Should it be static?
   drivers/staging/gpib/ines/ines_gpib.c: note: in included file (through arch/alpha/include/asm/core_cia.h, arch/alpha/include/asm/io.h, include/linux/io.h, ...):
   arch/alpha/include/asm/io_trivial.h:12:16: sparse: sparse: undefined identifier '__kernel_ldbu'
   arch/alpha/include/asm/io_trivial.h:24:9: sparse: sparse: undefined identifier '__kernel_stb'
   arch/alpha/include/asm/io_trivial.h:76:9: sparse: sparse: undefined identifier '__kernel_stb'

vim +/ines_pcmcia_unaccel_interface +1236 drivers/staging/gpib/ines/ines_gpib.c

bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1235  
bb1bd92fa0f2c9 Dave Penkler 2024-09-18 @1236  gpib_interface_t ines_pcmcia_unaccel_interface = {
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1237  name: "ines_pcmcia_unaccel",
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1238  attach : ines_pcmcia_attach,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1239  detach : ines_pcmcia_detach,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1240  read : ines_read,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1241  write : ines_write,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1242  command : ines_command,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1243  take_control : ines_take_control,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1244  go_to_standby : ines_go_to_standby,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1245  request_system_control : ines_request_system_control,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1246  interface_clear : ines_interface_clear,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1247  remote_enable : ines_remote_enable,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1248  enable_eos : ines_enable_eos,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1249  disable_eos : ines_disable_eos,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1250  parallel_poll : ines_parallel_poll,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1251  parallel_poll_configure : ines_parallel_poll_configure,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1252  parallel_poll_response : ines_parallel_poll_response,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1253  local_parallel_poll_mode : NULL, // XXX
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1254  line_status : ines_line_status,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1255  update_status : ines_update_status,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1256  primary_address : ines_primary_address,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1257  secondary_address : ines_secondary_address,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1258  serial_poll_response : ines_serial_poll_response,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1259  serial_poll_status : ines_serial_poll_status,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1260  t1_delay : ines_t1_delay,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1261  return_to_local : ines_return_to_local,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1262  };
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1263  
bb1bd92fa0f2c9 Dave Penkler 2024-09-18 @1264  gpib_interface_t ines_pcmcia_accel_interface = {
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1265  name: "ines_pcmcia_accel",
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1266  attach : ines_pcmcia_accel_attach,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1267  detach : ines_pcmcia_detach,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1268  read : ines_accel_read,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1269  write : ines_accel_write,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1270  command : ines_command,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1271  take_control : ines_take_control,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1272  go_to_standby : ines_go_to_standby,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1273  request_system_control : ines_request_system_control,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1274  interface_clear : ines_interface_clear,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1275  remote_enable : ines_remote_enable,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1276  enable_eos : ines_enable_eos,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1277  disable_eos : ines_disable_eos,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1278  parallel_poll : ines_parallel_poll,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1279  parallel_poll_configure : ines_parallel_poll_configure,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1280  parallel_poll_response : ines_parallel_poll_response,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1281  local_parallel_poll_mode : NULL, // XXX
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1282  line_status : ines_line_status,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1283  update_status : ines_update_status,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1284  primary_address : ines_primary_address,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1285  secondary_address : ines_secondary_address,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1286  serial_poll_response : ines_serial_poll_response,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1287  serial_poll_status : ines_serial_poll_status,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1288  t1_delay : ines_t1_delay,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1289  return_to_local : ines_return_to_local,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1290  };
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1291  
bb1bd92fa0f2c9 Dave Penkler 2024-09-18 @1292  gpib_interface_t ines_pcmcia_interface = {
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1293  name: "ines_pcmcia",
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1294  attach : ines_pcmcia_accel_attach,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1295  detach : ines_pcmcia_detach,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1296  read : ines_accel_read,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1297  write : ines_accel_write,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1298  command : ines_command,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1299  take_control : ines_take_control,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1300  go_to_standby : ines_go_to_standby,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1301  request_system_control : ines_request_system_control,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1302  interface_clear : ines_interface_clear,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1303  remote_enable : ines_remote_enable,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1304  enable_eos : ines_enable_eos,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1305  disable_eos : ines_disable_eos,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1306  parallel_poll : ines_parallel_poll,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1307  parallel_poll_configure : ines_parallel_poll_configure,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1308  parallel_poll_response : ines_parallel_poll_response,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1309  local_parallel_poll_mode : NULL, // XXX
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1310  line_status : ines_line_status,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1311  update_status : ines_update_status,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1312  primary_address : ines_primary_address,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1313  secondary_address : ines_secondary_address,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1314  serial_poll_response : ines_serial_poll_response,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1315  serial_poll_status : ines_serial_poll_status,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1316  t1_delay : ines_t1_delay,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1317  return_to_local : ines_return_to_local,
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1318  };
bb1bd92fa0f2c9 Dave Penkler 2024-09-18  1319  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
