Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA00337BB5
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 19:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774034796; cv=none; b=eNcvm4/NInavOpr06H929b1BNjMhzNBiu9Rdmxxsx53JSISnHJa+IZf6Jh1Vgqpmu49i+p37doo11XbQrAZtzfT/lEdAWi1q/te/P7ORQaVBu5WdjTOYRWFhTsaHDUP5OnG0xZn+zNkJE9LWCYjJwguk2f4aZqZZf1QiFvcZGwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774034796; c=relaxed/simple;
	bh=HLtsWcDnDFHyIAKtCDD2Mt9bkVqle7cRgYZZpJTXARc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jiSuMhHaHkacS+reY6B3OtOZw80e3Zldmyr6q4Ydp20hfO+daRG1sJ/Y/7/oMoIyAUBm0a6seRMTV+kw+UBzT0Wh23uZo6JzOb1qLzvaEniZyOiB6msv9Z51znoeHxeECgWKXyL2Q8acYVo6ftgpjqdWMuME1PIl3GiukCxXwtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cLnEJz3M; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cLnEJz3M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774034796; x=1805570796;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=HLtsWcDnDFHyIAKtCDD2Mt9bkVqle7cRgYZZpJTXARc=;
  b=cLnEJz3M2l0kXmQdvVMjaHLP97U0BTh6PI30mKbMoJlbgpj/ZwAzWB4H
   0jAAWck9y+dao2WBmZq5Dk7DAt1oJ+QgJt9xXRf7LtQMJIParIotxMLQ8
   W4F/7eRHV4rsXOdVLz/2yHjwDZgUdaBzWkVOtEhH/d6+F5GOT7aF8rsJN
   iPllVK5Jc9nIPL2QiIjBVKLCLcUxdB+L4vtMsV+BTnZH05192gF0FTGk0
   ORzeUMs1dukfvZOBfi0w2asQAUqDX6jmFks81wMpHFDJVOW/eCZyQ/YvG
   BzmHSZ7AvGlIAocJGA/+R0mgs/sPeqSzXMzpWtZqtSsOf93NXGyFg9yZE
   g==;
X-CSE-ConnectionGUID: LpYnFJ2wSZKzE5q275/WUQ==
X-CSE-MsgGUID: UTmoXNwZRkW+rxXI2fcAwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="77735903"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="77735903"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 12:26:34 -0700
X-CSE-ConnectionGUID: GZlP9vM5SRqCiNMglHe+nw==
X-CSE-MsgGUID: bgWgqTTITqem8bGajgdXkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="223362866"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.40])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 12:26:32 -0700
Date: Fri, 20 Mar 2026 21:26:29 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bera =?iso-8859-1?B?Wfx6bPw=?= <b9788213@gmail.com>
Cc: Yeking@red54.com, ethantidmore06@gmail.com, gregkh@linuxfoundation.org,
	hansg@kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, rayfraytech@gmail.com,
	straube.linux@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: remove copy function
Message-ID: <ab2fZaBu_5EJieMq@ashevche-desk.local>
References: <20260320182437.13948-2-b9788213@gmail.com>
 <20260320192015.30665-2-b9788213@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260320192015.30665-2-b9788213@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Mar 20, 2026 at 10:19:59PM +0300, Bera Yüzlü wrote:
> On Fri, 20 Mar 2026 11:25:08 -0700, Bera Yüzlü wrote:
> > On Fri, 20 Mar 2026 08:27:22 +0000, Andy Shevchenko wrote:

...

> > > > -	GetU1ByteIntegerFromStringInDecimal((s8 *)Channel, &channel);
> > > > -	GetU1ByteIntegerFromStringInDecimal((s8 *)PowerLimit, &powerLimit);
> > > > +	ret = kstrtou8((const char *)Channel, 10, &channel);
> > > > +	if (ret)
> > > > +		return;
> > > > +
> > > > +	ret = kstrtou8((const char *)PowerLimit, 10, &powerLimit);
> > > > +	if (ret)
> > > > +		return;
> > > 
> > > This will change behaviour on the invalid data. Before it was just partially
> > > converted here and continue, now it breaks an execution. The commit message
> > > does not explain if it's safe to do or not (i.o.w. if there is a guarantee
> > > that in current state the input will be always in the correct form).
> >
> > > Otherwise, you probably want to use one of simple_strtou*().
> >
> > It only indirectly called from ODM_ReadAndConfig_MP_8723B_TXPWR_LMT() with constant values.
> > Maybe we can convert this strings to ints so we don't need to do it at runtime.
> > We can also remove the wrapper odm_ConfigBB_TXPWR_LMT_8723B(). This should be a seperate
> > patch, right?
> 
> Just noticed ODM_ReadAndConfig_MP_8723B_TXPWR_LMT() didn't called anywhere.
> I will remove:
> GetU1ByteIntegerFromStringInDecimal()
> PHY_SetTxPowerLimit()
> odm_ConfigBB_TXPWR_LMT_8723B()
> ODM_ReadAndConfig_MP_8723B_TXPWR_LMT()
> in v2. They are all unusued.

Sounds good to me.

-- 
With Best Regards,
Andy Shevchenko


