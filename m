Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6253319C546
	for <linux-staging@lists.linux.dev>; Mon,  1 Sep 2025 11:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756726435; cv=none; b=CPSch63XKlUEDfhtVAQCZFT/0uPIx2WhG4WnbtceLs0wJE9zhu78WAVvAV4ZnwQ6qanvdhvM5jRjGBv4kfXZVeN3CX7suurxeoUpbsAh78j/ltuIBqv+TmwAfBsK7wqwtO+qvh/bjyLIzwv0BSL9wyRxXwWYUr+thJtmiCkJlY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756726435; c=relaxed/simple;
	bh=NLO1dCIv2EF5Y/31u0lOX1YkMwC+8fc1J9seaeU96G4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fgqpViT79quZdiqdfT7YDaYzfMvTwhnCL7BkV/ELF9owOW0HuBqawyfF5Q6MgILOkMDciYNku0huGCLc6g6awB/ZeYSX7gxLxtEFEqxX8n3o0/RmSk5fdIbonYlGwVZcyIawyAqzpIvQS+gIDGwdWe772prKPC4yxBnJlY/GO0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qt7Qwe5y; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qt7Qwe5y"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b83ae1734so14878765e9.0
        for <linux-staging@lists.linux.dev>; Mon, 01 Sep 2025 04:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756726432; x=1757331232; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EaGLia0ZyDDZwtKndRyXXNbGsxcdHRQLopkYwbNyjyQ=;
        b=qt7Qwe5yp0BR5uydc3vjbstpVnmBUeFJWrfE3FcBDe3y0GMgZYbeoaLbBOw2l2URYV
         oos0ci68GekQDeoTQ4ch3jqTysiD3a8VMNLsAapPHNnBhEbJDxjaduovYGLSCF9rRnL6
         YRT2DKuBOOEXYDng2lknzF0zYugM4VeddFcq4SQZ2Q0nqFmYUSBK3QS5IzoevPQzNVZn
         Coxm0/ZYwoHdKxbNpc26XQpBEM9MI742dkUGqipuGwQbdZEYs0IPiXBMp4RWYRIjRlv7
         lvTl63s0H5Elqns9wmh2USOpWCrbPLiL9IS0Yf46v/Z6KvzqxSNCA3zLa2rdqgaj2Uga
         2K8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756726432; x=1757331232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaGLia0ZyDDZwtKndRyXXNbGsxcdHRQLopkYwbNyjyQ=;
        b=faBoCN5KTPizCE7EnoSNEF6RVR6/pPYD+SvEtZ++b8CcGTGJjVIMy9AWgFuvHp/q0+
         9MEcceAeTR1TS8vVGmlsnt3lzXgM8/pv8aXZBUos3eOOlJBFnbohzabO4AEVlzsdnxqb
         h+ouLDIb+T24VUnv383i7LmKbv71Zb3VS6j3pJJJJdJoJWmggo44E8L+yVTC+at0qSwt
         VMZFX6+hk4EZY7liCSvl+Mk9dmY/H0zIpFELqxSsR4ANUfaowhJlL0GM2Pa40zf7CP6j
         ckcEieJPsiXg9Le0rsdA9hXxnRvshCm/o4+DNNjtTy8wB8iOXRIB7F0WNEcirpEpL82C
         SvRg==
X-Forwarded-Encrypted: i=1; AJvYcCW/DFoeOZ9g+R5v215aLw3TON+Gj8Pn4aBJN1+IO5i0gZxmW9UHiM3bcbMl0MOab+z856T8ComTcDK3t/1o@lists.linux.dev
X-Gm-Message-State: AOJu0YzRyensaMwJpP/kb0qJ8u3c2N/PJlHqtn2wUAsfrrVdzbqruzGG
	BlU1yk6+kDmA3jG6pi0b5LrYwlTpSdNi3sVd4sHIM6hdSCXiIyAh4gsU+3dB7LFpVns=
