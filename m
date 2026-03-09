Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263803A1E62
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 11:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773055064; cv=none; b=hMXH/z+/OCbR387eOHCjp5FACpD2IUsu8kNVMe5wp66AUvlIk4RbrCCuhxikhj1Q+VRZ0187QiDxH4aqptpPR+GYzXKuymoJeeZ9BiII6fa5X4z8/JICbhrdK/T9m3536dZbNBSIN5eDu7c+AsJZl/dmVI0jIx5FsWHMbZdAVuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773055064; c=relaxed/simple;
	bh=98j4f8amdP1EeRYHfpdpJ3f/3/VZ6Fpr8k7byvHGiOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6QAbsUBOGYvz/ILWHrWrESpp8oAg3GDfl8Hs6WUykXgYCXfyYV/8sN4Z2uk7jT0yW/75Fhg/9THB7+1AlK/XWzSezob9eQIN1GWJlxH/qEtSVsySG59gqeZooiUPbz1jhV7FZR7aXSl1tnovv/A7Z9fmbfzijFF6uoDlEFRx7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N7Lo3XM5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N7Lo3XM5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773055062; x=1804591062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=98j4f8amdP1EeRYHfpdpJ3f/3/VZ6Fpr8k7byvHGiOE=;
  b=N7Lo3XM5mpz2uWwI5GanU5Hbhxc5dm9uM3CroPT0tu1TAwPwsJ2bRJ3L
   E+LCX1ivHEJNS7Xqi7cJBPMvow7s1T+8e6nCj7mNRUT7DEpgnBlVWIQkl
   4qPgLKAiWpY0Ffz4n+65bSmHALONgX0ABi4GIyMfln1XXlp13SzYid/Ih
   zfm038y2GbO0WODkAuCmCPAJpn+txUw10TbzTO6vlMDfh2smS+Enec2o8
   8MlCU5usnheBL0R4BWngmxOnXTwSe7yGuEu0dOrV/fsLLmUMtFJDnW2B1
   tXktuDKjjE3MQFGqkh/Osq/Lzp7yZPkOYlfYKTA8mQbcyAheMyP4B4YpW
   A==;
X-CSE-ConnectionGUID: OkTxSGIoROKLGoCQ7hITew==
X-CSE-MsgGUID: 2cEQk/rBSy6tabY+OTZa4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="85425484"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="85425484"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 04:17:41 -0700
X-CSE-ConnectionGUID: yLu4Q5tlSnKDj985aNSL3w==
X-CSE-MsgGUID: HvbOp46kRTCzgcgjyy8rPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="219666917"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.181])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 04:17:39 -0700
Date: Mon, 9 Mar 2026 13:17:35 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laur <laurentiutopai2004@gmail.com>, hansg@kernel.org,
	mchehab@kernel.org, gregkh@linuxfoundation.org, andy@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: comprehensive coding style
 cleanup
Message-ID: <aa6sT1TwsPeNWRFQ@ashevche-desk.local>
References: <20260308215840.31197-1-laurentiutopai2004@gmail.com>
 <aa6fMZaAvMK-CyzL@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa6fMZaAvMK-CyzL@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Mar 09, 2026 at 12:21:37PM +0200, Sakari Ailus wrote:
> On Sun, Mar 08, 2026 at 11:58:40PM +0200, Laur wrote:
> > @@ -2032,7 +2032,7 @@ static unsigned int long copy_from_compatible(void *to, const void *from,
> >  {
> >  	if (from_user)
> >  		return copy_from_user(to, (void __user *)from, n);
> > -	else
> > +
> >  		memcpy(to, from, n);
> 
> The indentation is wrong here after the change.
> 
> >  	return 0;

This code probably should be changed to use iov_iter facilities.
See the ALSA driver conversions for that, exempli gratia the commit
49aa6ed94c5e ("ALSA: korg1212: Convert to generic PCM copy ops").

-- 
With Best Regards,
Andy Shevchenko


