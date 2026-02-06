Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FA232ED57
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 10:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770374178; cv=none; b=gzTMPltiWj8W4+LVcGj3RzTs2DrVqqCNuv6H3tsVi5h1XE6KLCAyThPfv92wEcPP80KN1dtoEyofmneUIHFseDiQNtncy5UMFhVdIrhTz6NvZ9n4CDOGKKRhEmRauenmYJ0xPQiukGBg4izIVFD9OODb2IeJ0bN2ZbJzqnKpVxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770374178; c=relaxed/simple;
	bh=kVwx9xHPOct8NYQjPahVHNDHhBM1uFvr3Q+pL3rRQM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBFBuoxIQJTfkf7l8p/cRLiwAClyohth91OxJNR/aJdhIXOiRSKSnyaYnSr5+sRTA8azN6ctNeB+pWONsvEQ/Gc06vu6nhzCl8LkMZRIdF9XESxyU1L0S4ZLdsn+QSiyRBIW/MmIM36/oj2JLLRvj2CTBi8DtH2fUo2Iy0eMEnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cvyvKfsm; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cvyvKfsm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770374177; x=1801910177;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kVwx9xHPOct8NYQjPahVHNDHhBM1uFvr3Q+pL3rRQM8=;
  b=cvyvKfsmy2IKLt7AiF48tF+JvEDbbAcxVzjsadHsRefW4vnWPxcy3qKF
   6Pd6l5UhvLq50hsVQsCzREGH0LfyGryWUkLajfJF6mbEOE4K6kr9XLzZL
   mAy4opLJlDQuCpX/r1W1O+cODApxBvAdJ+a4WsNZHGX61aZhaKjCf2HzP
   9iGVug1TZOflgUnLoEgsPDgFgVJNYJPiW5N28dtpMMHX5VSpYMpeUlEuG
   wVkX3DY9Wgj/hwWT3wNTiDPsEiAQStFAQaoCRVRnGRLW3i08MgoZC1sgk
   OtEgCIxaeUiBz85kiwecxsQND057VXALgDSvhT+bxtzq6iFifkSEJqGNF
   A==;
X-CSE-ConnectionGUID: SN2+d2UgSLe1WBZ2/istcQ==
X-CSE-MsgGUID: OOndZ3+DT9udL36W/yN3ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71305135"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="71305135"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 02:36:17 -0800
X-CSE-ConnectionGUID: +Yyql3ZPSYK99KG0JX3E3Q==
X-CSE-MsgGUID: iNHMpSgsSK+G5P9oOfGcjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="215006133"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 02:36:15 -0800
Date: Fri, 6 Feb 2026 12:36:13 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nam Cao <namcaov@gmail.com>
Cc: ChanSoo Shin <csshin9928@gmail.com>, andy@kernel.org,
	gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v5] fbtft: limit dirty rows based on damage range
Message-ID: <aYXEHajVeKvIMmL7@smile.fi.intel.com>
References: <20260128203938.962414-1-csshin9928@gmail.com>
 <87y0l668ki.fsf@yellow.woof>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y0l668ki.fsf@yellow.woof>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Feb 06, 2026 at 01:04:45AM +0100, Nam Cao wrote:
> ChanSoo Shin <csshin9928@gmail.com> writes:
> > Instead of marking the entire display as dirty, calculate the start
> > and end rows based on the damage offset and length and only mark the
> > affected rows dirty. This reduces unnecessary full framebuffer updates
> > for partial writes.
> 
> This looks useful and I prefer to see it applied. I understand lack of
> testing is the main obstacle.

Correct.

> Are you still trying to get it merged? If not, I can take over.

Do you have an actual HW to test? If not, won't be applied either.

-- 
With Best Regards,
Andy Shevchenko


