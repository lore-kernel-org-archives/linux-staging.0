Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975E331DD96
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 16:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771864539; cv=pass; b=CzDi0WPcYkIaEZVUXLk7/yB49iaU+PNIlHqu2ceVuxNc2W+hkFQuv9BAj+gOjkUazpgnd0G+VBt0txnRgTJsbuFsP948G312VKjWXU60rRhZv3kwe1pUcErp28EKeH3ii5wWQBi8VGB1VBSE261gn00lOvUSnZinbATDkXiQDoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771864539; c=relaxed/simple;
	bh=N71k2irlCkrnEFlEFr7e4D8Lx33tf9Wji2sFUas2sjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uMLfX7SSS55Uy2WBZWYG6aSjhMzYehw4nEyP77PtBCRyXOlG1MFQcoAzEHjNr3veKpvO7BKmK+dhHZ0RzoNvpkGYxH36F8bxaE4PmBC9Xv66aUPX5H+Qp0MelpXqbUAslK9MJq1rY7JBe6GjYPcCHlETaLpGVDUsDczMQJ7swy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CzVYPu69; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzVYPu69"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-797de0727a4so40426247b3.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 08:35:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771864535; cv=none;
        d=google.com; s=arc-20240605;
        b=b5qOsBhS9Aw7N+beM9xF45ek5hZZv+rZWLqsB2vS4E93uDW7hFO9bKyFB8f2y0pVPe
         sJqKDYoggHu7pvxz458ASdHrvZUIdU8Ic/GmW803al3lY5YqPoNd08xsTtyF+8pOXuPh
         uN+BcBUCFomY/WmMSxHAGO500GLNkTeZz3R3u49C7ojFDmlXYpNU+er6mBesFJf0hdmP
         Cmaq91RGnNU13efN5kQ4B6VpDTn+xsMrKzCn24NywAr03qC2mYNujDU5HI+A/MNLzew7
         MSo6q6WiPm9MAZCL1jf1uI8KcFudJgR3Ckrc2BR4mUVzyWMPVwzq2K9YkBz2Nd2BlJMI
         /UQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9lO39Y1kmMpITHCNNP1efqJfYyteQBFQx7T4Fl0GEtg=;
        fh=0MGNYudbFLbz+G2nd9bZSGygTt68ujdPJCSdIRJxdPw=;
        b=GEl27zs0kSgkcDsF2eSGmPnyWQlFXfDwDRu0evP4y1eBPXq82jQMo/c6rG+K2ULZAQ
         dcENuzESh5vg/k80OcgfFsQ7deykTcVgdWtzI2vPQX1xj5FxnUx3aP2V5t/7G79msr7w
         QAWSnCpAbJn4ZB9Cc7lsWjJR2FWUHxHNJO8m8/j6uNycBEnCCXBSnTKDHO6N6AB7v/MJ
         G96Ha8yCTvpPc+Qu2w7UbM4UXCle/eimKBqcwJCJi1o1nETEtvH745kz7ouS8fVbepUS
         GJv0h29VYUjC1hXyuH6XfKW5Qv8N7w48OQP35DDOoULlJP33ZPI8AZNOkbuToR5AjaaO
         Nxuw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771864535; x=1772469335; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lO39Y1kmMpITHCNNP1efqJfYyteQBFQx7T4Fl0GEtg=;
        b=CzVYPu6964KkUwCRgbsng5+PP7tE76kc+lqIL1hbECohHV8d06lTGr+leTaJATVizY
         Zg8XfelJhLJIkNuTF2N7J+eQ7WMklB1p3mMtryuB4YkbjXzl6swJxhlE0o4br5NtEQbn
         5HPuUz1e1yCsMcIvPMq6Ecj+5YDEGqhvf48iAb5zKmN2xijhaAxBf+2SKQluPhPCfcKk
         FNYQgL7RYrCgg2Oo7Fq9rOJSO0YwLmlPU55RjnBdNjqJYQYikDok1ugPk+Kwg4qjCYSJ
         6wDAbBJCgES0Pp3hjKgEaRtdQIAOTp1idG542iWyy8B/yRFhVOHGmsgGN/ttiIuWVU8b
         pHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771864535; x=1772469335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9lO39Y1kmMpITHCNNP1efqJfYyteQBFQx7T4Fl0GEtg=;
        b=fgIyVwhQ/a/0xDMsKEqaNwOfNkSYm9uFYCqSjcND+wQcGWICpEieiJKW66fCFn/uCF
         BTwfWxTcyUOd7phX8wypcm2g5wlZYI042Nuh2qIKaCe3gtmLi+hsepCxWpU3T4cpI3cf
         dv8GhAwwkitDWN5AOF0y/Gn/DjNXq1DwW8ALCO/nG2vpqlght1UIUH8yWvCMLLqGo0cm
         cWWlhhOdauRjmnzCPIyaq/3V13ZMAPanxBWkMp8N/JGNcAltDqyUjIju7v75kInQmSHL
         1yKRrYhXO/NOFVz+jxjvCl1kqzyPQDVOlwTbIrbMB5A1NqrXZDCLdKndadCV0tWRszb4
         gDlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGUBvr2xI/cjc0wLAJklxSNZougsnGz9R8cSnb+iR1mjTvt0YsEXa/TKBJbMk1ywpmfThQbtmA8aXbBZP1@lists.linux.dev
