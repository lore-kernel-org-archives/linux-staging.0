Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C242C027C;
	Thu, 25 Jun 2026 07:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782371651; cv=none; b=dQm5YGcBK0/KeXbHwnZ/6lsE9R5ewglAkxtmlvFOueNOWUCDP0OnmNjIc/vN9eFmYfQVR37NywXYOKzu07MPelDQWcTur01Ob5RqF9IQ2m4aY/k9gxPU+E7T2POv6eRs9dXc8Lzb1RvkbfZ4Mttu0X+cOKyjTmrZbct+2YUPa3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782371651; c=relaxed/simple;
	bh=Tguj9rM7L+Pr1kybxB6ItHT3wFbHPbjQ1nRrVHjccX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=etAI0nXoEQkEW7afPSBnzEBmiOqpv6xnLZa0TJZw6jnWz3GqbBtFS70xb5NGsGLt/iQSvHWQ8LVdP8Y2t18w7hQgdaQlZs4lPOgMIW+YnyG1krDoDAPFnUMrZfCmx3IrHQSipx7eXsjF/VfX1B7rbvufDAXPIexxWkssLCDQ8Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XTR4vvgW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XTR4vvgW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782371650; x=1813907650;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tguj9rM7L+Pr1kybxB6ItHT3wFbHPbjQ1nRrVHjccX0=;
  b=XTR4vvgWBnlUzu4jMnpa09iAqaBJMphjwJp3qQC4KxHqHWtcQ4Wr7PC6
   ubOk/mjnnRUN7fT7CUYP7ntYHtWNzppsXUJ09+gcccgMWuwKK395OSgpa
   KQbuhnhcJMKg4mSJ0GMIAMyhIXeNv6itLCaInCzMhjzM/2INFIoIUslPJ
   mOgFxlYKvmw9UXk92xTNMYWeXLMshBVfN0AZZtaqNS75h7CCHznL3i+YF
   d/J3laqaPDneGxcWgFBsFR1uNX5HtkdxVJ/xkYaLTGmCRQZaEg9ioIQR3
   rrZE1rjCiLlYlh+/kkrraP3QLsuk6v04af9nU54j8TLoFp/asPs9ZEEVv
   Q==;
X-CSE-ConnectionGUID: WLPNwd+OS1GSqpoySDZgIQ==
X-CSE-MsgGUID: 4etE74eMR3afHyNU15FLcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="82127748"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="82127748"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 00:14:10 -0700
X-CSE-ConnectionGUID: hNasxWafSTOy4fs6HUaMwA==
X-CSE-MsgGUID: AtoV4Dk+RVOBM+88SJmmTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="247303780"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 00:14:06 -0700
Date: Thu, 25 Jun 2026 10:14:04 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	feng@innora.ai, ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 2/3] staging: media: atomisp: use kvmalloc_objs() for
 overflow-safe allocation
Message-ID: <ajzVPHie23a90TA3@ashevche-desk.local>
References: <20260623221028.40238-1-rodrigo.gobbi.7@gmail.com>
 <20260623221028.40238-3-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623221028.40238-3-rodrigo.gobbi.7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jun 23, 2026 at 07:09:27PM -0300, Rodrigo Gobbi wrote:

> Replace open-coded width * height * sizeof() multiplications with
> kvmalloc_objs() and array_size() to prevent integer overflow in buffer
> allocations.
> 
> The atomisp driver computes DVS and statistics buffer sizes using
> unchecked arithmetic.  When dimensions are large, the product can
> silently wrap, causing kvmalloc() to allocate an undersized buffer.
> 
> kvmalloc_objs() uses size_mul() internally, which saturates to SIZE_MAX
> on overflow, so kvmalloc() returns NULL instead of succeeding with too
> few bytes.  array_size() provides the same overflow protection for the
> two-factor dimension products.
> 
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Feng Ning <feng@innora.ai>

> [rodrigo: rebased; convert only the sites left open-coded after
>    commit d178c7ca8fef]

Thanks, you can keep this on a single line

[rodrigo: rebased; convert only the sites left open-coded after commit d178c7ca8fef]

> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>

-- 
With Best Regards,
Andy Shevchenko


