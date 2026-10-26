Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793007900;
	b=DWmA8KrOzx74xtEXseRjdhOhT1/uFjn5A1r7AIcyc1rDNN/xypv8Td3oixbayCKol3nl
	 05lCDMiL7eUdFtvE3vUAY4+lHza0CBg+z0kwsfDoY6wqH2hjJfVlLRm1oSJxDBiJCUXcL
	 yNEhdZWzlikF17YPMxiD0YyLNMbgRnywpYIjFUYJGtxkdqTUe8NADSSPv139oIMAie7U/
	 0T+qCOGDEIYf0N6zrfeuHM61zIT8j/Uzh3VE7YPPSn5QyIF2Pb0tkhmCrHn+mHC4UV29a
	 cTlwPzIwVKjx2Z1r0RnJWqcX/Daf5L61gLiBqSkEwKRdhBQsFbV+R09WEpaWKLQbNOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YySXXUFBOHmytywvVTLMkHqN01ZYut8GdXtuh1QQB84=;
	b=o8XsgApUs9+mYqo9dq7gm6fVcSNTmg7dd7cMyRjvEHbMRfBcYn6LPrCHYZohrFZiLUYg
	 1X5C6+05w6ElNQtYd21FUg89oC6PMfYwJJ6wEDyJnz7lKKdzwqB3Yyjue43uIOXXRZMh2
	 GK9PiApeNstIgrHOmJp97vykQagip0E/JEqsQJAELipAFTHqZdJq6HNB9rXKtjUoIpKeD
	 J2GnQQV7mN04L4DMzmWbsMmdH1s1gI4oZSsz0QoJRKA+k3nosX9HnH+IaUcjozq0nJAQM
	 wX8mhRKeZhaK5NhRGLSlqe2Tn5tuSp/FmWV271rJmrBDMyeqHW+cczrxJH41NtRitdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=au+isjdQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9482606A323
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 09:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9482606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=au+isjdQ
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-705cb6ceebaso1902589eaf.3
        for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 02:44:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793007899; cv=none;
        d=google.com; s=arc-20260327;
        b=N4OjrPIBi4wOZJ2yObq3Fop/F23d7S/EvsjKdFGQBpFhSjIUJS7P88jcjIrlvEE0Zx
         xhOIUXhiEj2bX31flwuDTXrqa+8iyHEijvmkIkkKiY4lBRz3JZ8Mj5Qoj+FkeeWk/Vvs
         lGPP+kLfvaJPzousNxXj0EsiH+R71Z9Guu039gG09V9JmTxUNNdE+272jv+RkvBACUPF
         8bpVNOsllFR4p1y7wMDgZkw4a4coyb0fFS9M4CIw/tA/fEj9WeNrQYBdZIP2B10w4LwE
         UvEmn/hVstLBI/YDHP8wM4f2XvZfCjsQJ3uHKoPclT9IpUfWh5fz7G7zIyJ4fm/5txCZ
         d3dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YySXXUFBOHmytywvVTLMkHqN01ZYut8GdXtuh1QQB84=;
        fh=b7KgUpEBoBJSdaku5xCZwBwVdgKH8MsJswQE/qYFMhc=;
        b=iI91hC7c+KGS5rWA5835Y8MpNzyqv/QfBXuIhOXfh+9VdnUQG9nQ8GqugRfg02I5C5
         LCC6npNNvgL7MYSWFCacOVtKa54hTJ4ryfjYb+3x67bw1m8SfPoMPIb3UkCtCzG82ePh
         bvjxyw9ccdXANjFHOtmSxx6s5R36ENHnR9oixbqsOMfdJEMbUbs7dbDHiHgELeZB6Qvi
         t5caB8nie7CcjeEfcPwctGKkwq2kK91e+zisK6W/MIfuzZlbztxGUWyqkVZF9g+wsIp1
         zw6CCDg/Nb9zyWnHeu9Xmrp5kfUolg481PWnmmy8TwjXKJgY56XUO9RGRWp1p5CJe0Kn
         8rfQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793007899; x=1793612699; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YySXXUFBOHmytywvVTLMkHqN01ZYut8GdXtuh1QQB84=;
        b=au+isjdQH8tuC45MZrI5ZWIhxTDQ2+Cs4YcJ17e4S7jOf83hVty0yUMOqRaLJMO3xc
         2Pir8WPlH1cSe1ZmmyM99fWsiQ0YwuVC10kKrqW9EAdexHx2tkNtdo2PfStrAN7LWBn0
         Bd3VuHHTucq4bg7ktlc4cdQVGXzujNe+8AR9gz/6OzYTdsI/l12NzWQwhg63CIusbtC3
         dtDaVwRHkwAtnjPT54XZCXq5Ad9SbR5sueBrijyn9rdsl6EOOiyxO1juHEHNYRcHwcRK
         InQPERsdIYE/rPnF36Mve3D4dx+KUu9UfnjYRtpih2X8ardKBwKsfeArg6VX8SPmuWuL
         qjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007899; x=1793612699;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YySXXUFBOHmytywvVTLMkHqN01ZYut8GdXtuh1QQB84=;
        b=hWqWlrn88driRxF2uJuLtm4prf1nfinf9blqs/dPbBTZRYI6D1YOw0W/LPm/Qr2sB2
         We6/HIiOu2VAJtUDHypzwOnktcGEU+XuvhBllnrjm1WBdRA1NPOXB07ZcUn9WfImwOEB
         W3LQlm8wWOw6qdm1xcBS34rIlElY9KauNPsyheWz63RD1vorXvfdDdjYKYeZEOPQvqG9
         PuHDPSXX0nsVEYKcVN6cFRzeQyGjE73OeHQzsPF2UoTk18yLEVyecPZVD0vEYTRcagHY
         HrpTwa0g5Kg4SqGZjOwXeIBzdsGVrnD0fJDy0mX8Oj2JQA1IIJvIxC4bt2L7PJa4A/M0
         F4qQ==
