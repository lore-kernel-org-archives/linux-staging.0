Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EDA304BB3
	for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 13:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787923922; cv=none; b=H+kCTu8Z1DH7++Vzi3Fn8pvbQmE+aPcaUHTetoddW/+renKA887IuVfwgTmaowTysYtrtu2BbUxNf98r/6J8A2P3BCR/JkZTu6/SlL9feKoZkRTRbYCtjUUjENI9I3x2XQbtQK1qltLzsE9lSPCIUgMR1+aec0RdhbEXgsYBkeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787923922; c=relaxed/simple;
	bh=vP5V+pCuyFgveglxjmlFRA86XFPdwRTLBpPd1GdcEhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=enJGZ1f/Dh5XbaDlxkf9/X8mBh6iRvQp9/NJHCt65OA5KaYQ3OjmIuMKVB4Zlz6Bgea9hrYc0VKuw0loEBT1s3joULBLUtaQmhy8SSr2PAVvefL6Qa/ejmiS30KScw9ecZp71NjQiaV+fz8+gp8uUBRk9JBmj5YG6EtS8E0xtf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mZrdan3r; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mZrdan3r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787923920; x=1819459920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vP5V+pCuyFgveglxjmlFRA86XFPdwRTLBpPd1GdcEhQ=;
  b=mZrdan3rYIMqbUJF6eeaQ5MLinOsmna8/+nvKuL3JU8y2YZRddfFKV3t
   BMuvkm0kn0iV6tJEulUGI15aArkf+InyZ+eqr/TCfrWTKsC7TeUZhaDs6
   QfCVhbIzsFLyIbyCa8u+GTMmvEzZ2l6bzp0NLsWWqv+V+4q0cCe7QN7l8
   TQm//TWOG8E73Ub6NGEoZqNsR4y0CEiAKg7fGJZXHH4zHg5Rz0ElTbSYA
   KIXpSIJmH6m+XKpKN6GfiL5zGlX0lVWt/xOS3QEcL5jMfubFfJn/w+fBb
   wjjW7Ag+gXPLL83rDOz683o2HKprgMRWmg16m7rNk1E07dapD93bGe5YD
   g==;
X-CSE-ConnectionGUID: ixxZGl1UTbm6k8Dfw8zDRQ==
X-CSE-MsgGUID: NjAlkUrnSyelLuWJu+rdvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="75976719"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="75976719"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 06:31:58 -0700
X-CSE-ConnectionGUID: SxQnCkggQ8G+eE8124Y2RA==
X-CSE-MsgGUID: +1ynk+76QHi0F6gE7/DNoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="272382258"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.167])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 06:31:55 -0700
Date: Fri, 28 Aug 2026 16:31:52 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Maurizio Casciano <mauriziocasciano7@gmail.com>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/11] media: ov8858: Add INT3477 ACPI ID
Message-ID: <apGNyISEGM3vx3d2@ashevche-desk.local>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-6-mauriziocasciano7@gmail.com>
 <apFvSlkU9V1f1mrZ@kekkonen.localdomain>
 <CAHp75VfOba8pSw-4NhTOyzJxjEB97qfE+w+RjXEtdMrNEZMOOw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VfOba8pSw-4NhTOyzJxjEB97qfE+w+RjXEtdMrNEZMOOw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 28, 2026 at 04:24:38PM +0300, Andy Shevchenko wrote:
> On Fri, Aug 28, 2026 at 2:21 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> > On Thu, Aug 27, 2026 at 08:17:50PM +0200, Maurizio Casciano wrote:

...

> > > +             .acpi_match_table = ov8858_acpi_match,
> >
> > Please use ACPI_PTR() for this one. (Also see
> > <URL:https://lore.kernel.org/linux-media/20260828084328.257703-1-sakari.ailus@linux.intel.com/T/#t>;
> > this won't produce a compiler warning then.)
> 
> Why?! What's the point in having this?

For the record, while the first patches are okay there, I definitely NAKed
the last one. It's quite controversial.

-- 
With Best Regards,
Andy Shevchenko


