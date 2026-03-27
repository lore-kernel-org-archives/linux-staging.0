Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1182368952
	for <linux-staging@lists.linux.dev>; Fri, 27 Mar 2026 11:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774609869; cv=none; b=AUT2GbqtOnCGzC0i0BOp9n7PYI9zAxgCnxwL7wC4Ob9vV7AwXCDCpDUvyJu2F9btvA13/FlZUYqQvgS53QVi/XEesoDFQkT0T+q9jgC5MKrAgPBpF1BJTBGJSgEdiSNsHmRaTfXwp14FwiT2qlmH1Tc+da136e5F2QEmMISpYUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774609869; c=relaxed/simple;
	bh=KWTxbWtHXsjI+mpUK5s7SUAbfDdT7EgWH8G6b4L95CA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IBLP834v2OKFdEsGiYXFobz6228egf7HL30nV2HGTj1k+Gem6b90/3Q73z8jNglKqPlgal9zTcm6qZ8cOTmgcz/Pq9UOZgGaHJYr/VUAzMP7vI6+2EqMyomw5QQ/O23KyndQx7NiIIWeSyUywJyUNUWvJlJmlryfKFuo04jFhF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iTD5u6V2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iTD5u6V2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774609862; x=1806145862;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KWTxbWtHXsjI+mpUK5s7SUAbfDdT7EgWH8G6b4L95CA=;
  b=iTD5u6V2mELMiQcE+MGv+rgyC0zqhOa6nC8zqF7aHZHTSC0J9l6jPDld
   rsp5bdHSgxy53/w33s8D8YpjkzhJLLG0zftWg1CQnUZtXtBD4Gr+dviML
   iRl/o1HoPYkk/U/BfujVmVh+6Lw+ROwcQDLlwi9FFZkSnVTRFY2L2V5rc
   orBDEx0D4evdQjJsM6XLYe0e2cA7k3zJuI/0ksuPq3NpvHkm4AGeCYGlS
   Bsz7yuIs6AyoDhVoTzRUPt+KAOTrBZO0q4L84Wtn3qE3cflubpIF6kIoL
   ajKUXLHZELQZXbRciMOeG39eTocEzgFUKG8x9JqtB3uvr7SUWyQ5yMI63
   A==;
X-CSE-ConnectionGUID: AwZnoZ4CSrSavtNDzO2pSA==
X-CSE-MsgGUID: SFRtbVVtSd2YUQSkffp/uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75746793"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="75746793"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 04:11:01 -0700
X-CSE-ConnectionGUID: 0PUrURj5T4e0KoJal+Tmpg==
X-CSE-MsgGUID: MfH00wg2SheleZ0qmdwWdQ==
X-ExtLoop1: 1
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.127])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 04:10:58 -0700
Date: Fri, 27 Mar 2026 13:10:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chethan C <mail.chethanc@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Osama Albahrani <osalbahr@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] staging: media: av7110: fix coding style
Message-ID: <acZlwLpm9oMODXjc@ashevche-desk.local>
References: <20260324184259.694280-1-mail.chethanc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324184259.694280-1-mail.chethanc@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Mar 25, 2026 at 12:12:44AM +0530, Chethan C wrote:
> Fix indentation and alignment issues reported by checkpatch.pl.
> 
> Rename enums av7110_rec_play_state, av7110_type_rec_play_format,
> and av7110_encoder_command to follow kernel naming style.
> 
> Rename wssData and wssMode to wss_data and wss_mode to avoid
> camelCase identifiers.

TL;DR: one hunk should be not touched (see below).
Otherwise LGTM.

...

> @@ -551,7 +573,7 @@ static ssize_t dvb_aplay(struct av7110 *av7110, const char __user *buf,
>  			if (nonblock)
>  				return count - todo;
>  			if (wait_event_interruptible(av7110->aout.queue,
> -						     (dvb_ringbuffer_free(&av7110->aout) >= 20 * 1024)))
> +			(dvb_ringbuffer_free(&av7110->aout) >= 20 * 1024)))

This change is wrong.

Also one may consider to replace 20*1024 with proper HZ-dependent value.
(But the latter one should be done separately.)

>  				return count - todo;
>  		}

...

> -		av7110->wssData = ((d.data[1] << 8) & 0x3f00) | d.data[0];
> +		av7110->wss_data = ((d.data[1] << 8) & 0x3f00) | d.data[0];

Another side note: This kind of changes can be properly converted to use
get_unaligned_le16() & GENMASK(). But it's another story.

-- 
With Best Regards,
Andy Shevchenko


