Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46516265629
	for <linux-staging@lists.linux.dev>; Wed, 24 Jun 2026 22:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782338932; cv=pass; b=jmsjjUCH1nKGZ2BVX0krsJa+g32OMGPWdI+x4Vo6oE67ExQsP1iIMn5TH0O38mI2ZxQ9LNys2S2P+YuRME/EIlb3WAFR4dg9L0ZfgTg/1S+Gc/Us94qyeUv9x6o9gkSE1KWoLFpnRtLKGuUOYAIkzqJwIUl+HXCuQdhyuJIypUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782338932; c=relaxed/simple;
	bh=JSMZlOyNNb/LCM0LaI8s5qPuF3XNy5Mg1P4wSZ48la4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uXopF/KigAoswrGtv2LKX3NQzafgxYU7I2wAbzbOzspDzj7P+St/7wh/RCC+QWBPouvI2Lp3L2exn1O2a/FpgkVVH4Vl49d+jw2YdgqSZqQRCD0aYqHiEyI1QpxzvL2LcpGfHRTyKzgfPLWqQyFK+AShKM2Wt8LfathkYC4dbuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oDXW6aRs; arc=pass smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oDXW6aRs"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-6cfd17e9250so718343137.1
        for <linux-staging@lists.linux.dev>; Wed, 24 Jun 2026 15:08:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782338930; cv=none;
        d=google.com; s=arc-20240605;
        b=CCWYhrk7ncXMNgWeOc6c+fhNdmQY9FTwPEC74GdI8wNzO20b7T98aCVfy3Er5qxDC/
         eRqRYoFiNMDUnMGvzcujEHqB1ehfhA4fupWZq8lzCBnKtV705rN5o+2orhjYE+1b5HPX
         e6SF5FSlWfASSe0wXNSALhgaXVlKfnGx91BRJXQQPRdUu8d0YskvMgvETm5UqmJwQkWV
         XmcrghxHYDUXvUZKKmoju/E2/YQ824W8KetFvG4aODN0tKo5Ly+dgKLG/ftFuo7u9xR2
         35Srq2kUUB2f+/3tztGbHbvteyY7rfZzcrwMshUQQ9SKDJAltpvveklkk3Fml79IEftb
         DYHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=90+9QTm1dDyatyRL1QPemx45BGwxzMdao/XJyvV0s9g=;
        fh=OGuGyImkAcJwt+sRhpXRgKfXKBxNQnSga2zoz3XK8eQ=;
        b=AusvIOuL6zSrCgmHUlozzIhr4BR0EH3I0UhyMWxHL7OVaOl8adbnvaAb4GZkCXt95K
         yGeBQpofhSf9QpngEPyadIdG3Y2bUKaMAX6pN0W2ra8Kr84ivcyBUYiHiBXKtVyd2PcC
         n+qIX+SWG8iZQvXE7t5iM0HSY9wo0gfPAEwcUj2/nKJa0CklFjx8ZZ21lnjLp/TS5nFu
         Zd8GDr5iR+F8dg4f+yr2XQC4/VVvHRoH57A4tErOJD06Dn/m/y8MYcPM9z0s75ZJbG8g
         Qo0H9G9517lKXMv4RllCVSOChuSQtoMOkYLN1qUzAcHgBlyFm7ifTfiNBYieru04O9RL
         EOeQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782338930; x=1782943730; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90+9QTm1dDyatyRL1QPemx45BGwxzMdao/XJyvV0s9g=;
        b=oDXW6aRs1fUCFX16BF+9zCmG/95JS6zhsHlp/0EmrWegWmITUl5Iib8olBSOpkeNmI
         c24L2/O1d3V76UGXimdzT/no49o+TAQ6oZPuxlAxtEbjcp+qtiObFApa4ylsypClSXwo
         ajXCY7odcIKbN8NyRz2FYXgumcYzhzzwH4qP/ZkJuiZ0V/ng78iJMiuFYmdkPc+L1OmZ
         X3koz31DFxBZpiV2zCZrEcSXyKQnROU2+0Sk6D98M6lE0pr4uEj1lIOjySgdzA7RXWnm
         TeMOtHu9P/WK30+uUz2xxQ1HD7hKS5Lr5idXW8jIyaKryuCcuej21a4w1yRGVC+5rEiB
         l5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782338930; x=1782943730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=90+9QTm1dDyatyRL1QPemx45BGwxzMdao/XJyvV0s9g=;
        b=lYoM3UlAx+aABsSD/zP3/HRmwFHfXnZTQPiJ2ZzevHVsiFqXcYd+dod6F197yt9D5t
         Dgd8uL2kgu6NJje+1k8HIbqKldkeyoFmF3so1qQyHvueFfCZjDkMjKLQvSh9DqW6xfs/
         Vf7R77tGMA2XPKtQwer1TeXcLf/s+10eAYNghHJlDiG9bpcor2+ivD478ir5qvp4qdjp
         9/tJHHG7KebM1vJNCJjxFSKO9SUz0ymawzbrQ3XXhXBOyPQXARHd0XVGQzZm6ihB8IRF
         0LlW70VBquWQV8rlN5e0h+lDSrNXG9szUrHqhJfIbpbsvMzhUZbBKNORC3+RRh9XLukS
         vm7w==
