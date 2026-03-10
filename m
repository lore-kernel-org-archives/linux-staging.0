Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6413C3C07A
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 11:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773143000; cv=none; b=dQNbvOOSw/93OfVfbq2t4e9bDo8jsvRvw3BH3DRbHSRdpFg36HBD5Ky7Da3c4OdlINEkViuVlK8yfxjG8xAu738ZLy9eVLWLEmTsyyc3TFX+NliQ79YmDbh2xPTHud5eMaOkoZy+07Gx9d9wi428a8dTbiNbB8vVXreGO8GOkiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773143000; c=relaxed/simple;
	bh=mqbkG/edCyp0Mk2DsLFE06P3hc0McCqa8DLzWHkPv4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IjZ4eUIQyQLiLsXW+f03OkEatytQ9BgCjVQUmCqCl7rf0QJzQoQQhVKWs7J84pcPvUtLEXpLFUcEWMqNuhiWSwXR71SOcsOD6TAdUNS5HQfY9ZsowAUpl0wammW4Pif0TTCdb/89P4yeQ9R9XBbgy8kWyhN08NTBY9m7e6JWuUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ypu8snO8; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ypu8snO8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773142998; x=1804678998;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mqbkG/edCyp0Mk2DsLFE06P3hc0McCqa8DLzWHkPv4I=;
  b=Ypu8snO8bQVBaDv22gMix0YbUscJJ69FZ4qWE9Jfrc/70pIRjY6sR1ar
   zOhAXAjRyMUidWpCY6nm6NgeprhVXcM3UQq+YG3vMj9hqvhDPv6pK+Ytu
   npb8t9Hwttg6Lp94gpxw1PqV1G3Wxz/mdb7NOdf0EMDA69Ld+t/9Tlc3y
   sevr3vw6rn2Df2h87wNZuDnO0qSXVbhdFiDBkG3vqNTG11uVbgsbz+Lj0
   9yIjDjDjz82Sbc8zuYKNSBCiAT+bsu3EGm18JC7nsKAuVGILZ+7/Q0IL8
   gWaDl2yyRS/l3N7HDzbXqz85vtoB7mSqGReG+2P9ruB4mYI3QEEOH06VS
   g==;
X-CSE-ConnectionGUID: iowjnCIcQzOU+oQo/k6kVg==
X-CSE-MsgGUID: TNBpACeGRXiJ/kGMITo8kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="73381607"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="73381607"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 04:43:18 -0700
X-CSE-ConnectionGUID: tGXQp/o+TxiIABjTVNio/Q==
X-CSE-MsgGUID: X5knLD3qRXmaciQpLoEcew==
X-ExtLoop1: 1
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 04:43:15 -0700
Date: Tue, 10 Mar 2026 13:43:13 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: atomisp: fix block comment style in refcount.c
Message-ID: <abAD0ZvWiTUDizs8@ashevche-desk.local>
References: <20260309215516.6091-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309215516.6091-1-rayfraytech@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Mar 09, 2026 at 10:55:16PM +0100, Oskar Ray-Frayssinet wrote:
> Fix block comment formatting to comply with kernel coding style:
> - Add leading '*' on continuation lines
> - Move trailing '*/' to a separate line
> - Remove unnecessary braces around single statement block

Are they the only ones to fix in the entire driver?

...

>  /* TODO: enable for other memory aswell
> -	 now only for ia_css_ptr */
> + * now only for ia_css_ptr
> + */

/*
 * Please, fix them in a better
 * way as depicted by this comment.
 */

...

>  			/*	ia_css_debug_dtrace(IA_CSS_DBG_TRACE,
> -				"ia_css_refcount_uninit: freeing (%x)\n",
> -				entry->data);*/
> +			 *	"ia_css_refcount_uninit: freeing (%x)\n",
> +			 *	entry->data);
> +			 */

No, instead use #if 0 ... #endif. Or even better if you find any existing
compile-time definition for that (instead of 0).

...

>  				/* ia_css_debug_dtrace(IA_CSS_DBEUG_TRACE,
> -				   "ia_css_refcount_decrement: freeing\n");*/
> +				 * "ia_css_refcount_decrement: freeing\n");
> +				 */

Ditto.

...

> -			if (entry->count != 0) {
> +			if (entry->count != 0)
>  				IA_CSS_WARNING("Ref count for entry %x is not zero!", entry->id);
> -			}

Make this to be a separate patch, and find more occurrences of a such.

-- 
With Best Regards,
Andy Shevchenko


