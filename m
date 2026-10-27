Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793122070;
	b=XkzH+E0ifQrs+WfSK2ICU9Oh12f0YN1IT91Moi1beJ1p+Ryew9X3Olzh4KpLNJcmsvLh
	 xsHCuKJvUsgVusFgoWWEA3IZL5d6Ty9CmAedMQvMzffj1Frvt5XX48rlHZsqeh4m6cyqA
	 PiFKmFHTDgE3Fd5il0y01KrTnZoFa0iUfM9v0fGmcbGNKJKQMu3bGy68oOQi4tGMntoJk
	 D9agNxJU87JGREH5aqMVdHLQRzz2TivB7YtsRuivbhwG7bg4muTDglbjsg35cZXqVSD4u
	 5OqL/iIMmx8P8855Cf0zkTlpcUewmOexW4X5HwROorrWKcmywFJ9e5uALJ3RpV9x1QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793122070;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=lt4l40T9GlSAVAX2LK6PXcshODNkMyVROuAZR1z4YdU=;
	b=L10lswamIIfBrs/wnz5F0jSYVUSMcA5LYHNhb3Dh9BsZH7Tukok7QQ6ejoNxUPB3z8a2
	 NFuisZ8zlWlFxM4Vcu3KPHvDdcUWSqLLd/sdYlVuf5pPj+rp7vV+kzWYBoYartKxuqP05
	 WkE67xJR49s4fAnV5MsH7wfENWEThyHkqW5W/2s891JYS+DKfRIyIkSckffQphTSf52Kc
	 BvfPfRO/QISdlj67Vf94EXBufT8rXpMcFVnjimA6zi6NAMcgp50LOUpczbVXE9E5ekijC
	 KiYG3YoRBquSH2SCb49JAILula818GCJHn0JNOnuF4Wy1OIK88hpnsTmLMv4uYO5e1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N1Lum2g2;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35F0606A31D
	for <linux-staging@lists.linux.dev>; Tue, 27 Oct 2026 17:27:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E35F0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N1Lum2g2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793122069; x=1824658069;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WXOjcDYd8G6UkiBh69qaiJ0zs5RsmBQuOpYzgzEtwks=;
  b=N1Lum2g2nZe28QTNjX75lkkDLdpL/5sdOILVPsWXYiWL6v150frPxZlF
   er4T4VE0NwczoAvSIBU1o9mCPN6ZeyWKRfU8pya7jkBbHEaOa0u4qKwqx
   c5yVis+57XxBeBrAF0XaUjfKGrxOR48e4ALQwJgofjuJyUEDD+BrYTGWV
   a2LzbHHpn0jPUa7Y09e/Oc9vXbMVe9yr5PREVlPKs7SIGb2G3hl543bRQ
   FISdXAfIv/qSCZ93a0TqdVHIQbWmF0f4bBF8hafzsmfkrCU9On3yHyCJZ
   BgE4IXjwgkrVNCFkaoN6E9V/8anQIUDPf9M+XXjjCAjoHfYk36Y5tJgRj
   g==;
X-CSE-ConnectionGUID: uSi4PmUiSfuhJ2Kzmb624Q==
X-CSE-MsgGUID: HvjKhXx5TZ2WIHAg7kjycA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1842187"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1842187"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 10:27:48 -0700
X-CSE-ConnectionGUID: VmMVJktAThiYAuxnIfa+2g==
X-CSE-MsgGUID: d7mkQCxaQd2gco7F9kfsEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4935252"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.196])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 10:27:46 -0700
Date: Tue, 27 Oct 2026 19:27:44 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: =?utf-8?Q?Rare=C8=99-Mihai?= Vladu <vladurares@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] media: atomisp: queue: remove unused local queue
 support
Message-ID: <auDfEPhzJlAN7mmv@ashevche-desk.local>
References: <20261027120341.2305533-1-vladurares@gmail.com>
 <20261027120341.2305533-4-vladurares@gmail.com>
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
In-Reply-To: <20261027120341.2305533-4-vladurares@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 27, 2026 at 12:03:38PM +0000, Rareș-Mihai Vladu wrote:
> ia_css_queue_local_init() has no callers, so no queue is ever created
> as local. ia_css_queue_uninit() only handles local queues and has no
> callers either.
> 
> All queue handles are in the static css_queues in bufq.c, and
> ia_css_bufq_init() sets up each of them with ia_css_queue_remote_init().
> This happens in ia_css_start_sp(), before the host sets
> host_sp_queues_initialized for the firmware, and css_queues is not
> cleared afterwards. Before that, the old code would have taken the local
> path with a NULL cb_local.desc and hit OP___assert(), so the handles do
> not seem to be used before initialization.
> 
> With only remote queues left, the queue type no longer serves a purpose.
> Remove the local queue code together with IA_CSS_QUEUE_TYPE_REMOTE, the
> type field and the type checks.
> 
> struct ia_css_queue appears to be host-only: it is not copied to SP or
> ISP memory, and the firmware uses struct host_sp_queues, whose addresses
> the handle stores. Removing the union member keeps the struct size on
> 32-bit and reduces it on 64-bit, where cb_local held two pointers.

Yep! I hope now you see the elegance of this change.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


