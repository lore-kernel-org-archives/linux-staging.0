Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C18821257E
	for <linux-staging@lists.linux.dev>; Wed, 10 Jun 2026 00:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781053110; cv=pass; b=iieSV7c3D6U8k2UXodxYpdo1Fjzm4HVYKhZA+1YYv1IuLAxGrr6xvLv+hd2kfaLBI6iGoR1CnPii57VBgoUnIssnVdsGztgNGwTo6Txs/I/Nt6+LX4MEt5AWb7iFxNgzCyI5EsUxt9bQ8HKIUOF4nV6+J5uLvKRC3KvHydgpjQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781053110; c=relaxed/simple;
	bh=Tpl6l8U6i2ihTMI8RqZ3xiY20L9OW4IKGRcDKrG5+6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mN/cGuDI76YLNE24ECiYay+yGr7TSRWhx2LVNmjyD4bkItCfU5kpZC78qHbTt8fn0Ikn77aYFDMHNwE5rzNIjXgcxHzXzZigYEFy7Mz13+Iw57BquzIL+gI4CI8tBFrjiiilE07wX9eVbMrzLeZjsbMTxPZZpOfJWsgqllse1a4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xsw9HcVy; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xsw9HcVy"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bf1141c26ecso771744266b.0
        for <linux-staging@lists.linux.dev>; Tue, 09 Jun 2026 17:58:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781053107; cv=none;
        d=google.com; s=arc-20240605;
        b=OoE/Akt5Jdg6dijEzmdU9kdhfVgsgP75vFe9l0YO3bijFJ++Ezsw34amEHZgUX8LPI
         tKLHaZu8MqA0TpnP1dhBTHUrT48prRzuJ/KdSNu2juizNHVYcBg9sWr9Dg+9qMIEPTdh
         NmSg8Z6dxOBfYn523BiLfIBvfwy3LPuoRTq6xbJCejCgLoox/scRR+GDji9Pf+nGGj81
         55UmHKRFUFU73QA2FRnKYuAKIeUIsPAaT6uJXAVVLkal4TVl6oZkHBlS7ISWCC3Inda6
         LWSvfbihKI6JqlYkZk7rVtDVRwMMX694x8vTVdcYXD5aS/AO7qXT+ghU5b1Kwd82vh9W
         Mt1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Tpl6l8U6i2ihTMI8RqZ3xiY20L9OW4IKGRcDKrG5+6Q=;
        fh=xSsqTReSAAVhrnEZvQEoCpUsXaFY3Vs/pHMozOHWwlM=;
        b=SenRDYQupqj4rVZo7Bi583kagaMeKnEHEAYRkMs4y0USUG/a6DYaMzlkDK8rRQyRUR
         OqyhvG0ta3BNfAKUlksFtHgOydJI4oufa/naUNebPgxcbkfrSXrPhvt+9qK0DWoFFkev
         U73f79R0ipGRj/G+zNoKpq+kPsM1923qCvYIicgdAArH3HYwsKtQrbqwTkzMx5RmoiGm
         ZtKTCtL+lE4ErQq9GNSVD+SHV7xAFfgKNqPTDSWWN4onGK/p+TNP2pgWfh9ta4nQw594
         bF9+3gyE+EU0YGsk+hLNtP79SBGAk5q+orbDYXpoqiEp5LdXmgrIvRP6Ges95weKHMEa
         Vo8Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781053107; x=1781657907; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tpl6l8U6i2ihTMI8RqZ3xiY20L9OW4IKGRcDKrG5+6Q=;
        b=Xsw9HcVyNg7j1i0ox9g2a0nYhlQipxWJO6F1dqWS5so7uvF0LMZwDK4kRX8GUUDvlx
         btJHaFKaLpQC8SQcH1HWmbAFKv/OeeRla67rUtq3GpUNANskYG2vEa9DRfAqF8pM5lZJ
         B4ob7wQ2jOmoE65VARAvLTzkL+qrVH7LA5yyHYbEm92S+WOSK2ESaqmqZudDeY4QZwJo
         gxCbtl0t5Jx9MAvgijyXpUO8hoAbqkLFDn3KWMw2/GbzeERw3nmRjidzuW5F4vmXM6Rq
         rEEnI31s1Uu2ZhWkT48ab1Nj7m+1Ca41L7zFHWgvA8MPiLhxqrR7GboO4r1dP30Uvnsu
         KyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781053107; x=1781657907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tpl6l8U6i2ihTMI8RqZ3xiY20L9OW4IKGRcDKrG5+6Q=;
        b=Wb22K5WhIqDnL1HH8isT07YSluremVSmg/2qb6b4RhOuBPt7t/c5GJMFkgCxzn31zr
         FYN2bznaPo0/VFkUdJEDicNYU/feahapTppUVzlgg36ncJdxsIy6ZXBF4zxpvjuW3QH9
         964in+cc37CD6ryG+0LENvEAg2odDrezKA3hNrT0KEjT4fIgu/WxvTugW1kh6A2D672m
         4V3P02GAbrPnMrdyLZDNpgAAH2ror2Yeq3zx+RXJRnReiFTt9Bf3C5Gf8ff40ZZt2iEH
         xD98guYrK00/59CUaW0NRhLN4vGE/w8TFhSfJ1be/VtE+wv6/kER+/m5D0Fu+3BmPZb6
         KgBA==
