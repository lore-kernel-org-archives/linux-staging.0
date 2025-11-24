Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB322EB878;
	Mon, 24 Nov 2025 07:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763971017; cv=none; b=G6g31gGvfd46zah6M8ZqT6z7XFEUOjN00bnXtCnZq+6jMl48ZXzBdmhpUitRA/hZ1sr8jHOvC3/9ZDqE1MCieRcJ71WFM2PUH5PutQmsmYzO3Uj5jJzZRbyiBECOc+Bj3VAWCYPlSQ/e7+1D+5bMWwJCecrwunImUlYiA+crZPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763971017; c=relaxed/simple;
	bh=JMmyA1UM03VItCiB0V0yBZrq4sGkGXbx679o50P2+HI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hle6S37pFuBXnE93CcRucpnU0h+EdNsXcn/YyW3J9v9FytiygjEHaDWmkTFHLKLYvkaheNMyvxCV1wkQYVIXkx8HrvvmJXV9zaOJRhDjZtJXCTimz9sNM3sW3hbAyEJbQoxi+38OJ/J1d4Ujl9IdD23WXmhZ9lkp7CmTq915ZQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eg/8h2Oo; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eg/8h2Oo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763971016; x=1795507016;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JMmyA1UM03VItCiB0V0yBZrq4sGkGXbx679o50P2+HI=;
  b=Eg/8h2OoW2afi2p9u/maE43LpmOm85s0uSWV1RZ9ierCImB7tUqrcWKg
   lspegbHpypxmhRQzm1wn/9W3Doteo1l3XR//Cm8zxtC2ZKL2HwiMwlUgz
   UKVcnwbPctaJWZzRJRvDa2HuzP24gEe+/CemmkNfPL7x0aA/sqgpYoi+f
   H1w+YJOwrCaS9YZVt7UaHqCF+OPLQUK65Nwv+svYKWHyibLO5AMK41t6P
   1y+tqyA/VNkoUnb731B8mOKcSclsLOr2HknBXVuAkv5bsVbUT/vdujJXw
   M8shkmy/lwjfTvHnYxTx42c1DW5Tk/gytjkjPNwP7TsMEU/7SIB4vDb2U
   Q==;
X-CSE-ConnectionGUID: wXBrHfFaQsaMmHJFo+v7jA==
X-CSE-MsgGUID: BEkpBIchTZevQbZ/BISkTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="64966497"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="64966497"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 23:56:55 -0800
X-CSE-ConnectionGUID: s1x/SJaCSGCq1rywLWdfVQ==
X-CSE-MsgGUID: LxtbkT5CQ7iY7XUOE0vmnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="229550980"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Nov 2025 23:56:52 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNRRJ-000000000V3-3nQe;
	Mon, 24 Nov 2025 07:56:49 +0000
Date: Mon, 24 Nov 2025 15:56:18 +0800
From: kernel test robot <lkp@intel.com>
To: Sameeksha Sankpal <sameekshasankpal@gmail.com>, vaibhav.sr@gmail.com,
	mgreer@animalcreek.com
Cc: oe-kbuild-all@lists.linux.dev, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Sameeksha Sankpal <sameekshasankpal@gmail.com>
Subject: Re: [PATCH] staging: greybus: audio_manager: make envp[] static const
Message-ID: <202511241504.tsKxZp9G-lkp@intel.com>
References: <20251122083814.49753-1-sameekshasankpal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122083814.49753-1-sameekshasankpal@gmail.com>

