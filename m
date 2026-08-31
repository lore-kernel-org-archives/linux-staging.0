Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C2E3E5EC6
	for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 10:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170625; cv=none; b=jSKNBAxqLdh5DAW0LqTB5PDm+9+2MbuPh3r4hFSQLWg39XWTEMGjd1PtnuY6ROwn0D3HoBnM2tdXZsAlbwK7oz1bmZ+N75e0sZ3U7+DJ6rBk2CSTRUmbq1ApbGrtpW+zZiqeatKgLyU905xp3zaFf2S4VkLOY98MOVI4T75l2sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170625; c=relaxed/simple;
	bh=lRbSSu/+b4rTToiOU8MM/0ji99H9vzmGs7aSniLhDwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IH7qiPNDdlfTPPS/owB7M9Bb9Xe8GxKKgg3I2C6N1W4wmhVtpKl+oR1+uFdZcH7C2G9CToIWMKoYD/b8plr748fGC7Azwy1ErUN4ZSojZEzYNLCTgumEIB2sYgvC4j3SOhNnGne48ji1tNMrDG3ottgS2DBRmLLQcHVDqCAE390=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWojYNir; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWojYNir"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788170623; x=1819706623;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lRbSSu/+b4rTToiOU8MM/0ji99H9vzmGs7aSniLhDwg=;
  b=fWojYNir0VP5DcCxgFzdgqJytCMOpFwo5bVQcJnubIxw3myiSH6nAZC3
   JpBMI4cmF24CyijsS2+WiUFUxX2PKZqo/cKOBJHFVzVNMg5z8ujouXeXX
   hte8rwAvP7PlZhy2LvmL7m9xCUa5wjJbV9k2uviMpqUFcrkzYb+WLspNb
   2PSmeQ4t/SXe5LSXmRIIbN7HztDuGJHPkLeAEV44YYIub0SOV9vEGfa3W
   WxRw5vMS7YzXK20OJxjl3iDX/cCScdpLtXM73Klg9nDaMTDlpkgmnV0fL
   aVs2WjpYzlLuvXea1V3hG1qWPGrhbcuBd9iF5ezz6ID79vEKKZMHq956/
   Q==;
X-CSE-ConnectionGUID: 4jFCD8xWSrOH/9odioiP4Q==
X-CSE-MsgGUID: XYF3rxpHR06+6Rt3IxQgNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99175572"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="99175572"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 03:03:42 -0700
X-CSE-ConnectionGUID: z3FoL9HLSoOnfAZM7Da+Pg==
X-CSE-MsgGUID: R1TMSTsPRja2k2elN8uW4g==
X-ExtLoop1: 1
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.21])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 03:03:39 -0700
Date: Mon, 31 Aug 2026 13:03:36 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 12/15] media: ov2740: add manual white balance controls
Message-ID: <apVReFqDOIhPDnNj@ashevche-desk.local>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <a34bb1a2647d85de407b4c93627981ef0577cc75.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a34bb1a2647d85de407b4c93627981ef0577cc75.1787933456.git.mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 28, 2026 at 06:14:54PM +0200, Maurizio Casciano wrote:
> The sensor has separate red, green and blue manual white-balance gain
> registers, but the driver currently writes the same digital-gain value
> to all three channels. This prevents userspace from correcting the
> strong color cast of raw Bayer capture.
> 
> Expose red- and blue-balance controls relative to the digital gain,
> update all three channels under group hold,

> and always release and launch the group even when a channel write fails.

This part can be split to a separate change explaining "why?". What's wrong
if we don't do this (as it's currently done in the original code)?

> Tested on the Yoga Book OV2740 with live gain changes and continuous raw
> capture.

-- 
With Best Regards,
Andy Shevchenko


