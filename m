Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04F428751B
	for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 19:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131484; cv=pass; b=VE00aF6qIyeGyM9aUMdcG4YdxdY5cGHcL/eN9Lfr4lpmedqVXT7I2tL1rNWkiRYOr94ZmqRkMcuR/y+4mltVhGNVL2hHi4eUCeq/hfzOs/Awb4h+jsgU1Fih0QlfzWAo5bdz10TmPfC2YnzjcKAyKbzCI33FfFAB4t/t3szkxCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131484; c=relaxed/simple;
	bh=6oJJE5UNhr2wpzWh838/Gl1WSmr1appOubA+1xPUAoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ala8q1K1XMnyQBhWFtv7LjqZcvPqHfFT3t14pUX89hwGTMFl29oHrm+0HpTcH5uA0rtRpPe1f84dh9B+uTeSCfGUDINxAKell5qhO+qxOtBZR8bVQJ1xlwJxVOIhZCv3LBeddAGT8CXaMvwO2oePxAAMo8XNbl6uSV3oMErMVtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HHG7t1dk; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HHG7t1dk"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-67b6da5a618so4732203a12.2
        for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 12:11:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779131481; cv=none;
        d=google.com; s=arc-20240605;
        b=TQjHIoyOhzB6Pkcm44vEf7hCCA+300jElUvnpzG/w3T0NB8Qq6atoQ0MCnFm7QveZu
         YaAdJHW54SkRRdDjPFk+pw5LVhgaZcQtJ9Oro2PG+vPdUk75INsqCg2pSy+5gUPXBJKG
         erefFVBDJoZCmaFcDT+DqaV+r9UCJtBrGedWXr5zWlQ4MFesM12Zg4NJEOMwENVRubIg
         fa8/H6DYb9kfYw5AzGd7wvEmWIaI9obbrOSxmKwcduf8qNG/39uK17Gcwq1HjNkdYe0q
         fF16maMQ/k5cfsWLiZ+PbPflfkG4w0KocNM9N/FIEr0Y2x659Qpd4AXjjlzHXyrTg4Fj
         RdXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PwOnXS36GK8924Samkl1Rsi9voNVKewHLksnWc1aYIg=;
        fh=gLVAmYciNfmgxxvRrg21etp8Oez7RSGBGGa5UHMcDIA=;
        b=bNBWqwhmAA5LHSCmw44DHxuop/wsjGHgPYlok1IS4q9MBjeVCZvtrt7X5XgKWh0ibo
         q1PmLrcVN60Iqc8lM8l2Kn7zZs5GAgulDaJ/TI/bt5YC8X+fBlvVzimiA+d279knYWGJ
         Aqdb80HUwh76k99/xNPkm+7uA+2SH5Svd7v8fTvtqMedD2qrc4K1BGoYlKjpfE2qlTcm
         KPz6KeTxqsNkZE3FY1yZnGCZUMbE2nDIaqDBbNxCiEdkLpegxR2XGe6bJvABaWqhNim8
         NoVyu+KibHcP0hlnpdXbd5twNuQ50S5A60amgda3OW4jal1n+MaIRiWFSts3yGnzmloc
         YPmQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779131481; x=1779736281; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PwOnXS36GK8924Samkl1Rsi9voNVKewHLksnWc1aYIg=;
        b=HHG7t1dkuxCezv4XgLK1XvC2wHRMhqewecHFTwAHq5La0ITLUE0E0xPBS7XTfdagel
         eJPsvG1drRwW4Ht1jY0bXAbkA0lL+YyZe2rTB1Xsr2eycvb8o16pJvErl2SBAl2NyKTC
         rXFRotSks2NAjfbSoXtsxs/5mFF8XVGqH5+vBld2y9qFStBRdvGXowyL0Em7RWvXDdaC
         cMxmqp6ka/bGciegB7znAfe2bo10ZJ2dUJoJ0nZgwfqOO4UhE9Gg3m0IftAF1cYTNyS/
         XjRrPwttUghlhKGGMs0z5iEW5gRHAkRwsWELB5H1JmDG8OK1HPIML76Z4sFcR0NYMrVY
         cXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779131481; x=1779736281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PwOnXS36GK8924Samkl1Rsi9voNVKewHLksnWc1aYIg=;
        b=TmfkjBbQlpR4/rVlPmDEXgvvXFyRe0v4x0igVlDdvIGg7sWD2VncfSut3MwEbRWOBW
         KRvUuYaCkfvC2udLtf/6eLWytPs5I2INeXVhquPGkV/xJYO06uwlBXefhHV0Odl33LUK
         nTEet63iG3FKFTiNNUhMP5OljVqlN5DW1tRc4S7hl23a54ccoQYGZzqw8tXDq4OiCZAE
         wRKpFdJWjtMIQjD+0aI/CdUbhL3O7mtLah5XhiJtHflS9GSGlo7Cch5ln6iWNyPbmCAW
         V8fP5KaeKumjL9tnXnADbYGQmf4lQucrP3Pie5hvQMXdSHM259sh1wLvjJqkZNm3vMAF
         fsxA==
