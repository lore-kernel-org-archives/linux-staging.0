Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8316B31F9B7
	for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 08:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773216213; cv=none; b=Rdidxg//PQJ8gv7OA5CUpud7jE0pOaTKG+C5ULqiQN65Q2uoAlHf26XiyuR4xyRGWxjZkwPxW/HeXNSnIe1Cv3L9vBR2Ccb/kHRWsf46uXiO6CmHyqSfRaBAWF/k+HvEeuHAsTp2Sy9dJRK9fVGdKfSwZibEqNaHC7Oteg7CJJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773216213; c=relaxed/simple;
	bh=sDWq5lv+gM8a7XYx4Byx88O+DNdEK8LeOLuY2bJMnGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BNXAGtwCohJoHSZvAozbD2M+lEKq3YSdnPLaSZ1KGHJsCZ3HduDi2b38N15wfsg8KuQWcze5LZjryf3pjT7epN/luU6nealaf8eqnN6TUHFeTDZoeXUO3I4hN7j5AmFMy3/d59Zn6O3mu61xXYjLyXX9fP3gh3G7M96oJiK5gH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XkFjU5yw; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XkFjU5yw"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4853510b4f3so50478375e9.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 01:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773216211; x=1773821011; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/GKTZlLwNmLaUaWTNO7LNYujCTgpU6qriNhF/151t/Q=;
        b=XkFjU5ywwvwbXOEPHsiYdocZEc1e7qB5xxartyzvqRnhNpJRG5pcG9NhZL42KCO9VY
         HjxLsLHxADnB/tMW0m62znZbQm7LTIKlBKIHRr/kIY3I9ShJrWKr7RRss+VbmUlA6U/Q
         lv4gqlzggJXulK583jnpZRlqYMKGU90PcxSu3exjh3xUOTr9nWc6+cvlEJYXn3e9FYwe
         Ml7VK8IEpejuclro1RRhl8vRbmY7MJD469ztqi19YK9i4PsZCjBAYcn8syjgLDVhyE8b
         5KeL3XVlE2hxj6EUByKGDODQD4Hjk2/ABLJeAPvzeMWh2l/GM13xo+d0uC+/NKUx/kD7
         o+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773216211; x=1773821011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/GKTZlLwNmLaUaWTNO7LNYujCTgpU6qriNhF/151t/Q=;
        b=vLE36LSlOYfkBZ7kOWJrHzkIi5QH8FCoqGfwp0cGC579cXTSPOZ4GqXSy0hB3uc76o
         VW+9HAq0njBFFLVvJGKc5LLg2qNRHz7q5kpI2xryBKW1evsl9lWF5qlkTX0vEXCLo9Gg
         sKOocK3DOw+Xp8CwyRy3a0/I32ljKRCf0Q7feVb5t6HlUVE7kUYbb6Vq8+RCq2/u7MlI
         BP7nn3r9HPPZDed+vlL5Gv4j+ouDVO6moR33GErVHD3+evQE+tHRLTAwLktT2QfNKfgQ
         OqeMYB5avy5GOTeoKDI+e3E+kx1MLCh2ZFy+Xtt7ft5KVcMAKFgfSZlToDS5/DbYBo+C
         yXZg==
X-Forwarded-Encrypted: i=1; AJvYcCV7Luz5eQLnrJCfpOoygRrLZMt53b4UCH/bwP/uYON4DMWSf7x/abIyU0cmMZlY2PuuP2vRFigpKJ9imTIh@lists.linux.dev
X-Gm-Message-State: AOJu0Yyrvr2cwBU5mqe6zrgBR/zOq5yw+iEAd28rrS5e2XWTnGS6ieHK
	1T+RUT9xamWsoavcXuf+f6fjdF/ICTnFaU1V7rgRKjm5DYEDbaiuaAkvdWEjLKWBebY=
X-Gm-Gg: ATEYQzyC2Tc7jSO+LYIk061nSZyGefoFRtUh0gMbRP4acIM0yV+xc2Vg32N2W6rtGZq
	KKI1v0wB5yuRa+HE655+Tx6cW8LjNOAgqGiHipAJnz/4JmCtrmnX2GK70JnaHCIy65OTWWiH/9E
	uOS0+QWo2yfcKaT/kznsl0dEKIwrCDPw9AnR/5sGro2nnUHe6iqaVyGs+8u7HOq2MeDLXUakmsM
	js6nVj6AiQbJJSkii0F6DpoFik8q+zxbLT6YyQCTvwUObl53BMKvPyxOKhX9KtxBmyyIq8zH76r
	cP4Iwle/C3YxlxNA32KpCN8f0zOIbZp8X9SB1hEOgo5r0Iw2cBrxsB59MZoO1neI0Ydy6adt8mr
	ShMKtHHZhc9BUJ3+Ciyppl4diKbZx3qWRXrUsIyADuR/DQTcudiZ+ZIbFzZUMCjzOAV03gzIyro
	kEBEZsdIUpa9mZ+/3wzk/ekidN3liz
X-Received: by 2002:a05:600c:a44:b0:485:4100:1eee with SMTP id 5b1f17b1804b1-4854b10c539mr24019235e9.24.1773216210831;
        Wed, 11 Mar 2026 01:03:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aa73easm129591915e9.3.2026.03.11.01.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 01:03:30 -0700 (PDT)
Date: Wed, 11 Mar 2026 11:03:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: I need piece of advice regarding rtl8723bs
Message-ID: <abEhz7LVGlwyTdir@stanley.mountain>
References: <270B444B-3171-4FEB-A43F-CD33DFFAB518@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <270B444B-3171-4FEB-A43F-CD33DFFAB518@linux.dev>

On Wed, Mar 11, 2026 at 08:21:47AM +0100, Luka Gejak wrote:
> Hi Greg, 
> Sorry if I am taking a lot of your time or disrupting your workflow,
> but I would like a piece of advice regarding staging/rtl8723bs. As
> you may already know(or you may not), I am working on port of
> rtl8723bs to mac80211 architecture. I am currently on stage on
> getting wifi scans to work(I can bring up interface, and I believe
> that I am close to getting scans working as well) so I want to ask
> you if you recommend making patches for staging/rtl8723bs as once I
> finish the driver and begin process of upstreaming it
> staging/rtl8723bs will be irrelevant/deleted(or will it?).
> Thank you for your time, Luka Gejak

I'm not 100% sure what you are asking...

If you want to port rtl8723bs to mac80211, that's great.  We love
that.  When it's ready we can review it.

Until then people are free to change staging/rtl8723bs if they want to.
Your work on the port is future work.  We can't really be confident of
anything that will happen in the future so we just go on with what we
have.

When your driver is merged and it supports all the hardware that
staging/rtl8723bs does then we'll drop the staging driver.  We never
keep two drivers for the same code.

regards,
dan carpenter
