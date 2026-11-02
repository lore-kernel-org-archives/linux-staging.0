Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793652323;
	b=A5fS7EzgyZ9heUcgIVWcXT2Fscsnk+4yvefjiTfEe498Qe+oizy9JOy5cwkSJZofQq9k
	 R+EwFM07PHkKYrtyczA0nXMCbanmxjCV6dEDfqbEbwO0RdcYoHxoo5jB74Gavr4phuGqM
	 hVAozyXGEaQG0CyetYGT47diKMR2Nv9aRkYCa3qA6A7F7BFHRPuHPlarldH8hFKC4x0kE
	 dFaaWXw+2Y/mFai1ElraGYl1WvDula/hOqGTuhmH9HM7W30j9PlbKpbXjyecNz5gzX+gv
	 QJ86DMIciIUsJtHVmuRl1GlTOuxzHlGBdOt9p2eWhx0R2Lq8DG9/K81LN0Cj1HYfbxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793652323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9+4MG/RP98VFJErdCyXbOsA7c3c0RHEevq093WDWxVA=;
	b=o6ttlDQM8+mCUmvzt90xQpWixhXV14n/7BK3BTWLp4lnPTsJowHkJYBaZ48WZw7H01VK
	 WbmSj/+EjuQKEJmBGI918Sj3smej1/UoNErv6fGqYTbWMWvMr8UW7C19fk9CG8qzIA7ZY
	 TCib5KjKOzYMvSHW59AGCQ61TsVl4qU2jrmLUW7TajUDW8KSfLNnOCDc3wdcimgfV3pGt
	 Mae5yDr7hdtMnep5BBaP+o9Y1jcOx3ZHcT/0dP0el4IPp4wZLcwQ86MWN4rCvLFnF1Lip
	 AN/l3ZvwZsnwdhyXRb4PDpbNY4iBwY03ASMFhphmPcteS6T9INkLPFMZ9afaIBbq1jA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iZ9jz4Py;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8FB606A32C
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 20:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E8FB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iZ9jz4Py
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so557982766b.3
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 12:45:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793652317; cv=none;
        d=google.com; s=arc-20260327;
        b=KzmVRe+AuCydkr28ggZJ4xqqaIgpIb7Ah7Ml/rBXd+0nLrCg60YkXKujHDRv1VWZws
         yCpWpAzwl0T7JPtts1nbL0uPUDrUXLeP32j7cbC+c+0w96+FSgVFLWqXTT7Fw7yH4I9+
         paCPbeyFss4HeetLBcqpRA/U9HEosnbTXeeWktFCs/U1f1wKWvOoJXH2PgrSly49n4VJ
         LF1MKyzIX1WLM9yHpDwWkna18FPklKWmaBA46K4IQji4cUex+CRf3tY2O2gXXDrJR5aL
         kL+HhIWSWLinYkmvr2WdSesF3bRXBuwynSnUz3qji05Rt4+BTFyPR+5iSFJ8NpPoCXvf
         nZEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9+4MG/RP98VFJErdCyXbOsA7c3c0RHEevq093WDWxVA=;
        fh=8ybzlCMy/nblH8VmR2ZCkPrZizx4DVc9KaNpkEc4G5E=;
        b=iQe4e7efw1po2qxy/DD6wa1nqlT/id8w7zm9CAErCmNWEIJsuyiNVsTQv5uTNaApo/
         r39LdqZhPbJlRUlLy+/tCFnQzdVi++miiRjJBfnR3lU2nJeFWWkxZTd5iaqSfQHVb0Yn
         qAfdg38Oh2u+RQjL6XR56nAbF1owsoygm9COIwGlJ6O3wuhQb9MjXRYbTOdQAHNQbeyZ
         XW+ds5+U9SccervhgI82JghGLItBnDHbSuWShF90T6lGGxxR8rFuZsAoozugx69qW0AZ
         woe3nGyyTv8JcNxDfBDNUNiWv+Q4a/jHRF9uaDaFTP85oaNVXa8Hw5Lg31Fe1xvdzFOI
         Bm2A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793652317; x=1794257117; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9+4MG/RP98VFJErdCyXbOsA7c3c0RHEevq093WDWxVA=;
        b=iZ9jz4PyY3YAVYKOZW6RW98w9KxHraOD+drU0LG6NSxXN8SZuXRbr6eJSr2eCx+hwQ
         eteT+20cHDpr6Ljm3hWVosA9XHW3IEoVwHRgxCAnbO+1WJr1mkHpsyrfg43SxjdGo0Lb
         MAGdoaTkMRfmweINPWgipISswr3IYNlMvJSke4fdGAitiMqWwMdwXSp5f4ld4vIz20q6
         nJ2u9LG2ZsTGWkG6WLn4lSSFt5oJor3o1ketOGfqEhge2Y72EqNcK55KQfnDtjujSB3o
         PWHpeCx+awXTI+kn8r0XaHiPKKmy1BsI7NJkYzzsPPLleV+MGs9aZEyfnqMW8CRTq/bU
         Qr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652317; x=1794257117;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9+4MG/RP98VFJErdCyXbOsA7c3c0RHEevq093WDWxVA=;
        b=gTbClncwdCJKQ8z7vB8Jqj4agDEHCt5JVI9quFDFmNNFN6mPu840GRJb+6RX8PSu3E
         sa+w5Uj5Myw4TcMW8elNIGPxtuW/SChDTEw4QQFcW84Irt0zCEQKLpXizqS+yC9NsPaA
         7aUXxtfmjgvTH8qAf8OwBFT+Ko3FkXjw5fY/7yQ7g8hSFBemAPlwGlCLtECtlsWQy5vQ
         qwSaaKIQYv4uydW8lwgywZJllUUo4c0zoWYCqm7RdhJgHS2Cm9Rlr29dzdRsgHRgpqcz
         ZWHxZmEtnw1yB80RwiRaRE7cn2fARCZn7EYKrdEl4MIyqiNsOe9Va9QCE09HJiLip4aE
         eIpQ==
