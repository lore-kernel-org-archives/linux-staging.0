Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764759;
	b=Rc+ZzFolMLlYsM3O1DBUZDom891X5BI2BuuksXtf0nVAaSwbHk2CddbLfYjHsD8l3RVg
	 kVEokI/Vf9H5VX8NlUmFiZAxAvHwZspL6q6QXydh2lZ5DgyPD7Qk8B+rntLmyPsM3+YOv
	 6KfiJC3eOqUBmRRgaT8+OyTKCMu9q/TtWqdrIk4ycPYbrpdBmjcAJMYDyfGQnbdm4RBZY
	 0ke7gdrLC1F04JgGomfuggRGPj3CdubsxUg6H0ER8Oo85aSpnn3QTOCxEUFwD8WStMjwE
	 Vyd5fj9JncXKK1BqEXqd7jugSaoG8P87QyyxUWoiWeRmhY02C0GKi/inmJlNHtpwm1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764759;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=Ab8RHstOOGsiaRRPvys5lJ6PezymvXrBWNKqeo/lvPM=;
	b=ALIiV2j2icq4RYe7vxNAUvG2IZVPE+ejiyX/KVis6OGwmpjZNeqr4CXOEYxHGuDYQ58p
	 IWio38WI2SDWib55RLulsVQEQngItTTUe30ZkXMIB95IWMjyFxKyPmZJqr7doFbVWdEyf
	 Eo/8m9SF7wook8Fb/o8j7QkoXOSsaZMMvYY+w1M+Z+Q/yauR7skrCsvCfI8GngAg897bg
	 Y51yCKAdOaWf62L29KsKp54/LG1iz/4fEHv4rkAoYEn6bk90h/XvbJHHyPtB87n3hePom
	 uiKY4T4jy+CQJ71cQXcKQJMA1UNz6bzsSiozmPzCFD2muTitLnWCo5jJZkIyaqtmSMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aEvvqQY4;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5558C606A31B
	for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 14:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5558C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aEvvqQY4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792764758; x=1824300758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=KqznkMmYbL6qu9UlIb3UJC6Y5I0wTV0+qWfGZcx0rlU=;
  b=aEvvqQY4S4xkfxuYdCu1FggD0ix86Ua3iGW+WiOjElM3bbqVCESpt+7x
   hHlBwisf8ZEwRURuJvllEivE1ynZ8KMae7AukSSfy59m0YtiKskJOot9Z
   mQv3y0cnfILTHxzLJui9ejogE8jN6qUfw1JOtyxLEJvT8FQx0kEyDo1Id
   IKp4NL+LwgAEchBTPm5uZPjRyXo8NGpDbraT3Y0DuSXbGTkI9CKd5xWGx
   1Fw63IL7RGc7zJt4xyj6KWXc4mGt0tY1Uhd49e/RIl3Z8CQwlRBP5SqfA
   X+0LcLcUHFoyd9X73SCb6IqQFA8lEazpkesys4Rx95q+svuYZMIza/3v8
   A==;
X-CSE-ConnectionGUID: 1i3Jky3aQs6KNAZWDv9YUQ==
X-CSE-MsgGUID: 8cpkapaPSHuKUVhwQyN17g==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1399878"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1399878"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 07:12:37 -0700
X-CSE-ConnectionGUID: ZTLF/PFATMOEfFXfHp7sUg==
X-CSE-MsgGUID: ErS4g7JXQcCIbTofzgeKww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="4142845"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.100])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 07:12:35 -0700
Date: Fri, 23 Oct 2026 17:12:32 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: =?utf-8?Q?Rare=C8=99-Mihai?= Vladu <vladurares@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] media: atomisp: queue: remove unused local queue
 support
Message-ID: <attrUN_9ilg9W8ah@ashevche-desk.local>
References: <20261014111213.1967452-1-vladurares@gmail.com>
 <20261014111213.1967452-3-vladurares@gmail.com>
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
In-Reply-To: <20261014111213.1967452-3-vladurares@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 14, 2026 at 11:12:11AM +0000, Rareș-Mihai Vladu wrote:
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


I'm wondering if you use --histogram diff algo when preparing patches.
If not, use it next time.

...

> -int ia_css_queue_uninit(ia_css_queue_t *qhandle)
> +int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)

This change is hard to read. Can you make an intermediate patch to just move
the "remote" branches to the helper functions first and in this patch actually
kill the local case altogether? Try to make it so that the ± statistics is
minimum for the changed lines. It means that create new helpers as they should
appear after this patch alone (just with different names). Example (ideal case):

// AFTER the mentioned intermediate change

static ia_css_queue_enqueue_remote()
{
	...
}

// in old function
static ia_css_queue_enqueue()
{
	if (LOCAL) {
		...
		return ...
	}

	ia_css_queue_enqueue_remote()
}

// In THIS change

-static ia_css_queue_enqueue_remote()
+static ia_css_queue_enqueue()
...
-static ia_css_queue_enqueue()
-{
-...
-}

Repeat the same for all affected functions.

-- 
With Best Regards,
Andy Shevchenko


