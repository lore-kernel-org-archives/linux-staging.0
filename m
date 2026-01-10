Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B117E29B228;
	Sat, 10 Jan 2026 08:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768034503; cv=none; b=CNs0C8kb/Vgq39D4QOPFiy9ZllYHg4mANzSkby1yLgr5B/Vfkq83+BCc3nJnF7V83AQ6HjkRn4bARrkjkNTjnYYetP+/wYxONdAwNjLdX9Kgd0LS8sIidN+ejDEc/mYHo+ZdAa2KGmNhG/t5Qz+f8ThYKUSDJcIK25o0HmxYiuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768034503; c=relaxed/simple;
	bh=1DjWPWdhX0Ie/qaQwpDtxf1YgBrSUghYnpPn9Q+vyVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+PLcF3Rp/uJnMmnxN/kdpZOjTe8qESlXqto45huOb02ttrxrE0k87+t+GdwZmKoljue77Vr2ykqZJGqNHMQtTrZ5GIcxbPhPze37pG8BpEgrXJRCtqtCbf5vEQYPBKynvR+3Fi3+wZy3XOMHDBL9ensyDOYWAKCUAB7S6QCbxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B1PNLviW; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1PNLviW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768034502; x=1799570502;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1DjWPWdhX0Ie/qaQwpDtxf1YgBrSUghYnpPn9Q+vyVg=;
  b=B1PNLviWfaeOZqcnCqkNpFEo5awyGmwri7eAaW3NrQZVt95ySnt4i87x
   AJjAqwjb9FLPqJKHKHFPnmMQo4Wm7ebi6gE552iU0EAK8MW/qSLiUF4l2
   YaVjA9N5TaJkp/RU13qgSACwNbfYPXDY4dA4QuSYZRsjhpeA7FUH92Nu3
   +Ifi/y6ULybk3l52eg3L47k4IG21YET7UcbBUVykWhA0YHpTyvkFBGW2U
   jCfDfLP7QntwyQGlUU6O+7oq+D7QNLVD7QpTV7kg6k9U+ikH0/Gz6HYa1
   o1LIw2MNms1TPExk3D0smwgH3k2qcabV690bBYD/tnj3G+wyru+xe8Dwq
   w==;
X-CSE-ConnectionGUID: xqddcZYOQe+4a/qLIO6HJA==
X-CSE-MsgGUID: B7j4CmkATDKFHHiPtrW7yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="71974038"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="71974038"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 00:41:41 -0800
X-CSE-ConnectionGUID: 1c+mjFeoS1KP5FPn/ejt2w==
X-CSE-MsgGUID: qvPX263eSECPkl3AYRmXCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="234870732"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Jan 2026 00:41:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veUXR-000000008Se-3lVF;
	Sat, 10 Jan 2026 08:41:37 +0000
Date: Sat, 10 Jan 2026 16:41:25 +0800
From: kernel test robot <lkp@intel.com>
To: Nayana Mariyappa <nayana.mariyappa@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nayana Mariyappa <nayana.mariyappa@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: fix coding style issues in
 osdep_service.c
Message-ID: <202601101642.PaiOTqlr-lkp@intel.com>
References: <20260109093801.15334-1-nayana.mariyappa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109093801.15334-1-nayana.mariyappa@gmail.com>

Hi Nayana,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Nayana-Mariyappa/staging-rtl8723bs-fix-coding-style-issues-in-osdep_service-c/20260109-174134
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260109093801.15334-1-nayana.mariyappa%40gmail.com
patch subject: [PATCH] staging: rtl8723bs: fix coding style issues in osdep_service.c
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260110/202601101642.PaiOTqlr-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601101642.PaiOTqlr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601101642.PaiOTqlr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/staging/rtl8723bs/os_dep/osdep_service.c:9 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Translate the OS dependent @param error_code to OS independent RTW_STATUS_CODE

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
