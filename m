Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94ECA2AF06
	for <linux-staging@lists.linux.dev>; Mon,  9 Sep 2024 07:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725867381; cv=none; b=e9/wEX/yy93X8GjGwVDAjxatb9mnHFRcnG0+buc5Q5zzX6yC7q5B0XVu7Oo5aBqSdfcMeODilCTkXkBnwKQdnX27IRtvtXzFLoVD8hgVZ5dwfUSAS4GhfQiycCZznUkcRuZdY0q6ojhYEPlvKqPpsh5qoGGiBUGhop0f/GHaZW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725867381; c=relaxed/simple;
	bh=oBYkJrIB4DfMlu8HfETKfJzT9U/InpISMzhesI2aIvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Kdhcr1gYY24UrdZ660KJEsrBtMCXb/YKAUGyE7pMcnZ/pVrhYHb4in7v1YtV0H0opJioX0cAFRuQzQhGCiMm9Oo8/UVtU4LyhVSMbddXWA0Onp1IH7eVtRK0Kbff0Sg9FWYaE8KEyPFN3XSwal2miXVxQaXhHq+AcqS4MgLMQLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MW0IpoIT; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MW0IpoIT"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5e1b55346c0so1471336eaf.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Sep 2024 00:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725867378; x=1726472178; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1ZBifs2OnOGSFnNW7eBfuw5hq3WBNWRDA3rjsHm7IM=;
        b=MW0IpoIT7awwe00X9zJyjL22dXg+whQSBA5ZnVHXqpoisD69eMK3F8QnOPGTmU3/3t
         6uUVc0Y3m/RhsY6677QXQbMcniJhzwynLLeucLFj8CosQ3Jwcxg8TFTZofz4jPMKs+SW
         zc8zlyfDXgAjRQQ9uTNL3EV9QkVG3gSfvYjJntewD79xQLu1swUeW5CrzmUVS/BYmg1L
         u7bJvM6nGB/+AOA07GKSnpipyLXLEdVh6tWOnCSB8WxBEp33bLzfv1ACHPlMIGm0+gEE
         oFi5OZe96Gae2O1npCmC1uTtpJzRu1a5SbssF9Xkb51zR5cGGAuPSbnIGKuKgzyQkYEO
         iTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725867378; x=1726472178;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U1ZBifs2OnOGSFnNW7eBfuw5hq3WBNWRDA3rjsHm7IM=;
        b=k1LdZN07cc+p/QXNInCJyPQq8LZd/CLQ+BptPx4UVkdOmx9MP8OJwgYfoMDuKm/Vsq
         hyweBcjhswaU7FpOBQ8UemDMglIWB9aChYc7ZRYJSLXlP/lzoXgvSshEgOLJ7xHT3jfa
         OivaYIk0f5Qm5BQr36bchVM4VS3Gb3tdkgHTvEC4HmxIV/nPWoeIEebto9JQx4bpuKHr
         4Nj6PJqhfa6ABdbMFryjM8M+rzakPXx9w8BvxN6u25KzcEJSt3yIhXsyc6yG3vrCujG5
         3AURKd1eOeWBH8DacA43JwiaT0DjJvSJCMow0GZuVQFV7BZYnvpSGlgmQMZf8DiCPy0d
         Laog==
X-Gm-Message-State: AOJu0YwHgNvbnHXVOoDBidNsZZRLLLBp8wOvHfGamDqINhGmLdQafCRZ
	fFD9a8BnSZP79EWCb7Nx61eOy8HEJ7daAxsJqu1U4xCLYe4wAiCyitjRaAvqdxrW1d/YAbph/95
	Jh4JQRQUXHbeZs3LE9LwfgFTwRUMn6qKTpYc=
X-Google-Smtp-Source: AGHT+IE6Egd0kmjakA1Oc4ImsMFPobCl7NvVfA8doP8hlJbf1MsE1z/6EbbMywsJNX5oFVivWj9tRw2Rk6LhRLyaKRc=
X-Received: by 2002:a05:6358:432a:b0:1b1:a845:34d4 with SMTP id
 e5c5f4694b2df-1b838812083mr1243314355d.27.1725867378116; Mon, 09 Sep 2024
 00:36:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240908101110.1028931-1-sayyad.abid16@gmail.com> <20240908101110.1028931-7-sayyad.abid16@gmail.com>
In-Reply-To: <20240908101110.1028931-7-sayyad.abid16@gmail.com>
From: Sayyad Abid <sayyad.abid16@gmail.com>
Date: Mon, 9 Sep 2024 13:05:42 +0530
Message-ID: <CACVUEBnU-XYn0b4WZ5qbeKEgfEbHoM3jAkOvAgLQtcpYDJEfnQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] staging: rtl8723bs: fix no space before tab and
 statement start on tabstop
To: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

it this working?

On Sun, Sep 8, 2024 at 3:41=E2=80=AFPM Sayyad Abid <sayyad.abid16@gmail.com=
> wrote:
>
> This patch fixes the space before tabs and also makes the sentences
> start on a tabstop instead of spaces.
>
> Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>
>
> ---
>  drivers/staging/rtl8723bs/include/rtw_security.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/s=
taging/rtl8723bs/include/rtw_security.h
> index 740c8504cba7..f005ec88d00a 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_security.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_security.h
> @@ -162,7 +162,7 @@ struct security_priv {
>
>         /*  For WPA2 Pre-Authentication. */
>         struct rt_pmkid_list            PMKIDList[NUM_PMKID_CACHE];     /=
*  Renamed from PreAuthKey[NUM_PRE_AUTH_KEY]. Annie, 2006-10-13. */
> -       u8              PMKIDIndex;
> +       u8              PMKIDIndex;
>
>         u8 bWepDefaultKeyIdxSet;
>
> @@ -183,8 +183,8 @@ do {\
>                         encry_algo =3D (u8)psta->dot118021XPrivacy;\
>                 break;\
>         case dot11AuthAlgrthm_WAPI:\
> -            encry_algo =3D (u8)psecuritypriv->dot11PrivacyAlgrthm;\
> -            break;\
> +               encry_algo =3D (u8)psecuritypriv->dot11PrivacyAlgrthm;\
> +               break;\
>         } \
>  } while (0)
>
> --
> 2.39.2
>


--=20
Abid
