Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71ACD2E040E
	for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 10:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770891229; cv=none; b=Fv4cLRcGCcOQWJPCwrlWWxDoAz5miwTABP1fxXMYh9lYPMEML++zjEfq0MKpGYCVmHEOsNMxVfWse1wGuu6PuGdzvHMXsI2CposhNGOaUecx2qytMX3+cQLjZBex+WYK4yoI5l3jMKYWAYugO7xpqwcNOiqR+XBIDKuB21L+Cn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770891229; c=relaxed/simple;
	bh=3MSidW44q464Z8alG+qVBm1Ulap/yrSMRoMM5gJaXNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2P92EN+NbtM9QOaqoJH+caT9aDdKlypv5GSo/FafiVcvA0M28KhNSuJq/886F6Y/yaztfbyfr1TjWisuH6WbHgPlhQzc3C/WP7otoHR5uPhXJAC+AsMcM6pWukkW+SXE0M9NP0XjJjp9kxB5JnY2FZC/1jvH3NjsMqBnmZ22Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HpfDWTGm; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HpfDWTGm"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so60459515e9.3
        for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 02:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770891227; x=1771496027; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yYNO6gMuouM67BRrJSaKOZMx38WmQmF67AYgzDtgK0I=;
        b=HpfDWTGms01+bQcsBgONcWbGNW5j4gtPBeNTypR2m9uewDJXzuHtfi+OugLzgh5Mfj
         Ts0lopX5+uVVUyeZEDYu+9Flda9K3miv5gKeQbpitgVo3kf3S9jbCWf/CjmYQXyQH5J3
         dak/IfcmLfTVt1w7FNrPck9VVOpHFYCo5GA9s9pkEWLVHgKXI//XNh2P84Ck/jUj+zRY
         T+29Eno0zqAOSCkzkA1iedxVZPa0f1W/cuFJMxP4JzUvSwI6acik3lW3faWFs3919W2L
         dIEWY4Yi5SSTkt5xE3F/kiy33FoAjmj535BnS+eyLs+LhAAe7Tpraa/xmjTy/ZwfAsAU
         VxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770891227; x=1771496027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYNO6gMuouM67BRrJSaKOZMx38WmQmF67AYgzDtgK0I=;
        b=TSMUIULQRJIZvnePHBNLglCzPnMFrRgSoWFTgo4t0tXF+Nd2tJKnc0m8LlChCyhw9b
         +h6v+Y9S3heV9lGEwUP2pla/Pdu6JMkxPlH7NOfNssdG3yTmw6fzc2sboedV9qEOsU+K
         r9o9DSr16oIgqE+SEaBkOS6UhUFELQbKEnSxr+Zsi8/Q9m004HzOZQJkJkhYGdf0ziEg
         JF05e89PtAMoqXw9TeGjw4B23S35ZxOdz0tdO7yQEt0bfL1UqmvHhIH9QWyOVULpe0Ey
         C1D9LLXMHhhPmbcpU84N/8H38PISnoOmB6Glb252iO5ogg5XrGlGru1u/fcBPXOTC5MC
         OjtA==
X-Forwarded-Encrypted: i=1; AJvYcCVOFKD54xfB44D+JQ7VIMMEBh5VIW0cXEcDYgVFh2ue1i5g8i4M+BEeuc0nU8O0f2SWk+pG9mqagG/VAQm2@lists.linux.dev
X-Gm-Message-State: AOJu0YwVmOyFY6reZmjNoODQWpuPBkvyOeHB7BdrKeoB++5BSrT6stRH
	WLG6lMBe470btlCcvtn4zjtcAWD+d+WmdFBuJFEIbOKhvm6NKNr6ZsyiJwOSHX7g5kc=
X-Gm-Gg: AZuq6aJSViOMkUR+1F+prGXi82EMvFca0Vufg9YL6DJPYlGzeJrNl65FdB4tZhXcyMz
	L/i5yfImwZt2W2VHDUlf8rzHJedDqkAE48Ma+k35KmBW8D+aNi7GI5Yom2wkJbiwhvMfBJ/Xm0J
	W8g8D8mx/Gpghirs4IdlskwLW8ABzWJwNv4m6dTsMhgnA8IpPUar7bmZABNAxMUDAfPWPDu0XwF
	dGWcoXU+OCF86N3FAgHDvbfD5mAPJsoGxOS1mFyijc/UVNjWegJvN6+kFddslDEQtpu1OH6MuZW
	0Oz08STTlRNMqJHq8B0vDSYk4HG8PJmloCxYAHQJ5gXqHet7UjdSVYdTsmdFiMO8kIZ/GMY7ch1
	pUNORu1rxOS19VVqp8lWN7dm+ksrjs6vnC3m6DDmWU/Kmo8uO04oY5Ikra209PwQa5w32+LBLIj
	0wZPrdEhz+lnRd00FX4BcYxcJaBCSI
X-Received: by 2002:a05:600c:c494:b0:480:25ae:9993 with SMTP id 5b1f17b1804b1-4836570df9bmr24783715e9.20.1770891226720;
        Thu, 12 Feb 2026 02:13:46 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783d46f9csm10677577f8f.10.2026.02.12.02.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 02:13:46 -0800 (PST)
Date: Thu, 12 Feb 2026 13:13:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: RachelOvrani <rachel.ovrani@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750fb: Rename nDirection to new_direction
Message-ID: <aY2n12yxgH_wnMFM@stanley.mountain>
References: <20260212095715.2844-1-rachel.ovrani@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212095715.2844-1-rachel.ovrani@gmail.com>

On Thu, Feb 12, 2026 at 11:57:15AM +0200, RachelOvrani wrote:
> Convert the variable 'nDirection' to 'new_direction'
> in drivers/staging/sm750fb/sm750_accel.c to comply
> with Linux kernel coding style guidelines.
> 
> The variable holds a newly calculated direction value,
> so 'new_direction' makes the intent clearer than 'n_direction'.
> 
> Checked with checkpatch.pl --strict: no warnings, no errors

Don't include this sort of thing in the patch description.

> 
> Signed-off-by: RachelOvrani <rachel.ovrani@gmail.com>
> ---

This patch assumes we applied that previous patch but we won't.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

