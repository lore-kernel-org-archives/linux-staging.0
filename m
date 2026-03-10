Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CB939DBF1
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 15:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773157628; cv=none; b=Mlg33kxZJLPcP+Vc2D+EMAltqCogCBTu6deoyB4nkRACxbR1kqEYjWQSK42XFTZEUN88vrFH704u28O5qDmMdRl7b+Q+RPvOQ1Wl0VeDWE/zX5+hMSVTSrCkFGCo8A+CttM5vN9T/HFInNVUmELk/ZIIdxNHwRTpsK5QN55yH0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773157628; c=relaxed/simple;
	bh=48OPu68nX57J+iJpQXJVVvscDiuiSAIls6D+cio/1q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fut8YN7o2AbT2a1y0w5QJP+v6STmLohNDe4DMDasC9qPy0hXonTJ+k0qj8bY1KmwWXoGaEFSPvFahjOh9PU8XAxphl0ILA+pVk6KQOROvkYPJ/oMgOQTDDsiZAgnVhiRB9/SCXHfFgVpTbRF3i1alGg4E44wB8YicXjAm0TVi2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LubFatLT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LubFatLT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773157627; x=1804693627;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=48OPu68nX57J+iJpQXJVVvscDiuiSAIls6D+cio/1q4=;
  b=LubFatLTw3C7WFENlvHQUPDrUl2KTnbC18oJbBdmwS4zKME61YHnKrje
   jPC4gQS+Wjiu4z7ejSkjB1Fna4Dn9vdxwQEfgcH5MHutX7T1ZTO3MkvWM
   dO9wxHHVMuRL0TNjiYi/oFxnO7hr0CktLwkFjznraHTAnov4ARJK22k9r
   HIrydfKO7TEPOFQD8zvEtakiA+vKvJwulmPln4oeyX3nmSqtdc5OXGQEp
   7Q2f4w2KN9ND1iMst6E5sDgFmdkWBY+4qetv5WPgA6wf7urKAeadw5zD0
   yglaCSA/lgL+T2TUnuw2cY2vY28+eLolTmMyY2FfbZJPFrLL+r5I/p9W6
   A==;
X-CSE-ConnectionGUID: AYVPqzj7QLqj8xoZgiOtYg==
X-CSE-MsgGUID: XJMEHRP/QRyM3VgiLIrNrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="78062730"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="78062730"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 08:47:07 -0700
X-CSE-ConnectionGUID: bS2+xtnMTqafqDWyhxeT1w==
X-CSE-MsgGUID: 8e/8UxUrSr6o/AgrmVcllw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="216517887"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 08:47:04 -0700
Date: Tue, 10 Mar 2026 17:47:02 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] media: staging: atomisp: Remove unnecessary return
 statement in void function
Message-ID: <abA89i96YiLpRJmy@ashevche-desk.local>
References: <20260310-atomisp-remove-void-return-v2b-v2-1-b0e73f498e25.ref@yahoo.pl>
 <20260310-atomisp-remove-void-return-v2b-v2-1-b0e73f498e25@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v2-1-b0e73f498e25@yahoo.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Mar 10, 2026 at 03:27:44PM +0100, Tomasz Unger wrote:
> Remove redundant 'return;' at the end of void function
> ia_css_dvs_statistics_get(). Void functions do not need an explicit
> return statement at the end. No other occurrences in this file.

> Found with checkpatch.pl --strict.

Is this the only one problem of a kind in the whole driver? If yes, don't
forget mentioning that in the comment / changelog block below.

> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
> Changes in v2:
> - Fixed subject prefix to 'media: staging: atomisp:' (reported by media CI robot)
> - Rebased on media-committers/next
> - Verified with checkpatch.pl --strict: 0 errors, 0 warnings
> - Compiled successfully: make M=drivers/staging/media/atomisp/
> - Module loaded successfully in QEMU with Linux 7.0-rc2
> - Link to v1: https://lore.kernel.org/r/20260305-atomisp-remove-void-return-v2b-v1-1-902e534ecb48@yahoo.pl

-- 
With Best Regards,
Andy Shevchenko


