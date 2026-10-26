Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006421;
	b=u6gwxgSTH3kgDN8E1u+W7BZKiidq2iWX+j8UIlpjYx1BQ0IP/9GPPwwc9638RynS5HsN
	 TWrHwT+YOzPT1Fo47slpQq1VerD0AL9QbwGDy3K6fvwwCx7xiZHbvhH3Cs6M2BJHf3HF/
	 udqYV+4JeCfI7wBa8ZX6lQ9MdzqpCpcMlrTsFxI2k9z+ixjDmwW8zm6y4ylKvD2cJhggu
	 AuKNeOd5r4ys7mFL1JHiXu/8YQwVRHL4ycw8BpOSfEDmHPB6DS3VrPdHs9C4e2a07aeMW
	 bFAYUgtn2B0uHPHPqfmEeW8hCrfWwEFcwFJOIi3auLdbMEVteAKAwPz3PApT4m2jk7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006421;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=ovyzx+4aMS0ZrrN8RnrYN2vt3p/SsR70lqwN6FFW96Y=;
	b=noIhvllVt3QQ67wvlycKqCgAmjp4m3Tx5O416XkLWmuuSmELRxLmWiPhDe5oHdV9cYei
	 5rTaUfA1A3tVVvdjTJQaoP0a2rvEwjLyCIs8WvtRZBZijopFMz2QrVMLvzVeQjmMGlom3
	 iylM1KahHAZrFsUZ8IImiv0zjlHyC3KOnUx6o6GTSndpTEP+2O+O/+GEd2oyz8n/oOrP5
	 PkU9C27FmFLv6dHzX9BeIbe9Kj5GkFZQIJkEtypKmElVGWgVlz58F54POfFk/B6NYzife
	 xLWXMuqhiO0sm8kucUPL1FoWTNRvJdiiLlan3TRxsHk9ah3yUM3gKWAJMw9mjKMQ8/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nk4xQPYa;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA96606A31B
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 09:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FA96606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nk4xQPYa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793006420; x=1824542420;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l98tJlWIxePL8UadcPX+icRB1JGKcTcv7OakA/8Fbb8=;
  b=nk4xQPYaqxVy2el9UByZy1TI4/fkvrLr5UvNDds+DzOgcVqM1C9mqVsn
   dtaFQuDv15yN4jajb2efUrCYPAn3ycUaKyfLkNgwV3JTungjdg7TsHqNJ
   Tj7i6+HQ8OaN64RqtWP94YcGxmz/krI9l4Vd5CoIkn3rXjEGP2Xzoz1GG
   nq3dOH1xyzPHm6ZDgcerecIC0B2jpuN6n8gSgQV9sfRtl2Dazc6NU1k8b
   vo3wKclataNvYn0pqajMxSEN81FdFIkw14x5YP9qEgpwquzQ41u+votDQ
   t995mMAj9r8L84TE5MmRg/DG6WsClWznKvHGCRJMACRKM13NtH0lOU7rw
   g==;
X-CSE-ConnectionGUID: g36Gr7hESEOcWgyaVd8XLQ==
X-CSE-MsgGUID: 8/QtTGQ8SKWocx5mpb+ZJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1567221"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1567221"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 02:20:20 -0700
X-CSE-ConnectionGUID: +NkuXWxbSty1XHIxudWlug==
X-CSE-MsgGUID: 61o73YBrTBeplNEqcvJ6Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4269505"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 02:20:18 -0700
Date: Mon, 26 Oct 2026 11:20:15 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: himanshu bakshi <himanshu.bakshi478@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: fbtft: Fix line length warning
Message-ID: <at8bT7NCQb9XvGoS@ashevche-desk.local>
References: <20261026044523.18516-1-himanshu.bakshi478@gmail.com>
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
In-Reply-To: <20261026044523.18516-1-himanshu.bakshi478@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 26, 2026 at 10:15:23AM +0530, himanshu bakshi wrote:
> From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
> 
> Split the line in fbtft_init_dbg macro to keep it within the limit of 100
> columns and address the checkpatch warning. Also aligned backslashes (\)
> for the macro. Added a temproray variable for platform data.
> 
> Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
> ---

Where is the changelog?
Why do you think this patch is anyhow useful (based on the previous discussion
and your observations)?

-- 
With Best Regards,
Andy Shevchenko


