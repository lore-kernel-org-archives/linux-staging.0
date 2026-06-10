Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DF4409625;
	Wed, 10 Jun 2026 13:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098589; cv=none; b=rfCmVusk1wzoxxO1puHgQlcp29cL1oMdkWDj2pb3xHGKJBe+3U1tfvZSivYkdeh8kJ2GsYtQzcrRRuE1V6Vd8LPbMSHHJf2IgOsQC4SYXv1qodUuoS8vGol1zEP5SIhGFC5FBEtOI5pfwoXSty21ctwdFDroHhysGqEwM5mAElQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098589; c=relaxed/simple;
	bh=l2JZP7zzFaDa2y3gL9xNyiYHIWkp0WBUocN6D/6f+J0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qhefgXha/Bp2ekx822N8vixwR/p+B8qvk5MHx+5fMDI0VDMYy7RYdSpBxgkZLfn8k8BmLzVr6I0yHaW7xO2+SPgD8VhaVypOLOzOU4RU4qxiy4mmSrXEssTC2bKlSyObjjj4Ug2+w70EU9wQgyKB/DKyk7VsC0KG180CkFDdZ80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DrOQZOmF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DrOQZOmF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781098585; x=1812634585;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l2JZP7zzFaDa2y3gL9xNyiYHIWkp0WBUocN6D/6f+J0=;
  b=DrOQZOmFtc436O2pdK3CoPxCZ/Oe0UVkPyu9ka/hgxZd3Q291G68t8cO
   FzwquHXwB3EHzSZjQIAiIhI/y0tfJn/xBR+l3L4BsqYD9uwPmh59jR064
   yOCGuUPo8hV3yFqOlw9Y5epMBxZZKAr3S6W+Ebf3Nqix1qHUY7po0SJ7C
   IuDvFew4YpM60bLXFtgiEvDLKruxvU9WwvdVzQb/IYBQpMqW19r4V0X6P
   RZrsoVBZt3zrPGkvG0HDLDy+T+je/tE9+YxHYbYAGujipBPEd8i8E0cQ5
   wvgVwjCJfKAwjXwIPaxwGIXoZKj25blkyJL9eYi/DTFX7H8/vj7vUero5
   A==;
X-CSE-ConnectionGUID: hVbaTQg4Q1G/ZsmWRrhqFw==
X-CSE-MsgGUID: stDWQXJDQdOFc8+sdjrfOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81868625"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81868625"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 06:36:24 -0700
X-CSE-ConnectionGUID: IqWG2RouTdi7xF0imV58dQ==
X-CSE-MsgGUID: vEg/9p1mSVirOQOcH0Buug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="246027947"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 06:36:21 -0700
Date: Wed, 10 Jun 2026 16:36:19 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	feng@innora.ai, ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: use kvmalloc_objs() in
 make_histogram()
Message-ID: <ailoU33VyQJtpEcA@ashevche-desk.local>
References: <20260609215110.118860-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609215110.118860-1-rodrigo.gobbi.7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jun 09, 2026 at 06:46:31PM -0300, Rodrigo Gobbi wrote:
> Replace kvmalloc() with multiply with kvmalloc_objs(), which handles
> the size multiplication internally with overflow checking, silenting
> checkpatch warn.
> 
> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
> ---
> Hi, all,
> There is a ongoing effort like this for other files from atomisp
> at [1], yet, it is not covering the same file.
> Tks and regards.
> 
> [1] https://lore.kernel.org/all/20260413112904.98864-1-feng@innora.ai/

Yeah, the problem is that the activity seems stale. Can you pickup all
the patches from the mailing list that have not been yet applied (regarding
k*alloc() uses) and combine them into series or so and update regarding to
Sakari's comments?


-- 
With Best Regards,
Andy Shevchenko