X-Gm-Message-State: AOJu0Yze8ZbWwNth6aJmBcHJwrK+5XS8sERRBEozHpVkvYsSPBPm5+zg
	nhpV0BXv8kabMh8Q+0rLU0+vaKeswSZjOfME0+Xg5ZdVq0bb/W7LA7P8TvCWG+q5tg1LfyRnbT2
	UrshUusiJ0l7XNkbcrUiIK3P21Wh+jDc=
X-Gm-Gg: ATEYQzwdHPrS10lwBb9gidr9aQibvUqMLntw0yt4ehsKIHoPC03z1arbj+y5/KZ6DNA
	OHn7uOzNF0+R3XDc8GlESRL6pzXRWpo/MSGHFXAIqdXXpE0XZYzM+WTc/ZkSBWwUDt0hMVwBdRP
	WmXTfKObGp3SzFDQrGTGPYD3Nnrw/pbJ7I9gHjJ0aUVqOL2chin0P4Q+0vgsTrb3wablDokc1Tw
	pWyx/uuSMfj7/NDIXmyNDFgQogambxjzQRE5gfnDHvycBNw2u2xxL3mO/Oew+1Wq7BhuMQa+IGf
	zC1HC408Zlo=
X-Received: by 2002:a05:690c:6604:b0:797:db54:b856 with SMTP id
 00721157ae682-79828fc1d5emr92772477b3.35.1771864535371; Mon, 23 Feb 2026
 08:35:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260211135545.13505-1-mariyam.shahid135@gmail.com> <2026022352-squid-consult-b1d7@gregkh>
In-Reply-To: <2026022352-squid-consult-b1d7@gregkh>
From: Mariyam Shahid <mariyam.shahid135@gmail.com>
Date: Mon, 23 Feb 2026 21:35:23 +0500
X-Gm-Features: AaiRm52IjDVnq-FzslAAD9143LLrn1J3ObBNoVjj5OXygkqC7CJ1k1fr0M_FHks
Message-ID: <CANhxO_g5qD7=nwuxrrh4CK_d-pTAFkGP+5O1yUpUU1usDZ1+Cg@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: fix YODA condition warnings
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dan.carpenter@linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 8:19=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Feb 11, 2026 at 06:55:45PM +0500, Mariyam Shahid wrote:
> > Place the constants on right side of the comparison in rtw_security.c
> > to follow kernel coding style. This resolves a checkpatch warning.
> >
> > Signed-off-by: Mariyam Shahid <mariyam.shahid135@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_security.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/st=
aging/rtl8723bs/core/rtw_security.c
> > index 8ee5bed252bf..601178dafcc7 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_security.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_security.c
> > @@ -1488,7 +1488,8 @@ void rtw_sec_restore_wep_key(struct adapter *adap=
ter)
> >       struct security_priv *securitypriv =3D &(adapter->securitypriv);
> >       signed int keyid;
> >
> > -     if ((_WEP40_ =3D=3D securitypriv->dot11PrivacyAlgrthm) || (_WEP10=
4_ =3D=3D securitypriv->dot11PrivacyAlgrthm)) {
> > +     if ((securitypriv->dot11PrivacyAlgrthm =3D=3D _WEP40_) ||
> > +         (securitypriv->dot11PrivacyAlgrthm =3D=3D _WEP104_)) {
> >               for (keyid =3D 0; keyid < 4; keyid++) {
> >                       if (securitypriv->key_mask & BIT(keyid)) {
> >                               if (keyid =3D=3D securitypriv->dot11Priva=
cyKeyIndex)
> > --
> > 2.43.0
> >
> >
>
> Does not apply to 7.0-rc1 :(

Hi Greg,

Thank you for the feedback.

Regards,
Mariyam