X-Forwarded-Encrypted: i=1; AKwUvByLXFmebDkdfKZsmz8dQLmkW3cf5DJZMPHmmRoF/qH8vXqofIW6LzVNbUBIyFKWSSk7WAZdp4hei6h15yGp@lists.linux.dev
X-Gm-Message-State: APuU4Z/aw/IS3tgq7+KcxoTMj4fv0HZKqJsRf3jgFX5nS3FDlsvrhvpY
	A6TKp103j8bdlyH7wZtnk9ZyOWts3A6Tn38oPCqDQGPMMVLc85b2KuczTMM491wNE0gVpdjTp9y
	MkjfUZdy6nEVp/BrlH/5Blea4JchY8gQ=
X-Gm-Gg: AYBFou2p4nj4w/h/+VGKLDSkYP+fUqTmWGvxlmoBCPwgKLsx6kYvSlVkzr6iXPTEoVJ
	+upV7Ich35cOL2cRM+kPlT6L3yJbC39f5+MUpfeAblSNSPHz8ZxfnBymrU0hRFaWTm5aC5JsCqB
	Zi+8fyGufO0xOnQDG2AF5qRhwi6lcXa8We/5C5j94AbxkyBt+bIm/V+ZQxzSiFmzE0Wi3FaYMsW
	KLuv9PogeVB53+d5JSfYAwKXy8n74zsYre5CybZGIvjJjJlIPqB1Bbh9FDab0o1wkOCHAIM0ngK
	AC7Lo8hiJzbIDA9SQ7YEeNnUFHvyTba6qi6v5shAbPO4/PfbeuXTv41RQLKtYdxicpw4E6aMBAY
	QDw4A3xSEPWhnubj04oU9No9LnHg88WNdOyX/ZQuL193PFOiTSH9elQyOtW76jyMI8ku2r5ef19
	OrtoKH7s6BVhBKJL78MEP+yEOwZFjqjkwF7e49ycFvzcHIVjXTHhIf8Qz3kkOwVaftAoDm+C+Rc
	S2t7t4urnQYOpWDLG5qUOG4Pw==
X-Received: by 2002:a17:907:7291:b0:c36:a4b4:b1ed with SMTP id
 a640c23a62f3a-c4ca7a18e9emr1040945766b.11.1793652316563; Mon, 02 Nov 2026
 12:45:16 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261031042315.1122699-1-eric.lee0305@gmail.com>
In-Reply-To: <20261031042315.1122699-1-eric.lee0305@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 2 Nov 2026 22:44:40 +0200
X-Gm-Features: AclHuK9vd6HXpTj_GoBsuPuHc9gsfqa_KIPnkW7tQj01sWOMQhU3GUHBUvE2PZg
Message-ID: <CAHp75VcvKkOmFTtJDHuKCNVUMXgjZLiNqmGcHFKT__dtTt_QJg@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: fix space prohibited before that close parenthesis
To: Eric LI <eric.lee0305@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 6:23=E2=80=AFAM Eric LI <eric.lee0305@gmail.com> wr=
ote:
>
> Clean up the following checkpatch error and warning in fbtft-bus.c.
> drivers/staging/fbtft/fbtft-bus.c:14: WARNING: macros should not use a tr=
ailing semicolon
> drivers/staging/fbtft/fbtft-bus.c:65: ERROR: space prohibited before that=
 close parenthesis ')'
> drivers/staging/fbtft/fbtft-bus.c:67: ERROR: space prohibited before that=
 close parenthesis ')'
>
> The reason of that error is the modifier argument is optional to the
> macro define_fbtft_write_reg. So, even if removing the space before close
> parenthesis, another error "space required after that ','" occurs.
>
> In this fix, I change that modifier argument as optional, so that
> it is both ok to use that macro with or without modifier argument.

It's not a fix, it does not fix anything.
Also study the mailing list archive (lore.kernel.org) to see what
happened to the similar patches in the past.

--=20
With Best Regards,
Andy Shevchenko
