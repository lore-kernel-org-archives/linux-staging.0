Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E612777E0
	for <linux-staging@lists.linux.dev>; Thu, 22 Jan 2026 18:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769105018; cv=none; b=FlT5MGs326Y7QizZKaf4qe5RrFOXuHNfKm/cY6dK10IKImDLhaqvnPtgOshk6KjcLZc/I/8oIKDnNN9xH2L/k8PqsGypIq/OAXGSOebbLeVrY4uceQFhzyzvtQR/h3QFTv/8R/NMUcLszSEzsOH86NllOWGdT1CEDeAgi+mQDb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769105018; c=relaxed/simple;
	bh=n6C01P9OUU9xxp3amgRl3AhSriCpPAHCrVcczqxoIvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GqVH8rcLfZXVuemwKGmn+es9uYD0In6X5JMc6b7pJIzUATh4R8sZPwLEXvYZ/P3VRsUNsORJDKlJXeYi1IPhrh7wIzIQGh162ex7kNnPlvmC4PeVg5+3cYUklGyVenDq0sP6vZDa5mAoTg9b17YDmRHN40EcsuG2WWwJji01sK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ghov9rAz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ghov9rAz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769105003; x=1800641003;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=n6C01P9OUU9xxp3amgRl3AhSriCpPAHCrVcczqxoIvY=;
  b=ghov9rAzJD9kDq4Z2rrEyporAw8bRwjMS/6eZ2X1PvqqpfKWpMUHpCC5
   EnDfhmhzZpyoNt7tH9TZFmZMe3TZHfCyDdlucRu2tlNN5AqCRBQMlFIW2
   K4wnl+NJU1NzbXU6V+dQHtMqKvsfb+cTRzMeCEbidxNoo5aQCOvLfYdt3
   P9uju7Nj81nWfN9d8Rg/A+RGAtKCkVuD2+seAHRn+5nVcu40MN2ZZ2Y90
   Xra3CYQRId+xbS84K799OKOz9p2UbzUEvhVs3osHCbLagSYLNNx7LEEvT
   /MwaLfFO5NEUfpKtih3iY6O1aIJScZ3FgNDSZQYSe6TySf8ZM5CLELMFb
   Q==;
X-CSE-ConnectionGUID: 228jHAWLScOWg6G5uvSfDA==
X-CSE-MsgGUID: EJekxuxdTSaON0KNklQ5Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="73984218"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="73984218"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 10:03:17 -0800
X-CSE-ConnectionGUID: YIXlbBtcTzyahguTu4uBow==
X-CSE-MsgGUID: XUElWnq9QD6U7kyOQ75Hcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="206860056"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.225])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 10:03:15 -0800
Date: Thu, 22 Jan 2026 20:03:12 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Archit Anant <architanant5@gmail.com>
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
	gregkh@linuxfoundation.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: impedance-analyzer: ad5933: use div64_ul()
 instead of do_div()
Message-ID: <aXJmYAZ-8KkXCFI9@smile.fi.intel.com>
References: <20260122145633.14938-1-architanant5@gmail.com>
 <aXI-ZV4uAd5GyFLz@smile.fi.intel.com>
 <aXI_HnvDNbX68-lq@smile.fi.intel.com>
 <CADJHxWB3b+bH2+HBP+SG0jxhGNcozstBeWeDH_3dgS-4c2G-6g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADJHxWB3b+bH2+HBP+SG0jxhGNcozstBeWeDH_3dgS-4c2G-6g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jan 22, 2026 at 10:27:52PM +0530, Archit Anant wrote:
> (Resending to the list, apologies for the private reply earlier.)

First of all, do no top post!

> Thanks for the review and the detailed math breakdown.
> 
> I agree that `(freq * BIT_ULL(29)) / mclk` is algebraically superior and
> improves precision.
> 
> However, regarding your concern about the original code:
> > "why the original code drops precision, was it deliberate?"
> 
> Since I do not have the AD5933 hardware to test if the register expects the
> truncated value from `(mclk / 4)`, I am hesitant to change the logic in
> this patch.
> 
> Would you prefer I:
> 1. Stick to a purely mechanical change (keep the logic equivalent, just use
> `div64_ul` and `BIT_ULL(27)` for readability)?
> 2. Or proceed with the `BIT_ULL(29)` simplification assuming the precision
> loss was unintentional?

I definitely prefer #2. That's why I plead to AD people to confirm.

> I'm leaning towards #1 for safety, but happy to do #2 if the maintainers
> (Lars/Michael) think it's safe.

> On Thu, Jan 22, 2026 at 8:45 PM Andy Shevchenko <andriy.shevchenko@intel.com>
> wrote:
> 
> > On Thu, Jan 22, 2026 at 05:12:42PM +0200, Andy Shevchenko wrote:
> > > On Thu, Jan 22, 2026 at 08:26:33PM +0530, Archit Anant wrote:
> >
> > ...
> >
> > > > -   freqreg = (u64)freq * (u64)(1 << 27);
> > > > -   do_div(freqreg, st->mclk_hz / 4);
> > > > +   freqreg = div64_ul((u64)freq * (u64)(1 << 27),
> > > > +                      st->mclk_hz / 4);
> > >
> > > It can be one line to begin with.
> > > Then drop that ugly castings and explicit big shifts.
> > >
> > >       freqreg = div64_ul(BIT_ULL(27) * freq, st->mclk_hz / 4);
> > >
> > > Now you can see That 4 is only 2 bits, so this can be written in
> > > simpler way:
> > >
> > >       freqreg = div64_ul(BIT_ULL(29) * freq, st->mclk_hz);
> > >
> > > which may give a better precision at the end of the day.
> >
> > It also might be worth to add a comment on top to explain (with given
> > context
> > I don't know if there is already one on top of the function, though).
> >
> > And I think we want AD people to comment on this and maybe explain better
> > the calculations done (and why the original code drops precision, was it
> > deliberate?).

-- 
With Best Regards,
Andy Shevchenko


