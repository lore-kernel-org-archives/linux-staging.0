Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB03533065D
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 21:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769637110; cv=none; b=XEK/nbVJ4AcnTyk34dSoz3DgdP5pSVKufmrLAm6InFoKikfK5r1WonRXAsejfycFqpEjZVqqolIi/u7v7BnOJT2sySYTMjt32ft9zzsqu+D9eOE6pgvvC6e3gTg6ugqONAFa6eVeFHe9YNebD9DZSyB5y1eYOEc+aXVu46p3OkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769637110; c=relaxed/simple;
	bh=Jqw6lQOtAPqgqnXXbMkmosqpgXOY2HCuGhS2TuHm5go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f20qSNCbYfmiDiHL7ocIm1/weE8heL7orSUf7edxfSoTQP2O0IJrEOF9tQD89SYYQPBNsm42duv/wBgUki65nZ0/Y21tOXR0Ntis6Iu0co0zyFWB/H1HJN+SaoilYwJ5XwfWgLkRGfc1iDGnjhoBmj51UiSR+HfYskt68rkW7gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X+S+apAX; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+S+apAX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769637109; x=1801173109;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jqw6lQOtAPqgqnXXbMkmosqpgXOY2HCuGhS2TuHm5go=;
  b=X+S+apAXn2O65iecZOoaCQUuRelKQvJXyTUnqZKNH/0p6M2hY3Y9QIqL
   J/nrQcgIKQJqH9CZaFXmaICcFc0aRQ89VCj4PkUHcoiTmniGDKekqT6fi
   hGtUSJ84TGUQNinEgMEyfrT2YFkV0V4Cpfrvnf9qz7RfQh6e72f2ykh2q
   6Z60eIp7HAVQbuzaZxTnQTXfOoyXOwL2cx4zvoYru7w91m6r11EStPklH
   i+Z0XoqKHpOqtIYG/GCrnB0+QmWoz5en35B+TXfHbKWD57agkhWzVAPUk
   pXPBAoYjMK8Nn3g9gdwkqziaS21JFpodU0/roPaYX0FWIO06YwZMLZR6l
   g==;
X-CSE-ConnectionGUID: 1lEUsgHWTrWOWSS30xT91Q==
X-CSE-MsgGUID: Kzw6sw1vRDSoX6xcza/HoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70061303"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70061303"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 13:51:48 -0800
X-CSE-ConnectionGUID: Urk+2e2rTy6o+9bkSDGDeQ==
X-CSE-MsgGUID: R68HzW9wTIKehgN9WcDu2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208473412"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.57])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 13:51:45 -0800
Date: Wed, 28 Jan 2026 23:51:43 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Minu Jin <s9430939@naver.com>
Cc: gregkh@linuxfoundation.org, hansg@kernel.org, dan.carpenter@linaro.org,
	trohan2000@gmail.com, andy@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	straube.linux@gmail.com
Subject: Re: [PATCH v3 1/4] staging: rtl8723bs: replace _rtw_malloc with
 kmalloc
Message-ID: <aXqE76ZJO5RCSyJu@smile.fi.intel.com>
References: <20260128140954.1065382-1-s9430939@naver.com>
 <20260128140954.1065382-2-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128140954.1065382-2-s9430939@naver.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jan 28, 2026 at 11:09:51PM +0900, Minu Jin wrote:
> Remove wrapper function _rtw_malloc and macro rtw_malloc.
> Replace all rtw_malloc with kmalloc.
> 
> All call sites are reviewed to select GFP_KERNEL or GFP_ATOMIC.
> 
> 1. GFP_KERNEL:
>    Used in paths that are executed in process context and are allowed to sleep.
> 
>    - Driver initialization and probe paths.
>    - Workqueue callbacks and cfg80211 configuration callbacks.
> 
> 2. GFP_ATOMIC:
>     Used in paths that must not sleep because they operate in atomic contexts.
> 
>    - Interrupt handlers and SoftIRQ contexts.
>    - Functions called while holding spinlocks.
>    - Low-level I/O operations (SDIO) (eg, sdio_read32())

...

> static void update_BCNTIM(struct adapter *padapter)

>  	if (remainder_ielen > 0) {
> -		pbackup_remainder_ie = rtw_malloc(remainder_ielen);
> +		pbackup_remainder_ie = kmalloc(remainder_ielen, GFP_ATOMIC);
>  		if (pbackup_remainder_ie && premainder_ie)
>  			memcpy(pbackup_remainder_ie, premainder_ie, remainder_ielen);

I haven't read the code in full, but why not

		if (premainder_ie)
			pbackup_remainder_ie = kmemdup(rpremainder_ie, emainder_ielen, GFP_ATOMIC);
		else
			pbackup_remainder_ie = kmalloc(remainder_ielen, GFP_ATOMIC);

>  	}

...

> static void update_bcn_wps_ie(struct adapter *padapter)

>  	if (remainder_ielen > 0) {
> -		pbackup_remainder_ie = rtw_malloc(remainder_ielen);
> +		pbackup_remainder_ie = kmalloc(remainder_ielen, GFP_ATOMIC);
>  		if (pbackup_remainder_ie)
>  			memcpy(pbackup_remainder_ie, premainder_ie, remainder_ielen);

This is simply kmemdup().

>  	}

...

Also check other places if they are copying existing data.

-- 
With Best Regards,
Andy Shevchenko


