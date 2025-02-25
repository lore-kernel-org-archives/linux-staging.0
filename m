Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A0E21ABC4
	for <linux-staging@lists.linux.dev>; Tue, 25 Feb 2025 14:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740495236; cv=none; b=iuEQzUtKdTexawkLGSuZq8HpwuB5YwLT0YMHlSMiKQBJBfYMQLkUUCqrFNwODQFqcgYDyMe5H/cht5vqmU8k0gM9RZEs4pdchHAp1XXUK76eTzrXlOb8N8mt444MauSqVxpI475DF7OaMYc7aCs/azqBT0mgnvj0YR9qj5c14u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740495236; c=relaxed/simple;
	bh=/rkbwb7BWbpl6EvsZedD5EKq6cXDtvyu4pczaAeBfS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gF5hDrbZmNYu+uCQ5WW31lV8GGjpRtFcNhDLJgQQjFOZ2h0+H9p83ZiGPehaNrk02qI/aQqKZORuEkCM1Y+1a79ZSgtw70vYN0J2OkEX9TzqOScQrtblRRxORJndKaUHXuNgGyTfCwqbQDtKSgBI9EGSbWfxe/8BFNS0gFXicHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SzY0dIlD; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SzY0dIlD"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e0452f859cso8968392a12.2
        for <linux-staging@lists.linux.dev>; Tue, 25 Feb 2025 06:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740495233; x=1741100033; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5C3026m8vJqLHregU/ELib4I5AMuVrmyvjpEMDfDPJI=;
        b=SzY0dIlDkOH4LhVPRm+yEhYkbsGmnpARd/ounBT/aAgfj1QJOLoLnYNSHxHZW0DU0/
         5VU8XM0FKN6nD4Ohmx78j1km1lhXphMqUc+bEZ5X0OZ80w66yIULa3Wb4DVNt4Eerxp8
         dFGACnncujxxpRopjNrHYikARruC+cWWtZBa5P/hoXzCxTj8a5cZuN6p18yYKoiFAKeq
         xDt2QoK6XRG9xn/yq6wGu5FPodMhOIqrhe7Q76S44wR8y7lepTcz/8/km2XzDpPANvCM
         3Y/05bAS7LZbUgUs4rJA0k0WHxNOvumN7CoSXZoh1WU63YOv43E2FCIv07CtDN3S9VQu
         FJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740495233; x=1741100033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5C3026m8vJqLHregU/ELib4I5AMuVrmyvjpEMDfDPJI=;
        b=RiQWnM7aLhe2LXeNNs2rmSM2KvhE9X0oRTLHCouXoWVFeWtrWoINrTJoljgLZ49/gO
         ifGR1+OQqOxOilD3+1s7XBO9jdbnDLY2XOkrqOZ9qHoKhMejsM4Y7K5/PPCdaTKw76cn
         XdWyFZRczhohfedO7dHuDoPhOtY1Votcp8o/NRHkRsir7WWRyY7m7bsWiaFT+DidIdvH
         VrCLtFEdocoGcK/BNot6yUfheX0k0fPz4ok4BwMfykhVKpBUvfGJJbDvNedfwmuNC2Ss
         i75k+0mLd6At4k6q2WMpsN8Mjwq2AFHrCt037nlQtFvihcYoO1zauPkF0EYAq/xFXd/1
         6Kig==
X-Forwarded-Encrypted: i=1; AJvYcCVnxihCL4qSWvW9VjtOcNKLY1d8PYqMl0d4bB0ICPOyctLEBG3qbBdfH4YCsX9KFMtILcWVZzo74cT88RoL@lists.linux.dev
X-Gm-Message-State: AOJu0YzvwJNbOFXZGBdAb0OEE/99TKkrf/uNX9k6DDHwGYbFh4DpclJH
	tgWQBiRjQj0rb4FO/297LeR4djQJFB4ahQvBD+A91yU4oMHBDlghbdXXz6tS/yU=
X-Gm-Gg: ASbGnctvrk1mDEwjbTtjsLz9z96KkcvooVZYQcAvzm/TJ4WZukDV4mT+LG9j/Z7JyGB
	bIWs1x6V8JDF7co9jGIDB3PXrQ2PUioZcEPFCDhgPYjdxBnVkzbgYTnTB18y6f+R/t3jvlxQleR
	8OVzlWgxfxO1ihjsFLiazp9989q2Pd5HUQ7Ag2+ezrpjt2dY5IgKwEfR2mfeQnhyAwRQvGnqUX8
	u1fRXRnwEue/ycuoJNshEFH636f7hf9ifoVQ80c2AerVo7ra1nt3f/Ii5y0ZD3ya/KxJFCZQZ+T
	Tknbdrltaa5hS2bin6CqN6r9ltl1PBM=
X-Google-Smtp-Source: AGHT+IF9Qg7g9R+HcAoXsNncQZZXosXuBSyKZekQD9yLdDMX6VPLdQatIx5tZiUiQOgii6TA9Dw+0Q==
X-Received: by 2002:a05:6402:50c7:b0:5dc:a44d:36bd with SMTP id 4fb4d7f45d1cf-5e0b70d5790mr15883093a12.8.1740495233068;
        Tue, 25 Feb 2025 06:53:53 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5e461f3e7f8sm1338944a12.69.2025.02.25.06.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:53:52 -0800 (PST)
Date: Tue, 25 Feb 2025 17:53:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Gui-Dong Han <hanguidong02@gmail.com>, paskripkin@gmail.com,
	Greg KH <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>, baijiaju1990@gmail.com,
	stable@vger.kernel.org
Subject: Re: [BUG] r8188eu: Potential deadlocks in rtw_wx_set_wap/essid
 functions
Message-ID: <40085616-3b80-4e4d-b610-605dba69aede@stanley.mountain>
References: <CAOPYjvaOBke7QVqAwbxOGyuVVb2hQGi3t-yiN7P=4sK-Mt-+Dg@mail.gmail.com>
 <Z73MMWEI7o59qzDL@equinox>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z73MMWEI7o59qzDL@equinox>

On Tue, Feb 25, 2025 at 01:57:05PM +0000, Phillip Potter wrote:
> > This issue exists in longterm kernels containing the r8188eu driver:
> > 
> > 5.4.y (until 5.4.290)
> > 5.10.y (until 5.10.234)
> > 5.15.y (until 5.15.178)
> > 6.1.y (until 6.1.129)

This work is interesting, but we're not going to patch old kernels to
fix static checker bugs.  If the driver were still present in current
kernels or if it were a privilege escalation bug that would be a
different story.

regards,
dan carpenter
