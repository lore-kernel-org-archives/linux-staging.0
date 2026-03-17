Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51023988FF
	for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 08:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773735347; cv=none; b=nAG7W6C+OlX6cFOWIrGgWE0CTajEYdjQkAdZADB3ToCkIlv3DZ/e1VGhGWy835UIPNXujO1ilpO/oqMN9kMB7frT2f9hGIalofVDQIqv7A8OLm/FlfL9bmpwi4fcRL+fD0HjzU16uU7HIVimKa2eORmby2KSZgh8RMuZLoyVToY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773735347; c=relaxed/simple;
	bh=xbilnszM/kTXchWYeiho0AEx9USygSCMz/T1Er2cBco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlsRNBqqY0wNEYvQqQZ+UkdgdpR9Gs+x79wvJ54bSE92zCvhsIw7B3Js+o1gx/iFZphY9wF/W2+4olRaZQbstnZtyDZcBlGZ1ikfyeZfFw+BO7K2Wtij5ytRToxGZDmz5I/+puYAqC5rcvwha3DY+jGORnGolGOiiVXKcjAlJkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z2KJRykM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z2KJRykM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773735344; x=1805271344;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xbilnszM/kTXchWYeiho0AEx9USygSCMz/T1Er2cBco=;
  b=Z2KJRykMnPDWzH2XPmPPIbOiS+GMxhN+sVhAuMORvFXITsF9m8xR1wVt
   Jh/PaVvynkLIWDOCTQuMmwcJ0BXEFNySOE8vNGFIZIxwhDgZkBRlvyk0/
   uDIcS4qQHEReZR/ug9Bcor3qbuTZFfbG+hCUYBPOv4ZtBwaa0V6b8Q/4f
   lA2OwJkwRjs5U4ddnCg9RmugTVsjJqyljxP87Se9+OAwIXnfwUEsHAHnz
   uSdtAcPir1ZtRP9fhc1vb2okYy7FlM21pRheD/+1IWspDnWTvb1PcYscp
   wASCBMawH+rwzgMv9tfVdGMOol5VLEnVPp0T2wb7f6jEbB4oKP9LCOmrR
   A==;
X-CSE-ConnectionGUID: vTG1PRWITySz2fFOmiSKSQ==
X-CSE-MsgGUID: n/Wacbt4R4KglbYwJ/tH1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="86237236"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="86237236"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:15:43 -0700
X-CSE-ConnectionGUID: fB6eW82pTU+KyNFWQqFfDg==
X-CSE-MsgGUID: 3YZiQgcuSju+7Br1rtaV/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="222137718"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.97])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:15:41 -0700
Date: Tue, 17 Mar 2026 10:15:38 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bera =?iso-8859-1?B?Wfx6bPw=?= <b9788213@gmail.com>
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com, Yeking@red54.com,
	hansg@kernel.org, ethantidmore06@gmail.com, weibu@redadmin.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: change custom comparing function
 to strcmp()
Message-ID: <abkNqgwMPnATcHWT@ashevche-desk.local>
References: <20260309184556.846-2-b9788213@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260309184556.846-2-b9788213@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Mar 09, 2026 at 09:45:56PM +0300, Bera Yüzlü wrote:
> eqNByte() function is a redundant reimplementation of strcmp().
> Remove eqNByte() and switch its usages to strcmp().
> No functional change.

...

> +	if (strcmp(Regulation, "FCC") == 0)
>  		regulation = 0;
> +	else if (strcmp(Regulation, "MKK") == 0)
>  		regulation = 1;
> +	else if (strcmp(Regulation, "ETSI") == 0)
>  		regulation = 2;
> +	else if (strcmp(Regulation, "WW13") == 0)
>  		regulation = 3;

Now you can move it towards match_string().

static const char * const regulations[] = { "FCC", "MKK", "ETSI", "WW13" };

	regulation = match_string(regulations, ARRAY_SIZE(regulations), Regulation);
	if (regulation < 0)
		...ai-ai-ai...

and so on for the rest.

-- 
With Best Regards,
Andy Shevchenko