X-Forwarded-Encrypted: i=1; AFNElJ+4K2hY4CT7s3pY2Y9rX+Zbzzk6lf+526uZ08H8WjkLWPUn70NUy3gZep/PuqkOaISorBEL8t9+eEihVlAu@lists.linux.dev
X-Gm-Message-State: AOJu0YwOqEMhYkTYPj6O26DUyr6BvFVCmCraX6+wlD0ylEIgqGLqGV7g
	xJvaysAerJeWMty+dICnQsBfx1yr4ZeeFhK6TMcIQvgEKOzEiWqEdHJPaozw8uP31KIaO+iLXPk
	yOkOOS0mI2QuS0z9kwxt4rO7ZbYpEaDQ=
X-Gm-Gg: Acq92OGZpx8Db/j96Lo6YgJnusdhYeyaf012r51E6XSz/CuBCRuGiBFhrSSWvxGYdhg
	63kI5R10TO+oyTyU9TcQ8gFQVc7jWmOCJvpGdVH0zMjB8ij/HUUkLMHIvaTZjFa8qzDPWI77eAe
	rvuwaVYi74qIrYMylFCTno21Nogl4lzlUmkewUPojxHYb/BaCaE8wBHsBPay/qzxiEezORo9TWX
	RV1cEvrkbSvE/QMY4dsCfm8UUH8txeN8AqJPSMv1vbf+3JgeyYtkJtWMOkJLrUl324dxXWhktke
	oLuPFNXZCP3ePVPttVxrj18l6jG8mWCJMw==
X-Received: by 2002:a17:906:8a76:b0:bec:da5b:5a6 with SMTP id
 a640c23a62f3a-bf370e6215fmr809390966b.21.1781053107289; Tue, 09 Jun 2026
 17:58:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260609011736.17401-1-brockhaftner@gmail.com> <0d8d9f38-3cce-4da2-9ba8-f8e99f7b4dee@sezginduran.net>
In-Reply-To: <0d8d9f38-3cce-4da2-9ba8-f8e99f7b4dee@sezginduran.net>
From: Brock Haftner <brockhaftner@gmail.com>
Date: Tue, 9 Jun 2026 17:58:15 -0700
X-Gm-Features: AVVi8CeMcVJS6rxYbZttj4-L01-KcgRMD-E04JG978tAB95OThDR-UKWQ5st8N4
Message-ID: <CAAYiRaNgyHvtd34H1hR8wQk_5NYRB92QsnOWe9810mNYiZ6+8g@mail.gmail.com>
Subject: Re: [PATCH] staging: sm750fb: make g_fbmode array const
To: Ahmet Sezgin Duran <ahmet@sezginduran.net>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Teddy Wang <teddy.wang@siliconmotion.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, outreachy@lists.linux.dev, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 6/8/26, Ahmet Sezgin Duran wrote:
> Did you compile this patch while enabling sm750fb driver in the config?

No, I did not. I apologize for the mistake.
I ran make drivers/staging/sm750fb/ prior to submitting, however I
failed to realize the driver was not enabled in my .config.

Cheers,
Brock
