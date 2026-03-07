Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386B8AD2C
	for <linux-staging@lists.linux.dev>; Sat,  7 Mar 2026 14:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772894384; cv=none; b=itstI7Auumah/keMVTOW5ENAdgX8+lgVTgq3qxvSNR5As89e6XMv9qyNXq6YUGCX6vjx5x8s58utBYj7OK4nZF9NVdoCJzU+ODMmBO2/NehSJytDOlSGJRAh7jWRd5eVSflF5q0GIGBVpSyGamCq+lKK3PKlSMnxrAJsgQWu5kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772894384; c=relaxed/simple;
	bh=BARth34Yph1cf5m0V/wl5J3UZE1mf+ZrtvgNTrr9e7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZNvwcMfztfPbhJgVAzfAp7aDlV5zyW7bOntFaUqMysSv2JthIuSdZ207vpB9wsAhnby7aU54hfcVPRIjXPcX5UnoJw8t39P+nYuh3Y43ISvv2DyR1jWAA0dTmQBU23vz9T2lwk/0b7W359LhHUfCiuOqRP8IMngAq7lW0XNgPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pn6xKb8o; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pn6xKb8o"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-660b497acd1so6325522a12.0
        for <linux-staging@lists.linux.dev>; Sat, 07 Mar 2026 06:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772894381; x=1773499181; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hpCq+Q4/Fku+DsEBvJwO7OxmVZJajB6rcPiIWQF8jOw=;
        b=Pn6xKb8o8Lmc/itVqctTwT1V6qtR622R7jryGombiInGICJcV9jSYO19xBH62jsJF7
         w9JwSwEV+HmWu0RggIb/WexMNOh+tPv3jgIKtmTkClLH23UVOm73GsJa5x0gEULXTJDJ
         8a7wShTp+X2xL9JLGagyE+4PKz013vtLHeZm3Q1AKm7DYSPAcXSbTj0kWOJclPhV4QPa
         02npHMGOmKUWtnH6BSZ82jpDozTiTuHyNXIAU41vo6Opd/Ot17GOCYrzQwcEmCzroQRW
         0ghXPgXtfdwQ4bIGXCXkn5NxYkqoc5dqz6q/taH5v6318nt0aK1ZYD4kxy+XdBrfqX7U
         qiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772894381; x=1773499181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hpCq+Q4/Fku+DsEBvJwO7OxmVZJajB6rcPiIWQF8jOw=;
        b=eR9MIN+bStmX1BddKP7O0vrqEZ1iMPFmvx7F8J3OQ42B0hfuPLYwoLPmZTtmju9YWy
         WfixPPQUxpfNapsRYhlNDLSUzskVpBQuAIVMXBrdtFH/7Oosz4hZoxvkaLmo/sNINW5C
         sWCBycCMNLdTOf02DcciPDLsiVs7aikUz8CR+10Cum25AnlcG126OQPpyjZQJhV4WxkI
         PsCsyFgHGP/DbC/KtucHa8+9f1u0T0QFrB4/twh6OPWZw1AFUIzRq8bfTLppW1UOPAfK
         qecsXsANcXcQKE+NfbQPfAd3AL6AXTM/3CfZ6niq4pfpy81IkFu52F6wh0OcLiYalgWe
         BKBw==
X-Forwarded-Encrypted: i=1; AJvYcCUtFhVGxVeg1sI2y+vNjNKaVDfVEWPJbXKPLZslAht6nihddNi0+cZIwd09o2oE9OId1tW6CSj8glLLDC/4@lists.linux.dev
X-Gm-Message-State: AOJu0YzN5KywAb7h+XysrKVxtiMTOwOmIv+y62CCxUC2Ac7s9Smobh86
	U4FUVE9Hu3nZxxS4Iz7v5Bq0Cd7HzB3nBaSk2PN5KFg1JmkHGfnsrI8QpoyxJ3IWemc=
X-Gm-Gg: ATEYQzxfghra/SPvtTppDMSZonmt5hMtqSUHB6KlmFFx8yVjo1GcVoaG6rP7UBQagt7
	0ou10KiJLLIBZcwJY8+uB6jl1zF6Py3/ya2/Z7rjq/4GnaHufjuecwShXchp11ouRHzOAFAyOlR
	VanTR9nYZB2Rrrp7URyoe1DCdyIgOhG9Ly2QNwOGoQfPOB2ZXus9TaihD9tkxT5FZIQPkPpfHGx
	HNxY1YkuKCEntWYxKVVdVo0f5YfSk50hdpOHMFFzWYjw7OQBTLDev9gigzI1KFPEvfSgoWuZHOV
	je7aPUBiN7XNpfxlxjs2JhglkF6L6um+bUAceaKcCMRRagaN8Y/vYjtwBBPAnSh6IZY1fPf2O2D
	58lcYwr9UrqxUugXJAD2ViRhWNqZP3UTZEnDmIPE1UF2POUZ/p8GHf9TthlvhWOQ4VBcyAzoiDu
	k6wwWQoew1zobCt194a3NsPlscjNE7
X-Received: by 2002:a05:6402:268c:b0:661:93ed:cebf with SMTP id 4fb4d7f45d1cf-6619d51a156mr3250392a12.25.1772894381431;
        Sat, 07 Mar 2026 06:39:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a55a660csm1248151a12.33.2026.03.07.06.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 06:39:40 -0800 (PST)
Date: Sat, 7 Mar 2026 17:39:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rachit Dhar <rchtdhr@gmail.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] staging: greybus: resolved checkpatch checks for
 light.c
Message-ID: <aaw4qSHE8c_YE_mn@stanley.mountain>
References: <20260307140930.1732-1-rchtdhr@gmail.com>
 <20260307140930.1732-3-rchtdhr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307140930.1732-3-rchtdhr@gmail.com>

On Sat, Mar 07, 2026 at 02:09:25PM +0000, Rachit Dhar wrote:
> Added comments to mutex declarations, to resolve the associated checkpatch.pl checks:
> 
> CHECK: struct mutex definition without comment
> +       struct mutex                    lock;
> 
> CHECK: struct mutex definition without comment
> +       struct mutex            lights_lock;
> 
> Signed-off-by: Rachit Dhar <rchtdhr@gmail.com>

These kinds of things require more than a two word explanation.  It
should probably be a paragraph.  But first do a proper review of the
locking.  When do we start needing to worry about concurrent accesses?
How is it accessed?  What would happen if the locking were not there?
Is the unregister sequence correct?

regards,
dan carpenter

