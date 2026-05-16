Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D06B2777F3
	for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 15:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778946769; cv=pass; b=kE6YtXdxZtIR2Zj86Is4PeI25rV48xJR0OyZ/eWmfcvJzyZKxEVW4vcrOLMcqRZvWHyPBAfTo4TqqTs10yHoxrEpEjGM9d9aAYhUkgymIUrtoMzSS7t9rLDi0ebUqELqSpTIVU016Zm/3z2S/GPvcKfB4OIN8KlnHixHXaIId70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778946769; c=relaxed/simple;
	bh=5CAorhpiFzSfdfiLD6W2ewjuRzOWcgMBZRIBGyRw+6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oOUCC2c7UpiDIdjd1ITNmXsEo1kJraKBCO63wUFKBZAkziEQu6+ejP5wPsb0ITvhuPhR0fCfsE2if/5ZoVGZC2hdvB/f5mnyyu0Evyg4zW1DYbw6xx72s5w2PTPhVX+GPtoPFJ7XQcgvAGjCHYRjoyVk+hcS5CcmCRvfDWsJ8vM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ASkg+p4z; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ASkg+p4z"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67e2498f3a7so2193835a12.2
        for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 08:52:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778946766; cv=none;
        d=google.com; s=arc-20240605;
        b=QhNDBGPio4D8sUMxPmDpxZqJ8FN/sMMfICptpeGxrhPgxlh0RZUQlmp9KPZNeVv4Rk
         960r/lF8cHaR+9mu/gFOLGJklzSno53sTaeha5dLaQ2ViiS3z+LvTVXLfvEGXRxv71GL
         cdEikLkHIU0WHw1fe03d7tMc3eJUvhuSM0nI4SlKdlPWARUdt09U3Ki6V6bx0E6MhKu6
         pXbeEgdr4nPy2buD/amtBgIoq7YjZeCsAE/bZNYNlJiIfr9eu10r7rfnokOHpxpvIfjI
         3mAjo5kJmgjMfmoQuJH6X8aJA0q/+LH0DpU2fqLmaLeXRN2mieK5DG7UGDe6f3nD6atQ
         e9fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u5LKsFv8O9aJpCA/cRcQxOe4aQfE74kqndYvx/fgrdI=;
        fh=aiRgke59QYld/DSa/j8l1wlchb1kvrkKH6Buc13EUOw=;
        b=TQsUj0JIuh5jyEu6ZczNP/b2HZuu2d1LObA/aYgmjGmjRSMWxx452KgZzA43Cz2atb
         rfA/efCvlvKE3R4RFXep/9mfkd7StBIznOe1afNEhPV0OzbRghFm6fTeFbzKLcycwhw9
         ZGkVSKcuDNWC+m0Nks8h0e9PvzIBi/6F7BG+LmuRQUVoYv/HSFvomqk4VinXSa+uZyT0
         vy8qQMG6oE5STwnbFv/owwlQ9MjJll/ID2+Qt2FOp4broNoxSUnjkjOTjBOyIk6SGZGb
         McFaJF2d18QLCQMAdpr69ULT/ns3xjFWmJJ+zjziOgjZ4guqBQBbGvSPfwyLtKcTEs2d
         wGAA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778946766; x=1779551566; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5LKsFv8O9aJpCA/cRcQxOe4aQfE74kqndYvx/fgrdI=;
        b=ASkg+p4zBSzyaLDam5LK2WUdluRwYfyb7NjkhUN1J/aG1ul2vwqzm7kPgsR3yTMsOq
         oCjbXGFNbTdY6qSsLYlcz47tQ/qbpwkJEnAjgbKN8hqsDP1lxeaUWm/ArPvVor3uz+46
         p/mwa1JiCLJUi+hjgqnbqaQBB5A2IRacLj/4LKJxnr4BVBA74knJT3M78mYTTXOHjnT/
         axuwZPTNu4uQbLpdNy98DhfMDKLcmQy6UgSI7iYFVMUiPwUi4uXwT+ng4XDjqxTnMV3Z
         K9ocy73pinIGPjIA8GkD3uK5xJHED55zXzy6Exr7fGhULJMPXzTeNqThHmCue3nYbest
         1pcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778946766; x=1779551566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u5LKsFv8O9aJpCA/cRcQxOe4aQfE74kqndYvx/fgrdI=;
        b=biOeIGwLo3U/sq6lr3MRmxE76UukIil6Vyvx+aykFShsf6JYrXG4dUR5W9bcIPgeK1
         e+h/QGXuq+rpx1uq8SzkhNm0tHy6FewnXluwa+Q8yhOt1sveZIOoR52HRV8uEP97emqs
         tbm3v0MnjoTojxnYNa2WSmcF5pRuYrgyJy76k7W61VyXok736GR2PrC2xJP7QqBIHSkx
         r7m7WCrrz6DX2+kF1s2ZF8lV/YNWZTsHyayp3Igd0HnDwzKvplLYFlzN8aV3nexlWUh2
         h1VIPjsViKNrLMw61rMxVVsz0be2217VW/Wu43H5rdVYJVB3SCd1D1ZgnBMJ9B6aCaSh
         VbQg==
