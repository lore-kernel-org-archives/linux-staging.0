Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1A8E55A
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 01:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773797029; cv=none; b=JHzImWbjlUn4o2tZNC/t9cXYr0X6D4tJ9r0t0vP3HuGkTGia5HYsFAQFFACbW2/SDcs9oyjjgS9Z0285CTNnRSpRPSsNrKbIE/Awti6vs3eDPSqPSb+bulFrcf/bL8eSWBidPEMc4UbscJGS8qzwrt9BwxjZaw1h7/0nuo/Uhjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773797029; c=relaxed/simple;
	bh=R5sx4sFUcOuopX+2DaAPF2eNhj60OdEmbVFMHC2RN5U=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=YolaCHvABoCQc29poInyYwIJMeLhuWqBDa6oZ/pqV80BXi/z/GGkcS/QRSuE0C62mERuxlYXFtFMEUK0adhJHnidI2CEFf7Z9fPPBK0xFU+vQXIs/hxixvE78YN0pdwHjkvudZATiHdWVYnr0qrja6Y2+gjNmKr5mi032r0EwB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rbv91tZD; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rbv91tZD"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79853c0f5b9so50366807b3.0
        for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 18:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773797028; x=1774401828; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5sx4sFUcOuopX+2DaAPF2eNhj60OdEmbVFMHC2RN5U=;
        b=Rbv91tZDaC02GmuZE7xCef/0XZ5IhEMeT3ErycpBfxbr93L6X/HC6AN5Rv0mTPyrgg
         5Xznr4g9A3OClOqXOzA2lUzsNDHqDeFGF8vnm+ivDbm56GUthYQdNjBQlK5V2Bin0W0b
         I7HyXRFP2V1+wkmcYJ91xF78WoMzXuZbZybft0X4Rs09XElpoyOkJuhbXu5YyRTLQHeU
         kt08N7LPEDXr8joyH9EPkK87EdvFYmzK7QlJFK7W+GC1niIU+KJB1OyBMIsG5ig5frU3
         euVKCs+w9V1Eyz8ghFVjGS/1X9McPMHKfT3AwZzm8TMyQnv+C8NpfLjFKufU3UohZV3I
         mpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773797028; x=1774401828;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R5sx4sFUcOuopX+2DaAPF2eNhj60OdEmbVFMHC2RN5U=;
        b=VZQvSrY0JxEwuN+T3dVAHqg//huNjqWUntH/bTiZDBTXTzi7YTg7NNNCqH5THA6XTy
         eNeEZGCXujtGuNCmcT9N+DkPbZXZsESvljzei9tUdP27I/l5LDo37J7bASfhYLjyrTwF
         eATRtXUbYI9od+nmx6ZY4Jf4AC1zblOk59Nu4UyFAYGE344quxf2hBRPsvKbiOtS5gNB
         3Iz1hM1UeBfBjXJu9uao8fbRbIRsM+t6RnsE/GlmEsSTcXHoTdoUeijLUlHPzju4XVfo
         NjGPsnr6emza8Dy7iqiXsmm13S9bw4PbQMtia2Vg/Ll/CW3LcuAYY9FhoV4GEfmRf2JS
         Mx8w==
X-Gm-Message-State: AOJu0YzjoeuLh50+pDgoEMyU9rJXWRBQaGacNWnlPRXbiOZbpyUrxUsk
	8qNCnQpPAkm0aADW/5y0l2BE5IllYchRJH2xfoKx7LNS1traDZTaPSct
X-Gm-Gg: ATEYQzz4XSLoNtAG1gTRw6KXME1zMndOfatCrFmtpQur8f7HwQOoQvirHljRGOLrxTw
	6SXStcY4DwgXxt5d15AL8pwHiFWBgkD1aZ6T/CIpIi9KO3GUQztbI/fgB0yeXt28k9z205sNenb
	fxnnpxxmUupVB4dzWULm2mh5fVKXG4lVg1DQ0nR0r5P1JGwAdcg6R7GjJt3twafoJhxh2V/gfTy
	Yu/YyRYXXblAZ9ySASr4rUJHLht8IguPLVAf+ojK2zsyN7qKfk1a7hH2Ey+7UJim0en8MrObCZ9
	AS/6TA0RNU9a+E8jpGP/Fr/l0j500OjhpS7odvWK5VZw4LiBe07dpl3toL6Fzn0N1ord1Hs25VP
	YEnyZeh5HOvB/M4zzj7ajXI7wYwcyfHOUjyBLYnaORaOG4ARimXzoR0q/R59vwljE40nwd7NNVh
	psdP0Dn0a1HxXz4noZ/gig7mJ+mUhM3LeDX6mHOxXvaWTZowTGvT9O+MRkaDUr67Xi0wVKuaMJL
	wzC+iXnn6w+2lFTvr04/CbMJ6bHJ8UomjSpm5xXI/o=
X-Received: by 2002:a05:690c:dd3:b0:79a:670a:488a with SMTP id 00721157ae682-79a71c5c0d3mr18058287b3.53.1773797027697;
        Tue, 17 Mar 2026 18:23:47 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::f769])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a713cbfe5sm8304747b3.13.2026.03.17.18.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 18:23:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 20:23:46 -0500
Message-Id: <DH5IKGFNEMY9.3GZWGB4I38K0V@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Malavya Raval" <malavyaraval@gmail.com>, <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: coding style cleanup
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <CAJhGtcFQ03WHOq+UOO4FUH==JqvYi=GEP=1L3nY2JYBZYm5J5g@mail.gmail.com>
In-Reply-To: <CAJhGtcFQ03WHOq+UOO4FUH==JqvYi=GEP=1L3nY2JYBZYm5J5g@mail.gmail.com>

On Tue Mar 17, 2026 at 5:14 PM CDT, Malavya Raval wrote:
> Dear Linux Staging Maintainers,
>
> I have performed a series of coding style cleanups on the rtl8723bs stagi=
ng
> driver.
> These changes address multiple checkpatch.pl warnings, including CamelCas=
e
> variable renaming, long line formatting, and missing blank lines to bring
> the code closer to kernel standards.
>
> The changes primarily focus on:
> - Renaming CamelCase variables and macros to snake_case.
> - Cleaning up formatting in rtw_io.c and rtw_cmd.c for readability.
>
> This is my first contribution to the Linux kernel. I hope these cleanups
> are helpful.
>
> Signed-off-by: Malavya Raval <malavyaraval@gmail.com>

This is html, please use plain text emails. Also, where are the changes?
If this was a patch series I believe you forget to send the actual
patches.

Thanks,

ET`
