Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0359F4457B7
	for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 09:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786612380; cv=none; b=SRlYANCPrEVrJ9t+6fODvN5F9WR102MOnpJEx/GM0RpjPDfSV4ym/kIIfj1l3aKuHQ+3OrV0XUKO0ej0Rqbfp8cayjZF+RKc/U+gFCYFaLbtTjfVb2njEbPBHDn2lUkQQT/Cadx19RcRmdn43zBT6JKNvoik+gSxL50Z7KsZ/M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786612380; c=relaxed/simple;
	bh=Gval1wV/mGbXLAOIdSXUjxSdI+eHtLXc7lCDuy9jddA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bdqGiuUjVxPv5o155mqPW/8JVIfOolGjshxapIn1FgLf9HcHb8CST3bI7q6Jug1G9KAqxPxsKj5Nvi0z9sbodxx7h8o8/TTFgddW8ypuQeLZK5Xt8uxQsPe6LeNqLUIAFB3Mx9y2FPTDsbTu6DFQJAZql7Ctpvdp3LgSiDATgYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=InCwML2v; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="InCwML2v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786612378; x=1818148378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Gval1wV/mGbXLAOIdSXUjxSdI+eHtLXc7lCDuy9jddA=;
  b=InCwML2vRAJwwtQhUYVO7szP5shMJ2toP/68U3NnBAVoSPv7qfUzcyK3
   FIdHFev+6jMvw2am2XxIzpb38M4PSgiSW7IAmFEj7nbCMvTE49/GyLp9Z
   kt6nnMY+zPGfrZtrw5xZ4AbzC8YweChZECLDnUUN7f6uDqSKvKBqgJvLH
   R3pEu5DOmyUb3Kta1pqOdquuV15kp7MljmRpIlHfpP5QlzCkGQ4IJ97cy
   EehLNv0aMVobR5QIjdHmtsJ9fG0+gjOzbSO7VSiEBLfaW2wx/ZHDUY/yK
   0B+25LmhcNXjxkFVLhV2W1gs1HecWnoG240vTM7ntZC4rZJhhxmFatU0F
   Q==;
X-CSE-ConnectionGUID: MQY4qngJRnyC99cLTk3KzQ==
X-CSE-MsgGUID: tx+kJfPjRCGDE0NhrHL5iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="104565654"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="104565654"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 02:12:57 -0700
X-CSE-ConnectionGUID: csjIqpuVTA+Pa9lvkHxJXA==
X-CSE-MsgGUID: 38V49rUuS4OC6fHQ+swFDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="293838187"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.250])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 02:12:55 -0700
Date: Thu, 13 Aug 2026 12:12:52 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nikolay Kulikov <nikolayof23@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] staging: media: atomisp: cleanup pci/hmm/ code
Message-ID: <an2KlPmaXYxyVMEX@ashevche-desk.local>
References: <20260812205429.39181-1-nikolayof23@gmail.com>
 <an2KI4rsL9tkA_4M@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <an2KI4rsL9tkA_4M@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Aug 13, 2026 at 12:11:04PM +0300, Andy Shevchenko wrote:
> On Wed, Aug 12, 2026 at 11:51:33PM +0300, Nikolay Kulikov wrote:
> > This series removes unused functions and replaces obscure
> > variable-checking macros with clear conditional statements.
> 
> I believe I gave tags to some patches in v2. I don't see either.
> What's going on?

For _this_ time, please reply yourself to the patches I already tagged with my
Rb tags placed on a dedicated line.

> > Changes in v3:
> > 	- Split the last patch into two (inlining macros and removing
> > 	  the file).
> > 	- Replace variable initialization with assignment, followed
> > 	  immediately by a check.
> > Changes in v2:
> > 	- Squashed the function removals in pci/hmm/hmm.c and
> > 	  pci/hmm/hmm_bo.c into a single commit.
> > 	- Add commits to cleanup macros from include/hmm/hmm_common.h,
> > 	  as suggested by Andy Shevchenko.
> 
> Also two process hints:
> - add --base when prepare patches
> - add links (URLs to lore.kernel.org) for the previous versions.

Same here, just reply to your cover letter with these URLs, and for this time
just refer what the base was in a free form.

-- 
With Best Regards,
Andy Shevchenko


