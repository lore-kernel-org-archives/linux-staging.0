Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FC13859CC
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 11:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773056115; cv=none; b=FtshpoLUrshrycqSpE3i8pNGMtgYhRLNVKtBfHE5VmkjpUfq1+iTQlfX5WzXLFkp9FmBQwxytUEsro+QlNwFkzVIFVf4YcVobGVxSM8ffrGo+QP2JfGQssZ/crPaV9cj3jhEmscv0F5RcCAL3jz05ICuqpiA0TNVbgs925Ms74U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773056115; c=relaxed/simple;
	bh=20BDI8MNZYGlUkJKadNeJI+OFMFKni2X0fAf1vQP6lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MS/nCZonDexJapNLiY6IKms/DUrlLX7bXzWms0xJjABlQNLJNhgsxzF5XP9msI9Y/2mFnaqyfSCXBJr97cSN1QvNwdckEHz8BadNsCK2rIKYsTZIyzH0fe2zR9nHWfVhPbBM4gAy3Kjo22F4QX9X7OHly9mRm+KDxsGaBPzNM68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JXy+Cj/e; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JXy+Cj/e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773056112; x=1804592112;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=20BDI8MNZYGlUkJKadNeJI+OFMFKni2X0fAf1vQP6lw=;
  b=JXy+Cj/eip/PIJ3I351jXh9S7T39Q9ubkjqBC3M54Z02N+QeIB9gRL0f
   Jgq7pB+pzU+CRcWvWfzDcHMFwx1WFv8xVAjj5RhRik983tUFqyWZ+1Xv7
   rpDXf4bDALZmzsGCL/7w1GORsjJdtfeYtbBt93j50/dM//61j4mCaqUxN
   WzlTgXDx1DfT2S6F+1eMdHA/nzVZcWwH4a61Cq8B9Ku5IjiDRysOWUMlV
   N0kpgEu7VMbcNCl7EaaMxXZy+zvHf0MD0ClGy9QmF/pEZtMbHsgM5KCi1
   TzR38PMmCqU3hL/Y+oYYd7EE9LNYNtxHD3H8eNXwG4y77GiopV/zG9iTa
   w==;
X-CSE-ConnectionGUID: qQ/KvRHSTXuae8na5gMMJA==
X-CSE-MsgGUID: p10+c7WxQ3yWnF1T9g60CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="85426528"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="85426528"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 04:35:12 -0700
X-CSE-ConnectionGUID: f7z9x5jASde+Tcw/n5xEkg==
X-CSE-MsgGUID: rDY0osKET5uTuidhJqtJTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="219671527"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.181])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 04:35:08 -0700
Date: Mon, 9 Mar 2026 13:35:06 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: staging: atomisp: Remove unnecessary return
 statement in void function
Message-ID: <aa6wakTzH6ZjKrBA@ashevche-desk.local>
References: <20260305-atomisp-remove-void-return-v2b-v1-1-902e534ecb48.ref@yahoo.pl>
 <20260305-atomisp-remove-void-return-v2b-v1-1-902e534ecb48@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-atomisp-remove-void-return-v2b-v1-1-902e534ecb48@yahoo.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Mar 05, 2026 at 02:45:27PM +0100, Tomasz Unger wrote:
> Remove redundant 'return;' at the end of void function
> ia_css_dvs_statistics_get(). Void functions do not need an explicit
> return statement at the end. No other occurrences in this file.
> 
> Found with checkpatch.pl --strict.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
> Changes since v1:

You forgot to update the version. Use `git format-patch -v<N> ...` to get it
automatically (where <N> is version number).

-- 
With Best Regards,
Andy Shevchenko


