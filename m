Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82B71547C0
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 00:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780447724; cv=none; b=I1rc313f8nziAXqlqk+LaaAWPAZoVLSHMjhCjnPYViFG7LPXRZjRfgI33mMJZ7zcwFiQcD42llisV+f1h6TRvEK89Rj7mzF+p5A0jdjUob5bVHVnjrE7T+Ca4ZB2RyrVsNytAUqgylPeCYo1paMKcRM9l7L0ftsiDAiqC3exxO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780447724; c=relaxed/simple;
	bh=HkZqtHh57yBE+5nVpPU8gP3CIXwSEAh6XH2e+vl0fwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZkxC3Gp2o0z7jJFKV/Xg8iZtgaxmIyNNin8kWY5qTnwkhrQ/GYwExgnr1HNiJ//ULGCgk1n7roQw6q0kOpZABrOwsYEPJ+494SjpF9Q/p0iAOfsAbb3gydVkmS6PZoX7Iee9Unr8exbYPf7qH/R6CcYDJB3z9Eq1kahu2Xf8tds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lek0sqEY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lek0sqEY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780447723; x=1811983723;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=HkZqtHh57yBE+5nVpPU8gP3CIXwSEAh6XH2e+vl0fwU=;
  b=Lek0sqEYYdrAY+TU87ZebQieQB651tv7nVwWVpNIh/04IiM+o6r6+oNf
   KKPIUxRHcwfPFx0Bl7P6FSWKkkHpB04I7RZeuT/GkhWHdMQjrvm5VObVY
   o1TaD1+xnsbKxvkdQcQSul8ni3DiQ4pmkC8ZLNLJueRjEFlLfCEgMIz9/
   1EiwJxwVG3Y1CmtjpHGZrPTp6nQl4C/wfuQk3+HqtBVwxLH7xdaDTSvxw
   h/BEgymTDUEV07yVjHw7YDCJHIZJQ3rXk3jzWKxge4Y4OsxxRFVCKNbQp
   b7Q/E49TYaGFo1TlxlfBiBPHNsnOI4EKT4JFtwSvED06qgWhSWWfzKR8N
   w==;
X-CSE-ConnectionGUID: jLWlkLj0Sb2XJO9XvwyMFg==
X-CSE-MsgGUID: 9uCJEPz8SpW1pSQpFIHMFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81242206"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="81242206"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 17:48:43 -0700
X-CSE-ConnectionGUID: t8Ipd8jwTUKa/tEtjaDF9g==
X-CSE-MsgGUID: GiDrLc+IRva7QSXUN7caiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="239610523"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 17:48:40 -0700
Date: Wed, 3 Jun 2026 03:48:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Cc: Minu Jin <s9430939@naver.com>, gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org, abrahamadekunle50@gmail.com,
	zxcv2569763104@gmail.com, milospuric856@gmail.com,
	karanja99erick@gmail.com, weibu@redadmin.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/2] staging: rtl8723bs: Fix error handling in
 _rtw_pktfile_read()
Message-ID: <ah955alcKpjMXYXy@ashevche-desk.local>
References: <20260127153811.1592900-1-s9430939@naver.com>
 <c6828c20-8f77-423e-a744-344d09c54488@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6828c20-8f77-423e-a744-344d09c54488@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, May 24, 2026 at 09:30:01PM +0300, Bitterblue Smith wrote:
> On 27/01/2026 17:38, Minu Jin wrote:
> > This series improves error handling in _rtw_pktfile_read() and cleans up
> > the code style to comply with kernel standards.
> > 
> > 1. The first patch combines the logic change and caller updates.
> >    The function change and the caller updates must be in the same
> >    patch. If they are separated, the code will not work correctly 
> >    or will cause errors at that specific point in the history.
> > 
> > 2. The second patch focuses purely on code style cleanup (changing uint
> >    to unsigned int) as requested by Andy Shevchenko.
> > 
> > Regarding the logic change in _rtw_pktfile_read():
> > 
> >     The original code used a ternary operator to read whatever data was 
> >     available, even if it was less than requested. This could lead to 
> >     callers processing incomplete data without knowing it.
> > 
> >     I have changed this to return -EINVAL when the remaining data is insufficient. 
> >     This is safer because most callers expect the exact amount of data and 
> >     should not proceed with a partial read.
> > 
> > Testing and Verification:
> > 
> >     I do not have access to the physical RTL8723BS hardware. However, I have
> >     performed a rigorous manual audit of the data path and verified the
> >     changes using Smatch static analysis. The analysis confirmed that no
> >     new warnings or logical regressions were introduced in the modified files.
> 
> I have some bad news:
> 
> https://bbs.archlinux.org/viewtopic.php?id=313401

It's unclear that this patch made it happen. See below.

> [quote]
> 
> Hey everyone,
> 
> I recently upgraded my system, and now I’m having a strange issue with my
> WiFi (Realtek RTL8723BS).
> 
> now I can no longer connect to any WiFi networks as a client. however,
> creating an Access Point (AP) still works fine, but whenever I try to connect
> to an existing network, the connection fails.
> 
> dmesg logs:
> Every time I attempt a connection, dmesg gets spammed with this error:
> 
>     [ 1083.925640] rtl8723bs mmc0:0001:1 wlan0: xmit_xmitframes: coalesce failed with error -22
>     [ 1084.921217] rtl8723bs mmc0:0001:1 wlan0: xmit_xmitframes: coalesce failed with error -22
>     [ 1085.921434] rtl8723bs mmc0:0001:1 wlan0: xmit_xmitframes: coalesce failed with error -22
>     [ 1086.922320] rtl8723bs mmc0:0001:1 wlan0: xmit_xmitframes: coalesce failed with error -22
>     ....
> 
> Has anyone encountered this specific "coalesce" error with the rtl8723bs
> driver? I'm looking for advice on whether this is a known bug in recent
> kernels or if there's a specific module parameter I should try to bypass
> this.
> 
> System Info:
> 
>     Chipset: RTL8723BS (SDIO)
> 
>     Kernel version: 7.0.3-zen1-2-zen
> 
> update: I fixed the issue after kernel downgrade
> 
> [/quote]

That guy should bisect and find the culprit. It will help a lot to understand
what's going on.

-- 
With Best Regards,
Andy Shevchenko


