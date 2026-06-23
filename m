Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F93230C60C;
	Tue, 23 Jun 2026 09:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782206951; cv=none; b=M93IGPbXU93bDx+NhafLQf4d0IX2J1sX54jWUibxTxuAIQ+3dXVvyHxUVFM6d0fnDj57bF66CdvuEmB7D+0FZlu1HgxsoOc3214nGhXC0MxCpxxMWMab6nY98H/8qVylXyUoVgVxWW2tRj4X3LuoOTNXQDnqeZNh7uxNds+d2g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782206951; c=relaxed/simple;
	bh=hhmxGY3v3Z1tWeR8/98foV1B0+A+e8DwxVI7NPDMlOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HMpJkTMjTENkw74a+R8T5WTuoaE8dJ3zo6hLpkYmwnopSnM/q4SynTS+mbjErvS1yeBfbKCo/6taUzPuiCzNNuLsCH4MxKFw+GzzzaquRExEZOhgEC4J+VOMvh/yhd8urjcugzfo545hs4f9ltvKt+vmA2B8OnWpWouU8DkqquI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iRuZd1VK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iRuZd1VK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782206950; x=1813742950;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hhmxGY3v3Z1tWeR8/98foV1B0+A+e8DwxVI7NPDMlOA=;
  b=iRuZd1VKR5fxzgw9dVIHQLd24GuBmMuiFDtk1kihqrbjVUPrMmrT7nOo
   +w1e9XNB/qLWLBdqb5ZvTaTtAo56SxeqqQda+Gr+uXA7FlE36NiGd02sZ
   RhfL7AOYFitW46Gl6SHQaL3DpAsuduLLZIG0CInPBViIMV2Kaf2hkPfH1
   oOB1V/8kYpeYQrO7NQbzvWvz9Szn1NofdCoKU0fHJoWoYpL9JoeFgVNYu
   hu2E6FKeAbTKHOx3zTDh8AaWlGPFHlorJH4eGbUfAj/yZeZLhfGZqBUHQ
   h+BKwd+71XYu6Bss6OCiHg+8ygdREVq/cf+TQz5QnpG58Bf8+OgGqkhCy
   g==;
X-CSE-ConnectionGUID: YRc48hPrSE63DzAuWEXaHg==
X-CSE-MsgGUID: BUvCCzUbQFizXhjv6QUvUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="85493791"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="85493791"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 02:29:09 -0700
X-CSE-ConnectionGUID: W65lbi0lRQKXjP3EICLWow==
X-CSE-MsgGUID: a9mld5UhQsWVhz4ypZFEtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="273528327"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.7])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 02:29:06 -0700
Date: Tue, 23 Jun 2026 12:29:04 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht, linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 0/3] staging: media: atomisp: use kvmalloc_objs() and
 drop redundant OOM messages
Message-ID: <ajpR4P9FtIg2Se8i@ashevche-desk.local>
References: <20260622224402.34001-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622224402.34001-1-rodrigo.gobbi.7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 22, 2026 at 07:42:41PM -0300, Rodrigo Gobbi wrote:
> Several allocations in the atomisp driver still size their buffers with
> open-coded multiplication, e.g. width * height * sizeof(*p). When the
> dimensions are large the product can silently wrap, causing kvmalloc()
> to allocate an undersized buffer.
> 
> Convert the remaining sites to kvmalloc_objs() with array_size(), which
> saturate to SIZE_MAX on overflow so kvmalloc() returns NULL instead of
> allocating too few bytes.
> 
> This continues the work started in commit [2], and picks up the stalled
> sites from [1], unifying with [3].
> 
> While here, drop the redundant IA_CSS_ERROR("out of memory") messages on
> the touched allocation paths: the memory management core already emits a
> far more detailed warning on allocation failure as raised at [1].

> [1] https://lore.kernel.org/all/20260413112904.98864-1-feng@innora.ai/
> [2] https://github.com/torvalds/linux/commit/d178c7ca8fefc28115d35b94c3b1f4d653e34182
> [3] https://lore.kernel.org/all/20260609215110.118860-1-rodrigo.gobbi.7@gmail.com/
> ---
> Hi, all,
> Regarding a comment from Andy at [3]:

> > There is a ongoing effort like this for other files from atomisp
> > at [1], yet, it is not covering the same file.

> > [1] https://lore.kernel.org/all/20260413112904.98864-1-feng@innora.ai/
> 
> > Yeah, the problem is that the activity seems stale. Can you pickup all
> > the patches from the mailing list that have not been yet applied (regarding
> > k*alloc() uses) and combine them into series or so and update regarding to
> > Sakari's comments?
> The only patches that I found from stale threads were added in this series,
> hope that is fine now.

You need to preserve the original authors.
Also see individual comments.

-- 
With Best Regards,
Andy Shevchenko


