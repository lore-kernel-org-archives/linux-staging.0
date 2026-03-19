Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93CE314A90
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 17:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773939677; cv=pass; b=TYqKGCqK1cqN40cXNW/yrvKftWTOGRTfo3s0DXygG4N39qr/TJudDv3hxgykPiv/FldkswyiGgW8Nm4fWltY3K0f73RTBmAj3ip5hORKjuNt2VnUYUfl+OsHCT9IkZUKlPOX9j3gBekC1zVQNVYDoDm85fQUxBXZrEd4Z7wx8e0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773939677; c=relaxed/simple;
	bh=162kKHSp7un5ZsR0XuVe0WxIuSUcAmTl2LdLqB/HvOw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WttxfYvlTcDHW9ZtQzyqGsOBbPXxALnfG+YaLCWmc83vT2nzWY32YP9p89aJT8783LBpIA5YO4tQeqbBqnR3FCF+raZeiRboWG0xVfJKPGzBTVgMTt+G4zw1P3+raRvpwVb42nSWo81pE4TiKLsUM/gd6hzJWzwiEaumPdAIyuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5zA59LM; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5zA59LM"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38bf1561215so5299921fa.2
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 10:01:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773939674; cv=none;
        d=google.com; s=arc-20240605;
        b=fULadXQ0QwncZGkIdZ+UWzq8u9J5Ua20SMqwJMsvXcF/ftFjR6t71AHiaUItH8UF7T
         6Zbc2xBlVh77wzC65f/f/zvwrg/bPwsaO6obMBXqXzNVogOMBFG0Kvz2H2XMk5rvR7Gt
         KrI3VsrHF9GIlWYcjf7SsPoYD/FjBrdP0N3ujG9c4qTXE2bPIj/VOgDovVtyxqYoGUyz
         6Ka3BVCpSZDpWGdJQUpNufZQiu4X2siHR9glzsOQ4HSW7DAgKO5/VlbLyZy/JN33ifC6
         yxCVEQVW5vQaEyb+NApt8Zr+qMJvVgLD3U7ZIkRmFUzA5YwkhzfbGdpcHXVDxdZuR0s9
         bF3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pQYz4NNrmLYgCVL/3ZSipeNt1UCJsZV3sEZIMqKJMSk=;
        fh=mafiPZcJyB0/03gDxHoERFmPnYrj5xZHjnXs/34mvN0=;
        b=fWSIX6xsJjiJxxxX9mV41rWRrKbtTbXcUK1pn3B25MFq1CnUzxYaUEqS9if8Jg7tQh
         1L6evL7JSKX4Komighp6SrGZujClJ6JgFT/+DKMgXWjxEf6PnHTlEbKrFEgPctocR1JC
         Ol+wI6U5Dz7ryVbvXV1mwk+Ejv37TkG7pbmI0aSl62z4B+MmsZwvq0TQqlw7iv7zTe+6
         85suOKwqK/FIq2j7GeT2osRulfo1VapyAaTUzWOMmhxsUmxxcXdPg6Ba8Hx534zwBFbF
         kzsDrOOj0cy+u/c69FiqtyR+t9Y9rzEcB1Q/Ze92HMGzE9xt2kjHZ46eliJOIwSWKcvn
         Z8ag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773939674; x=1774544474; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQYz4NNrmLYgCVL/3ZSipeNt1UCJsZV3sEZIMqKJMSk=;
        b=O5zA59LMeLGnFFggE3S24uYELO99rfYDVytRImazFmVa2jeciviymt9AVzCOBywjOT
         sRByLzjLQgtqni2BVWaqffgbfyFSQoy1tB/jWsjdW4Wd/5XXCqFTu+OIgmOWJZjO7X0t
         uFAxyJhpFpHORJT5Z41p3XHDSIey7eFqHKaPI1ysYLUj204p5xGuVHqVla7+zrFrDctj
         bjmf9XZrQYovA6k+PYpp+NeK0lLPWHxL7e6LdCYAqgfsLImbnD6nEIgrNnxcUmj0mQCM
         CbTuPXhodgRBsoDTGPlVWgbFrIZ+888mLOuLgAcul1D8GNRCcB+jtP1Twk+6aytLWM13
         A2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773939674; x=1774544474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pQYz4NNrmLYgCVL/3ZSipeNt1UCJsZV3sEZIMqKJMSk=;
        b=DLHSlfXuXC66os1g88vmsn3XxoVKNEs1PdUH3MRjoZWmFT17sQAijknBMcI66s82Jc
         OrNX9eyBUBGcBugrIXH45XlAtxPAxT4yrDWipjBGJtpW/o3/qei9tLNroDgPPSgGRZ+N
         ni6S6J6rkK3U4IGf1XswyvhQj9FFlP5pqRg3+VOcKIBTeVmagHw5O1/Z2LUGDljEGm5g
         nNyXsTd6eYqwNaDCzdOq+53yLTJyudaDSoU4cKN57P7qBKozfsMZV6cz6f8vOoCK3Sv4
         q5xUnV058q3CsdtM3CklJkYVi9fBUacvujPgleOPq0Da7Czrt938qfwkCBTl/cJXZvE+
         RSzg==