Hi Sameeksha,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Sameeksha-Sankpal/staging-greybus-audio_manager-make-envp-static-const/20251122-163906
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20251122083814.49753-1-sameekshasankpal%40gmail.com
patch subject: [PATCH] staging: greybus: audio_manager: make envp[] static const
config: i386-randconfig-007-20251124 (https://download.01.org/0day-ci/archive/20251124/202511241504.tsKxZp9G-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511241504.tsKxZp9G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511241504.tsKxZp9G-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/greybus/audio_manager_module.c: In function 'send_add_uevent':
>> drivers/staging/greybus/audio_manager_module.c:163:17: error: initializer element is not constant
     163 |                 name_string,
         |                 ^~~~~~~~~~~
   drivers/staging/greybus/audio_manager_module.c:163:17: note: (near initialization for 'envp[0]')
   drivers/staging/greybus/audio_manager_module.c:164:17: error: initializer element is not constant
     164 |                 vid_string,
         |                 ^~~~~~~~~~
   drivers/staging/greybus/audio_manager_module.c:164:17: note: (near initialization for 'envp[1]')
   drivers/staging/greybus/audio_manager_module.c:165:17: error: initializer element is not constant
     165 |                 pid_string,
         |                 ^~~~~~~~~~
   drivers/staging/greybus/audio_manager_module.c:165:17: note: (near initialization for 'envp[2]')
   drivers/staging/greybus/audio_manager_module.c:166:17: error: initializer element is not constant
     166 |                 intf_id_string,
         |                 ^~~~~~~~~~~~~~
   drivers/staging/greybus/audio_manager_module.c:166:17: note: (near initialization for 'envp[3]')
   drivers/staging/greybus/audio_manager_module.c:167:17: error: initializer element is not constant
     167 |                 ip_devices_string,
         |                 ^~~~~~~~~~~~~~~~~
   drivers/staging/greybus/audio_manager_module.c:167:17: note: (near initialization for 'envp[4]')
   drivers/staging/greybus/audio_manager_module.c:168:17: error: initializer element is not constant
     168 |                 op_devices_string,
         |                 ^~~~~~~~~~~~~~~~~
   drivers/staging/greybus/audio_manager_module.c:168:17: note: (near initialization for 'envp[5]')
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

8db00736d365b7 Svetlin Ankov     2016-01-13  152  
8db00736d365b7 Svetlin Ankov     2016-01-13  153  static void send_add_uevent(struct gb_audio_manager_module *module)
8db00736d365b7 Svetlin Ankov     2016-01-13  154  {
8db00736d365b7 Svetlin Ankov     2016-01-13  155  	char name_string[128];
8db00736d365b7 Svetlin Ankov     2016-01-13  156  	char vid_string[64];
8db00736d365b7 Svetlin Ankov     2016-01-13  157  	char pid_string[64];
d0af1bd5f6f449 Pankaj Bharadiya  2016-10-16  158  	char intf_id_string[64];
a9234bfd6cec44 Vaibhav Agarwal   2016-03-30  159  	char ip_devices_string[64];
a9234bfd6cec44 Vaibhav Agarwal   2016-03-30  160  	char op_devices_string[64];
8db00736d365b7 Svetlin Ankov     2016-01-13  161  
c78cfcfa51fa58 Sameeksha Sankpal 2025-11-22  162  	static const char * const envp[] = {
8db00736d365b7 Svetlin Ankov     2016-01-13 @163  		name_string,
8db00736d365b7 Svetlin Ankov     2016-01-13  164  		vid_string,
8db00736d365b7 Svetlin Ankov     2016-01-13  165  		pid_string,
d0af1bd5f6f449 Pankaj Bharadiya  2016-10-16  166  		intf_id_string,
a9234bfd6cec44 Vaibhav Agarwal   2016-03-30  167  		ip_devices_string,
a9234bfd6cec44 Vaibhav Agarwal   2016-03-30  168  		op_devices_string,
8db00736d365b7 Svetlin Ankov     2016-01-13  169  		NULL
8db00736d365b7 Svetlin Ankov     2016-01-13  170  	};
8db00736d365b7 Svetlin Ankov     2016-01-13  171  
8db00736d365b7 Svetlin Ankov     2016-01-13  172  	snprintf(name_string, 128, "NAME=%s", module->desc.name);
8db00736d365b7 Svetlin Ankov     2016-01-13  173  	snprintf(vid_string, 64, "VID=%d", module->desc.vid);
8db00736d365b7 Svetlin Ankov     2016-01-13  174  	snprintf(pid_string, 64, "PID=%d", module->desc.pid);
d0af1bd5f6f449 Pankaj Bharadiya  2016-10-16  175  	snprintf(intf_id_string, 64, "INTF_ID=%d", module->desc.intf_id);
a9234bfd6cec44 Vaibhav Agarwal   2016-03-30  176  	snprintf(ip_devices_string, 64, "I/P DEVICES=0x%X",
a9234bfd6cec44 Vaibhav Agarwal   2016-03-30  177  		 module->desc.ip_devices);
a9234bfd6cec44 Vaibhav Agarwal   2016-03-30  178  	snprintf(op_devices_string, 64, "O/P DEVICES=0x%X",
a9234bfd6cec44 Vaibhav Agarwal   2016-03-30  179  		 module->desc.op_devices);
8db00736d365b7 Svetlin Ankov     2016-01-13  180  
8db00736d365b7 Svetlin Ankov     2016-01-13 @181  	kobject_uevent_env(&module->kobj, KOBJ_ADD, envp);
8db00736d365b7 Svetlin Ankov     2016-01-13  182  }
8db00736d365b7 Svetlin Ankov     2016-01-13  183  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
