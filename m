Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CC229A5;
	Sun,  1 Sep 2024 02:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725157712; cv=none; b=NMRer6+7rgNHnLwf6xL4NoYngj5lTKNK+aIX/atctF/Fu5VvPhq35BS+JRiLrRRlF3V+7iZq5H/FKbi2w1WQTOClku1NBfO0JZV00rhgbDHC1l83wyTZ+mrHJgQBlmq56ifCrTba1E2qxSMmOwUmri54aVijqWAwv+Gl5LCJcho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725157712; c=relaxed/simple;
	bh=RLY9vgtFSSAnUSgXvZyFKQwN2JCSEdXEsD6XtAtQBHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ObZeiiSrMgFdDfrO+7HH7le7/280MmRyxBPZ/R7iKBnZdgzIcVlT6L6BARikOwKOaJ9R2VwjMSVmkU8xGrXpQ5o8YlBmBZ2j4yHD1QCuZu/fS4EN5t2zm3jWpUx5wDOi5UMhvy256YuzOM0Ttr7Ys5FfTkrJLFjZob3M4h5l3/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lixmEOF2; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lixmEOF2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725157710; x=1756693710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RLY9vgtFSSAnUSgXvZyFKQwN2JCSEdXEsD6XtAtQBHQ=;
  b=lixmEOF2eOJNPQHs9Ss+fmosT9PcEPsTrrTr+OQfhQDWHrysVrqdQM76
   cjosVoiJBQzOFFLT0UJlJHVH4Ly42jiyEOY8I/haDbBeLFfGZJv033pMF
   XQN7kpGtzp4duJte4UzebL9n8vMAcaYcvsgI7jVIE0Lab9fpjf/3mkLiV
   nwKAZC0CALgElE2E7ZgPvYLqMjiumRX23kC0lDoowH3LM/0i39yDIYlHA
   Izi5w0ottgJ1F/uiR+yggGF+kd5/9UTsAjD4d61Jc6DHzyyVWC9HxFrek
   Ro2bEC7xLYO/+t5qYgF2AWCPU3czuIXuzJzwcxkjNB3xjvm+rHr5ehZ2y
   Q==;
X-CSE-ConnectionGUID: RU3ITmE0Qg2wMKCCJMnJrw==
X-CSE-MsgGUID: pWRYT/8sSkusn9lPOeGXvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23574856"
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="23574856"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 19:28:29 -0700
X-CSE-ConnectionGUID: RChm/ESJSJKZdhlxhHKlAA==
X-CSE-MsgGUID: Jwh5GKJKQty6aQKz3qbSyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="64296260"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 31 Aug 2024 19:28:26 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skaKG-0003Hi-10;
	Sun, 01 Sep 2024 02:28:24 +0000
Date: Sun, 1 Sep 2024 10:28:14 +0800
From: kernel test robot <lkp@intel.com>
To: Umang Jain <umang.jain@ideasonboard.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Arnd Bergmann <arnd@arndb.de>, Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: Re: [PATCH v2 1/7] staging: vchiq: Factor out bulk transfer for
 VCHIQ_BULK_MODE_WAITING
Message-ID: <202409011052.hHoEnTUy-lkp@intel.com>
References: <20240831162435.191084-2-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240831162435.191084-2-umang.jain@ideasonboard.com>

Hi Umang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Umang-Jain/staging-vchiq-Factor-out-bulk-transfer-for-VCHIQ_BULK_MODE_WAITING/20240901-002839
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20240831162435.191084-2-umang.jain%40ideasonboard.com
patch subject: [PATCH v2 1/7] staging: vchiq: Factor out bulk transfer for VCHIQ_BULK_MODE_WAITING
config: i386-buildonly-randconfig-001-20240901 (https://download.01.org/0day-ci/archive/20240901/202409011052.hHoEnTUy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409011052.hHoEnTUy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409011052.hHoEnTUy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c: In function 'vchiq_bulk_xfer_waiting_interruptible':
>> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:3152:28: warning: variable 'bulk' set but not used [-Wunused-but-set-variable]
    3152 |         struct vchiq_bulk *bulk;
         |                            ^~~~


vim +/bulk +3152 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c

  3140	
  3141	/*
  3142	 * This function is called by VCHIQ ioctl interface and is interruptible.
  3143	 * It may receive -EAGAIN to indicate that a signal has been received
  3144	 * and the call should be retried after being returned to user context.
  3145	 */
  3146	int
  3147	vchiq_bulk_xfer_waiting_interruptible(struct vchiq_instance *instance,
  3148					      unsigned int handle, struct bulk_waiter *userdata)
  3149	{
  3150		struct vchiq_service *service = find_service_by_handle(instance, handle);
  3151		struct bulk_waiter *bulk_waiter;
> 3152		struct vchiq_bulk *bulk;
  3153		int status = -EINVAL;
  3154	
  3155		if (!service)
  3156			goto error_exit;
  3157	
  3158		if (!userdata)
  3159			goto error_exit;
  3160	
  3161		if (service->srvstate != VCHIQ_SRVSTATE_OPEN)
  3162			goto error_exit;
  3163	
  3164		if (vchiq_check_service(service))
  3165			goto error_exit;
  3166	
  3167		bulk_waiter = userdata;
  3168		bulk = bulk_waiter->bulk;
  3169	
  3170		vchiq_service_put(service);
  3171	
  3172		status = 0;
  3173	
  3174		if (wait_for_completion_interruptible(&bulk_waiter->event))
  3175			return -EAGAIN;
  3176		else if (bulk_waiter->actual == VCHIQ_BULK_ACTUAL_ABORTED)
  3177			return -EINVAL;
  3178	
  3179		return status;
  3180	
  3181	error_exit:
  3182		if (service)
  3183			vchiq_service_put(service);
  3184		return status;
  3185	}
  3186	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
