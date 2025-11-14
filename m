Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38CD2586C2;
	Fri, 14 Nov 2025 01:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763084559; cv=none; b=m/qwCk/YkP17l8dhjJL0Z/bbdGOtEVbkvsKV+VUIGGRDWVSGvZ9G7xBC5vQEWAaIxsAsFagLCwZN6v6JBfwCNwPSTfu7X+mGOWUjozFmQyMDEAaUTD+FYC8Q9JSQI/44QpBo1sYBl4vHB/P4AQXdddb5hoAYJyFOjS9/cTE4ePU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763084559; c=relaxed/simple;
	bh=u5YdnzGkL+WRVBM1n72jQPK6f9r0K31Jkf9kkUeRGMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZRUwD6TM9ZPiDaXBPabld/CwxPpT7gcaIiHUBPyw8TNMxNXw8QYR3QLjcsJW8W/Y6oOjjbGyY41ZrnPeZV5asVOTdCvFZ0BUla6/kzZRMTZYB8U9jFd+AR5Yo1WiGO5BrhP/6bMdQuUiZcAVyCx5xcAQWmtCUb8JiE92OdPcCbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RSWnWrRL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RSWnWrRL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763084557; x=1794620557;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u5YdnzGkL+WRVBM1n72jQPK6f9r0K31Jkf9kkUeRGMI=;
  b=RSWnWrRLLU0+23ibRxHoLqoHT3xr/lRREneJfj9NOnUue7EqtnCAcqqy
   +PLsFsXJIKdFqFg0tREh17pjNiaIHLgDsVabgW3rPX3uttXWTa65rdyC4
   whNFtSvWApl1qe+VrPy1PIlaaqnN4mzmRQFotE5kQW8n3sBm/tUxs0n/+
   wXb9r257emNJGV+7+3vcE+VMolTIRsJMNE7TJu6Vg68YbUhN7sHr7zspk
   UnlaZlTu7EVp0SG9994GOYPTevmT/hS2GcoxKos4zS5pMLn6FdY51twx+
   /mzJZRr+mwY1RlwURvRh8bjzbT1jdsa5x46HIPbtEzXVeCtdSxLKyYZW8
   A==;
X-CSE-ConnectionGUID: IfYDRmPAS4yc4SwRLPfAgQ==
X-CSE-MsgGUID: BciQjX0pSKqOWg9R1fpcdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65273075"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="65273075"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 17:42:36 -0800
X-CSE-ConnectionGUID: afH/k2z9Rlu0+k4D3GRIfQ==
X-CSE-MsgGUID: odGSQhKSTAOG/PN8uSixYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="189657191"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Nov 2025 17:42:33 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJipa-00063n-1d;
	Fri, 14 Nov 2025 01:42:30 +0000
Date: Fri, 14 Nov 2025 09:41:57 +0800
From: kernel test robot <lkp@intel.com>
To: Chang Junzheng <guagua210311@qq.com>, outreachy@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev, Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, guagua210311@qq.com,
	Chang Junzheng <guagua210311@outlook.com>
Subject: Re: [PATCH v2] staging: greybus: audio_manager_module: make envp
 array static const
Message-ID: <202511140945.OPHTq1yc-lkp@intel.com>
References: <tencent_3725607DD617A567779DEB1BEC7C3B335208@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_3725607DD617A567779DEB1BEC7C3B335208@qq.com>

