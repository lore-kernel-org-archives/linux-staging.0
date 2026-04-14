Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0BE30C629
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 07:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776152781; cv=none; b=lyD2ra7MnTPbff7lLkIdyf1NJq6x7YZ0Kuef9msN7Ikgi3TtxvYhac7wISiLbKy1MVoHzX7bxcqAgFOJj0pzS+438LQwBlkcwYF7lqjks5vkTGxm5YwrN9WfdTahLfYRi/KJi7piffEptorSP5p3aankh3XTnURS5HSM/qvdjNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776152781; c=relaxed/simple;
	bh=OlotIy7B0e9k+hvO4QN8wI6K4OEI148REVfWN/aLDws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWJ5SHX7ErEP9OmrfXIo0sGJ66sOhwXsYoPl1BmsH1xHDiQ6Pod8rjZJ1IDaVZG35znxKsCa20+M++Bb9ldwmd+HQ69sU9W/jx5a8GB33qdPTxYqRE/Zt+NJ/BdblxhMDuV9DR0Er7EeEnJn0pqGeYG0BaAuWG8DnCEhpBLIYxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=li4Hn+DT; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="li4Hn+DT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776152779; x=1807688779;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OlotIy7B0e9k+hvO4QN8wI6K4OEI148REVfWN/aLDws=;
  b=li4Hn+DTLWB2C6eQCFIYJHOL+fcKjcoOylZyCgb7LYpc7OqG2wLayt7f
   Bw1/N/tjOSnXbG6ef+IGx4HTULJs+WIPXKLFn3zMFTsSc093lDdUwxab5
   zydc1lXO4m+lobVXp+FpiM3z81N/77cQqmu8nMkVXkQHn7V7EigH8bWyu
   59hzjR1TXasIcGiRRtAMDJPIByeoobfD465w+yDp0IaGHRWQoDXGIQzO5
   r/Ww6H5EiJJjTOfJG7YZDNXV8sEF0rjCgjJ+I1Ylln9WsrcSjVSMZx0b6
   UbIhcfdtzzbxHz6UyHIZtQdgweuZoctdv3bQkVf/WOb71aohXn31BSD4w
   w==;
X-CSE-ConnectionGUID: dYdvH041R8+yQ1aaByZwYA==
X-CSE-MsgGUID: 4D6eGL9BTWK2y7wRwwb6wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="76808344"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="76808344"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 00:46:18 -0700
X-CSE-ConnectionGUID: I4fDq5mARRO/+13RcoAgeQ==
X-CSE-MsgGUID: vJV5GP9yRw6oXL/CkAm7nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="253237631"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 00:46:15 -0700
Date: Tue, 14 Apr 2026 10:46:13 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Cc: gregkh@linuxfoundation.org, ethantidmore06@gmail.com, error27@gmail.com,
	nayana.mariyappa@gmail.com, s9430939@naver.com, kees@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: os_dep: avoid NULL pointer
 dereference in rtw_cbuf_alloc
Message-ID: <ad3wxbGGPxxm72_6@ashevche-desk.local>
References: <20260413224417.5674-2-shyamsunderreddypadira@gmail.com>
 <20260414071308.4781-2-shyamsunderreddypadira@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414071308.4781-2-shyamsunderreddypadira@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Apr 14, 2026 at 12:43:06PM +0530, Shyam Sunder Reddy Padira wrote:
> The return value of kzalloc_flex() is used without
> ensuring that the allocation succeeded, and the
> pointer is dereferenced unconditionally.
> 
> Guard the access to the allocated structure to
> avoid a potential NULL pointer dereference if the
> allocation fails.

You have a procedural issue here: please avoid sending a new patch version in
the same email thread. It makes things harder to follow. For example, I usually
mark the entire thread as read if I see some comments and don't want to go into
the details. It effectively means that I will never see the new version that
already was in the same thread!

...

> --- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> +++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> @@ -194,7 +194,8 @@ struct rtw_cbuf *rtw_cbuf_alloc(u32 size)
>  	struct rtw_cbuf *cbuf;
>  
>  	cbuf = kzalloc_flex(*cbuf, bufs, size);
> -	cbuf->size = size;
> +	if (cbuf)
> +		cbuf->size = size;
>  
>  	return cbuf;

Now to the code. This is still buggy. The problem is that the size is not
validated and when it's 0, the same issue (dereference of invalid pointer)
will happen.

Dan, JFYI k*alloc*(0) returns not NULL and not valid pointer.

-- 
With Best Regards,
Andy Shevchenko


