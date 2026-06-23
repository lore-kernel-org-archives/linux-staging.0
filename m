Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6BE377544;
	Tue, 23 Jun 2026 10:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782210184; cv=none; b=TJ8Z34jg9KivSq/5x6ZqaWWxmVorcccO4Mn9k3ZuNqKJvy29WFYRrxiYUvKXRZO04Z2NyCl2M4+zO1v9/6t9nSuXjsYi6JDipZl+vC8KGx9sLeD4bGP9CzVheMh1TB4v/UOVTbDO34ick9Jv07RAFSinBEgZT+yZrz8stRQTkfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782210184; c=relaxed/simple;
	bh=VcLFiuENyyd3m/b4a3E+So1QsoqXa7Lc8NGW4N5fCW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tz06Lo7lU1q5RfWsGSpMujaIGLKJqaUHtjvfEsCayEZbYYH+7QhoVOVLdH24idAb96DQQrHFBzIDOMUGGreTJb6yCORQzPyXuotNIFEFg1Y4y5hKI/fBvoD+wapsmxv0K6ELZVaGwbHgbfAPvpMwJbqoYUKgxluiBEl6LtZGRmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+oZS+CS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+oZS+CS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782210183; x=1813746183;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VcLFiuENyyd3m/b4a3E+So1QsoqXa7Lc8NGW4N5fCW4=;
  b=S+oZS+CSAhU6Y98vuVz1BVBIsWiz9wkV6SCn1ak0OHayEkp+/THtt1ti
   DHBjyQKhvUl6grcwjWec41Fw9Hl4DWrcK2E/YlPYsPS3yi/KvTfGylb79
   MesUep+ksYzdKDluHtD4RXgCGxxXCYf8CUxUXzytngQ27TfCC99Jcop4C
   EspA9ulq+mCBGanJYaHn514G6InDWFHYrvmf1uIK92bDgZCr3wXXb62P2
   HgqGdPqUHaRX2RMpcsxc0O2h40C4fGLPOw01SjjfOvE/tY8NbnSBKuIy4
   vrH1bgWBMyuNeYzem4yIpjjhZqnbEhYqplE+fgZCnBOqoMCsusrLCz08A
   w==;
X-CSE-ConnectionGUID: PyRkm3RoTrqCc915hY0ePQ==
X-CSE-MsgGUID: ifHJmdsASMyT0a79xfvz5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="86856121"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="86856121"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 03:23:02 -0700
X-CSE-ConnectionGUID: EuFLw/PpT8mMtaz73qmLHA==
X-CSE-MsgGUID: 8j8e1yFVTDSG/5DLJv65KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="279659047"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 03:23:00 -0700
Date: Tue, 23 Jun 2026 13:22:57 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht, linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 2/3] staging: media: atomisp: use kvmalloc_objs() for
 overflow-safe allocation
Message-ID: <ajpegTS1vfclimCQ@ashevche-desk.local>
References: <20260622224402.34001-1-rodrigo.gobbi.7@gmail.com>
 <20260622224402.34001-3-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622224402.34001-3-rodrigo.gobbi.7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 22, 2026 at 07:42:43PM -0300, Rodrigo Gobbi wrote:
> Several allocations in sh_css_params.c still size their buffers with
> open-coded multiplication (e.g. width * height * sizeof(*p)), which can
> silently overflow and under-allocate.
> 
> Convert them to kvmalloc_objs() with array_size(), which saturate to
> SIZE_MAX on overflow so kvmalloc() returns NULL instead of allocating
> too few bytes.

...

> +	me->hor_coefs = kvmalloc_objs(*me->hor_coefs,
> +				      array_size(grid->num_hor_coefs,
> +						 IA_CSS_DVS_NUM_COEF_TYPES));

Here and elsewhere with long line, do like you have done in one case
with a temporary variable cnt. It makes same number of lines of code,
but readability is better.

>  	if (!me->hor_coefs)
>  		goto err;

-- 
With Best Regards,
Andy Shevchenko


