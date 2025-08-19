Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A3D24887E
	for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 06:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755583557; cv=none; b=GUU3N2+zlTTAY39pnJrsCIuwnzryPBBI37USLU7n6oIbKxqy9EZsRHmJvkOFRvcD15TIF0OBdU98R7Kx/l8a08oPxkFsY0ljLdL9F5k/EIE7ghosH/YEqrgCwjhGnjC9UkgB2Lr0pfAcsLWdiscZrZ8yCh8kqVOQDKP2qOHgZ7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755583557; c=relaxed/simple;
	bh=bxPgM7yo/aZAhGNQ4NGGRlw3ruzUcR9O3+5SiEZqKnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CK7jDY7YKkrpexggAkgXAaXC0ljDf4rXyIekpJbwk2M8ELpKxskSjiwI5uaJY05huCMX1GWxMr73HRmSzL+v+Oj4BGQXO4mpKhi59EztJdWnsmrxyRVGyHfPR3IdKNKPkLqlinUQidRfk2/DVwwRK2p1R0Lsu3tAt4moAnTZsr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sizVvwCJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sizVvwCJ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a1b04f8b5so24393535e9.1
        for <linux-staging@lists.linux.dev>; Mon, 18 Aug 2025 23:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755583552; x=1756188352; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyYciVPLbS6snOaAsO4fw3vEl41HECaYwSESuUU0uXk=;
        b=sizVvwCJ1Ct4ErUZ0xCIWCqnuae+h8Di3vRuKKoshvNyAubVP/AlvdCl7ilBAKO8WW
         M3ZSxJhFmjM+vVTUApXYFwgdZE3E9QwdDBzLSj5hZndvQcppMt7RivN/7EY+fsXKQ9xJ
         wdzpGLsO0YGJflZihgueM/WgwhaMl2K6cejEaxEn9X5bKHv2Ua01EyrEvjgWxdHzfQoA
         29onzvlelUcRJujAE7R0czkqGqE0FKSNKx9DoIKy0a+tRJnqRh5qAs8pKz/vrEBKFtx3
         HNSL04c+XO3nfYXsjdNJ9VnlYqdQupI5HOWmH0NAKQdZ6HxApCmASfRKkIzqT7aTEJjQ
         K5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755583552; x=1756188352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZyYciVPLbS6snOaAsO4fw3vEl41HECaYwSESuUU0uXk=;
        b=VL7B49gJ4aYXhfSVe9n8BLgU5K7cbBfga/hO6+iSIEsRwrXuyxOYHF1rmy27iVW6ii
         0/52sc+8XzecTGTwghiruhO5QfYrO/PdRsOvBc71C1cHANMaU+jbv8ERVhxvrVaGe6lr
         C/7MNkKsT9CtRAIktomZ9lCsGJrKVsb7McufH7tqhpxLla+gpfDuwxWR/LdDBWP8O/9Z
         ZTUoEcP+g2UbPTryqJYxyC+B7DYtMd5uNMJ1F/1PiSnJEeMTT3r30zAD0Dt8XiFhno2C
         HPpeN0okhqhWMaMqetfEL5yjAnk2arwBWsV8p7x9TuRAu1SbFqPevAxa+mp25jgYsZj/
         26jA==
X-Forwarded-Encrypted: i=1; AJvYcCWCnUp23Ba2ifIGd5uBUtiL7QEyVPCil5j2FAXtKj1z9b/SK+SLpGe4VPpx6+QtqvFdMGJRFqiTf2X42Mvb@lists.linux.dev
X-Gm-Message-State: AOJu0Yyh0BCQMyZI9sDsPoCj7WAEtq+AfJpEbi9TjqanEQxQOJsDC59y
	vbQT6RTGoyDGrp+efSt2zuM6pEuFNM+eJf3498B8wFngRHJq1/C14MIxHsoofkJwqgA=
X-Gm-Gg: ASbGncu+MMUwTDBst4pb6+hYO+Wfa7HdcmEyHpI8B3CCEPpLiCpmDdXrXnR5/PANQHM
	v2oouRRoQ/WLYjs9K60CtHc7z21Z6oRDm75ZDxw0anxHOSGC1jwfodL00ZhRf9O7nLghDhqweWE
	sMv0cpFh+WMpV53XpvNJUjP4n2NVfxy9GIkKdG4aO4V4Mxp6qypAOWb/L0zKuDtgvFbdMENtVGB
	OwXOjLAOAF7qYGUOh2/xU35nrw83Lowz88Qd+hqCngxCcv5WmbIeLjgdfN1ZRAUsGhCOiHCcnSj
	NvINXiEWbrkkR0t+aPPPxFceYrGFVKFMpMvtf621mpyWBdmauV1aPBpAoCgik3ktcOxgi9YvR1m
	Db078p1EZnwgEq0a+nUZlV8R44IlvnxTQO1HqIw==
X-Google-Smtp-Source: AGHT+IFw2BSNTmQYZsrxAeHUw41R54OQHcFGDyt5cWhAdj18Fb+YQS9GQGDyVsvFlrO93e7In/3Z6A==
X-Received: by 2002:a05:600c:3582:b0:459:db5a:b097 with SMTP id 5b1f17b1804b1-45b43e048e9mr9080665e9.16.1755583552442;
        Mon, 18 Aug 2025 23:05:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a1c6c324fsm194494305e9.1.2025.08.18.23.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 23:05:51 -0700 (PDT)
Date: Tue, 19 Aug 2025 09:05:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mohammed Guermoud <mohammed.guermoud@gmail.com>
Cc: marvin24@gmx.de, gregkh@linuxfoundation.org, ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] staging: nvec: Remove unused NVEC_PHD macro
Message-ID: <aKQUPPlr4hJS1UTe@stanley.mountain>
References: <20250818203855.11914-1-mohammed.guermoud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818203855.11914-1-mohammed.guermoud@gmail.com>

On Mon, Aug 18, 2025 at 09:38:55PM +0100, Mohammed Guermoud wrote:
> The NVEC_PHD macro is a debugging helper that is only enabled when
> NVEC_PS2_DEBUG is defined. As this flag is never defined in the kernel,
> the macro and all of its call sites are dead code.
> 
> As suggested by Greg Kroah-Hartman, removing the code is the cleanest
> solution. This also fixes a build error discovered by the kernel test
> robot after the v1 patch modified the macro's body.

We don't reference v1 here.  We would do it under the --- cut off.

> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508182005.4PiKxXcN-lkp@intel.com/

Don't add these tags.  They're just confusing because we never merged v1.

> Signed-off-by: Mohammed Guermoud <mohammed.guermoud@gmail.com>
> ---
Here you would put a comment like:

v2: version caused a build error.  It's better to just delete the
    code instead of trying to silence the warning.

Please send v3 with a comment:

v3: Fix commit message.
v2: version caused a build error.  It's better to just delete the
    code instead of trying to silence the warning.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

