Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB713B19C6
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 14:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774277544; cv=none; b=QbZhn/tvKrz4i9Lqa66ZLbFvsbWqIJwguyG5KyVC/Kwht8Nr1Dip1vt01hNCIXqFFOfxAmwM7micWsBqU8luCiyFAhdb0Kb+5qs6cMVK5kJdTA99mg/g65Q0fO1TIy7xpXqBri1Pqwl/OMWsxrvd+ao+r+1aTdEuvLpviHo7nAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774277544; c=relaxed/simple;
	bh=56qJK4yD3U9EA7KLi2YIpYQ7slKn912lh6LF4LUfzLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b1kjOevon+H7aOpILPUrSx5HVUqxHc2tOut1APVqGKk3vk9z6C6jmipTIOwLNR5W1seuuDHoeOIQN5w0RN3K/ApSqgnxv9HVCciOsgZ4L3YVa2Ld0Xra9VyjxjvJSktlnPJYrMaVOACyYuaFkugTrI7S81Z0Rbf0k1RCC95xylM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nfs2jRWp; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nfs2jRWp"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35b90d6fe14so2974171a91.2
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 07:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774277542; x=1774882342; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FfOO4PyYEkqRDNpFOu7sop/vHqEpZFiPDUIVrBhezJQ=;
        b=Nfs2jRWpoL/yoOrZjaCjJHQxyaNLhBruFtZR2b5X5d+MBammqJZFU5isDSxela3Ho8
         8c0r0U6cyRzUOiRW5n9CsV+zuT+AK5xmtCCEi7LiGGmwHmBz5hQio7M3ul7sCGJGHl1P
         0LhKtL2+QL3O7e7+LIlM+4UhoSqTLCXep8WAkdbpwOAyvVTXqzejDeWSZNAox2gDIbV/
         Qvh0pMSinlxNuJTNOrluyx8Zredb3DMSoDF0ey0n5pjF7hmCkUP6yxR7XHnodjNPeafY
         /wZUklp54isplvDfvIV4cU3P6hk9oBzir/J7zLpZZB35Xjv/cKrUM7QNfan9q4/ZcmiU
         v7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774277542; x=1774882342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FfOO4PyYEkqRDNpFOu7sop/vHqEpZFiPDUIVrBhezJQ=;
        b=rc2MPODvVlzGrzYdhOWQGJ7aez+X8eAta+t3KWbp8QTHKm7lRCngE03Q14lH1MsZVJ
         Z8A9THd9G5L1Nw/cZLQ1ChotklUZFiqaRo/phanQswrC1TdZG2Gko5AT8d2p43BDHdmu
         FczsFC92KSh6fL71+k4Dc/266nxBQLYOM4ZSzBuM7udTs6IAK+vJO9B2xCse9Z0VmPj0
         xwRW+hV6kW0CWiCMvfWJkJSJtcoCIj2P+/m7VviGWCieEdM1eZXOji67y36tiOhrcRq7
         ivusEcHiXjBYqcieNsVhcj9p9XG7bOdDOxIl66C+liIAzu+FLgd2xalI4Q2WTc6DIALr
         P4hw==
X-Forwarded-Encrypted: i=1; AJvYcCW/eD3nl4WusQTVsiptJ8qIu1rBVFgenW9Cj+0yzOHNv6yrQxfEVdWi4zcNVTQtqOf6kHMNicnTAg1zdo67@lists.linux.dev
X-Gm-Message-State: AOJu0YzaHKKEC/JWeZDeOmzOWEj/tktVX5b775dU7VhOD3e2TWt+HpH4
	MXRr6VYmFCWo/f/C+ulrrK1UDxcyPQaobVklgMXGJ8YRammr9gzXJc54xUiZHEVL
X-Gm-Gg: ATEYQzxTmzeClbdgrxK61I2ujVuZyPGty/LzZz7Sk3O5+dwh8Vj9+P09J3lnbwyuu/c
	6s/9WaIjNCcqdr+xMshBTcYa91JOqz4PfGY15eBDzX7dp1WMvfM1hlepYfzOqf30OkmnC7xvbT8
	MN0SoYXoXiflXUAaoZKO7S7ihdgdOK/TiX+oPMwQe/XrwiiJ/xUtQvulv7z6TyrGwuTbTd908F7
	jV37j+MOyW9rnviAFIUsBaPSYbfjWwtMPmSN6Vw4a/9oJJk3CsSTy28dQD/gxf6BqikLzAbt1v1
	OypFisNrNqlnh4RmNa+aIrjRMb+wcgzCUFbW4RSpV96In7oiH5AJOJIlEeYMxajNnsb4UIND73B
	L/oQ67toG61GfX4WZrNsPSrAa7vr/VGl+a8hmck6myadCsp/efW6lDddJtnwEwsucRHjjrM+8B1
	SXyIUGxp67Tha6b2Ef4Ho6HYI=
X-Received: by 2002:a17:902:f70e:b0:2ae:5104:571e with SMTP id d9443c01a7336-2b0826d6e37mr112977745ad.9.1774277542268;
        Mon, 23 Mar 2026 07:52:22 -0700 (PDT)
Received: from inspiron ([111.125.240.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516938sm119387375ad.6.2026.03.23.07.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 07:52:21 -0700 (PDT)
Date: Mon, 23 Mar 2026 20:22:14 +0530
From: Prithvi <activprithvi@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com,
	ethantidmore06@gmail.com, dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: place constant on right side of
 equality operator
Message-ID: <20260323145214.ubhshy2gwp52j5zh@inspiron>
References: <20260321092536.138499-1-activprithvi@gmail.com>
 <acEFrIIYaS3ZW8j6@ashevche-desk.local>
 <20260323132235.sg6fw2azr724g7un@inspiron>
 <acFBPuCNpD_MNKwR@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acFBPuCNpD_MNKwR@ashevche-desk.local>

On Mon, Mar 23, 2026 at 03:33:50PM +0200, Andy Shevchenko wrote:
> On Mon, Mar 23, 2026 at 06:52:35PM +0530, Prithvi wrote:
> > On Mon, Mar 23, 2026 at 11:19:40AM +0200, Andy Shevchenko wrote:
> > > On Sat, Mar 21, 2026 at 02:55:36PM +0530, Prithvi Tambewagh wrote:
> > > > Place constant 0xFF on right side of equality operator when checking
> > > > value of hw_channel_plan to fix checkpatch.pl warning and conform with
> > > > the Linux Kernel coding style.
> > > 
> > > First of all, in the very same function there are more of a such.
> > > And hence the Q: have you checked the entire driver? Please do.
> 
> > Thanks for the correction...While checking out other places requiring similar 
> > change, I observed the other place in the function where constant is on left 
> > side of equality operator:
> > 
> > 	if (
> > 		(false == pHalData->bDisableSWChannelPlan) &&
> > 		rtw_is_channel_plan_valid(sw_channel_plan)
> > 	)
> > 		chnlPlan = sw_channel_plan;
> > 
> > Here, the formatting of if statement can be improved and we can also replace 
> > 	(false == pHalData->bDisableSWChannelPlan) with :
> > 
> > 	!pHalData->bDisableSWChannelPlan
> > 
> > Would it be alright to add these changes to v2 of this patch itself since
> > they  are related to the code having constant on left side of == operator?
> 
> Yes, but I also meant to go through more files in this driver for the same
> style issue.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

Sure...sorry didn't get it earlier. I will check for checkpatch warnings 
related to constant being on left side of test in the driver and send a 
v2 patch. 

Best Regards,
Prithvi