X-Gm-Gg: ASbGncvJg/unoCy6Me2JjdUAKTV8glremjdzS5k5mNFE/mU42yzciMH+u/ZsYvaan4f
	Zw/nGD1Z76UT9ttZ0yyQ/KGZNfCA/inPm4K2TGh84NLJjciFLSCW+Tt22HnzYXPiY/Cc02asYRQ
	sRVMoyfKW2L8blp/XZL6/oYK201kZK8yq2OqigmscD0bbuPZRtp7lB2O6xLKNla4w3j749Wu03k
	6dZKuUMrGje2qqJRKuNUnWCQeu77KQeIbQ598OpH9dLh8pfGIolZYhO30F5Uj3sPZuRili8NRNy
	+iW14CZuV9gLpsR6GMiZpvAqXwFJVf7VGeg9E4ZFGflz1agL1ZN0JYYtJwluccBheAZ29UTFVa+
	xXaBuU1peL0qrYN+k6Ptw266i9CWAPB4f26kRJQ==
X-Google-Smtp-Source: AGHT+IHlZsFA6bO5PL525W9kRFa10Ed6TtJv6bjUkL/ZCgjzMq2fAWcbrEpWZ54ZlAQ/b0gIQUe8sg==
X-Received: by 2002:a05:600c:a0a:b0:456:1824:4808 with SMTP id 5b1f17b1804b1-45b855aeb67mr56578155e9.32.1756726431637;
        Mon, 01 Sep 2025 04:33:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b66f2041fsm141251905e9.5.2025.09.01.04.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 04:33:50 -0700 (PDT)
Date: Mon, 1 Sep 2025 14:33:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Masaharu Noguchi <nogunix@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	florian.fainelli@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com,
	hverkuil@kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: greybus: audio_topology: avoid
 -Wformat-truncation
Message-ID: <aLWEm2sQpmoNYLAC@stanley.mountain>
References: <20250830173850.323897-1-nogunix@gmail.com>
 <20250830173850.323897-2-nogunix@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830173850.323897-2-nogunix@gmail.com>

On Sun, Aug 31, 2025 at 02:38:49AM +0900, Masaharu Noguchi wrote:
>     - Fix -Wformat-truncation when prefixing device id to widget/control
>       names.
>     - Write the prefix with scnprintf() and copy the remainder with
>       strscpy().
>     - This avoids potential truncation and satisfies W=1 builds in
>       drivers/staging/greybus.
> 
> Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
> ---
>  drivers/staging/greybus/audio_topology.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
> index 6ca938dca4fd..5bf8b5e29dd8 100644
> --- a/drivers/staging/greybus/audio_topology.c
> +++ b/drivers/staging/greybus/audio_topology.c
> @@ -1013,7 +1013,7 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
>  				      struct snd_soc_dapm_widget *dw,
>  				      struct gb_audio_widget *w, int *w_size)
>  {
> -	int i, ret, csize;
> +	int i, ret, csize, n;
>  	struct snd_kcontrol_new *widget_kctls;
>  	struct gb_audio_control *curr;
>  	struct gbaudio_control *control, *_control;
> @@ -1087,7 +1087,8 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
>  
>  	/* Prefix dev_id to widget control_name */
>  	strscpy(temp_name, w->name, sizeof(temp_name));
> -	snprintf(w->name, sizeof(w->name), "GB %d %s", module->dev_id, temp_name);
> +	n = scnprintf(w->name, sizeof(w->name), "GB %d ", module->dev_id);
> +	strscpy(w->name + n, temp_name, sizeof(w->name) - n);

The strscpy() doesn't make sense.  If the string doesn't fit then you
can't *force* it to fit with strscpy().  :P

Here we're taking a buffer w->name and adding a prefix at the beginning
of the exact same buffer.  Obviously the result is going to be larger.
The W=1 warning doesn't add any new information...

I feel like these W=1 warnings about string truncation are rarely useful.
These limits are not normally thought out that deeply.  Poeople just say,
"This is probably something like a company name.  Let's say that a
company name is probably 48 characters long."  But really very few company
names are that long.  It's just a rough estimate.

And really it's not the worst thing if these strings are truncated.  Kernel
messages are mostly error messages.  We'll still be able to debug the crash
even if the last couple characters in a really long name are chopped off.

regards,
dan carpenter

