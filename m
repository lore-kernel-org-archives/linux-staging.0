Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC5F3AC0FB;
	Mon, 23 Mar 2026 13:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272837; cv=none; b=JTrwKzzqLG8VHtUPqMBAY7jDxdRHIlwUZY642HZ5XBj986D/MrYnfd7lAjOfnQouWpb2sWXqIDgbdljegFn5BbO83A/XTQMPnX3Xhq5BTUldCPLhyMW4hGy+tqkrHd5HORrMesFTfDY3DgRQ5CwMpQgJLAZtf6HFOAVkaCf2DnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272837; c=relaxed/simple;
	bh=evJMAbvWPyjQ32RmCBCkfNmPdC5r63rr37BJC7yPaUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jV2uBKNd1P5caw5tL1uidLKahk3t9wkwu1Yih+W+NNtUbIHuOlptUULov1JWT46Ij6FsAKLLQ7tRRvk/2FkyL+DllaMcN+B9k76+NmWxaFSw0ZpXZxJ9WIrBzu4Ash0lYIt3/ZrM7LFXVauYZHgROoP2XP3zNhfm6tLzGuce79A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UyL3fVtr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UyL3fVtr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774272835; x=1805808835;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=evJMAbvWPyjQ32RmCBCkfNmPdC5r63rr37BJC7yPaUM=;
  b=UyL3fVtr87wObY29nXtdUbjprLS7o9rXNlsCUkQed1XnmE6RwJL7booy
   0ghJJy8GX40VRwh0zKbojIg2+3SCu1wuVYEWUIswp3xHLfCNsvT/NXsMI
   TEPk5zy2FFPq7XRZrxZ0bIz0sSxE/rHdHbKoEjYPnVcAWD4puQObII5A/
   dPls0vFe6DDur0+7N++pFTXhz7FLiEkHBhTiS7YtryKUUDKbHCdzJcUMa
   +qj1ntellIm0YSpJNx4auS/a4Jg01rUGf2FkOrBZdc2OEmVx4Dz6B9TpX
   nY1n5FbEVmrEcBx/E9Bg4VtGrDRO7cRNakzqZfATS/d28O4Z6uzOVrzWr
   A==;
X-CSE-ConnectionGUID: MGucaQPhS7iKWPje4QqPGg==
X-CSE-MsgGUID: ndzhfjGgRj6reWNziwYe4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75292635"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="75292635"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 06:33:55 -0700
X-CSE-ConnectionGUID: 7jeiLa/vRvC0gCdqEkFjGQ==
X-CSE-MsgGUID: eiQbUKS1TMeFLWUFnNihGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="228502776"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 06:33:52 -0700
Date: Mon, 23 Mar 2026 15:33:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Prithvi <activprithvi@gmail.com>
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com,
	ethantidmore06@gmail.com, dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: place constant on right side of
 equality operator
Message-ID: <acFBPuCNpD_MNKwR@ashevche-desk.local>
References: <20260321092536.138499-1-activprithvi@gmail.com>
 <acEFrIIYaS3ZW8j6@ashevche-desk.local>
 <20260323132235.sg6fw2azr724g7un@inspiron>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323132235.sg6fw2azr724g7un@inspiron>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Mar 23, 2026 at 06:52:35PM +0530, Prithvi wrote:
> On Mon, Mar 23, 2026 at 11:19:40AM +0200, Andy Shevchenko wrote:
> > On Sat, Mar 21, 2026 at 02:55:36PM +0530, Prithvi Tambewagh wrote:
> > > Place constant 0xFF on right side of equality operator when checking
> > > value of hw_channel_plan to fix checkpatch.pl warning and conform with
> > > the Linux Kernel coding style.
> > 
> > First of all, in the very same function there are more of a such.
> > And hence the Q: have you checked the entire driver? Please do.

> Thanks for the correction...While checking out other places requiring similar 
> change, I observed the other place in the function where constant is on left 
> side of equality operator:
> 
> 	if (
> 		(false == pHalData->bDisableSWChannelPlan) &&
> 		rtw_is_channel_plan_valid(sw_channel_plan)
> 	)
> 		chnlPlan = sw_channel_plan;
> 
> Here, the formatting of if statement can be improved and we can also replace 
> 	(false == pHalData->bDisableSWChannelPlan) with :
> 
> 	!pHalData->bDisableSWChannelPlan
> 
> Would it be alright to add these changes to v2 of this patch itself since
> they  are related to the code having constant on left side of == operator?

Yes, but I also meant to go through more files in this driver for the same
style issue.

-- 
With Best Regards,
Andy Shevchenko


