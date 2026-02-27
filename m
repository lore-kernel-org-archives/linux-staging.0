Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E802874E0
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 04:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772167873; cv=none; b=KMFk5XcDMXJ5xSX0JOjDwQC4JYKvSqKognnCcOuqaXrWnlYkcgWNxBM/Ji6d8yla9ACr+hYX0UzfxfFp3VaBBmtMfz8xXJHe8uzoRt+t6Ghmo2Ajnh3rudZqQbq5fYWpgr5ReXwLX/JCApx5ey8WRgeo4+Dub0xoQxqAvzHWVCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772167873; c=relaxed/simple;
	bh=88StybOU0Ec/gubmYbovd3Oc+JYBooELNU9E/jLothI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czPmrYVT4tC9WUDYfI2XYCTExrzdnczRtw18eBS/206xlkphyjRmErF0yyCxNqjoko+gVLd36Bh5VC8K1Bi8K+T3BBZhnfp6tMjPhlXOWnJyyQSv8BaCSPFVwWN2a3b4r4NecMufrTXmUfoT07cyuIO6YoWxcgRmc4ldtMotxe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRjKd/IL; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRjKd/IL"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35928defcd0so957872a91.0
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 20:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772167872; x=1772772672; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xlc5/wJcGMy2qVaQwNIPCexEitX/U5dL8H2UtAkaHiA=;
        b=KRjKd/ILVJ/BJ3guNXaDkR3SpuGlCPdCKMaGeDsmwpKyOc/kAOehFsJeMRwapaycj8
         t2FWp5gMK4jMRDP3snt3N3+0R+eYWI9WgQmSnV4WLUmOLPSA/0II4gTmDe2FMr5j1qgO
         j/3Q5BolOkllvNdFPpIGpc2JyAzLsC2/Ia09ClJlYt7uV8ibaCrk8xmiALjKilKX6w6/
         Bd80sQJH5q9lc1+prEJaLTJYBO5fBLIJVem8Iw7MKX8SCJnLpuBVOk97rgJKLMnlYZvm
         C1chpB5rbBRznVtvkq6IOxciEQhHH2NhlVUwDiqiOihKGzhrCNSBJQtg2IIexHHUzvWo
         nN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772167872; x=1772772672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xlc5/wJcGMy2qVaQwNIPCexEitX/U5dL8H2UtAkaHiA=;
        b=eMdHwiQ3FJO8MHU8XBjUbNr3ZO5lpWk/iY9ErtKmi1VN8VyplZNLp687T1wgjfTWCe
         RloeM4CMTevMpNiiDi+Bi/FyGX1Ba6TknWtJb6b5J1+i5d3fZ1sotZRXLDZz2R+Z5HwQ
         6OCgEOUQZitDefkFqXmt5DAj/1D7r/oWB+dowpD1iFvJ60/wUAkuM808CogqOXzPqVle
         vleTxRFbvEPvLRcmTsKyq6WnD0qSrclyogd1XZBAASW4zf6WYfMazbjeWkPaM4IM60mJ
         eztO82GRH8V7nYjXQzd0GwjaDSMD67hm3CaBAovtvki4zN9+J0Nv7w+pnLtIJUEUL4LR
         qnXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW15J1y/tEFuOithlCnBFXNClA3ZpDmcGURe/J6lqI/wUynjwdDqVk9TpHVdWj1gJbXcPqpzI96RQEeiHRG@lists.linux.dev
X-Gm-Message-State: AOJu0YxcvvtppyFx5nykozDIbOnRszKIxUYtTI/+aiYfZh7evivEsOIt
	lxksgyN+awaDs/eB3X2i644jkhY57HaFqA/bvRyeMYxiAUrFsYucAJ4F
X-Gm-Gg: ATEYQzxpOyDbpn8fP2iPCZWQF+ZmLylmtYEw5HXs1DD1bGR1YPI08144fBQhQ7NLyNN
	tUKbAz/v8+NUE07joTwARX5/6I8aLoW7Zu2k/pYLLB8HclBwHAZyaQ5JnC1ZBp7gnCoyvlQW133
	yKMXsDO+oei6hEty4Mc4tGZsYCtBotQnnvrDWsXbw2DK6L+yrA35mZ8+bQA7rT5iS+YsnUWyvkO
	cuDcbBTbXRKPiGjyHTSYSoArPKyETVMIpH2sJ2H/XmurQQwiIgB3QXW98So3htBZThVwXoSEPiK
	15XxuH3fB3C1X9luYRglWvLgkP7ra1lzg+wkOFm7X8VaANaiBKl53Q6fP9JZIqcBcWHAsCTPRoT
	Tvb3b16SXpPEI6XVFbceCXj468Mqv61qjMyzd5spwr3l2z6ChU9EO20oIotJV8phhkTrvqccmsz
	7EogjHEkpOy/xaD5e7wxk7SpItIA==
X-Received: by 2002:a17:90b:2496:b0:354:ad98:7d1c with SMTP id 98e67ed59e1d1-35965c3cb32mr1089009a91.11.1772167871672;
        Thu, 26 Feb 2026 20:51:11 -0800 (PST)
Received: from latitude ([2401:4900:ae25:bd8:c189:b262:db26:b797])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3593dcc9c37sm3706534a91.8.2026.02.26.20.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 20:51:11 -0800 (PST)
Date: Fri, 27 Feb 2026 10:21:05 +0530
From: Dhyan K Prajapati <dhyan19022009@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jason Donenfeld <Jason@zx2c4.com>, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix macro whitespace errors
Message-ID: <aaEiubs2v51xMmUN@latitude>
References: <20260226172531.13714-1-dhyan19022009@gmail.com>
 <aaCIqUXPB75vR6rK@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aaCIqUXPB75vR6rK@smile.fi.intel.com>

On Thu, Feb 26, 2026 at 07:53:45PM +0200, Andy Shevchenko wrote:
>On Thu, Feb 26, 2026 at 10:55:31PM +0530, dhyan19022009@gmail.com wrote:
>>
>> Remove prohibited spaces before closing parentheses in macro calls in
>> fbtft-bus.c, reported by checkpatch.pl
>
>You haven't compiled this, have you?
>
>
>-- 
>With Best Regards,
>Andy Shevchenko
>
>

Hey, sorry I atleast should've checked the definition, i'll keep in mind
not to trust checkpatch.pl blindly
