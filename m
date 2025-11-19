Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9313927F16C
	for <linux-staging@lists.linux.dev>; Wed, 19 Nov 2025 15:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763564451; cv=none; b=uzd/LJsrbXqe2iNPnUQ0U/RP38cLXzIZ4o0HSi5HKLNj1cdL9z2d/NiauvUJcZ0TP5m90LQp4w9ljm0bRklenZ6uilQlhf86EOhuiq3nshZPAt2BSXw/quC4eS3n9NZ4fbjopBALyQVGGxmMxLxUFkSlrhDhQ34nedlgWLUAlck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763564451; c=relaxed/simple;
	bh=6VLOKmDo4WviGUhM4qQZA7IzCWHn1ZvDUbxiE4MHVTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ATkSbBj4Wjf+kzuUbTcIyQOR2FTegwfznceKlrt5e49kvXz+RVzkqZ9zIiJ2D8sV9TGY3M2W/4QT8R+1E9Eqyz5PqZTpm2B+D5UaLqUHF6qIkb2IP7Sr9pRn7I4cM/FFQcoJaUoOqlfRMM3v7F+iddhWaAOcTiXlYrtmPwEbC5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M3LE2005; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M3LE2005"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763564450; x=1795100450;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6VLOKmDo4WviGUhM4qQZA7IzCWHn1ZvDUbxiE4MHVTw=;
  b=M3LE2005UPr1tYjc9htamt3tsuqG5tQRBp0G4Gexpr9qoFd4dt1WUdJM
   vRFBGyHEoYYwVyMTWpE+LOg2qSyURMo4dYreB6fUadyF0Sj5zaB/eDBrM
   SjvMpcEpHY9m0KBhqGqMwD0ghXF6RbbIceem+UsUB7ao/Kt8Om+xrgd05
   RmRksqFpJ23sWvPyFc2x940xmazKeFGDGHsHBQ9CXaHovNehFuuUcq7aQ
   8EpyPo4rRIXYKb72Kr7+D8tpAC05DKk7IZHb/2fNjdlOtBePeKWMBEGYq
   f+m3KF1yfYk6fqQfnn1oRwE1pjwC5nt/KwiLanuUsyMM2vWK2/dulL/ix
   A==;
X-CSE-ConnectionGUID: H7vnqBY+RFmXubEFw4Ks1w==
X-CSE-MsgGUID: nzEYTIV1QeqEZXN6M5LZ8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="91085419"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="91085419"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:59:36 -0800
X-CSE-ConnectionGUID: 1p6r6x9uS5u32zRd1eVaZg==
X-CSE-MsgGUID: voIFHWIqQSaE97KThetVqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="191329073"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:59:30 -0800
Date: Wed, 19 Nov 2025 16:59:28 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
	linux-pci@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
	ceph-devel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v3 00/21] treewide: Introduce %ptS for struct timespec64
 and convert users
Message-ID: <aR3bUMvPCqZr5utj@smile.fi.intel.com>
References: <20251113150217.3030010-1-andriy.shevchenko@linux.intel.com>
 <aR3B8ECx9W6F0BV_@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aR3B8ECx9W6F0BV_@pathway.suse.cz>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 19, 2025 at 02:11:12PM +0100, Petr Mladek wrote:
> On Thu 2025-11-13 15:32:14, Andy Shevchenko wrote:
> > Here is the third part of the unification time printing in the kernel.
> > This time for struct timespec64. The first patch brings a support
> > into printf() implementation (test cases and documentation update
> > included) followed by the treewide conversion of the current users.
> > 
> > Petr, we got like more than a half being Acked, I think if you are okay
> > with this, the patches that have been tagged can be applied.
> > 
> > Note, not everything was compile-tested. Kunit test has been passed, though.
> 
> JFYI, the patchset has been committed into printk/linux.git,
> branch for-6.19-vsprintf-timespec64.
> 
> Note, that I have:
> 
>    + fixed the 19th patch as proposed, see
>      https://lore.kernel.org/all/aR2XAYWTEgMZu_Mx@pathway.suse.cz/
> 
>    + reviewed all patches but I triple checked 7th patch which
>      did not have any ack yet. And I added my Reviewed-by tag
>      there. ;-)
> 
>    + I tried build with allyesconfig. It succeeded. I am not 100%
>      sure that it built all modified sources but...

Thank you!

-- 
With Best Regards,
Andy Shevchenko


