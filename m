Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE7C2E6116
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 21:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784151106; cv=none; b=pxJvKz+48Tdok/+c5LqsqbQL4cBwkZ+tGcxN4xnMsRcFBRcrGEaNL0gvEU9hWxs7Po4bTTzRoacWTSBad33NauvKeoEoY606jqsCRiBuJS9UrEbyPnW2lP4O+XXat/70G6AY8UwUHeAF7snjNFy5sREIKJdT5gMASyAqAfj4tnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784151106; c=relaxed/simple;
	bh=UQ9VAiVeCZWMZkBEOtn6RY19qayrGcPhQbdZi0ZSpHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQpTo/6nTPa6Z+kCufyM916ziuIX+UGZwTeEIb5rOkuVGxCU5D7m4qX2WNtY1mPB914GjMC7cHuEeT+0OXrMX7l0EEnMPSBB7YhdYN9MiWxMp99s+v7/M+lIVNYdtGcnmbvG48N1AW2IoYqdqhIr9UlJ9XmJnLL0UO6sBr8eYE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WveETwT3; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WveETwT3"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7ec58fa3e01so691369a34.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 14:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784151104; x=1784755904; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FH1G2p6pP1LRbcz11N5iQe1Ot4d6ncQZprgfJdvooEs=;
        b=WveETwT3h7HqkMQVCj1Pvrx0tlr8JHMqDrr9j3j2LjVGQLF9rth6mWR104IEtE3KlZ
         eHd12hj9xnkHLave+SvkVuqFHh3XaoFyTn/6x74WS/FOgxEE1eLmkx5kNlyj8Ye5yTmG
         hYnXwg53aNJq0OLluWl6ZqbD97bhH5O95Yx691F8zJ3L+e1EMYnEUTlrMD2r2CWOqkpH
         HLvXQ6IHz+rw2fdqkuaXAaUXgYDSMwxys8ujqNLRsD5zG4t2hOkUhOto24hCTlm9IVbz
         pNWiWEyueeGGcLaetBvC6y9IHsYjOAYaNiL+6kNLrxKH4Ihf4omHRmBgqOWPHLQnQjTd
         PXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784151104; x=1784755904;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FH1G2p6pP1LRbcz11N5iQe1Ot4d6ncQZprgfJdvooEs=;
        b=nPN9o2ryhIS9rdsyRmPJVllwpVcdRHCouRFX7LG+Q87mHuduJMl+aCi5qK1HcrkzOv
         bTrm8DvCVZkOT2z7O0bLRIODD5EOSfCOyQzW6k+VxUEOlHMY4CWq5uwOrC7CrK6cLMx0
         dTh2i0dKoDDqSMrn6Mj3Kx6QbzwdoPmA12x2nZH8mqyuj4ob8UkIjfKAubsLaRpO1Cdu
         W1bp8o2eqSQFs8pdPRhrPFzkZA0CkTgb2XMMUa4u/JxHVzVsEBrsRO2YDeQSfQODF4TD
         n+pGMHMEwPhMcbrO1cE6MF5SrlP1Opgyl8VW/u5lswT2347/cpptegaKqkHuF88Kk81C
         gB0Q==
X-Forwarded-Encrypted: i=1; AHgh+Ron0Ntu5PyXGIEH/PZfnZ84u4A4HFcQ2S0UR9SlEiTatOKthLW+I95OM7K9YY5v8cudHouaHfWH/0h7WMf1@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0Y+UNilNLxh09Wmdx+o3sqfr/KiqxytchRv5n7/P6qLXdDOAX
	e65zr2Ts/2rvzww6wAfCgeeqdF9cyzqkdFRRT7HQQ3sbTAVkOT6/soCG
X-Gm-Gg: AfdE7cm/9uL7cgf0aXbGTBCtrv/RtmTu1TRla4y3+KSmGfXd3AXRrtI0eV0PZnnChPT
	liTJZB41e2CkZTkc/fsW4j2qkWGJRz91Qud+32+DR7wqE13XQhD92mXpdOBWb4s0E6PFwxVvyYK
	L1DDakEdTRHal4dDRr6Fkg1QMnYIJCRuUv5SPKt6TatNsno6iQNR8LZfYfU1+pCU0PMpAjADWJc
	/JzckgS6nkqRGGQy7O0gIh+eMZdvjC6XaQY1d8GdT+lCv/6op5IEGJ3OoFmzePFX1486JUuf2It
	tVD6XLerh5bpiAi4yDeaAexjJiykGBQ0jV7VWzSvCs6cKDaP56L0Niq9TdGMP41bWqTPFfZZM7k
	VzQYoj8/PVkDTLnCbpVmsaO9ta9x4AZAjKEaOX0g2/nQZQwUp6ZZMrsHwOtcwmrbgHqyosQ==
X-Received: by 2002:a05:6830:680e:b0:7e9:f8e8:d905 with SMTP id 46e09a7af769-7ec097a243fmr12860663a34.16.1784151103942;
        Wed, 15 Jul 2026 14:31:43 -0700 (PDT)
Received: from localhost ([74.80.182.90])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcab8efc3sm17586080a34.0.2026.07.15.14.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 14:31:42 -0700 (PDT)
Date: Thu, 16 Jul 2026 00:31:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: Mohammad Davoudi <mdavoudi2011@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	rmfrfs@gmail.com, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Replace sprintf with sysfs_emit
Message-ID: <alf8N5msXi95aQfB@stanley.mountain>
References: <20260715172858.17658-1-MDavoudi2011@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715172858.17658-1-MDavoudi2011@gmail.com>

On Wed, Jul 15, 2026 at 05:28:58PM +0000, Mohammad Davoudi wrote:
> Replace sprintf() with sysfs_emit() in sysfs show functions.
> The sprintf() function is unaware of the PAGE_SIZE limit of the sysfs
> buffer, which can potentially lead to buffer overruns. sysfs_emit()
> is strictly designed for sysfs attributes and inherently protects
> against buffer boundaries.
> 
> Signed-off-by: Mohammad Davoudi <MDavoudi2011@gmail.com>

We're not applying this kind of patch in cases where sprintf is fine.

Really, I never like commit messages which talk about "potential
buffer overruns".  Is it a buffer overrun or not?  If it's really
hard to figure out then say that "This code is really hard to figure
out and I suspect its fine but let's be safe."

In this case the code is really simple and we can all see the original
code is fine just from reading the diff...

regards,
dan carpenter

