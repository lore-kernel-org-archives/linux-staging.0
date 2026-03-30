Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC7F3B52E9
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 09:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863335; cv=none; b=T9PVwjikibLzdnWQ1+GcAos5kx8r1iToSzCAubYy9gihU/Sgn+gsllL8KwqFE/4n+37GGJhfiKvbnMWK0Lzubykiwk/c1OAleGA+1ooeyflyECqiHRxoxzRkvjLlAF7Q+AlOz2rvqMVnUXydHYGjflztM/rF1AxQFdo323NfZBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863335; c=relaxed/simple;
	bh=6wPRRpRwz2x53VrR0QuhpMFsnugh4pAk0CBgUyKRH1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bs5m+PvLLz/71Iczeq527SYnIW4SHUyEuUBQwahYbQa0nMpAZ+1o4Myh5ATYzZNLdZvqoZYcLWKCO7HTwdTMpd7QDP3DMEHidnoH48al+yVd8HpahC9Vq9WpNFTrkow5/XI9XAPNOKALZITE7rdyHwTtwenjsFX/fDkhf3n68sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okbYwsMP; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okbYwsMP"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38bd3c6c502so35151501fa.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 02:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774863331; x=1775468131; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DEGfuqxl32v7PBbxgLIMkoQqyZgVqIOPNzYNHtZHgO8=;
        b=okbYwsMPU6ZKJjaTwN8hU36sDD7unD6NIvp+/TldWbJSFmoDWIxAfckJpXX5mcbYh3
         HJ7aVFKa2NsPSC87d+PujxT3yj3IM9eCwXReJ+Mo51tVnwodzdEfzdjtFRvLPhL9mlqZ
         Agar3zePOU0fzGlLKrhXs7R+TmHSPzSeBa7hR8uQmCoOpkaans6Alikg6zBQHm+10GbH
         R9fAURkfKsTqVfLYHBfTzBFwB/AlVfd8urOjUuD2nWNKgQ9IKBkyJXI++ZHVRl+YR11S
         zOID1GUfJgkhUjCzXkmbxN2s1ftoeOK4Ak0GPfOLSsgdfCkm1khecsHbVFtAZxEmSL0j
         s0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863331; x=1775468131;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DEGfuqxl32v7PBbxgLIMkoQqyZgVqIOPNzYNHtZHgO8=;
        b=GlVtAVAP4+qhWJAC0JaK/lgUd8osAVfEle/UAdvctrLiriTt9JO7+It8rRNNMxHoqw
         G8YB/wt3SeeavLWElV9FcvxeuigOqSNY7/aEkUeilNYPLyRJu1qbQtsqr539UTffXECQ
         I4VqidLdoCsmO85U8TzC3KmLy8tAZsQhiynmJeR2slH62gFBZ0yNj94rqfVw11llyyKl
         DKsPovN1b72RARG3vwJqGtrvb8LLDju8v0l6spn6rZXHeeP2pXJp7a/pP0Buu5IjpYY2
         iVVQ5xCzzZ7y7y+XIYssd6peiufKNneF9+6jRmjCUgSTAIjHnzHC8v54MkjzAOoJu8f0
         VMGw==
X-Forwarded-Encrypted: i=1; AJvYcCUqwfb8XTkfMDVOHn10fbiSqeOktga3lsm1qoHSg17Kj/jTsSJxHxwABH845rOvGmFLZCAveAkYL5UQ0cKk@lists.linux.dev
X-Gm-Message-State: AOJu0Ywb4gFG9TnzhSkzPgtdO09Bi3bmjuweV66dS9YaS7Uf+yb1oODU
	f+8/MqUCoNsfh5+2WOGMOQpQoqZfnSh8y2jboSmdcbA9Jk+NEEJyBCbx
X-Gm-Gg: ATEYQzzNVf5jq0Rm5H51jOizocOjUaZ5rNXcD/f/E30b0q9ONunMQrtTQCLU3vO1u8M
	4osyOixhy8GQRGU+ReM7f74IHlKallQX9O6tn6yiWWdXmuGR5zmeGK7uSnXCmW3Fe/Em3C0WF/n
	Ku0zY3Xmy891fm1sj83qZ3fSFV0Qfzn+iGs7SaUPLbu8uBl5H+LDUm5TTn/SeU1xfEabLKXSVGT
	A3BfQV0WHyo9tM4sSdLYNuxXIsyCmh1RaRMXoCAASV0qm7cQCFzd2coq1mhViLJ4MTMQnfwbwvL
	2cr77Z6pXW9MqmeLbMrqgQ+b0pTrmziFg595WLI7tZ6gnYkSl2oKDtIx8vD4TPArT0ILiFvRLcB
	IPsKj9RuM+Z0PwK0PX2DuRW3QeJB6236xHBdDYBFebA1hm0W/1MCTQHXiy1VdZllrafuJ5HBKxo
	VPdwZGVpPZ6tyRmbYinaw=
