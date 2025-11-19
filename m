Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EA022154B;
	Wed, 19 Nov 2025 04:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763525279; cv=none; b=T48o5Zun+KWS27xIS5apGarJu+3Y6UjBxon7ufd1UmQKC2aAa5avwlEX+C16QzeQ4e9qKm1GHVkNjXG3DmIdzrMymvMBsNbu7rvlsZgyip93d3uDmwnU6Wb/21gniW5hLNLP8mkdlB9vE2Fy98+xVbhTNxd9S2smc95Im8aBRF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763525279; c=relaxed/simple;
	bh=JwR96N0h7m0PPjccKfB4zI40qnHf8dnXo6VVwbxo0w8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ocdH4eXnZYaJFR7igEkZ83h/lC5IuX4g7ezlnbnmjidXV86wbXyuAXA2ThQJ+XSG8lVF85LloQt4Mn0AEasQDoGCFudiXjMUKnMZKLxTfDmAqmnzcA2qwxwY04lrX+N60IOFXa4uFjLHKHAVciMBPRQwKdN0Y1CfGTySmS3eLpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jt2QZ/jC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jt2QZ/jC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763525278; x=1795061278;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JwR96N0h7m0PPjccKfB4zI40qnHf8dnXo6VVwbxo0w8=;
  b=Jt2QZ/jC4ajjR5J1XncNE94bu2qoCBpUCVRimIfz59Gz83j/WeKj6DUY
   WQnECyNotk3FKVjO867w75mx6BUcx2os5Pm/cniSrtClXzR+gtUF9ICHo
   Ip7CtAWkNS/aVhR6AYFg6/JHVvxbwhAqEipYsio2ig9nBVO4w4Nhm2eij
   7vf8PArWMeIdF4MLlig47z6ZOQ6cSXAyFEYGov9YU6tfwPfwocKPSxYrJ
   UZ4RZXxo/JpFuMEm5w0slKDe9jf9vaWc4IZaVdNPloxARYbZV/Suf3hHA
   ZADaz+O/ZfJzmiJO2kWNeb7HlwEPgomhme3000JvMpHkK0t3OtWE/3guY
   A==;
X-CSE-ConnectionGUID: LwWCswsiQ8yAAP+de9TeaA==
X-CSE-MsgGUID: pc0ZpoGgR0KzYXLo0oLfiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="64757249"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="64757249"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 20:07:57 -0800
X-CSE-ConnectionGUID: TeazzyDPRc+uKXWS/ZyBag==
X-CSE-MsgGUID: pYx0xFmPTPqGGtrSuAW6uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="190729628"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Nov 2025 20:07:54 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLZU0-0002RN-0z;
	Wed, 19 Nov 2025 04:07:52 +0000
Date: Wed, 19 Nov 2025 12:07:47 +0800
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
Message-ID: <202511191127.cg63hCHn-lkp@intel.com>
References: <tencent_A64EA96730156BC5D2E33B86752776DB9D07@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_A64EA96730156BC5D2E33B86752776DB9D07@qq.com>

Hi Chang,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Chang-Junzheng/staging-greybus-audio_manager_module-make-envp-array-static-const/20251114-094319
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/tencent_A64EA96730156BC5D2E33B86752776DB9D07%40qq.com
patch subject: [PATCH v2] staging: greybus: audio_manager_module: make envp array static const
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20251119/202511191127.cg63hCHn-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511191127.cg63hCHn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511191127.cg63hCHn-lkp@intel.com/

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
0e0a4291b18003 Chang Junzheng   2025-11-14  162  	static const char * const envp[] = {
8db00736d365b7 Svetlin Ankov    2016-01-13 @163  	name_string,
8db00736d365b7 Svetlin Ankov    2016-01-13  164  	vid_string,
8db00736d365b7 Svetlin Ankov    2016-01-13  165  	pid_string,
d0af1bd5f6f449 Pankaj Bharadiya 2016-10-16 @166  	intf_id_string,
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
