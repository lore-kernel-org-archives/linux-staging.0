Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15293E5ECA
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 11:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776167924; cv=none; b=HfRsjczqJOqSEnypHp2kwQcvt0P4eAms1Okpy+py/ARCYJCh9R+pvpMqjA/klWE287eNFwn1dMFxXHAe3JT+5WB3xLObu9WYE4RfEJoACr78U1M/zcYfeHqX/F/KQBeDigDziwIGE+w7uVyCyyOG1A3zmXZqC2a5gFnzIRD/zHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776167924; c=relaxed/simple;
	bh=n1H+DUz3BEl/N750a9ZBcRW0Vr6KXZaNbzAegGkW5mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BhEAK4kypadc3yn+rtPsHubs7FTYq5hRus1p+yHeu49AoEMFb6jOQ4p0/iep6+GIA5OXD91c5mU1JIf4cgEatag6PfzI4x/wuG0dxFaELPuoWWktB9W2LjatAtGlmdPtAjTTmSD6De80ORiS7r55NejojyRcXmiM1sydTqxolyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fw/wpnr2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fw/wpnr2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776167923; x=1807703923;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n1H+DUz3BEl/N750a9ZBcRW0Vr6KXZaNbzAegGkW5mc=;
  b=Fw/wpnr2JHkxOTunyUh8zwllfQ9wxMXViuE3wlwxQrLMbdRkUdzDS16z
   I9uNfQcaZW/TeboXGwSia5eFVgCCp8oscxp4MRVOmDjH4olJg7XyCuoO3
   ICIisM2CQp6Za82pPvm7sdfWCr+KLGGy+aJOzpjV5OZ94Iqtq46+k0vJ3
   oB/nI+OwnRtnaGU89lmh5i3MZbE4ArhuT1VZ9l8ObLY8lYXM3DCXbgV47
   IscgZpixtuoc3W1jVyjwadY9oe1gksMdeVOC3VIi9ZMg6W6BLzXMrt4s8
   +w5XzfqYN3zEoEuP7ZDTqFZEAOQEQoX0H4SMR4h26XgjOAAAkZdjyCbQz
   w==;
X-CSE-ConnectionGUID: AeZFANo6TXqgZx4pIOCD1g==
X-CSE-MsgGUID: n7gSjGiTStu92SdjYhlB1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="102578946"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="102578946"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 04:58:42 -0700
X-CSE-ConnectionGUID: OSq+kV9gQ3C1jJkmrn7S7Q==
X-CSE-MsgGUID: mVnRRQzeRvmWbGEe5h0eMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="234477872"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 04:58:40 -0700
Date: Tue, 14 Apr 2026 14:58:38 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marc Finkelbaum <regpacy@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/9] staging: rtl8723bs: add spaces around binary
 operators
Message-ID: <ad4r7mx7AInFVm_x@ashevche-desk.local>
References: <20260414095833.76480-1-regpacy@gmail.com>
 <20260414095833.76480-5-regpacy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414095833.76480-5-regpacy@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Apr 14, 2026 at 12:58:28PM +0300, Marc Finkelbaum wrote:
> Add missing spaces around |, &, +, /, and % operators in bitfield OR
> expressions (SCR_* flags, BIT* masks), array index arithmetic in
> HalSetBrateCfg and rtw_bb_rf_gain_offset, and the register offset
> arithmetic in rtw_hal_check_rxfifo_full.
> 
> No functional change.

...

>  		for (i = 0; i < limit; i++) {
> -			if (psta->htpriv.ht_cap.mcs.rx_mask[i/8] & BIT(i%8))
> -				tx_ra_bitmap |= BIT(i+12);
> +			if (psta->htpriv.ht_cap.mcs.rx_mask[i / 8] & BIT(i % 8))
> +				tx_ra_bitmap |= BIT(i + 12);
>  		}


Looking at this, ideally rx_mask should be unsigned long type (or
DEFINE_BITMAP() if longer than 32-bit) and this loop either using
bitops or something like bitmap_copy(), bitmap_scatter().

It's a side note, in case you want to create a real patch, and not like
this "whitespace cleanup series".

...

> -		rtw_write16(adapter, REG_SECCFG, reg_scr|SCR_CHK_KEYID|SCR_RxDecEnable|SCR_TxEncEnable);
> +		rtw_write16(adapter, REG_SECCFG, reg_scr | SCR_CHK_KEYID | SCR_RxDecEnable | SCR_TxEncEnable);

This is way too long line, wrap it.

		rtw_write16(adapter, REG_SECCFG,
			    reg_scr | SCR_CHK_KEYID | SCR_RxDecEnable | SCR_TxEncEnable);

...

> +	rtw_write8(adapter, REG_RXERR_RPT + 3, rtw_read8(adapter, REG_RXERR_RPT + 3) | 0xf0);

This kind of operations are better when you introduce a helper rtw_update8(). With it it will be

	rtw_update8(adapter, REG_RXERR_RPT + 3, <mask>, 0xf0);

-- 
With Best Regards,
Andy Shevchenko