X-Received: by 2002:a05:6512:31c5:b0:5a2:8570:299a with SMTP id 2adb3069b0e04-5a2ab928032mr3211798e87.34.1774863330525;
        Mon, 30 Mar 2026 02:35:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b145642dsm1537904e87.65.2026.03.30.02.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:35:30 -0700 (PDT)
Date: Mon, 30 Mar 2026 12:35:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: Bera =?iso-8859-1?B?Wfx6bPw=?= <b9788213@gmail.com>
Cc: gregkh@linuxfoundation.org, filippo.muschera@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: refactor switch-case
Message-ID: <aconhLks-F3rvFbV@stanley.mountain>
References: <20260328163357.163332-2-b9788213@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260328163357.163332-2-b9788213@gmail.com>

On Sat, Mar 28, 2026 at 07:33:58PM +0300, Bera Yüzlü wrote:
> Refactored huge switch-case to lookup table. Used if-else for dynamic
> values.
> 
> Signed-off-by: Bera Yüzlü <b9788213@gmail.com>
> ---
>  .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   | 269 +++++-------------
>  1 file changed, 69 insertions(+), 200 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
> index b3e34f97cfc6..c02df8e3c398 100644
> --- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
> +++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
> @@ -989,6 +989,51 @@ static void halbtc8723b1ant_SetFwPstdma(
>  	pBtCoexist->fBtcFillH2c(pBtCoexist, 0x60, 5, H2C_Parameter);
>  }
>  
> +static const u32 FwPstdma_table[41][5] = {
> +	{0, 0, 0, 0, 0}, // 0
> +	{0, 0, 0, 0, 0},
> +	{0, 0, 0, 0, 0},
> +	{0x51, 0x1d, 0x1d, 0x0, 0x10},
> +	{0x93, 0x15, 0x3, 0x14, 0x0},
> +	{0x61, 0x15, 0x3, 0x11, 0x10}, // 5
> +	{0x61, 0x20, 0x3, 0x11, 0x11},
> +	{0x13, 0xc, 0x5, 0x0, 0x0},
> +	{0x93, 0x25, 0x3, 0x10, 0x0},
> +	{0, 0, 0, 0, 0},
> +	{0x13, 0xa, 0xa, 0x0, 0x40}, // 10
> +	{0, 0, 0, 0, 0},
> +	{0x51, 0x0a, 0x0a, 0x0, 0x50},
> +	{0x51, 0x12, 0x12, 0x0, 0x10},
> +	{0, 0, 0, 0, 0},
> +	{0x13, 0xa, 0x3, 0x8, 0x0}, // 15
> +	{0x93, 0x15, 0x3, 0x10, 0x0},
> +	{0, 0, 0, 0, 0},

This patch is sort of a pain in the butt to review...  I'm not
sure that it improves readability.  I had to read until I got
to 17 before I found a mistake.

> +	{0x93, 0x25, 0x3, 0x10, 0x0},
> +	{0, 0, 0, 0, 0},
> +	{0x61, 0x3f, 0x03, 0x11, 0x10}, // 20

[ snip ]

> +		else if (type == 0 || type == 17 || type == 19 || type == 37 || type == 38 || type == 39)
> +			halbtc8723b1ant_SetFwPstdma(pBtCoexist, 0x51,
> +						    0x1a, 0x1a,
> +						    0x0, psTdmaByte4Val);

In the original code there was no entry for 17 but in the new patch it's
treated like a 0.  What's the deal with that?

$ grep 17 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c

regards,
dan carpenter

> +		else if (type < 41)
> +			halbtc8723b1ant_SetFwPstdma(pBtCoexist, FwPstdma_table[type][0],
> +						    FwPstdma_table[type][1], FwPstdma_table[type][2],
> +						    FwPstdma_table[type][3], FwPstdma_table[type][4]);

