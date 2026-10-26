Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793007176;
	b=3x76Q1g3Lcele4IGgR2LlRs9uVsVeZHGuxgbZoh5ww55Y90lKO3LW4Np7QxbUiKI4vDQ
	 NdI8UmsEYROZCRkEXVJASW5LtlEHzd+DAbftucyAE8aKaNiVabMYxjXFfkAPfC1pw4HQV
	 9nIdj0HD1EtaMgTlDHiB/CejxFqJWADYCjVtd6jNMpjcsjklLdueDK2/dRNXlM6oeGx2W
	 RTuv051meJy6kfj1chavXVDAGuoimLsDu6rzDgChQ6hkZBvp+qvNE0zUeesxnFpcdIF8d
	 5qfYgVM+2yf1Nng8z3ZjkAPZStJxTSzC+f6F/LF846zkfJTPjMpAV+OITkfp4TdC3fA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Q6uMsTxs9DnFToK/y/1eGhUA0bzycwdopukAlnns2fM=;
	b=PzpTtv7IU2OoNX2hdVl63uRiK6yediR+22KyfXVLHjNGcnE7AdnlSnHhCLchZKpTdyy+
	 7SI7KfXSAQz1DX8KJsbRYUUU4Oq0DhHZ3YACjkSkoOxFZvQw28vPSN+VuY7Xu/IXSIkgf
	 BKZF4WCj8oBjw+tzM1UUKgjmdz65mqsdif+ioUV858AtK4RNjCqN4A2JCiJ2DI8kXrPiG
	 tpU+I9qLtkCe9++LR+LDdpckZFGwgMNYpSwj2mNdHfYbqg6dlMTkDOzwAUplU1BVpXCYq
	 8OJe7raP2nc674czkmAyzZpqd2LCid3JODDT9d6K0I0ki81ieupwJi0nKwh62oyo5ug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ebui6VnN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28359606A322
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 09:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28359606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ebui6VnN
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6aa9606ddadso1924372eaf.0
        for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 02:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793007175; cv=none;
        d=google.com; s=arc-20260327;
        b=Noma7IEt3DJP4M8mgljvriYb7uNtZm3kr5rSWSTYP6ErETG1z1CIJaGSJDeH5HeI0P
         Ek2RrnACNl82wTUluUObNIWW5sESty/GnwFsMxj7xuVAj/97dFo7LrQIZkS4MDMHEaaQ
         7TFCSrmPFjfcHOit8FjfF4z8oQ4cHEz5srXenVPY3e1/IsVfuxGU8DZZTEldXKrqUXtL
         52gszoRZwyYJKMKBXguYLCoSKAbt7ZL/iJLnOrBP17H9eqBrx+RaXuEMzfH0KCUafeKg
         flM5CdQCVYfiVwZdMThf0iNnQkxF+2sSg5bAyr2cKGClsTWEd8Viv7EiIRNggmJ/FAT/
         gwhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q6uMsTxs9DnFToK/y/1eGhUA0bzycwdopukAlnns2fM=;
        fh=iWTokfEQohlKB7ukka0OXHIz90OD5RhuVkjj32ipoGQ=;
        b=NjmgmrZ4LoaQmG9NAxA3V7xtQ1OLm9sCsqzrFfeN0wafCjcvprLAqC9LFEKtJToh7n
         rew9j1Zx4wqZNQj3QsGNbZ0lCQ/CUO28u+iQ7qDgSyxlYsY+70p584U0xwMVBbh84kBc
         cr5jFH1AdRoknQ58BWuhIGUscrnUe8w8cBYvMSkIWADVG/HohgGDq7CtGa3U9zeHFixV
         J1ffA93TArAXOnBniIqdl24HDDpTD0JRwdVwWwHugle/J5Ez3I7Pp63H9WuLrDRcg7OG
         gYlbTkdiaDhcsBTmeb5l7wLcF8Jtphxrp9v+VAWXHmx2K5qsCmC6Z5rHD7NbhJKdC3+w
         2law==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793007175; x=1793611975; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q6uMsTxs9DnFToK/y/1eGhUA0bzycwdopukAlnns2fM=;
        b=Ebui6VnN7sLiciHbppLOVMVpHCvxyRNNCUXAsLRfqLqFWGw0Q7P0WU9oXKdJsplqex
         SbGztGsBQ2ftdj2CRoMc0b66I+ka633OmA3N/8X20L7jw6R9AiP+FQBd7ujtxRDAEM5c
         WTB9yKvGhsfbiNNP8ALSQryhgOBeRoIWl/8o3eHR2S6jskl4mo5Sr0zOoyNBMuWRkvgv
         qN2b+urL0abIT7BUbM6A69/K0+tmkYV8yrDZDZfO6eNSn6rWIOvnMtZKRT0kGibPZsYb
         UTFt3Rz6e5q9PYUqspOU7VB5rechIRPSjLpaEkMFxetDJ0VV9MM5kWwD2qqrQGbLWail
         KN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007175; x=1793611975;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q6uMsTxs9DnFToK/y/1eGhUA0bzycwdopukAlnns2fM=;
        b=E5yHdQViS5g85Hrcj6EvI3pAd/Dp1F9ru/dcLPLc3l0YV1ep3huaMFSqdnUSN2fqfZ
         FkEq4i5xBa5Dy4+65qfeRTuPdH0IojDQCXQWZnjzoBt+zFU6YYd4ez1JebQPdj0FLq4t
         y2LcoUPLTuNeo7DY+d3bDZBWtHBWwjaEJoQEgvPyESd2tMar/dXVg98+hUCwWKaHIRPB
         PN+n0dRE9NtFebSnfQENdIF141scYIqCRtg8TgoeSxxvz/leOfxpU5O/SlBekTPGznwL
         /6g43jlyzh5p4XPFOorHFWndJopGt3kuBp9W6q9xZH/ySW5R2XKujUNkaY3tPd/DWK34
         M7PA==
