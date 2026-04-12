Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36155375ADF
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 14:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776004678; cv=none; b=jdDqwi5ZWTp/Px2FmARSTiyHV3Sytj4dM0GkuZPqPG2UuWnNyAQYVs3X83hn/tfdI0/h0NYZWvs3e/ODbkBuN5HxV50Uuv5w6VrtlyWOUxfF1g/K1t4kkh/LcMr1fdctadwAwy/sdqWxj4WGthihCtsw5kyKXlqPZT84wu28PsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776004678; c=relaxed/simple;
	bh=8HGVCGy0raN1geN6ut5D1K+q14q4DMHNCtQIRiRSJYI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dddcg6O2uBQtZsLpMMlYJBwBCib51MQGKUkDYYC+r3CJp1Zl30VkbRIzmr5df/1NTkWrcfQkvkMSDWOtuy9UiamygAzVQVbGjxc9BaPwqgo7jTLA8lFVRF6cUUVkkOKwDyzF7IZEWkoEjGg7d0WFOS6fn/8pWKrAGWo92N/ZP6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJ765nUi; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJ765nUi"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-482f454be5bso37970745e9.0
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 07:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776004675; x=1776609475; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEi9Jc/jK7jsLU4s75S6thPaEgweaYMPU9OSl2lWaSo=;
        b=aJ765nUiVljb7ep6s2elo7qgc7HXl9R5QzVh1Hu/8/gdZq6ru35BigNw4Zxm8O1nXO
         RwOLlVYgYRz7xTs43VVsOAJe9f1b5eFZ5gtGL/U7BFEqWGj/A98fCGWasuizKBwYmWB+
         LvzLVchwos0k+HSjyMoct5rNJSW9mbe0roZIfvOxObmzUwkgKnD8hmXCgXP1Rpr0vBKt
         ua39m4t6+C2FKruQfbr0Nep/KdGDh+r11XU85BTxHba4eAz7/oBWhR7tw/OuiBnuIcrv
         GVzqdZbmnQCJl/hsPiYLWBvRFnRetjoEb6fjhM+LG754gbrnjt/QuhaVBV8Eue0s/upj
         bnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776004675; x=1776609475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CEi9Jc/jK7jsLU4s75S6thPaEgweaYMPU9OSl2lWaSo=;
        b=am14G6EX9TkW3NgJ0GRI8BiRvEZ2k1F7OtT4Wh9bWKNIoDD7tFgNqS3EA2MGfXCQEq
         VjTPbB9j2f2IpTQBPI3Pfn+c6PVNlebp1VXb/lp7Sf8eWjHhzy/kllnFoO30Ohzh2DJc
         h3ymZcWKXSDrsD4Dz7s8WFxZpqXX6svZYq9NFPIl0EWKGiIsXEWR4p3SaJqRHsspQ4qX
         AK/23745p0kPTSDPhPaL9G59864JJhH76Sz6khYfqwKmT7G4tEm+pzvKoan6hlrtuVn6
         6rmBH0aNydqslw2Bnr479LkBfwbd1vAN5rutjskGKtmrR0aOi8ikDIUpzzKXHxIpUaHw
         cNeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqDmQ4RjjpICSYxpL/mJaf/kUuZQRHmpPV+Sg2IXMrFPNc6C/NLJcxT/J7fyu/Z8qvDy838eri95+Adj/c@lists.linux.dev
X-Gm-Message-State: AOJu0YwwX0RF1rscez9CtCGHfeITq4Z9K1WOIxV0nrqBqBb6vm1ZY8HE
	mSoxBQ2Rj/aZA/v5MYnTX2al7BvU4UxIX/WWMHnPMi9ZdEpUqFxOnLcF
X-Gm-Gg: AeBDietk3O1+AUo3/6DyPajK0TuI1kaUfRPCVar0WWxpn38E6iUG6SFUXCFcqF9YkkV
	YegF54E/CZc23Xpy5IT5t2hnUJYSGBVxWNiOqDZT43d3nCfGmSvvMbOkwAMtG8xWHqhBZevWMYr
	ImH2QrOEVKGD/62d1KX66NofWGJiLr2P7ZhoDBAOTgaFKEQde7Y6mQOXM4TypQMh8PMWue2QcAz
	rDvNZ4mORU+BFY7SNqkHfnbaxemWFVtkWfHfpyDpSYkZ7E53JmXh4W+Th/AbQXE56gQmy7Jiyua
	inEtmYa6Z1uRuYHHSPyAQTBghZWUSjCcZK95bLopAy/MNUoqn0drk+jw8825VxusNE4BBajhyXZ
	x7fEVWuhE61FiePCS1oRAmPMWqDjZTZuhdbTZSWOWAxAs6zenMe+k8zSxOoSo1JVGWQeLiIFY2S
	XY0q+0v+bRzr37zduKggS+NDpv1SNOcWpd8QGZhGwTVA9yRHn/fPmCvD7kXpjM2IlB
X-Received: by 2002:a05:600c:609a:b0:485:3e00:944a with SMTP id 5b1f17b1804b1-488d68ae78amr136527135e9.9.1776004675286;
        Sun, 12 Apr 2026 07:37:55 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d533e596sm232913945e9.6.2026.04.12.07.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 07:37:55 -0700 (PDT)
Date: Sun, 12 Apr 2026 15:37:53 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nguyen Duc Thinh <ducthinh100812@gmail.com>
Cc: Luka Gejak <luka.gejak@linux.dev>, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] staging: rtl8723bs: rename dot11AuthAlgrthm to
 fix CamelCase
Message-ID: <20260412153753.17c2c122@pumpkin>
In-Reply-To: <20260412130012.5832-3-ducthinh100812@gmail.com>
References: <20260412130012.5832-1-ducthinh100812@gmail.com>
	<20260412130012.5832-3-ducthinh100812@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 12 Apr 2026 20:00:12 +0700
Nguyen Duc Thinh <ducthinh100812@gmail.com> wrote:

> The variable dot11AuthAlgrthm and its associated enum values
> violate the kernel naming convention. Rename them to the
> snake_case equivalent, dot11_auth_algrthm.
...
> -	if (!(psta->state & _FW_LINKED))
> +	if !(psta->state & _FW_LINKED)

You didn't even compile it.

There are lot of unrelated changed that make this far too big as well.

	David