Hi Chang,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Chang-Junzheng/staging-greybus-audio_manager_module-make-envp-array-static-const/20251113-222509
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/tencent_3725607DD617A567779DEB1BEC7C3B335208%40qq.com
patch subject: [PATCH v2] staging: greybus: audio_manager_module: make envp array static const
config: arm-randconfig-001-20251114 (https://download.01.org/0day-ci/archive/20251114/202511140945.OPHTq1yc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511140945.OPHTq1yc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511140945.OPHTq1yc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/greybus/audio_manager_module.c: In function 'send_add_uevent':
>> drivers/staging/greybus/audio_manager_module.c:163:9: error: initializer element is not constant
     163 |         name_string,
         |         ^~~~~~~~~~~
   drivers/staging/greybus/audio_manager_module.c:163:9: note: (near initialization for 'envp[0]')
   drivers/staging/greybus/audio_manager_module.c:164:9: error: initializer element is not constant
     164 |         vid_string,
         |         ^~~~~~~~~~
   drivers/staging/greybus/audio_manager_module.c:164:9: note: (near initialization for 'envp[1]')
   drivers/staging/greybus/audio_manager_module.c:165:9: error: initializer element is not constant
     165 |         pid_string,
         |         ^~~~~~~~~~
   drivers/staging/greybus/audio_manager_module.c:165:9: note: (near initialization for 'envp[2]')
   drivers/staging/greybus/audio_manager_module.c:166:9: error: initializer element is not constant
     166 |         intf_id_string,
         |         ^~~~~~~~~~~~~~
   drivers/staging/greybus/audio_manager_module.c:166:9: note: (near initialization for 'envp[3]')
   drivers/staging/greybus/audio_manager_module.c:167:9: error: initializer element is not constant
     167 |         ip_devices_string,
         |         ^~~~~~~~~~~~~~~~~
   drivers/staging/greybus/audio_manager_module.c:167:9: note: (near initialization for 'envp[4]')
   drivers/staging/greybus/audio_manager_module.c:168:9: error: initializer element is not constant
     168 |         op_devices_string,
         |         ^~~~~~~~~~~~~~~~~
   drivers/staging/greybus/audio_manager_module.c:168:9: note: (near initialization for 'envp[5]')
>> drivers/staging/greybus/audio_manager_module.c:181:53: error: passing argument 3 of 'kobject_uevent_env' from incompatible pointer type [-Wincompatible-pointer-types]
     181 |         kobject_uevent_env(&module->kobj, KOBJ_ADD, envp);
         |                                                     ^~~~
         |                                                     |
         |                                                     const char * const*
   In file included from drivers/staging/greybus/audio_manager.h:11,
                    from drivers/staging/greybus/audio_manager_module.c:10:
   include/linux/kobject.h:216:31: note: expected 'char **' but argument is of type 'const char * const*'
     216 |                         char *envp[]);
         |                         ~~~~~~^~~~~~


vim +163 drivers/staging/greybus/audio_manager_module.c

8db00736d365b7 Svetlin Ankov    2016-01-13  152  
8db00736d365b7 Svetlin Ankov    2016-01-13  153  static void send_add_uevent(struct gb_audio_manager_module *module)
8db00736d365b7 Svetlin Ankov    2016-01-13  154  {
8db00736d365b7 Svetlin Ankov    2016-01-13  155  	char name_string[128];
8db00736d365b7 Svetlin Ankov    2016-01-13  156  	char vid_string[64];
8db00736d365b7 Svetlin Ankov    2016-01-13  157  	char pid_string[64];
d0af1bd5f6f449 Pankaj Bharadiya 2016-10-16  158  	char intf_id_string[64];
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  159  	char ip_devices_string[64];
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  160  	char op_devices_string[64];
8db00736d365b7 Svetlin Ankov    2016-01-13  161  
9af5fbe96477a4 Chang Junzheng   2025-11-13  162  	static const char * const envp[] = {
8db00736d365b7 Svetlin Ankov    2016-01-13 @163  	name_string,
8db00736d365b7 Svetlin Ankov    2016-01-13  164  	vid_string,
8db00736d365b7 Svetlin Ankov    2016-01-13  165  	pid_string,
d0af1bd5f6f449 Pankaj Bharadiya 2016-10-16  166  	intf_id_string,
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  167  	ip_devices_string,
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  168  	op_devices_string,
8db00736d365b7 Svetlin Ankov    2016-01-13  169  	NULL
8db00736d365b7 Svetlin Ankov    2016-01-13  170  	};
8db00736d365b7 Svetlin Ankov    2016-01-13  171  
8db00736d365b7 Svetlin Ankov    2016-01-13  172  	snprintf(name_string, 128, "NAME=%s", module->desc.name);
8db00736d365b7 Svetlin Ankov    2016-01-13  173  	snprintf(vid_string, 64, "VID=%d", module->desc.vid);
8db00736d365b7 Svetlin Ankov    2016-01-13  174  	snprintf(pid_string, 64, "PID=%d", module->desc.pid);
d0af1bd5f6f449 Pankaj Bharadiya 2016-10-16  175  	snprintf(intf_id_string, 64, "INTF_ID=%d", module->desc.intf_id);
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  176  	snprintf(ip_devices_string, 64, "I/P DEVICES=0x%X",
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  177  		 module->desc.ip_devices);
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  178  	snprintf(op_devices_string, 64, "O/P DEVICES=0x%X",
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  179  		 module->desc.op_devices);
8db00736d365b7 Svetlin Ankov    2016-01-13  180  
8db00736d365b7 Svetlin Ankov    2016-01-13 @181  	kobject_uevent_env(&module->kobj, KOBJ_ADD, envp);
8db00736d365b7 Svetlin Ankov    2016-01-13  182  }
8db00736d365b7 Svetlin Ankov    2016-01-13  183  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
