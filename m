Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A6E30C14E
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 01:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780449215; cv=none; b=j5HFeH5EKub7pjAESNCRIi0fVXSWo5ztFhi7zGY46cUpLXOw06fY+pH+tSm7LPpq4hIT1Tr1NPw9SwteRIvjZJ81Vyi5B/voGtoOKConel0afMDBo9bocvrM4SoTxNmYr7lsyeayE7b3X4aLINasAJCO49UXgqeLnR3U7EWQui8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780449215; c=relaxed/simple;
	bh=BvVlrfSyoLVyJv3EqVbTjwUn06zm+5EoJuwo9ycydN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QSvJkLv1v4KncD1A2tZeDRRjysq8ttZI+V84gPtZ5+wbOkjkvPlV3nci+9HAoLwtL5FGwDffZYKcbwH0RwL6I67chYF77VxF/HSlkMDJbpr64tywzgd+QmPqMO2ftbqIRWMque6RwBGUHHyoV92hqJq68gED2fqBu6eFv+vhohQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nxqCOU12; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nxqCOU12"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780449215; x=1811985215;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=BvVlrfSyoLVyJv3EqVbTjwUn06zm+5EoJuwo9ycydN8=;
  b=nxqCOU12J0VmQzj16Vrwi5UBmFfHbg8lby+L7sfwo5pilPuiMIFf9BNn
   ebJPXGcfjDEBimJs5ckrLUrAwDOE9YAbKtanbxiQ5DixCSqd3tHYI0L5w
   UdoYZsrcNrQZrazlPJ1THXRLXxItI+Qvp7qDmfdySCI8QaZljh73BI+Wm
   7UT6UoUqE36wy9xsbX5S1U1hMwpcHVcPPnMEheFNBqTvpG0hnEtC23Crt
   90SuBoV1lJrjR04eUAVCZlr96THvaM1nwiNx0PjEo47qBqkWJqJ6MxJsQ
   xs38L4/dMRSP5mfMXUbtMBTlmS2wK/QGaiRNuj1l6xjtoouRbCJTrlYHi
   A==;
X-CSE-ConnectionGUID: mRm2DxDZQS6EVujLHDKhxw==
X-CSE-MsgGUID: q2pdVcryRnSIWGbGwpoZzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="80984706"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="80984706"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 18:13:34 -0700
X-CSE-ConnectionGUID: GnWcwXL1SRGGmSSnk+D9RA==
X-CSE-MsgGUID: L1DFavUQTry3TBo+Nqv0bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="243017565"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 18:13:32 -0700
Date: Wed, 3 Jun 2026 04:13:30 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Enchanted Hunter <enchantedredhunter@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, andy@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] staging: fbtft: replace sprintf with snprintf
Message-ID: <ah9_utsktDp4oN9E@ashevche-desk.local>
References: <CAOSULec2OpwTGB3OUb_n3CdKO6H_DGJnxw=qsBswbd+JBjemKA@mail.gmail.com>
 <CAHp75Vc15t7zmNGeuNG_fLHwCN=Ym9w5Cn92+eqbtsioGxFzCQ@mail.gmail.com>
 <CAOSULedF6GUK_e_3KRPB+D0Jxgtow38OjQu9B1=vG-XTfsdYOA@mail.gmail.com>
 <CAHp75VdtOuLEkiuiUqxa3DT75y8Hd-1PtquodpN4qJ=rCFs_4Q@mail.gmail.com>
 <CAOSULeev+3LsSR6QboTy7oCUbTNQOOx72vjgf_tnZcr_JKbhmQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOSULeev+3LsSR6QboTy7oCUbTNQOOx72vjgf_tnZcr_JKbhmQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo



Please, stop top-posting.

On Tue, Jun 02, 2026 at 10:33:34PM +0300, Enchanted Hunter wrote:
> I suppose I agree with you. My patch does look silly, and I regret wasting
> your time. I've just started learning kernel development. Perhaps if you
> happen to have any routine task, you could suggest something that would
> actually be worth doing. I'm very interested in this. I will sign with my
> real name, but I'm from Russia, and I understand that this might be a big
> problem right now.

I have this [1]. It shouldn't be a problem as long as you are not working for
the OFAC sanctioned entity or tied to them in any ways.


> вт, 2 июн. 2026 г. в 21:32, Andy Shevchenko <andy.shevchenko@gmail.com>:
> 
> > On Tue, Jun 2, 2026 at 8:13 PM Enchanted Hunter
> > <enchantedredhunter@gmail.com> wrote:
> > >
> > > Overall, it doesn't address any compiler warnings, but this is my first
> > patch. I wanted to start with something concrete, and I saw an unsafe
> > function and tried to fix it. The fact that the compilation behavior won't
> > change is true, but the code will become a bit more formal — maybe that's a
> > good thing.
> >
> > Not sure we need a churn on the working code.
> >
> > A process hint: Do not top-post.
> >
> > > пн, 1 июн. 2026 г. в 11:25, Andy Shevchenko <andy.shevchenko@gmail.com>:
> > >>
> > >> On Mon, Jun 1, 2026 at 3:44 AM Enchanted Hunter
> > >> <enchantedredhunter@gmail.com> wrote:
> > >> >
> > >> > This patch replaces unsafe sprintf calls with snprintf in
> > >> > fbtft_register_framebuffer() to prevent potential buffer overflow.
> > >> >
> > >> > Signed-off-by: rat1bor <enchantedredhunter@gmail.com>
> >
> > Another thing, use your real name and not an alias.
> >
> > >> Does this change address any compiler warning or something like that?
> > >> At a glance I do not see any usefulness of this patch except an
> > >> unneeded churn.

[1]: https://gist.github.com/andy-shev/a2cb1ee4767d6d2f5d20db53ecb9aabc

-- 
With Best Regards,
Andy Shevchenko


