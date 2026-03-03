Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18321E230E
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 13:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772543756; cv=none; b=TSeuYBjwf2va3SKy06qTEDBr6m3+zfFzB6CBaXfhGjUiRFWHTu6qQFdUNAZuZA7JiotAr4AhJJgiMDI0d7xPlvTmEn91ANzEnDHXqggPNO75YdQO3SQ+APRh/N5Hal7sVJWxxJeUOw0sPB8J1gVzWiwD27eHaiY+0lfQbRCl6Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772543756; c=relaxed/simple;
	bh=Og/mbq1aFjzQa/su5PtWZ0EzrKzhz08S+BwJ8Ue+PzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f9gjdBP1x+14yL9MBXEIXuZWJhxv+LNX3VXU8UfMEoXrq/yYDNYo4FSnrukjrRCGfeSHAzn+6SM71GdRuHSqsuWt42wNvsP8H7looGGRFOwz/khJ5VEcZ2mgBjOUSqixJP2fWtbeQORHZo2Fe7GD5nBNbkKU0HYsLoM0UmXw7ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEU8T0mk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEU8T0mk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772543755; x=1804079755;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Og/mbq1aFjzQa/su5PtWZ0EzrKzhz08S+BwJ8Ue+PzA=;
  b=TEU8T0mkyqscX18NrBQovLNMxLkq0w9JzJ+MrF1FlQYi62h0Mn/8sKzL
   gq4ko4UUw4QDYMneXnSa08qrHqbislSNCW75Oseyc34go3fDTRwOh7TAv
   wwzk2FNQ4cJoGY5AWojjN/m+h89cMZ/VSJ5FJ7DbTF8GUc+swgyMl5QD4
   ovT9gFySIpnwQP/dIYA1+6w4e5SsjtywzK4TBbrprDjq4Nhz1tZiHPPV+
   YW+bOZwvBJyHJvRyw+FDHIq7uJP6HB7Ou0g+aoZAGn+1gy7hs2jJ6Uhqt
   oeluI8D9AGBknbDW2gBFeAeqKO/+vCaBL7OulSR8RLpqkPujQWxdb0Vce
   Q==;
X-CSE-ConnectionGUID: L4ZA1z60ReOs+9rrf1PsZw==
X-CSE-MsgGUID: tumVgf+zTieOb7YisEAiuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73486558"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="73486558"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 05:15:54 -0800
X-CSE-ConnectionGUID: ff9yUu72ShyVFPcebmQYGQ==
X-CSE-MsgGUID: vrbUjTQlRJeXpfwXI4MpUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="248492563"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.242])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 05:15:52 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 980B9121D1D;
	Tue, 03 Mar 2026 15:16:20 +0200 (EET)
Date: Tue, 3 Mar 2026 15:16:20 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-media@vger.kernel.org, andy@kernel.org, hansg@kernel.org,
	mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	Soufiane Dani <soufianeda@tutanota.com>
Subject: Re: [PATCH 1/1] staging: media: atomisp: Disallow all private IOCTLs
Message-ID: <aabfJEGDJGGP49bS@kekkonen.localdomain>
References: <20260303083501.3886922-1-sakari.ailus@linux.intel.com>
 <CAHp75VdaYxvQ+tx51WDPFYSzFOSWqHqFKB4xaNTOt-rx4O9CPw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VdaYxvQ+tx51WDPFYSzFOSWqHqFKB4xaNTOt-rx4O9CPw@mail.gmail.com>

Hi Andy,

On Tue, Mar 03, 2026 at 11:21:02AM +0200, Andy Shevchenko wrote:
> On Tue, Mar 3, 2026 at 10:34 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Disallow all private IOCTLs. These aren't quite as safe as one could
> > assume of IOCTL handlers; disable them for now. Instead of removing the
> > code, return in the beginning of the function if cmd is non-zero in order
> > to keep static checkers happy.
> >
> > Reported-by: Soufiane Dani <soufianeda@tutanota.com>
> > Closes: https://lore.kernel.org/linux-staging/20260210-atomisp-fix-v1-1-024429cbff31@tutanota.com/
> > Cc: stable@vger.kernel.org
> 
> > Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
> 
> Is it the correct one? Driver was before that, so I believe this needs
> to go deeper.

Technically yes, but even this one is from 2020 and the patch removing it
was merged in 2018, for v4.18. These aren't supported anymore.
> 
> ...
> 
> > +       /* Disable all private IOCTLs for now! */
> > +       if (cmd)
> > +               return -EINVAL;
> 
> Maybe even a warning?

That'd be just filling the logs, wouldn't it?

> 

-- 
Regards,

Sakari Ailus
