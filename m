Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAE631280D
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 08:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776413754; cv=none; b=GJHxsoqPLYcjrmcpxSy4Yxl7sBhSiE9ydHTqBgukgqNDQAOcRLPm/2HbCRktf8rMndEMb/5YzhKN8ZX36UiCp7myC6W+vh/PVKyi5z+Hk69j83S0FKlREYpITCY9Us8hiBWj3yYNj/ToX5HxArT3rpBf9JI1bvik+D6zFZX9z10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776413754; c=relaxed/simple;
	bh=u2Fsjjw5cj9mEcZHeaep0Ri8KvEYxWGrpnKPA4s4FbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EXqOsJuc12vSsZqbz4NL0uDMW78RNUCHSuUYTManhgI+oTE85jyewF80yeKL0b0O7xftVCy3n3nhYU9fxZ+qG402/vJG0bjEILDaUBvE2s3Oja2BoAqM3nAllx/wl82TbjqrTHRmw5NK5lmRZKLArreSraFP2rqlpHZHNrDbaDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YmB+xRu6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YmB+xRu6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776413751; x=1807949751;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u2Fsjjw5cj9mEcZHeaep0Ri8KvEYxWGrpnKPA4s4FbU=;
  b=YmB+xRu6mHXXAAPI4304kctEfvAYo0ygeGsEosErTyYkbOv+X4Oh4OMg
   hnrs/LiuNIjvmM2SKqJFjQaKI+FLM/0ICe++M58E8FrReLtZ+NXTFLt0I
   mww0N0nlhNpTrnmGeQIYzEkTvwCYlCZKqPmZEw/dA26S1VNHQHwzw325V
   ELqP3lad6o1EJCUBVvuC7fNn+cP5Uco1daWSmMfSTsTqDSeZk2OYBp4o7
   p9LucHf8yCoWXouaiY8fAeBmr1BXLOUrEJcAgDx+5yAKwvUIrDVYrk4QD
   HaVZFuzaRjHWds05vn4dGtBUzle5ILrzD754+abJAgJ2rtH6HzABh7cWa
   g==;
X-CSE-ConnectionGUID: xxkocfd5TEmUUC6kK/aErw==
X-CSE-MsgGUID: KeYAE4i6RJmu9wNCbzK4yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77545847"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="77545847"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 01:15:49 -0700
X-CSE-ConnectionGUID: mcGQ7J8YSousPOTmT/RNow==
X-CSE-MsgGUID: iL3zw46hStWQ0IEBtDZeUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="254196617"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 01:15:47 -0700
Date: Fri, 17 Apr 2026 11:15:45 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Huihui Huang <hhhuang@smu.edu.sg>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: media: atomisp: fix memory leak of dvs2_coeff
Message-ID: <aeHsMXwZEn29dROH@ashevche-desk.local>
References: <V2_MESSAGE_ID>
 <20260417070124.2677399-1-hhhuang@smu.edu.sg>
 <aeHncYMO-m183mOZ@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeHncYMO-m183mOZ@stanley.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Apr 17, 2026 at 10:55:29AM +0300, Dan Carpenter wrote:
> On Fri, Apr 17, 2026 at 03:01:24PM +0800, Huihui Huang wrote:
> > There is a memory leak in
> > drivers/staging/media/atomisp/pci/atomisp_compat_css20.c.
> > 
> > In atomisp_alloc_dis_coef_buf(), dvs2_coeff is allocated by
> > ia_css_dvs2_coefficients_allocate() and stored in
> > asd->params.css_param.dvs2_coeff. If the subsequent
> > ia_css_dvs2_statistics_allocate() for dvs_stat fails, the function
> > returns -ENOMEM without freeing the previously allocated dvs2_coeff.
> > 
> > Add the missing ia_css_dvs2_coefficients_free() call before returning
> > on the error path.

> The design of this code is that if we have an -ENOMEM here the caller,
> atomisp_update_grid_info(), calls atomisp_css_free_stat_buffers() which
> calls ia_css_dvs2_coefficients_free().  I can't tell if adding a second
> ia_css_dvs2_coefficients_free() here leads to a double free.

Exactly my point about NULLification... I asked that question twice and
no answer has been received. :-( I believe the atomisp must not be given
as the material for "the first contribution to the Linux kernel" mentored
by anybody. This driver is quite heavy (100kLoC) and very complex with all
magic inside.

> I call this style of error handling One Magical Cleanup Function.  It's
> always buggy...
> https://staticthinking.wordpress.com/2025/03/31/reviewing-magical-cleanup-functions/

-- 
With Best Regards,
Andy Shevchenko


