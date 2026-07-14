Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EAC36C0AC;
	Tue, 14 Jul 2026 14:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784037635; cv=none; b=LFWj0Q7fzXAIXnJNmXU/tfoid0Zoj0VHgndfLNoTkuABanSTYjDhMhrq9VGJIP3GBl1DiMbbmcrL9Xjqpewk96N8BnWkoDWJmGKcKSlJuKSDeBJFK5NhU2CUpvHG232K0hST/fg9Y4Tx5XsO5QdyXZtH2cPN0+TqwyBRYdfOCU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784037635; c=relaxed/simple;
	bh=JlTtuTgyttUoJX1tzSz3FCb8u2Xjs4nbU6LV982KfNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dw1vo48X71GSfOY5GLbWxAJ8rLkK+fMrHONP7QsBIb/22fp6R2Wdi12octtAMPfzbJg46yPNh9q0ER7lWUtGArZSqgpQenE4fJLyzwy9S1+YmME6/x7tnzxbhV7IiR0SPMXWbohn+hq4zdaPhmaVvbjwhg2walYFrsthfObU3/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fQYhA4+L; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fQYhA4+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784037634; x=1815573634;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JlTtuTgyttUoJX1tzSz3FCb8u2Xjs4nbU6LV982KfNo=;
  b=fQYhA4+LarETgrVfmE1QOP1+S17OQlzm5Wxa/4vgky9bCtdmzi5sIUIW
   2zHdDejDa8cnxaieTNJickMQwB1OyVIHuLwo7WXvJmbcU1gAzcbzHQE/G
   gu356fcD6Jt7ECeZ3kpCn2w9xpViZE418lsPi5wHcRRriwAmY29Gp2sww
   PUG2Hm9WHagwV4w/cVkpkVzdhXj5oiMMIjqE79Qbm6noH3ioyk7JOzZij
   pHxArxP9FnwMdyjV1jUJyAAhQmf9h3BZXyWuSLuIheM5Rb2le/ndVSzuZ
   PKdOAF+wu0LgvedTCjXGXZkBiOB7idCsFQORMgBDsAmKffknhA7nrLXNq
   Q==;
X-CSE-ConnectionGUID: FPXtWuE5S2+g5bdjcjRCFw==
X-CSE-MsgGUID: JqUHVK6GSOmZvv77PomMgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="83781031"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="83781031"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 07:00:34 -0700
X-CSE-ConnectionGUID: z8g/5vJ7ROme4zo2zAVSAQ==
X-CSE-MsgGUID: 4ZauGFZWRNeP3PVTEl3ffw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="260764911"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 14 Jul 2026 07:00:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjdgT-00000000Mh2-258m;
	Tue, 14 Jul 2026 14:00:29 +0000
Date: Tue, 14 Jul 2026 21:59:40 +0800
From: kernel test robot <lkp@intel.com>
To: Alfie Varghese <alfievarghese22@gmail.com>, neil.armstrong@linaro.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Alfie Varghese <alfievarghese22@gmail.com>
Subject: Re: [PATCH v2] staging: media: meson: vdec: fix advanced concurrency
 and UAF bugs
Message-ID: <202607142142.HnOYDndp-lkp@intel.com>
References: <20260713181602.773-1-alfievarghese22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713181602.773-1-alfievarghese22@gmail.com>

Hi Alfie,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Alfie-Varghese/staging-media-meson-vdec-fix-advanced-concurrency-and-UAF-bugs/20260714-023427
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260713181602.773-1-alfievarghese22%40gmail.com
patch subject: [PATCH v2] staging: media: meson: vdec: fix advanced concurrency and UAF bugs
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260714/202607142142.HnOYDndp-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607142142.HnOYDndp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607142142.HnOYDndp-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/media/meson/vdec/vdec.c: In function 'vdec_m2m_job_abort':
>> drivers/staging/media/meson/vdec/vdec.c:156:33: error: 'struct amvdec_session' has no member named 'm2m_dev'
     156 |         v4l2_m2m_job_finish(sess->m2m_dev, sess->m2m_ctx);
         |                                 ^~


vim +156 drivers/staging/media/meson/vdec/vdec.c

3e7f51bd96077ac Maxime Jourdan 2019-06-06  151  
3e7f51bd96077ac Maxime Jourdan 2019-06-06  152  static void vdec_m2m_job_abort(void *priv)
3e7f51bd96077ac Maxime Jourdan 2019-06-06  153  {
3e7f51bd96077ac Maxime Jourdan 2019-06-06  154  	struct amvdec_session *sess = priv;
3e7f51bd96077ac Maxime Jourdan 2019-06-06  155  
3e7f51bd96077ac Maxime Jourdan 2019-06-06 @156  	v4l2_m2m_job_finish(sess->m2m_dev, sess->m2m_ctx);
3e7f51bd96077ac Maxime Jourdan 2019-06-06  157  }
3e7f51bd96077ac Maxime Jourdan 2019-06-06  158  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
