Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793121987;
	b=RHkTv8H3x1FFzW3D695X4+K6TTuAJRydyhrxZ5dojFMu1Wo9e3MGuN/Fgw+5cNNvUNNR
	 TbI7T1WCx8K4NChDb29962S2FC257zPeuRJKhT6DiiGuvKYRRdKD7Yuq0nbY8nbuS2gBd
	 wCfXQhxNOTb0IJSWSbmn8ICSyyZXTMmqpOaG1BhorZqsJCkjgB8Wkox7nNVjj4aCbQwKC
	 1qEn+NmYvPnG9zHEOWt/fkQHirlq9EAL/ebSlR9d9tJpxLB33vQSTlF5aERUcm7DzRiAX
	 OeUuix7vwm5LVuoUbVtAtMV6mob/uvPjaGZ+uNvIyrJW2nDZXpIU+2RPQuk+SHiziOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793121987;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=VnUYDOsMXf4pJLOf13L3AnAE5vL5VsLeCMCBl/d4u2o=;
	b=uGUFYFQKQepSV7p2N+a7rAjo8iqDNIYMZ6oqbBl/9zDP3PfC5dqN79nKzHZ0bP9I9+aK
	 axdOwA5YGFPitUDUwnll6g3vVcMZTQwz1F7hDP63/GbpVrkKFbg5MK0OJhODl441sb7vu
	 CJCkYhryAuIiDDnuHGU/40PZnzP+BHvR8zrgefUplNTb2O5bz4827ko5/scmgYhU7bGIr
	 wIe4eWG+eLdPbIJHxroMMNrhitLoJJn9Kkv2PDVxlqmMXbCSjCo19GuymtszCLHNBkcGu
	 yYkjhb/JgGC54ZQBBGFBsJHPpf0je27m+kejZ9fjBb9Zl8Q8Sowc+oNDlRw/3B2Jamg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d6lF9NHX;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F532606A31A
	for <linux-staging@lists.linux.dev>; Tue, 27 Oct 2026 17:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F532606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d6lF9NHX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793121986; x=1824657986;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=TW1TXakyl8lV05rxtEra6EM04XKiaOHLbID/+oD0Dgs=;
  b=d6lF9NHXDp65bE/9hSeCgjIhIXOEB6J3zVWCSoM4Qq5LOOFfTUPKji5X
   /ne2I6Cxt9P6doVh1gN4RzxTkgVhjVnWeqgrry7t+HhcViFJVcrr+GRCY
   aAGvlGdNC+TXJQgFWum8SRTIKCwRi5BscQnmeLSd1np4ZX6VrI6w1x+hO
   Rv2snz9yylKjtwQ+fS36uc6vSen2CYqkdu/HJZy4ytrxRPm0dLFw324bo
   ZbaAScc8yPUwSfkv7xzDa2QmNTBQaBTuC+5/l5QK1stR6/uGV+RLhaik1
   RsqE+uFIWSx/z6KLufrwsy6n5QLWEsp/41EHINcpm9FP+D7L4ori0YDgA
   A==;
X-CSE-ConnectionGUID: 8sqy9geRQWCRK6/3aTThCw==
X-CSE-MsgGUID: kwiN7CjlTrahzMqqX/+J3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1816493"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1816493"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 10:26:25 -0700
X-CSE-ConnectionGUID: NDcdK9R9QyqueNVuHWVVkQ==
X-CSE-MsgGUID: qKOSaz9KQM6YTIPs2vTUlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6471129"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.196])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 10:26:22 -0700
Date: Tue, 27 Oct 2026 19:26:20 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: =?utf-8?Q?Rare=C8=99-Mihai?= Vladu <vladurares@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] media: atomisp: queue: move remote queue handling
 into helpers
Message-ID: <auDevM3eddfKEzPb@ashevche-desk.local>
References: <20261027120341.2305533-1-vladurares@gmail.com>
 <20261027120341.2305533-3-vladurares@gmail.com>
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
In-Reply-To: <20261027120341.2305533-3-vladurares@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 27, 2026 at 12:03:37PM +0000, Rareș-Mihai Vladu wrote:
> Move the remote queue branch of every queue operation into its own
> static helper, written the way the function is meant to look once the
> unused local queue support is gone, and call it from the existing
> function after the local branch.
> 
> This prepares for removing the local queue support in the next patch
> and keeps that change easy to review. No functional change intended.

...

> +static int ia_css_queue_dequeue_remote(ia_css_queue_t *qhandle, uint32_t *item)
> +{
> +	ia_css_circbuf_desc_t cb_desc;
> +	ia_css_circbuf_elem_t cb_elem;
> +	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
> +	int error;

> +	if (!qhandle || NULL == item)

While at it, do some small improvements on the moved lines, like

	if (!qhandle || !item)

> +		return -EINVAL;

> +	/* a. Load the queue from remote */
> +	QUEUE_CB_DESC_INIT(&cb_desc);
> +
> +	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
> +	if (error != 0)

Drop all these ' != 0' parts where it appropriate.

> +		return error;
> +
> +	/* b. Operate on the queue */
> +	if (ia_css_circbuf_desc_is_empty(&cb_desc))
> +		return -ENODATA;
> +
> +	error = ia_css_queue_item_load(qhandle, cb_desc.start, &cb_elem);
> +	if (error != 0)
> +		return error;
> +
> +	*item = cb_elem.val;
> +
> +	cb_desc.start = (cb_desc.start + 1) % cb_desc.size;
> +
> +	/* c. Store the queue object */
> +	/* Set only fields requiring update with
> +	 * valid value. Avoids unnecessary calls
> +	 * to load/store functions
> +	 */
> +	ignore_desc_flags = QUEUE_IGNORE_SIZE_END_STEP_FLAGS;

> +	error = ia_css_queue_store(qhandle, &cb_desc, ignore_desc_flags);
> +	if (error != 0)
> +		return error;
> +
>  	return 0;

So it's simply

	return ia_css_queue_store(qhandle, &cb_desc, ignore_desc_flags);

>  }

...

> +static int ia_css_queue_is_full_remote(ia_css_queue_t *qhandle, bool *is_full)
> +{
> +	ia_css_circbuf_desc_t cb_desc;
> +	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
> +	int error;
> +
> +	if ((!qhandle) || (!is_full))

Drop useless parentheses.

> +		return -EINVAL;
> +
> +	/* a. Load the queue from remote */
> +	QUEUE_CB_DESC_INIT(&cb_desc);
> +	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
> +	if (error != 0)
> +		return error;
> +
> +	/* b. Operate on the queue */
> +	*is_full = ia_css_circbuf_desc_is_full(&cb_desc);
> +
>  	return 0;
>  }

...and so on...

With all above being addressed in the whole patch feel free to add
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

...

>  	if ((!qhandle) || (!is_full))
>  		return -EINVAL;

(But no need to touch the lines that are going to be removed!)

-- 
With Best Regards,
Andy Shevchenko