X-Forwarded-Encrypted: i=1; AKwUvBzQFhvZn6LsgAmG473zkfWgqc5+foOhqh3OVcUCoPX/qHmaacmxb8GkWdesjkCdd/L0yfuXqgZtnqDy1j5G@lists.linux.dev
X-Gm-Message-State: AFq9FYLEWaBma2A2WrfGKeNzVIu6s2Pvv6aLXcknW5Ov+n64TOlurpj/
	b3o6oGR+G9vqnPA/WoCpt73yKgf8Lq3bYi8SFeCjjJLgmtvj+uq19NGCireMYyJ1b9oes88jXwk
	z6Nf90cBISvnRAyO8ARD0AHVzG5AsELGcFVJW
X-Gm-Gg: AYBFou0Z+zu8407wqtpvpKOEyG1t7kzmJOZUdcMqczNYJYUMNn77RyxmE2bajOgg5pt
	MWeNUbpRkbnLBusGUbcuff1kA2isgAsWBM4ROs4qmxhKgRMNUf3GURt+swU2dXpzYoUztYg0TY2
	BYjSCmreGSFHZNbngS6CpQomLpoD8D4JiRRUTCzRXlrYbg2279KnlPTZuBsnqhD644Mux4eYJh7
	I2b5v4g41l4zmDm2UDKEcKe+5kkTEqxtiXH3XXwmVQ7ktLyTqV6TA2osk58OexKLToF98Z/RMlG
	ymPSJaUUQyiGLMI+wTiJqNvTTyxGS+jcOkrA+l2Cizu6tckudvSCcEDfHSClvQqzQtdpsFFd1N+
	weBN6faeQRbBUvFNve/mKwfaTbj2DZ1XRIfr1O5x6FJrAYR5gmF8rqWzL78mpw8B91qsAYZ4=
X-Received: by 2002:a05:6820:1c84:b0:70e:d5d:8712 with SMTP id
 006d021491bc7-70e0d6cd311mr1154315eaf.70.1793007175058; Mon, 26 Oct 2026
 02:32:55 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026081832.60570-1-himanshu.bakshi478@gmail.com> <at8cAMm6psyWsqbe@ashevche-desk.local>
In-Reply-To: <at8cAMm6psyWsqbe@ashevche-desk.local>
From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Date: Mon, 26 Oct 2026 15:02:43 +0530
X-Gm-Features: AclHuK9WK4Yy6vI4OA679g4Ynf2HPB3VI2XldS6LVlec7p2KSdSehO3JF_dOaiM
Message-ID: <CAGLmz9+0DoWZtmLjUq-8X85p+DrCXKazsGtN-QOccK++d+YGrQ@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: Remove unused macro
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, dennylin0707@gmail.com, 
	cenzhang@linux.microsoft.com, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Mon, Oct 26, 2026 at 2:53=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:

> > removed. After compiling the driver, there are no undefined macro
> > issues.
>
> > Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
> > ---
>
> It doesn't say how you tested this, though.

I believe there is no need for test since its a macro deletion and there is
no call for fbtft_init_dbg() which should be apparent from the kernel
and driver being compiled successfully...

Thanks and regards,
Himanshu Bakshi