X-Forwarded-Encrypted: i=1; AKwUvBywNv5ECgYAdj+A+62EZ53bD71M+DvI+ir+H1I+s6GsD9ylfxxLgJqULG8UmZSl/4c1MIYcHNM7jSYiV85L@lists.linux.dev
X-Gm-Message-State: AFq9FYL8AwCVvHL6wMV9JYj5ozVHhjN2PUo7fA29TrGTsTEGbJlljnkp
	GY7DTcHReyk1Mz9YeEsRhzAy2KIUftR4awwFJFbgGAoLjGuBoqSnRKKZGeWlSywggkXgdbZiNR4
	IjIQsPGwVAmnKmQ3RGwcagsxZL5jnfXY=
X-Gm-Gg: AYBFou2a9+rkGQs/v7TPom4xGyDWgcr1RlQU1rASo3zXrdefVeoEwlXoBy7hqFonTfv
	4xVCFUZLumvlc/DQPKJwff7Uh+YPIaqp+dw5oz+3kN7p+GOqo9PLY0GLO1cdgR/ngkTZJAF5L1Y
	cUX8zKD++1oR126cIMxLIbhwiOLQ0AhDT6smFJ1XGrTxVNLqcWft5bu1OMba3zRxcSktVl9fFmM
	2ihTDIbLVUlExGN68rt9rM33yLjl0VXH0fjlHRQWYlIWtL7bF6K0KjFxpeMT5gwyVo67NrX73Ak
	Lr8oZ8oNSJTDEQFRenrK1ev9JBwLGhuRmEGQ1iA2gstItYhIhs7YjtlQoatuzRXbRLh/PhwdepH
	rSCaGDDBQo2DrKVUhKMTl53GT8uHpD8l8JIpkdt3L8TftnbBPzMgpN4tBmTzoRsdwM/csASsYbo
	xhX5iJD7Ih2BZgvhQ/
X-Received: by 2002:a05:6820:7089:20b0:70e:2096:8098 with SMTP id
 006d021491bc7-70e20968319mr679857eaf.83.1793007898903; Mon, 26 Oct 2026
 02:44:58 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026092423.66168-1-himanshu.bakshi478@gmail.com>
In-Reply-To: <20261026092423.66168-1-himanshu.bakshi478@gmail.com>
From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Date: Mon, 26 Oct 2026 15:14:47 +0530
X-Gm-Features: AclHuK8g_L7SXnsINc9C_3whJRkCHOJJj2ujrSiDjnaE7GbNryakHGpTdm_klP4
Message-ID: <CAGLmz9KsGrVEFRO-dQv559ArJRKs7yOiR5wY4T_aFAeuvNhg=Q@mail.gmail.com>
Subject: Re: [PATCH v2] staging: fbtft: Remove unused fbtft_init_dbg()
To: andy@kernel.org, gregkh@linuxfoundation.org
Cc: dennylin0707@gmail.com, cenzhang@linux.microsoft.com, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	error27@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 2:54=E2=80=AFPM himanshu bakshi
<himanshu.bakshi478@gmail.com> wrote:
>
> From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
>
> The fbtft_init_dbg() macro is not being used, so delete it.
>
> Reviewed-by: Dan Carpenter error27@gmail.com
>
> Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
> ---
>  drivers/staging/fbtft/fbtft.h | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.=
h
> index 40a7567df1eb..16459e4e0ba0 100644
> --- a/drivers/staging/fbtft/fbtft.h
> +++ b/drivers/staging/fbtft/fbtft.h
> @@ -420,13 +420,6 @@ module_spi_driver(fbtft_driver_spi_driver);
>  #define DEBUG_REQUEST_GPIOS_MATCH   BIT(30)
>  #define DEBUG_VERIFY_GPIOS          BIT(31)
>
> -#define fbtft_init_dbg(dev, format, arg...)                  \
> -do {                                                         \
> -       if (unlikely((dev)->platform_data &&                 \
> -           (((struct fbtft_platform_data *)(dev)->platform_data)->displa=
y.debug & DEBUG_DRIVER_INIT_FUNCTIONS))) \
> -               dev_info(dev, format, ##arg);                \
> -} while (0)
> -
>  #define fbtft_par_dbg(level, par, format, arg...)            \
>  do {                                                         \
>         if (unlikely((par)->debug & (level)))                    \
> --
> 2.56.0
>

Hi Andy,

For testing, I have compiled the driver successfully and
verified that  fbtft_init_dbg() has no call sites in the kernel
tree.

Thank you for the review.

Thanks and Regards,
Himanshu Bakshi
