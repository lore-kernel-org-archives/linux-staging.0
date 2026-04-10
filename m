Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D344C3A4508
	for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 08:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775808684; cv=none; b=MWijqHR1w3/BQbF2cWVSic0cPY+nSZjPOVDT9rEJVWIV4vAV9ay9gkL5xR4n8IPTAO+H5g1R4+aPvLRy1malpp0otoeo7HxZszZIpkguvJ4B3jd2U+N9FV/cFXhJZw9Jp7rZ6IsikTyZobFND6bUmO4/V03aFQGwwfJPCGSYYfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775808684; c=relaxed/simple;
	bh=eFNKlU6BN3Qg8lcYQRoLu1p6oaJmRcs2oqeUQphcWgw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZdMv/fNUR8ci9HZfdrZYZ6mjGIcSoM+76mWPp0NNVHYxGWs+M6Mld3Lp1tDDi+u6qzrwWxrYSRVHuSPDG6tLw5Y4PbLBm9d+PSikgFco4OQbQsS56OzvVluOb+PeuyNqcCOuGstM26CMkTsCp3mStz54kaoVNB/YXExPIeK3iII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DlVPzuU0; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DlVPzuU0"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso15930645e9.3
        for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 01:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775808681; x=1776413481; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOV62oQg08u1Yx/zt3MV8JzMI4cWJ9x82u8lWWrOUr4=;
        b=DlVPzuU0MX2QZcgqpl8s23uBk3xM+5bW0xcnxDKmRe3XSKAbbwRGanNzVQO5PtSdEf
         ItbQUQ79lJX0Hyhm1xzncTh8zCGDZDiXOiQ/X2TU9msnZd55XxwKoUaw5BVBdkOhsP7u
         d8V7/fOWXOEUZhTjQEJ9x1hCs8+WC1Zw6cwxwpfIyDYeGItFYxxOYbwCEuthKCB7L04j
         v4BJyMPUqusnpBW2lsv7eH5fo7322zQ0CA9wVKkRkRbkGIlw00HakbxpHlk9LHxQJdYs
         DTBayBooXv6J7wk6MnGj32QLrHH0TB05N4fq5e1JLm5N/3mG+7hlYs32i4LXZuJcf+Gm
         DZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775808681; x=1776413481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YOV62oQg08u1Yx/zt3MV8JzMI4cWJ9x82u8lWWrOUr4=;
        b=B+PpoF1VNtQwXKTOBMSiDST1T+XTf7SS/bDk3pfakeJKUDCXL5IMt9bInfXHMiz2T4
         tXKMjuKJEe5ZL9s5c1NOoIc1hsPx6KVjC4VqgC9O4lSkh1Q5APJl3pDC8bues2U1vR/Z
         Md8h/Rq+JCX1kknCRrft1qK0fS0WoCC/9WOxZ2ExkL4fmndiqkKddKnKEoWIJ1bLUGdK
         hcDzKXIqena4TRqPo1uopN0eBNjW73bMhzPqFOvFBA+7dfVhnhwKQ1HgjCKLr9m48R1v
         K67KxR1R33hNkHxgBlToue0waGWZya6MgB08HOD9g2dIZsCihQhv+QiTwS1WgZV7XEch
         Z6lw==
X-Forwarded-Encrypted: i=1; AJvYcCUKt6yAZ2dEsxblL07gfCG7BcgEOESXjlm5nOZL82uRXDaL5kBca4HLdZKkXFQkipCBQzLi3cJkrehB4/5C@lists.linux.dev
X-Gm-Message-State: AOJu0YwMa5hWNtIdprWq54sbdDPpJzaV8hWBm9zQjbmdbuoe1hgisbQK
	zDuHdZDAgnOw2Lfx9u57Z0WAKM2m71XT3Z1HMQLuqeBNBdSeEP1hEcgG
X-Gm-Gg: AeBDievO+fytt5US2nBlFu9uwYBo0i82MSterSFp21SYv3NEOt5xjDJ3E6zk5/246EC
	ax1d5mWVIbRiEVve9BXeO02nO6BTLl7ViZYqAtKsIiG/JmWw47/lfmqsmoKW6Ttbd8Wm5+UIWpf
	r3572EntlBPKW4brwrlwOtGjX1z+K1f6s1KonUF5OggfuzqDWbJNYlMwGOIAj3AcVFyqZzqm9QG
	5SVl+XTyHUfkMF5Ft46F6f2vfDRJsRosnp/rLqtfMwN843bAzT1IBQ7tx8J3TsnN55lWA3jn3AH
	7+79ZLKhC1NB9S9HcQ3zmL/1KuOm9OamThA44IDJydPFCg0Tp4uhFlhXKjmwu1EQWRlKOI+4Vis
	nl2nlnszs/6YKd0YYhMSvHShNnn4PV0eXx1wXpSOPU7sGi091z1ypIfnAzEXXJ1m6mfNH/r2gFm
	2K2e04aWxz/o+uwV6buePyeikl+5O7BVIbwl6JH10dWRAJwCAfA5FPfzJHo98od5eAfB5hfxwcw
	eo=
X-Received: by 2002:a05:600c:628b:b0:488:904b:f31 with SMTP id 5b1f17b1804b1-488d68603ffmr23646065e9.22.1775808681064;
        Fri, 10 Apr 2026 01:11:21 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5b3cbb2sm57593325e9.13.2026.04.10.01.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 01:11:20 -0700 (PDT)
Date: Fri, 10 Apr 2026 09:11:19 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, lars@metafoo.de,
 Michael.Hennerich@analog.com, jic23@kernel.org, dlechner@baylibre.com,
 andy@kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>,
 nuno.sa@analog.com
Subject: Re: [PATCH] iio: frequency: ad983x: replace do_div() with
 div64_ul().
Message-ID: <20260410091119.117d0feb@pumpkin>
In-Reply-To: <CALoEA-xo04NZoZLboZ_RNg+m8QfCaDMrfNRb0cZwnE1DMp=8ng@mail.gmail.com>
References: <20260409131823.1289-1-joshua.crofts1@gmail.com>
	<20260409182755.499a419c@pumpkin>
	<CALoEA-yVCyyiA1gUCj4Z0JcLscpSSssPCPXnUPOciWJOHj3VUg@mail.gmail.com>
	<adh8zOCQDhGwgf0Y@ashevche-desk.local>
	<CALoEA-xo04NZoZLboZ_RNg+m8QfCaDMrfNRb0cZwnE1DMp=8ng@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 10 Apr 2026 08:58:10 +0200
Joshua Crofts <joshua.crofts1@gmail.com> wrote:

> On Fri, 10 Apr 2026 at 06:30, Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > > The clk struct in linux/clk.h explicitly uses an unsigned long to represent
> > > the clock value, which is used in this driver. Using an unsigned long
> > > ensures platform independent usage without type mismatching.  
> >
> > ...which effectively means the frequency most likely fits 32-bit. Otherwise
> > would it ever work on 32-bit platform? This is a mistake in CLK design.  
> 
> So we keep the do_div() macro and cast mclk to u32.
> 

There is no need for a cast, just ignore coccineal.

	David