X-Forwarded-Encrypted: i=1; AJvYcCWDnYeTuRhHPHdvnBjDHA8N2bYrHLtDM+ZkjGnGO5mM6qGBRaQKF5IvemkqhR2/fB4MOp8FPuYn4DA6hbzR@lists.linux.dev
X-Gm-Message-State: AOJu0YyX3gKti45rFHZdlOKv+I5iRQ8m02NAQLoqpMzB9CdqduPANoIT
	7ZMMHRtZcp8RzARr5VCOmcM97QAn9cg79KEa4fHGFDdiiqP7ahOAy30wRAs14957CrQmWLLSRXb
	7585ZZCB9LFpdykPitx9vFHyoY9cTQ/Y=
X-Gm-Gg: ATEYQzxTQ9Vx3oIiMUYzyCJp+I1WxmokbpQl2trc1bxi0GXEZpvbpEWQwhreBKoPX6L
	Xb3cxf1/Ctq/MHyvVUo+maRhnObDb44s5mmWSPFRqCiJM7v7+YcJRYNqZ8jCdisKs1FDUIW25hO
	JgpEqZYRNLfGsPzRuSKTyc0ZBegLMISuhV2g68zotM0hOZXhjxcfdsgxYeFuZOk+WabD75fDoAq
	sLlwKh8Gx3rdsNaBN4EbiLLiUg1NDTSSECZZF4D2xIli13AhVZntmF6umPlPcB29Uzn9zcomRGy
	jjXO6bDbeaZh7Ilmxm14wUTkd0wa7fljjenn9j1M41LE6+01hSI=
X-Received: by 2002:a05:6512:25c:b0:5a2:78f8:60aa with SMTP id
 2adb3069b0e04-5a2796c24camr2615441e87.37.1773939673832; Thu, 19 Mar 2026
 10:01:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <abus4pKF0ykt6nhj@stanley.mountain> <20260319120737.29692-1-starpt.official@gmail.com>
 <abvwIQh0CHTp4wNJ@stanley.mountain>
In-Reply-To: <abvwIQh0CHTp4wNJ@stanley.mountain>
From: YuChen Lin <starpt.official@gmail.com>
Date: Fri, 20 Mar 2026 01:01:01 +0800
X-Gm-Features: AaiRm52-LCzd1QuBPwHW0-GRqsRI-csWZS6hPR_5ggXHQayw95QwE__r6Z1wQrw
Message-ID: <CAEzaNUR2AsufewOCJvW6NFK1nEsP9TF4AjXDziHei7W7GfhY=Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] staging: rtl8723bs: refactor rtw_aes_decrypt()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 8:46=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
>
> Thanks.
>
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks for the Reviewed-by!

> You don't have to do this if you don't want, but unrelated to your
> patch but the last two bytes of &le_tmp64 in rtw_BIP_verify() should
> be initialized.  Just set it to zero at the start of the function.
> Otherwise it's an uninitialized variable.
>
> drivers/staging/rtl8723bs/core/rtw_security.c:1308 rtw_BIP_verify() warn:=
 not copying enough bytes for '&le_tmp64' (8 vs 6 bytes)
>
> regards,
> dan carpenter

I will send a separate patch to initialize le_tmp64 in
rtw_BIP_verify() as you suggested.

Regards,
Lin YuChen
