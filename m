Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792939836;
	b=xj31b2vVewm2f1RMGrFMj0hrcGYzxkXhB4DH+7JYE8fDygePUKhJ1JvvyzUy8FfbaWEF
	 kIOuYzHHIvedS7cx0CpvUtOoyLZfbu8MNEWBNOIW+2q0BLbGUu72j7DPsrOAX9Q1/M7oJ
	 ia/NkxV0D2D1UnSCcqbAyIPUWEQ2c0Fuw4Ib5XvCRlS/vm5nlCT+/4Ju5p+BuXR21Vtaa
	 Zy7FqZ1p1BIWuaSz4j4RuCN5cnYqGUJQhJOtDxpyVT1TX6EZMjiRhGs+5qj/YQ03R1HSP
	 OGY9fPmBfRuem39DvdSzCubC16NcdAaU/jOCyzAVtrhfFDfZeHu8pKdyr+J7TvV9f5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792939836;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=6Pxhpwyug/cohEo6PD4X5ffzTblLzmuMS1iKA6wHYTY=;
	b=l3jSRz8G7rysjN+1dspMoOePzqxvcMgXzEPHEhvrAceEP1cDF2jDLTMb2MwEsZEqtz/v
	 l4XZSURJE4oq4aAlkW9MqZR1GQm6Qou9ByYlY5oJYPlVAr9fMWfaZEGUTXBAfXYG1u6MO
	 0Zcn2mlhYRJKua8bQ56itnmqMUIDmuZ2xY5gYJUNJ5Llofe1jvECVFDnsT+Hz7t1tPauI
	 demlM/Edxtc8Xz647YurAtxW3D0y9MqejCxlKw5srYMhL/t5oaMQK1gVmvTSyuyg8+Ucs
	 gGibUk0pddp6XhwHN44hxQ04aRHqarv9at+v9YAMtEfjxXwyqcKvgZuAjz2Uba4Jqfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PshC8Di0;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6372606A31A;
	Sun, 25 Oct 2026 14:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6372606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PshC8Di0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792939836; x=1824475836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H4I93okhC8Zg01N6xJwsIKRDh9uxsIAKt5AaymrgcT4=;
  b=PshC8Di0VvoCJPT1LPZrWYHCax+1tWNXg4qka93dGdGFM084thK169kR
   tUpvUQOnhDQ4SYrazUarH4D2Fa11pglepfTL05qWsDkHwHoMDXL+pbCVk
   RI78SJMRKlEJRXWcVsnvEWeTQ3Jpep8i7LTpi/0SjO3mXVgKYjnu/avvG
   eN+7OU9gKE+khRVtmp1R1l4GdVVDkN+zmhKoG4CWQ9qzyhalkT+JvIpcR
   Lr5zDMDJQNJDphOMgc2W/Gvxgbub+ql88xDHBhe6x2OnfIMts0Rv2ANLa
   swPU4fe0XL/4s+nghzskjR9EGa0LKJdUE1nabLhHebvYCFu9OduATy6gK
   A==;
X-CSE-ConnectionGUID: +wDDyThkQo2UX10U7J5qLA==
X-CSE-MsgGUID: qlgxi24PR6OFnJKO0n56Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1724552"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1724552"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 07:50:35 -0700
X-CSE-ConnectionGUID: ZsO6uhFNQiSLWYBDVmp0rQ==
X-CSE-MsgGUID: /noBoKB5Qp24wD3Z0bBbcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4060247"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.10])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 07:50:33 -0700
Date: Sun, 25 Oct 2026 16:50:30 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Abubakar Musa Samaila <abubakarmusasamaila@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: staging: fbtft: fb_upd161704: Replace udelay() with
 usleep_range()
Message-ID: <at4XNunsk8UWquPB@ashevche-desk.local>
References: <CAHxSwT8=ZA2sFqXNjfX2=Bf369+gNRLfCO+VtVmmWiTzenLwWQ@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHxSwT8=ZA2sFqXNjfX2=Bf369+gNRLfCO+VtVmmWiTzenLwWQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Oct 24, 2026 at 04:32:11PM +0100, Abubakar Musa Samaila wrote:
> Hi Andy and Greg,
> 
> Please find attached the patch that replaces non-atomic udelay()
> instances with appropriate usleep_range() bounds in
> drivers/staging/fbtft/fb_upd161704.c.

Please. study the respective mail archive on lore.kernel.org to understand
why this patch is no-go.

-- 
With Best Regards,
Andy Shevchenko


