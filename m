Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AA42D3EE5
	for <linux-staging@lists.linux.dev>; Thu,  5 Mar 2026 10:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772707167; cv=none; b=H+Rhwe9a5aIhdk6q7svrgxPURgT2GDDXovYosbEEOth1gh4GtNQO2bSecppt/W1wJcw1d29nDatBUryoq/WqaNS8l8pdvpKUgxLQEyvDW4OT2liVyFJo8V3Icozo2Ah7KE2CMf4sEhaoWwue0qW/sQexiejpq3mt3GlElytRPIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772707167; c=relaxed/simple;
	bh=OekR61VRyBz1ZxSwRgB3EOryqIwpBFk7xMHZIHmCWYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sxFNABcM1kej83nMkXBr2EOhtiovfSk1oVi3v49bin6Zol9OtdmvnG4KwbXIH61WDHvR89Xx4kOmW6k1C5bJkwhSqb2H3gIZ8L4puNT/8NyCxhxFpA8xDwQ9S78sy0Jf5RNWFZy3mckmJSW/wq+Co3J9/fG6a+nvcE8vJO0XmlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lFNud7rC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lFNud7rC"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48375f10628so52761925e9.1
        for <linux-staging@lists.linux.dev>; Thu, 05 Mar 2026 02:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772707163; x=1773311963; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qpH8AORv8wOGrawwCQPjEz0tJJtFs8NBUEs7VV6J7BY=;
        b=lFNud7rC09bTmc3TwAReQ8GWJuwVhAROPh/NyWn11XliMmK+8HsMKinxqMQUQbdbHl
         xjM3Vv27/uxujjkW31MkSehXig+CiHDY8AUM7oXPWbXHppJR4ATsBtXZhFnKu1ua6rcg
         KK4o88EV4/97bVB3gcDseEO18vcrjuz32502pqQU0jpyZ1RFIoW6J6gG+GJHXW/l3orh
         I5F0goPM4G1k5LxT8wkvu/IkrXEYB86LEUfSO/25Icn3DkKoTaifwGvl86iCgkr26pwf
         1nE23z1OUQ64EAKHjJELP1M6cPD7k6Gdoxolb/KSvYUZ0VpnxggVqEGhvPgZZLtjPL6G
         OuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772707163; x=1773311963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpH8AORv8wOGrawwCQPjEz0tJJtFs8NBUEs7VV6J7BY=;
        b=nxR7VbKM7reKXDsnu9CXQ1Q8xQ5Css0ksGtrJaRRAVWTKi9+w4DMW5AO0SxDRtHD44
         /2uPQukcJRH2vwhUbi/BtOnWLqeNGZKhQGFlOIqs1a3YJ84jCHLuTHBRTTlwbuxj3xvV
         554K5ek4N/3avVg6mieraBJQoCcZIckVPUYPB8GjWcpI1vXksmt0WwCmRywv1h+rLvcq
         WJ6zJpRWAYktg8AnLfPbBJQa838waLOTQzj5Q2a2rMA5PcxPo+MDalvuqVmy/3+rGnve
         mh9sAT9CBtOypGNujoPvuXoIicw7cboqytLW16ICdKWHgdA+z2h7dRHk+WDUW2OVT6+W
         xO8w==
X-Forwarded-Encrypted: i=1; AJvYcCU8euzsO42sGDMDuZwLML+hchOQMMtbRPIsh+w1FM1aqB6v28GVZuCYL1Q7AruhQvP9SoG6cJsU8vLvyb8T@lists.linux.dev
X-Gm-Message-State: AOJu0YxWgsU1DmeDzjEjzjR+w5xmcwzXqWMJovmsPL8DZlXA1ZJtMXSr
	4QZylGztSywORfHyFNVDwJQu4JByQH20EGP0Eu3ibALncpGV3p2aqutY+ixBePcyrV8=
X-Gm-Gg: ATEYQzyuG3AEm/t4quvUXigH8hXgU/JHvg/WI4mvnycgB1XJ7gQFxZMlz/TMkH0x9Z2
	MFBSJVU/PDtQDWbsOwkNczCU6wFQpIUNEKtRkcp0CxeumqzLeZqxyfBX3SH/rYmcEBg9KDw2DZV
	a1cbWyHzdFOmsW96cIrBNEja+j41KwvMLbAyOvWsCrwyT87qirr6LJkC96dhXofsaGxZG7vZwuZ
	bP40xozsB8LgPb5OhFBKda/UUMbwTL5X5f/U8aPVD8OfgHJEH2hmdvo8gdPLGk0NnQ5v6QAD3U6
	ddCXOoSZeMCMZBZEDv+SmjyLmDQxsdiSdL2xQPoEUgl1zayeL0JGn15s+6/aTBvCUpz/LCn0RdW
	V2H/pvm0hLAmh2c6POfDjXejAvuHk5ysdnRCnL8xl2/rXM8dY/80cpeT7oHBELSj8sd8agRmpPR
	1k9GMQMlARtwBvY7mrrYxH7gzOzB+r
X-Received: by 2002:a05:600c:4688:b0:47e:e7e5:ff32 with SMTP id 5b1f17b1804b1-485198a3bc4mr81680625e9.34.1772707162805;
        Thu, 05 Mar 2026 02:39:22 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b03db76bsm34310525f8f.18.2026.03.05.02.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 02:39:22 -0800 (PST)
Date: Thu, 5 Mar 2026 13:39:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] staging: rtl8723bs: use kmemdup() in
 rtw_cfg80211_set_wpa_ie
Message-ID: <aaldV-JrxjODWtXF@stanley.mountain>
References: <20260304135914.38286-1-hossu.alexandru@gmail.com>
 <20260305102318.43034-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305102318.43034-1-hossu.alexandru@gmail.com>

On Thu, Mar 05, 2026 at 11:23:18AM +0100, Alexandru Hossu wrote:
> Replace open-coded kzalloc()+memcpy() with kmemdup() to simplify the code.
> 
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---
> v6:
>   - Rebase onto staging-next.
>   - Limit changes to ioctl_cfg80211.c since sdio_ops.c is already fixed there.
>   - Place version notes below the --- line (canonical patch format).
> 

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