X-Gm-Message-State: AOJu0Yzv23SU7YPODKVGtNG3Tc4iKEPAP1MId4yyJFamSChyHJYO7lrc
	oBHLIyy911nKGUxdTzojGArMQEmoGcgPPcXVj5QGxDgWkS7zdwzKvaheVe2lCEj96HFIeJk/52i
	96v3I13g1fKI7RH1IP1rpCXHcB2s4xkQ=
X-Gm-Gg: AfdE7ckvC4sAAm7DQpmAof/JMH08UTDOz3jNXqnwAf2kulDbZw1/OLDEzDeK3nxvFXR
	WHG1Hxbh75IO1XMbxjxqSHAgwuLED22SADXWYHKzEP4ErMKL1jR+1m8FheqNXDHZXrac1EUOfcg
	FaeHnnAIgr4Wu1PFSZ3moxKywlmMfhrW3PtLvRnPp4uKsCUcDxurZ4dEUmvo/ThZM5qiw27SM9/
	Lz+wdPuILQmZed4gdcasgTpOxgWzVpSs87akic8oI6AxEYY4Z1N2KCMwAPbYTnveDVIontjovY=
X-Received: by 2002:a05:6102:5690:b0:6d3:aad5:6d17 with SMTP id
 ada2fe7eead31-731169801e9mr2614441137.19.1782338930172; Wed, 24 Jun 2026
 15:08:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260624215629.32568-1-andrem.33333@gmail.com>
In-Reply-To: <20260624215629.32568-1-andrem.33333@gmail.com>
From: Andre Moreira <andrem.33333@gmail.com>
Date: Wed, 24 Jun 2026 19:08:39 -0300
X-Gm-Features: AVVi8CcZj9MSaUYv4o30jo7tucNhX4qvo0icCog6WQmf-XIRE0Z9yEVlhwYTZPY
Message-ID: <CACO0qFKczLA7ufzFtE2-n0Gj0Koscd65vDkTZ1aE9BNU8tizzw@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: clean up code style in hal_intf.c
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please ignore this patch. I accidentally missed several changes in this
submission and sent an incomplete version.

Em qua., 24 de jun. de 2026 =C3=A0s 18:58, Andr=C3=A9 Moreira
<andrem.33333@gmail.com> escreveu:
>
> Fix coding style issues regarding unneeded parentheses, Yoda
> conditions, and unnecessary braces for single-statement blocks.
> Also improve variable initialization.
>
> Signed-off-by: Andr=C3=A9 Moreira <andrem.33333@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/hal_intf.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/r=
tl8723bs/hal/hal_intf.c
> index 228297cee5d6e..496f18d40c5e3 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_intf.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
> @@ -184,8 +184,9 @@ u32 rtw_hal_read_bbreg(struct adapter *padapter, u32 =
RegAddr, u32 BitMask)
>  {
>         return PHY_QueryBBReg_8723B(padapter, RegAddr, BitMask);
>  }
> -void rtw_hal_write_bbreg(struct adapter *padapter, u32 RegAddr,
> -                       u32 BitMask, u32 Data)
> +
> +void rtw_hal_write_bbreg(struct adapter *padapter,
> +                       u32 RegAddr, u32 BitMask, u32 Data)
>  {
>         PHY_SetBBReg_8723B(padapter, RegAddr, BitMask, Data);
>  }
> --
> 2.43.0
>
