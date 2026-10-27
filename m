Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793122746;
	b=0PJMxQ6eV1o6bJoA7zomcXtmPRGPyH0HTeZ+K1Wm/ns5T60JgfVvwWJnm5VwvLZgzsgT
	 EQborAEsUMlz8hoXlT+XT8+DDLJWATN8nWElrBPT38Vfu58U73+anw8d0lMJJYc1mS1Y5
	 s4rLMK0Btlw5nuUxERpXb2SLbdHuuwVLZxiP9JSvzP4t/b39mcjYlR59ePPLRe7hkxShD
	 hWBSoy+7VvGO81el5pU2PxtJz/+Jph0fGylu63BtkbCRS+MpGL/6xK/r+ID3UyAa2MIhF
	 amz2+IFYi6XMSqGDDfuss1YbugFeS8AuARhlWWHpz0XGdyrsWS1h73XT9G7UsAiFxpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793122746;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=GMLoZqn9hUz7CF6Vy6FF9tNhZQTvAeSqJAal3eoYO48=;
	b=tOpR61lKaEqRHcOy4GXFTuK5zWzLv5Zk37wYYV03MoqmS/1NWTNmMUhZzBHzU0L/UF8m
	 UxYMws7sjKWQi2IfP8Ts0/xw6oMn6pfObV4HQNEq683vqMZ9Nm98+ipYbwTIwffsB6/7J
	 tSrQvjib0TBqGN74GP1ap6IsBYa8ceL/tiPYLDUVOyOpQ5j7zj1J2jeTC21B5Tinn8JTT
	 +DWitlXQ7cfwnsBcuFJzLfIRjNbHd4/G1p3jWia4v+D9zHvL/+cc9JDhA7j7nl+s6Svp3
	 5VyBK4RmciTHgy4j79v54E3q84ky7WCWKWDdm47w7d5j+3WR2/JsG2Uz6QT4ZgNnoBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cqyexwYF;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E78606A31E
	for <linux-staging@lists.linux.dev>; Tue, 27 Oct 2026 17:39:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08E78606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cqyexwYF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793122746; x=1824658746;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+MxEiuBZ/L0ubNP9ZUsiWv6JkZZH6q8NBc49BPiB3FQ=;
  b=cqyexwYF5u2DX9SPcyWciTroJ2F8wPeHV9ejTYhfKbZtQpn/o+xHfZrL
   P20S/HM/NcIupEeGpkHnoqp73x+EdWLs2x+BR6nORjgf3rfslILnsZ2ot
   tirInmbTbaim93jNRVQ/luR3BuHfB0KtMcj8QQVrHDwP7Q3TVi6z9627y
   ci+5cP7kr1ACN967b6emwUaoFkprkbbjw4fg5c5uEOnXcRJWRSp60HaNA
   fw/g8moWKOw+SIxGCNjZ/KyGQQNKkBXIiokk2YRhD/WiaXHTW4PRoh1pF
   Twy+VaP9ajfMS51jQInpCnT/rLdsKmO7vphdH2u0jUUeB8WGKhpgnS9Vg
   g==;
X-CSE-ConnectionGUID: VPy0c6ogTR2n+YKO3kzYxg==
X-CSE-MsgGUID: uEO9YS7TSvSs0virR5y24g==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1718086"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1718086"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 10:39:05 -0700
X-CSE-ConnectionGUID: QWVD5rq2SAmBbkxIBx4vRg==
X-CSE-MsgGUID: mL7lmYsUSTaE4Fxi9cNa8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6474352"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.196])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 10:39:03 -0700
Date: Tue, 27 Oct 2026 19:39:00 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: =?utf-8?Q?Rare=C8=99-Mihai?= Vladu <vladurares@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] media: atomisp: remove the circbuf library
Message-ID: <auDhtEFGht8PQnET@ashevche-desk.local>
References: <20261027120341.2305533-1-vladurares@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261027120341.2305533-1-vladurares@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 27, 2026 at 12:03:35PM +0000, Rareș-Mihai Vladu wrote:
> Thanks to Andy for suggesting, in review of my earlier typedef
> patch [1], that I look at converting the custom circbuf code to
> circ_buf or kfifo, and for reviewing the previous versions.
> 
> While looking into it, I found that the circbuf API is only used by
> the local queue path, and ia_css_queue_local_init() has no callers,
> so as far as I can tell that path is unused. The remote queues only
> need the descriptor and element layout shared with the SP firmware
> and a few small helpers.
> 
> So this series first moves the remote queue handling into helpers,
> then removes the unused local path together with the queue type that
> no longer seems to serve a purpose, moves the few remaining pieces
> into ia_css_queue_comm.h and drops base/circbuf/. I may well be
> missing something, so please let me know if a different approach
> would be better and I will rework it.
> 
> checkpatch warns about new typedefs in patch 4 and about MAINTAINERS
> in patch 5. The typedefs are only moved from ia_css_circbuf_comm.h,
> which patch 5 deletes, and MAINTAINERS has no entries for the removed
> files.

Almost there! The few minor amendments to the patch 2 and I think we
good to go, I believe next version will be final for this part of job.

> Compile-tested only.
> 
> This supersedes the typedef patch [1].

And thanks for doing this! This is the real cleanup series from people who
want to learn while doing something against staging. I will point others
in the future to this success story.

-- 
With Best Regards,
Andy Shevchenko