X-Gm-Message-State: AOJu0Yz1Ql+KEri38/g7tZtHY2lkSPKUmsfD2s5DUXr7nnk6uByti95c
	y7ddto+S8/6ewNN15QqK84HVx8QTY84keaR35xaRPPhimgBKVT+RZRfJQoZSU07k7bgv/ftg9J0
	dqnjHYEg5Z1Ztx10ph+A5Zo5+6pHG+7s=
X-Gm-Gg: Acq92OGpbY9og3kDd6eLf1hFuQeJY3irIOZuNy1Y7R7TATdDwko+v5qoVqJDOBv4Lw1
	fP2i7VnRSeLGhDypCWofmgY98VzNBbbLhIYXdU10PzJJqbMk4nmEIWtAs/W+Jy1LEoE7LW/nghp
	V9wp1Sx70Iuufbnqwuj5r8N6pPqEKHpszdlmqgp+ijMQDMBP2tQuZHIz1khwzlHdqzMptttbKkJ
	iVvmo75tqFRURtLxerlfVGOc4mH4MT+M4tRIe0iuiPKinsNvdHjdMcJkI2x1kujC4gxqTj5KrOF
	vque6QAJ/4QWK713szHyisn85xVNsEuAPOqkKOGhP1ukklcMOnGZ7i+UIlGsh7s8mpLxk889pA=
	=
X-Received: by 2002:a05:6402:428e:b0:670:f319:ae77 with SMTP id
 4fb4d7f45d1cf-683bc1b747fmr8399835a12.1.1779131480804; Mon, 18 May 2026
 12:11:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518180641.44421-1-mokshpanicker.7@gmail.com>
 <20260518180641.44421-2-mokshpanicker.7@gmail.com> <agtd5tvK58iY6ot1@stanley.mountain>
In-Reply-To: <agtd5tvK58iY6ot1@stanley.mountain>
From: Moksh Panicker <mokshpanicker.7@gmail.com>
Date: Mon, 18 May 2026 19:11:08 +0000
X-Gm-Features: AVHnY4LT0Wfi38KCcUrPbP8Xv1v5e4h35uPzyOikAnf239GE9coRlTZALZ7OCns
Message-ID: <CAK0z5O=W-Rp7iuaLZ86Y15qCxkXNks94Sxn91zVOmAbEiRsmzg@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] staging: rtl8723bs: reformat rtw_efuse_read_1_byte()
 signature
To: Dan Carpenter <error27@gmail.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review. I=E2=80=99ll reproduce the build failure locally, fi=
x
the issue, and resend a revised version after proper compile testing.

On Mon, May 18, 2026 at 6:43=E2=80=AFPM Dan Carpenter <error27@gmail.com> w=
rote:
>
> On Mon, May 18, 2026 at 06:06:39PM +0000, Moksh Panicker wrote:
> > Reformat multi-line function signature to a single line to fix
> > line length and coding style warnings from checkpatch.pl.
> >
> > Also fix the missing brace/comment spacing in rtw_efuse_read_1_byte().
> >
> > Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_efuse.c | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/stagi=
ng/rtl8723bs/core/rtw_efuse.c
> > index 803a608b74fa..afece04c09cd 100644
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
> > @@ -78,7 +75,7 @@ u16         Address)
> >               return rtw_read8(Adapter, EFUSE_CTRL);
> >       } else
> >               return 0xFF;
> > -
> > +     }
>
> No.  You're not compile testing your patches.  This is the fifth version
> and you're still breaking the build.  Take a break and come back in a
> few days or something.
>
> regards,
> dan carpenter
>
