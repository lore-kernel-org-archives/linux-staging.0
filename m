Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793006700;
	b=NNY5saJKlu8CJKKeZ0EzV2A5x0rIYEJax2KNOe8A3GK2khJBrtsn84y9HdJ8nAyKr+/0
	 VXFq5T0Vg87fqEuT/FluAALBo+a4A5QEcc7JqRH0zeqwoYsMbiz46EQLM/PzLkmwhUwEh
	 xLY+8CY/gKuKnIhauSgW7L1ktmumJdN4Yx9wNZicnOLQpFYMT9GAq42goMbMeiBbU9Pky
	 a0dG/SMsgS+ehsfKNSyDVWgTP0pvjhYD0w9aCVYi9e0D24D3afhprxWZOC4sCEg/WpedK
	 RW++5R0tzWKcTjdqIR2seQyEmr1mQ7L2r1Lbco94avgpmvjsZNRwI38ObnzRO2YQDWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iH7cQ2YJ8diUnJspTVTMz6UMogpLRPO/6WHl7KC9WGw=;
	b=NSU/Hnri1lqkOD/+gQknElLM7yV2P6smOXgxWYHx0VieIR8hGtkRtCLihR7ur4IHD1N9
	 N19Q5Q/FyzVtsS4IeSzrqlDCvvolzWVnW1jq4mcCA14oNJdY61n+n71s0k/keKjzyaSCv
	 bdh0BeSsplcn9hzZlJpvy7xuKz9F6/RToiW6z8mpr/0M2DcwERlRFnFc5CmgEij2sR4K6
	 CXpJjoNgqumBfkoyqEyMKcncFqNQAvjkGvlz/phLkOrLZGFTfMbI0ym5MzW3TGV9y4mip
	 oa+vRgsGUXefnASnRdSdN1wBKHZKS/zqNxzfTJ3E+/9Zki0BYJx0H5O69faadOCwQBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rrMrOFvb;
	arc=fail smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FAA606A31B
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 09:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76FAA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rrMrOFvb
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-53c156ba662so1361552b6e.1
        for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 02:25:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793006699; cv=none;
        d=google.com; s=arc-20260327;
        b=SAPUwUCptcjfiVkoxJZhCG7aWaFVf1ge+FYnXM3hjmnJRUDcMtGSvJ53qgAqjdDF5p
         4UujOZUsjCzs5zDzOSWRlWUNp/5OV6OErOE96zWBNeCjFOug0Z5KD8NM2oUXhQq3j+t9
         uq71qb1ZJpAEDZpPh7pGNY333RyMmAErOAON93bh/ZR72Hxo1wckWWEAKiPTmDHDaKtk
         N4V4LH2cVh+J1VCNyXoyVSUDuyHKEwJC2GMYDqvVlFoEdRp17ucezRsNis8NubY294dD
         9IytdWx62B04wZgkl7UCXF5aw2U1jiM1mFryBHYa+RccD6YMxov1QCNvBOs+dtMrhKmL
         Q/CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iH7cQ2YJ8diUnJspTVTMz6UMogpLRPO/6WHl7KC9WGw=;
        fh=ydjkhjj5NaH5eL9664Nyst9Rj5wys+DPTBIfZCTC/Q8=;
        b=CX6NtlKop5n03Fg6bNzPHOC/7obEPqhbD6MDJj4Wyua1ovbtDr4TzrTX5hehja1iQw
         NYjaBTKME+DOHmWoEnSiZJN1OKESJWuESgX+2MYe4oy3CM09w4ImQO+ayAbMy28cBShE
         xogN+AJfT3S7iDEOwV1a2959ewNQ/e77YbWjRNk5yaZxRT8ZEZcEH0zPL2+f/P3+c5N9
         gxG2bMWftLykpjEn0OA+Fq5LqEnCOIpJ6G0FHDvLa0uPtdJlDLvhmRIRF1swtNwzRuaM
         foBWRKTWjybATWgwUl3UdhiSsZWNUHXa1TX4javTzk86UJpflkNbXbXbuispe2Jq5E1w
         QQ8w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793006699; x=1793611499; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iH7cQ2YJ8diUnJspTVTMz6UMogpLRPO/6WHl7KC9WGw=;
        b=rrMrOFvbwmmQOANcpBIxomiHqOBYCobfmjrpZGhHT+FSKnCewp5mc92fkCPTzLNyXm
         VA2Muw+efKy2S5vbc+ZVqehEOCsLoupDp3fAj+8S4TU5LgDdIJu0NglvSsLcLw1wo9KB
         eexEe6yQI0u2D8EQQsc64klG4TUNXe5EcOcMSNTtiRJzKxOjwl2EGpPo926bTan5PTON
         dj334Iym+yZcrDQSNDnro+x+i3Obin96dk1KHLzhx11BIINMEX2Zzs2IrZhTxT2HEFkG
         D0RNMKR3uSWeIN33W8TmWmGif2E3yBuj6ZTR8gawH646rCSsJACWmFd/56V7mik/NXZk
         GsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006699; x=1793611499;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iH7cQ2YJ8diUnJspTVTMz6UMogpLRPO/6WHl7KC9WGw=;
        b=wo4WoJi+G4jh+r8Am/gdS/CMJi8rJkAZFUoOh4meGvETmm7jIHhWROGf0gcp2uCf4B
         VXkLCTwuQtY2rPqCueTTeHtTrf5VbjQ5NmV6D5bzYgXOxq7G32J9xdWcHAFV5qUvvAIE
         qWVvC6vb31pyRCglvoZfjYFkDioKq9lnaXDY77P4xpq4uLVc6g9tyk2TGfMmNyVhTZr/
         n8lckutaPUYT3zC2glhYrVBdmtcGqtxQWpNCUVXgNONHgEsL1E0JsRi3Z1MNHLWvw+7m
         KdGtnyQ8FS7pOBuFtaWFUvu7Ne4fWes4IAIS0hwILnB0lluFj8vc+Ti1ZaYe5scx2cLO
         DYdA==
