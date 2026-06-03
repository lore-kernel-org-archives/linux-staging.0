Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B487D33DEC2
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 14:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495570; cv=none; b=Vt3k7RnatV2ENVj0FSkKne/9t6MhuYcKNSuDAc85+Nxxm6vUhPN34F8QmxvEmViGSwSuMgdDiqceY2N5/wbanjsZ4j0w96xRF9vrLzEQMOejbfwFzjfayiqaGvq3tlhnVf0/ibBsZtgX1mMVseJyPaixS7P8/rjekCfFPXXcKy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495570; c=relaxed/simple;
	bh=v0vFwGiNntFWVi+lyEqrFllWgdeiP6z9Ek0SuP/Dy1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+/ItV7DaIjVLuOQfvVfiuAhrj9uKMKWTpvVZl4ifuzRJqlX4Ui2QBkVG1AMO7sgbxqO4tFxvkHJAFcKsBh0k3/JkVqHri+YHuuShIUvRbvXD2JSYJ+467D/Ln/GyYqbjZK1GYtm2CacOabJ48hBIUHVJBKTqMkYFWU5YYJQwQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K6MLL6C/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K6MLL6C/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780495569; x=1812031569;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=v0vFwGiNntFWVi+lyEqrFllWgdeiP6z9Ek0SuP/Dy1I=;
  b=K6MLL6C/dkAmcp8fUOsbCXPK0y/DWpWBysqdxm/Zz6bObx8yYGxHKLvr
   hhFzGgSFnayOaExrblF5lvyQZRjSGCGKVxRjsIYOI/MCc5tm3lj3l0cbC
   +CTX1sskEkhQVmJGPnYc/oEHT19iaEEaewW2dDMWMG3M+8uKaDXbuVZW6
   eJxWZkHUGVG6Caphv6qGqjC8Pf8HE0UfYUdxTgM2lgsQKz40RGnk0iJ3g
   ZGCevrQKWZK6Yhvn713P4+Xyc3WZmPm+8dIMMMomG4OLDk82JTiAeV79n
   +15B+2YBUE7tWSzVBh6dK2s8yi3M1O9pJrj4hU6M09MbUbwL5zPfcuwRo
   A==;
X-CSE-ConnectionGUID: sUk1kHasSN6M5FPFj5NPeA==
X-CSE-MsgGUID: 33N1TMAJRWq9o8VJL+5xWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92682295"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="92682295"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 07:06:09 -0700
X-CSE-ConnectionGUID: ty+mtFvWQ76Ehp0Q/XTEqA==
X-CSE-MsgGUID: b0tE32aJR/eIFF3JTwT0kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="241269136"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.250])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 07:06:06 -0700
Date: Wed, 3 Jun 2026 17:06:04 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Cc: Minu Jin <s9430939@naver.com>, gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org, abrahamadekunle50@gmail.com,
	zxcv2569763104@gmail.com, milospuric856@gmail.com,
	karanja99erick@gmail.com, weibu@redadmin.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/2] staging: rtl8723bs: Fix error handling in
 _rtw_pktfile_read()
Message-ID: <aiA0zDHc494rnc55@ashevche-desk.local>
References: <20260127153811.1592900-1-s9430939@naver.com>
 <c6828c20-8f77-423e-a744-344d09c54488@gmail.com>
 <ah955alcKpjMXYXy@ashevche-desk.local>
 <fa16641f-d6b2-47e8-b1a9-08d63387c733@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa16641f-d6b2-47e8-b1a9-08d63387c733@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jun 03, 2026 at 04:40:45PM +0300, Bitterblue Smith wrote:
> On 03/06/2026 03:48, Andy Shevchenko wrote:
> > On Sun, May 24, 2026 at 09:30:01PM +0300, Bitterblue Smith wrote:
> >> On 27/01/2026 17:38, Minu Jin wrote:
> >>> This series improves error handling in _rtw_pktfile_read() and cleans up
> >>> the code style to comply with kernel standards.
> >>>
> >>> 1. The first patch combines the logic change and caller updates.
> >>>    The function change and the caller updates must be in the same
> >>>    patch. If they are separated, the code will not work correctly 
> >>>    or will cause errors at that specific point in the history.
> >>>
> >>> 2. The second patch focuses purely on code style cleanup (changing uint
> >>>    to unsigned int) as requested by Andy Shevchenko.
> >>>
> >>> Regarding the logic change in _rtw_pktfile_read():
> >>>
> >>>     The original code used a ternary operator to read whatever data was 
> >>>     available, even if it was less than requested. This could lead to 
> >>>     callers processing incomplete data without knowing it.
> >>>
> >>>     I have changed this to return -EINVAL when the remaining data is insufficient. 
> >>>     This is safer because most callers expect the exact amount of data and 
> >>>     should not proceed with a partial read.
> >>>
> >>> Testing and Verification:
> >>>
> >>>     I do not have access to the physical RTL8723BS hardware. However, I have
> >>>     performed a rigorous manual audit of the data path and verified the
> >>>     changes using Smatch static analysis. The analysis confirmed that no
> >>>     new warnings or logical regressions were introduced in the modified files.
> >>
> >> I have some bad news:
> >>
> >> https://bbs.archlinux.org/viewtopic.php?id=313401
> > 
> > It's unclear that this patch made it happen. See below.
> 
> It looks pretty clear to me, but okay. I forwarded your request for bisection.

I don't know how it does. There is no information about from which kernel one
upgrades to which. I assumed someone bumps from v7.0 to v7.0.3, but there no
such patch. If we take v6.19..v7.0.3 range, there are dozens of patches.

I.o.w. it is semi-poorly written bug report: some of useful information and
some crucial that is missing...

> >> [quote]
> >>
> >> Hey everyone,
> >>
> >> I recently upgraded my system, and now I’m having a strange issue with my
> >> WiFi (Realtek RTL8723BS).
> >>
> >> now I can no longer connect to any WiFi networks as a client. however,
> >> creating an Access Point (AP) still works fine, but whenever I try to connect
> >> to an existing network, the connection fails.
> >>
> >> dmesg logs:
> >> Every time I attempt a connection, dmesg gets spammed with this error:
> >>
> >>     [ 1083.925640] rtl8723bs mmc0:0001:1 wlan0: xmit_xmitframes: coalesce failed with error -22
> >>     [ 1084.921217] rtl8723bs mmc0:0001:1 wlan0: xmit_xmitframes: coalesce failed with error -22
> >>     [ 1085.921434] rtl8723bs mmc0:0001:1 wlan0: xmit_xmitframes: coalesce failed with error -22
> >>     [ 1086.922320] rtl8723bs mmc0:0001:1 wlan0: xmit_xmitframes: coalesce failed with error -22
> >>     ....
> >>
> >> Has anyone encountered this specific "coalesce" error with the rtl8723bs
> >> driver? I'm looking for advice on whether this is a known bug in recent
> >> kernels or if there's a specific module parameter I should try to bypass
> >> this.
> >>
> >> System Info:
> >>
> >>     Chipset: RTL8723BS (SDIO)
> >>
> >>     Kernel version: 7.0.3-zen1-2-zen
> >>
> >> update: I fixed the issue after kernel downgrade
> >>
> >> [/quote]
> > 
> > That guy should bisect and find the culprit. It will help a lot to understand
> > what's going on.

-- 
With Best Regards,
Andy Shevchenko