X-Gm-Message-State: AOJu0Yyj9xBFOFULgy2uCy/VFXrcF+i8saskXSPF3aBiTHLa8WHUyAyB
	fTQPK26ftcL1/8UHbFt4mlSnsFWtVwyvaKMcUT5nEczrMf/FqmGysdeJxZ86qd2fiYPbPbmg6X5
	iExW03DWBxMkjvKDaiQgbXXJhURya5Kg=
X-Gm-Gg: Acq92OECQj03XUBd+EkBN3B7CGzRTkZMphpNumKPNk2uBJBveOdp62Kew8mU0tSguUS
	OlmqMJ96cywvkquBm7VGNUwmuzQZC9++cYJI2vSCaSmlelDKPlv1R4gqRXBDxUi4zbtldS1fDq/
	O2l8SS5NGYG2DIvAc7+Y5G3IshVQl4stgaTSK0w0BHVAS7GgHPrZhm2DJLNw8NhBsdAd5FxoX++
	ONtTLauFm7nnw/AHhDjbU4dNYi8NmRp/YsapxpD/HExILSghVQPDK3drmOGitWn46E/GXmGs9BQ
	eLKwkCv2WIIIKZ544NxIihu26HAihyYa6rHX90ZB1osVLJZsCniW3Hk3GFidbEFrdIOSj2UFLw=
	=
X-Received: by 2002:a05:6402:24ce:b0:672:8f26:8a9a with SMTP id
 4fb4d7f45d1cf-683bc2c180dmr3700601a12.8.1778946765405; Sat, 16 May 2026
 08:52:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516095103.12727-1-mokshpanicker.7@gmail.com> <2026051631-nemesis-dinner-26a1@gregkh>
In-Reply-To: <2026051631-nemesis-dinner-26a1@gregkh>
From: Moksh Panicker <mokshpanicker.7@gmail.com>
Date: Sat, 16 May 2026 15:52:34 +0000
X-Gm-Features: AVHnY4LX0xDsmQ4D55ZPNIJuROHSO2qQIfRKthZIs6JDuVXDSjtx0CB-QteeTOM
Message-ID: <CAK0z5O==G0_fU5+5bC135UKBGYcbLdTJgcBNV0npXao9k1V1sw@mail.gmail.com>
Subject: Re: [PATCH 1/4] staging: rtl8723bs: reformat rtw_efuse_read_1_byte() signature
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

i have sent correct patches with the cover letter

Moksh


On Sat, May 16, 2026 at 10:27=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Sat, May 16, 2026 at 09:51:01AM +0000, Moksh Panicker wrote:
> > Reformat multi-line function signature to a single line to fix
> > line length and coding style warnings from checkpatch.pl.
> >
> > Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_efuse.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/stagi=
ng/rtl8723bs/core/rtw_efuse.c
> > index 803a608b74fa..987d05816c5c 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> > @@ -41,10 +41,7 @@ rtw_efuse_calculate_word_counts(u8 word_en)
> >   * 09/23/2008        MHC             Copy from WMAC.
> >   *
> >   */
> > -u8
> > -rtw_efuse_read_1_byte(
> > -struct adapter *Adapter,
> > -u16          Address)
> > +u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16 Address)
> >  {
> >       u8 Bytetemp =3D {0x00};
> >       u8 temp =3D {0x00};
> > --
> > 2.34.1
> >
> >
>
> I only see 3 patches here :(