X-Forwarded-Encrypted: i=1; AKwUvBzXgMIsjICw9LEZ82k60hQAmdJzd8LYGv5B0tmeNYlVFW43u+m62CEhlljsuXcsQDNVp+i5JHEq8+Ok5JPt@lists.linux.dev
X-Gm-Message-State: AFq9FYJmim2DpYEu8UMuv1cn78rMfF8xrfXy7Q2nLmEPXYuZ6RdoXTnJ
	iSmAS3Wm9fUVoq8Tb05RRj7fO5cPDsGLqMM4XSTDEw2m/UsqsFRPjnnpGitnVpoBROMRp0J48sE
	glQu370SWzIkiPa95fTVh7yTiydn8/co=
X-Gm-Gg: AYBFou0vvbIQyaX31AK762L1zKNUngq3WVG6Vp+U74+rNXbriSXxW5v3f6Pd60P/X7d
	Wqjoo4KWwp/dUjxic0rXsBZuK1u618JiXlwzOqBbIWUhAbjrcmRftgU5m0CwxrV5v4rhwKVcYZ+
	UqmOTYepfU0M926GZ8yhVZeVW3H2cqSCQJenCo4eHVzgdE9tfWpf91r6cCoE4eVsawnqFljI9Ab
	tiSbwB4b7v1SssilJ732n0H+lXTxVuYG7bizEuXPrDew8j8AzcXkkKGvMRJjIpO3nR6G4Is+mH7
	TgnbcwfQdnL2XQEdSaNj9QPHgigeSWI2Wz+rerYO0iIAErR1oCbr53nV8gX6iTOX+mjvRv/RH3o
	Y2JmL6sfuS97zZh8VhvAcjOCkrtvUAVSTA9oUw4BCfVNIWZEt9hg3tHH0dq/M2h1a+hYQlAs=
X-Received: by 2002:a05:6820:6fc7:b0:704:d59f:2a2f with SMTP id
 006d021491bc7-70ba1004bfdmr2405887eaf.86.1793006699407; Mon, 26 Oct 2026
 02:24:59 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026081832.60570-1-himanshu.bakshi478@gmail.com> <at8UoLDzrO9ypMeR@stanley.mountain>
In-Reply-To: <at8UoLDzrO9ypMeR@stanley.mountain>
From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Date: Mon, 26 Oct 2026 14:54:47 +0530
X-Gm-Features: AclHuK9P_GrPtY5hmmGoqr94XfczFIROopEnJs5pAYehQGelpuKw7iWG8V9_J8c
Message-ID: <CAGLmz9JD3UQ+4cAV4nigm8U4Jtb47=oBGi06miQWuetenszoYw@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: Remove unused macro
To: Dan Carpenter <error27@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, dennylin0707@gmail.com, 
	cenzhang@linux.microsoft.com, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 2:21=E2=80=AFPM Dan Carpenter <error27@gmail.com> w=
rote:
> This commit message is sort of acceptable but a better commit message
> would be:
>
> "The fbtft_init_dbg() macro is not used, so delete it."
>
> 1. () after the macro name to show it works as a function.
> 2. We care about the whole kernel not just drivers/staging/fbtft.
> 3. No need to discuss dev_dbg().  That is unrelated.
> 4. No need to discuss compiling the driver since that is assumed.
>
> Otherwise it looks fine.
>
> Reviewed-by: Dan Carpenter <error27@gmail.com>
>
> regards,
> dan carpenter

Hi Dan,

Thank you so much for the review. I cannot find any call site for this
macro in the overall kernel anywhere and hence it is safe to remove
it.  I have sent over the PATCH v2 with all the changes that you
suggested and will be glad if you take a look at it.

Thanks and regards,
Himanshu Bakshi
