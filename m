Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD19349AE0
	for <linux-staging@lists.linux.dev>; Tue,  7 Apr 2026 15:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775574737; cv=none; b=UTomP6CkhVZHDSpIGmRklPaQl8bD0bVUHO1Inu3R4/+q+NTWgP7LkWxrhRNeUjYdlfo1eChmDfvLtfs+/pXzAP1QtlnMJfGnJEx1ux90Xt1jTWqRSa3Yx9csR52uIGnDZQVXAxyjErEhOfZC22n+Z2J6KSrEHAIhVHMZeFNeFgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775574737; c=relaxed/simple;
	bh=ksaPGYZ9IDzRDhhhQbnkR90C6+w3bzomRLvdju5WGHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pmu/4AJoFsUlxdKILYCMNo/E7cHWmmdOlLARO42XVUJ7VcNuhko0aPLqeEquBaYfFqkbwgY5hRiOs/nfoWnByjVOzib6eR02jXBvC19pTnK50l4bc3XjSVBsLtu08D+Sd347Np/hgPGRIQDyRKd6jyKkMIfXC6MBgmYrOh6YCJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e2I7+TrM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2I7+TrM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775574736; x=1807110736;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ksaPGYZ9IDzRDhhhQbnkR90C6+w3bzomRLvdju5WGHo=;
  b=e2I7+TrMGCoY8aPcoNCWNGNoBfS1P/kd+ReS3WJji/UijJ2YiOB2WoN7
   hkSYQh1pTc0w7aXk8A6bvoX8AYeaQ0GHz5X2X0yqD40dNDm5IuaJY5WHE
   tU1WXgxKUV+Rkeh9DGEdSwenscv06Ka+tpcVl1FpeZQx6VNumvs+KNGMb
   rxiQNe4OpdabX4WPgNECPjGTd2vJ0BJ0ltDG9kb1Y634FRbzFv7iiLkvp
   DtRLSCOV9QU00L/ToY/2wf00Aw/Ty5PXNe+IcXkBNu11cZ4ZC6d02ZM3O
   c25oDY7W8byv/PiUWwi23jrdarhUm1ojJANIJ+D6s8BPA0RsWYYfFFM42
   w==;
X-CSE-ConnectionGUID: q/qqQTYXQ/O+xiaaCwovGQ==
X-CSE-MsgGUID: aAPjdW+6RaeZAQOhhGm5ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="86833221"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="86833221"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 08:12:15 -0700
X-CSE-ConnectionGUID: rk/XMJc1Q0uC4KoCJTZNJA==
X-CSE-MsgGUID: cMVQU6sQSbaeXq+xPWqEPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="233070942"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.182])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 08:12:13 -0700
Date: Tue, 7 Apr 2026 18:12:11 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC] staging: media: atomisp: change copy_from_compatible to
 iov_iter
Message-ID: <adUeywfiQzZ5JgEd@ashevche-desk.local>
References: <CALoEA-wrnqUM_5hDGUL1xJi3crf64ApE7fUrb2_47xVzhBT35Q@mail.gmail.com>
 <adUddSgsIhsZ9WP3@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adUddSgsIhsZ9WP3@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Apr 07, 2026 at 06:06:33PM +0300, Andy Shevchenko wrote:
> On Tue, Apr 07, 2026 at 04:46:49PM +0200, Joshua Crofts wrote:
> 
> > I've had some spare time and looked at the copy_from_compatible function
> > in pci/atomisp_cmd.c. You've recommended checking out the korg1212 driver
> > and patch for adding iov_iter support. What I find strange is that the korg1212
> > driver already expects to receive the userspace data in the form of iov_iter,
> > meanwhile atomisp expects a from and to pointer along with a boolean
> > whether it's coming from the kernel or userspace. My question is whether
> > you meant this as a local fix where I'd use an iov_iter in the atomisp_cmd.c
> > file (maybe separating the functions to user/kernel, since I don't
> > really like the
> > passing of the from_user boolean)
> 
> iov_iter has a type that implies the user or kernel buffer.
> 
> > or if you were hinting to a ground-up
> > rebuild of the underlying atomisp architecture (which is definitely a tedious
> > task, looking at the source code).
> 
> I believe the second (latter) option. The code has to be revisited to convert
> using iov_iter and drop the custom code.

FWIW, the core part of the sound change is here
cf393babb37a ("ALSA: pcm: Add copy ops with iov_iter")

> > Thanks for your time.
> 
> Thanks for looking into that!

-- 
With Best Regards,
Andy Shevchenko


