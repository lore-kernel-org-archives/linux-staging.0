Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBEB37188B
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 08:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773995243; cv=none; b=VVhzwBWRpZmzjNgg3S2SlHQNrGQ0N9tH0v0138aOPMwZK1ounzbEvzWf/mDwkUDfCrSUz8qfIDnVV7JxyQ216ndNpMEyjMpreqdvr/suCznB+hZGGd41zbM9H80jRndsNpkCPl8+CFmuVabzycEyWDt9wtimT65kVeeClbHD3n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773995243; c=relaxed/simple;
	bh=w3F1qeEqgxJLVc+xG5IdxxcBZl0QkDm9+aTGHqDIjIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=olcSNaJApSQwXzAhhRvGxsthEYiMoGHcTOFwxiW00bnnLDaTBvR57XBP8ltIni7fYVf695/tXwbBqTomEic8uxAUFVkRDopCeUcasR6tdbcxRr/FyHspJSb/8uYIRS+dZ8HBoz0AZw1UvOInSkl5dJri8+r0S2I3+xRfyRsx38Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OPxwsnLn; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OPxwsnLn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773995243; x=1805531243;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=w3F1qeEqgxJLVc+xG5IdxxcBZl0QkDm9+aTGHqDIjIQ=;
  b=OPxwsnLnJ1o4qApJVH6Cbx+RptKt+Df8UT2dynIo4A26AfmsdvHm5UDP
   /MxZeymjvpX/WEbEr3iY6vHUoBbw0YIyI15oyONX5ZwZjkMoDGJaQQROH
   f7nV0altd0JtmtBZMHF7QFiHL9btewdoX/Mf6xBCh8zeUE5B+22eb8vYO
   49MOlH1JQ2LOyBVN4n8vQy9S1Z+wBS6aG7v2IHIgwpoKsJaHuoqJ5TYtp
   VeySa32uKhgjhMO8xMPaUVTIwrzvUf4qIhfUhwILjDtcUNp+vvvRpyjI/
   2CtdsDQx6pkjEZzcNcyJiP59AEabRTNq/z7Ju0aTzDrZCRHD073GbIIqT
   Q==;
X-CSE-ConnectionGUID: GrjXwOarSNa7v53j9iOFFQ==
X-CSE-MsgGUID: +OKCuvzuS5eJGKmeMU8b5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="92651278"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="92651278"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 01:27:22 -0700
X-CSE-ConnectionGUID: utfYxWwURuSlzzC/m6EOZA==
X-CSE-MsgGUID: k1sIR+FtTvGxYC0ouHx1pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="222449465"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.40])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 01:27:20 -0700
Date: Fri, 20 Mar 2026 10:27:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bera =?iso-8859-1?B?Wfx6bPw=?= <b9788213@gmail.com>
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com,
	ethantidmore06@gmail.com, hansg@kernel.org, Yeking@red54.com,
	rayfraytech@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove copy function
Message-ID: <ab0E5Sp1rGCPrs-E@ashevche-desk.local>
References: <20260320071830.28713-2-b9788213@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260320071830.28713-2-b9788213@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Mar 20, 2026 at 10:18:31AM +0300, Bera Yüzlü wrote:
> GetU1ByteIntegerFromStringInDecimal() is a copy of kstrtou8().
> Remove its usages to kstrtou8() and check the return value.

...

> void PHY_SetTxPowerLimit( ... )
>  {
>  	struct hal_com_data	*pHalData = GET_HAL_DATA(Adapter);
> -	u8 regulation = 0, bandwidth = 0, rateSection = 0, channel;
> -	s8 powerLimit = 0, prevPowerLimit, channelIndex;
> +	u8 regulation = 0, bandwidth = 0, rateSection = 0, channel, powerLimit;
> +	s8 prevPowerLimit, channelIndex;
> +	int ret;
>  
> -	GetU1ByteIntegerFromStringInDecimal((s8 *)Channel, &channel);
> -	GetU1ByteIntegerFromStringInDecimal((s8 *)PowerLimit, &powerLimit);
> +	ret = kstrtou8((const char *)Channel, 10, &channel);
> +	if (ret)
> +		return;
> +
> +	ret = kstrtou8((const char *)PowerLimit, 10, &powerLimit);
> +	if (ret)
> +		return;

This will change behaviour on the invalid data. Before it was just partially
converted here and continue, now it breaks an execution. The commit message
does not explain if it's safe to do or not (i.o.w. if there is a guarantee
that in current state the input will be always in the correct form).

Otherwise, you probably want to use one of simple_strtou*().

>  	powerLimit = powerLimit > MAX_POWER_INDEX ? MAX_POWER_INDEX : powerLimit;

-- 
With Best Regards,
Andy Shevchenko


