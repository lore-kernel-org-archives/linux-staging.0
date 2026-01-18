Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681E22FFFB5
	for <linux-staging@lists.linux.dev>; Sun, 18 Jan 2026 19:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768764271; cv=none; b=EWuI9vgoIwaCHILXhVcOQjsZA2JFdJUXaF+YlEsKi1rQw9IaqsAMIE9INu/7HL9XKkWbLvTSXK0KMYW1iTCsPt4Mq8q7Ix2FNxIhBH87OkLEFkxZeG/00euiWxsuURaFqoA5e8BSEooDjBRelChhkwlpL4xCL05xEZJVGVsVdYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768764271; c=relaxed/simple;
	bh=NWrUWrvfvd2ogjHDu6/2DfPqsK5vwvdB01FnIvfl6+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oqa4Nu8IMLTqmHgKi8sm+zW6J6SrR0LsGOu00lK0gPtTuLTn2BMr8H6RWW6MqMezKfADNastfpB+hLq8dMR8XGEdC7JEoEyj33xlvIkTlI6GCtBTTvcoIIqFJ0r/rCWFFvZo7nEEya4qUlxgI4oHBqv/eN9cX0kILaJuUKQnhP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jFO3heaV; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jFO3heaV"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4801d98cf39so13827085e9.1
        for <linux-staging@lists.linux.dev>; Sun, 18 Jan 2026 11:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768764267; x=1769369067; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ra6SLH/t+rEiT8DP+rFlCv2teRjrvmsLJoORLmMg1xs=;
        b=jFO3heaVDqbV05gfBgXQJJS881dQOhNCj33VbXzsXLkN/FPvezWRYYMLfjHMyvWKQ7
         4aEraDVOWr4e4h+6qXfvaGldJct4UVOAN0N6tC2rHHgx0XrXXJk8QLzYqdx0094B6VGP
         qxndCYW+0cOikjUvTsPKGejeAx7p6JnAbcEIP8DMdiH0hfCfylfQEAYKXrHuZL5BS9Ox
         ZEm26hnrdPbDU9SPoDlJ1JL+/Qjuse1u2jdm6UFLTnwylmX/I6GdEOobAX1qTaUU5qlP
         UoOhjYEBm58fVciBtFzBFP5k378/VAIfnFmvGEVZ+2iSDIz6JV39T+vAXAE8vyiH2kbP
         8VsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768764267; x=1769369067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ra6SLH/t+rEiT8DP+rFlCv2teRjrvmsLJoORLmMg1xs=;
        b=STBRWW65johhKzLrJGqk1xnWG7mcwodKsrz7GdtGwyvbhRnkcgwMwj3mGWrcFlHr6d
         +NN6oPNJlND/FPZ2N8hv8hOwb4/jgZbgaazJ6iudQnKNAV3h4cUi9aRhidgkltQ6nQF8
         0RxxULWs79+1Pz3U63UNbRb9MdhYk93mBLcoS/KqiCTkCTHv4hiLm9WxvrEpu9cXluZW
         mN75r8Lz5iBnpZH6lzO8knOPGQa/p0RUe3yqZh+cw6PHGT9Jitr3k3qt8bwvVHgLMNtb
         rcccF6vaXNhaMufvh8b87RHp6mpSelhDKaTQya031I/KR/5++pjfJS5hNbwPh096M+eC
         Z2mA==
X-Forwarded-Encrypted: i=1; AJvYcCV4xp5SuG8sRd1iJfXYbcBc4k1U52sXZrSGw5tnfv6JWETojgXa6sO2VVjG+rz9ziJxYNAnjjgeftjD1la9@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2Tf4vVCUvpdgUifG9T9Ew3ioG7rzjlbhBXsAukLle8oGdRARc
	MVbVvgY9JH2cOoSD3cnP2NEKxDJ0sPmMyN1z6Nzw6CyWkJP330+M8owwp1hbIEUZCEc=
X-Gm-Gg: AY/fxX7Z3EHljF4lAqdMP6HybEknrNR6LrWzHzjJh2fnMsBWvErvhEfEG/Ld/nNHuLK
	SdrhBHqLArwadAjvJ0i/GW8ry5n6zQQRBTyY9vM19Z2E7W/WgZymfXfIxBTw07SGJMG7sJzDNyR
	WWSVA/DtZsBnxrccv+Ls9Io3Fir7gEM46JBlPDnCu8gYrAABrrTdBu7fV9xwSmkSgyk4ZKJtR1W
	YqCmIccBGGUIb899xSwSIJ9o5GIoTRvDhrEs9wGDt7z3EIvFMgDoGR+Wrd6ao4Iq9m2n9DRa21W
	gW0V5NpIrDGmEBK9HdNJE2IXqPr2Sr0d1cvgB9GNNacPwags3lWhKo7n/rUKEOUQJoXA+vm+UjL
	cpJDIfq/8CIcDdgTLQZkRP6Pd77qAlXa213lRCj4ueNAvuYPcEfGtkFzkbCRuDkT+9hhPWqk1v0
	nO4P8Xx8STMV47os26
X-Received: by 2002:a05:600c:6206:b0:477:8b77:155f with SMTP id 5b1f17b1804b1-4801eab5255mr121890255e9.8.1768764267173;
        Sun, 18 Jan 2026 11:24:27 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996cefdsm18021683f8f.24.2026.01.18.11.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 11:24:26 -0800 (PST)
Date: Sun, 18 Jan 2026 22:24:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: shinsj4653@gmail.com
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, nadzya.info@gmail.com
Subject: Re: [PATCH] staging: vme_user: fix missing blank line after
 declarations
Message-ID: <aW0zaMndlZeghsqM@stanley.mountain>
References: <20260118161954.80672-1-shinsj4653@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260118161954.80672-1-shinsj4653@gmail.com>

On Sun, Jan 18, 2026 at 11:19:54AM -0500, shinsj4653@gmail.com wrote:
> From: shinsj4653 <shinsj4653@gmail.com>
> 
> This patch fixes a coding style issue reported by checkpatch.pl:
> "WARNING: Missing a blank line after declarations"
> 
> A blank line is added to separate the variable declaration from
> the code logic, improving readability.
> 
> Signed-off-by: shinsj4653 <shinsj4653@gmail.com>

Use a real name, please.

> ---
>  drivers/staging/vme_user/vme_fake.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
> index 731fbba17dfd..55c00e1d162d 100644
> --- a/drivers/staging/vme_user/vme_fake.c
> +++ b/drivers/staging/vme_user/vme_fake.c
> @@ -67,6 +67,7 @@ struct fake_driver {
>  	unsigned long long lm_base;
>  	u32 lm_aspace;
>  	u32 lm_cycle;
> +

This is a bug in checkpatch.pl.  Try to fix checkpatch instead or
otherwise just ignore it when checkpatch is wrong.  The rules is that
when there is a declaration block at the start of a function then there
is a blank line between the declarations and the code.  Here, we're not
inside a function so something went wrong.

regards,
dan carpenter

