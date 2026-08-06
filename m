Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19DC41A91F
	for <linux-staging@lists.linux.dev>; Thu,  6 Aug 2026 23:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786057329; cv=none; b=fa6V93t583nOKff8T2SfE0UdpPjWixQWv3uwTZ2zrh4xrezEadgjP2R7kAC8mBw+7q1DdzKlVCyjcLkLMi3jYNbaJHW8k2It4bDTpzMqvaqt3GMNalP5qr7dWDfBoBB0fPz0ZwNZ89GJfO6iCpicI0YxmBnYiSQ+MyLzrBslTh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786057329; c=relaxed/simple;
	bh=Fay4qnmG2Gz2NNI7ele3DHj4DeurLQaxgsSMQ0zcqhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UFqcNlxGvNpGc8YngxT6OS0sE2l6mf6Sg+w82zkQQ/Gmo49B+HAHemxtWmbVzQRrrpOngo2yAO/GI/whzc4rt/Yg2g1O4EyPJ07GegX8I7xfrLEfo1oBPZZhFPYFd61T+15GD8ooB0HERVBCggDn9HrFmO48MJK3Qh2pQu6kTwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a2RECdkT; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a2RECdkT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786057328; x=1817593328;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fay4qnmG2Gz2NNI7ele3DHj4DeurLQaxgsSMQ0zcqhI=;
  b=a2RECdkTl4Wb5cMcxXegK61Nu/3xyBiM5XdwHf+O1lesFHn4VMqas70V
   L8NGh/W0AUaJsecr5kviKe0YhaDJfiyXKlmypZXIdzXpRbdzz78iiYbDg
   zT5GFEwim3vEjvxxPqqa9LGuLDhmpQMMO/Qs2eHIbMWGrk05cUHcDH/lH
   28H2GjinxAWOaBAlaD/KagsbsfIY2RyeiFxEe8l7oLg56rLa/4DrtbOJ2
   8G3icnh45c7fUiUbw+qbnqnCKHiN/K9cijUVCdXe+/wMeaGuSX/ZEpRRK
   mGQjkrPYDT7OmDl3xLYVnlt7Bmgf5vZV+6vblZjulFQHAk0ad2Bbz4Ybq
   w==;
X-CSE-ConnectionGUID: e0gCPzDJRieFcdQspqrOYw==
X-CSE-MsgGUID: Q6eMlJu9QFKL1YnkV1H1CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="89191505"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="89191505"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 16:02:07 -0700
X-CSE-ConnectionGUID: ziFoLghkTACQQCkeEuVeig==
X-CSE-MsgGUID: /IMPqO47TdaUQLVyr3QxIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="255992262"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.50])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 16:02:04 -0700
Date: Fri, 7 Aug 2026 02:02:02 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Julieta Goria <jgoria@dc.uba.ar>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com
Subject: Re: [PATCH] staging: media: atomisp: align * on comment
Message-ID: <anUSag_Xy3ESEGVi@ashevche-desk.local>
References: <20260723161814.115168-1-jgoria@dc.uba.ar>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723161814.115168-1-jgoria@dc.uba.ar>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 23, 2026 at 01:18:12PM -0300, Julieta Goria wrote:
> fixed the following checkpatch warning:
> WARNING: Block comments should align the * on each line
> in staging/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.c:80:
> 
> Signed-off-by: Julieta Goria <jgoria@dc.uba.ar>
> 
> ---
> 
> Hey, this is my first patch contribution, I would appreciate any feedback. Thanks!

Right.
Please, read lore.kernel.org linux-media@ archives against this driver to
understand why this patch is no-go.

Also, if you are in a group that is mentored, tell to the mentors to stop
looking into this driver by a newbie. This driver has much more urgent tasks
to do and it's not trivial, it also requires a real HW to be at hand to test.

-- 
With Best Regards,
Andy Shevchenko


