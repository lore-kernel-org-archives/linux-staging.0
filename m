Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DEA2AF06
	for <linux-staging@lists.linux.dev>; Mon,  9 Sep 2024 07:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725867487; cv=none; b=fWrFQyz4v6h4BPayh8c81ADBvKN0O7mhpaGMFDYK6okgFefhDR4wEp8HLcyeMKQo+wDiXYtvLJYQ/Aon4+9gR+AFI2bCjrOKfTfZiA1sUPVBnh+jLFc+LCygKolGEriLj9aClOgQHMuWyxOrvNaY7ApzaWJu5HPKOwZnOhjMKkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725867487; c=relaxed/simple;
	bh=FipMosQv1OOSJ+M/gEDK762kccihuN97ssbQOWVJ9gU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=FGR5aHBFh4fbx2XFjzPgXbQck63itJZ0UiCCEWb24L1ekvhAZxqktaXAA1dxDb6U0ZNKd27cZ+K/U0klfkFntFJ4Z2z8vQyyMhRYLMIDMJMiHieslKtMowEjMGkC6pQ6YP/b6LajdOJiK9ol8mC+2RGKm8B+jPyWvlmU3UtsGfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtEYewNQ; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtEYewNQ"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7184a7c8a45so2261912b3a.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Sep 2024 00:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725867485; x=1726472285; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nziohq7hqkZXQxWs47I1k+jlhYlb6jw2TFmuJCO2Q18=;
        b=AtEYewNQTr1RCkjq5qgzbiGk5nQC1/JzWqFt7ueDTpge0VKYi4lST9fVM68MOFMB9p
         3Aiqv/p+AP6hrlQtYeCILWfm6LvQTUCiiFQGcwURw5rcsltN0gXNBs7P839WuWkIpjSL
         r0ICzdAtM+u5RpllV+aKFq+ql3xbN74MR2nCM//WLw9jkpD5LIR7esDyMKvSeqLIpYm1
         DOeEtlWFbxIYsHYqAIenmRY4j08m/5Yu4CJcw6mNyKtgh818fH5younvX+wNQ8kKZwJS
         5Er8g915xApZu0alg4V3LWbb2/jHWmmADMSN87n3tM7pYyEaN/UEvJCZ5HkPULFR/K7k
         uAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725867485; x=1726472285;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nziohq7hqkZXQxWs47I1k+jlhYlb6jw2TFmuJCO2Q18=;
        b=Qem99PEz0wKnLYi4+MmsAQgY9wJrhMGcbbwLA7A30tuvxEo6m/19Cew9qtaw8RQan7
         TyIVtWZnIONdedUrx3X2Ovv5jzRcBQKqWBCkQv/lcftE5D3k4axX8jJopeoeDwS2Ybo8
         VbTTSDZIBE7joXnWNkj5ac+BQl9Zvw0IVpNT7yzE/WbaFiekkWHy22xUK/NtIziEtu65
         37O2CzvV8CT268ON1nu1nuk/X8/Albg3cYUEvXHEi72zXLqfBOzHqvQdcM8q2V2ywUcr
         bIz/3LzzYmZSKPs7rjrbWNKJ1Ygxvbt9iADpnN1Y4nB/EaZe3VNAuwL7SmkLm/elh3+J
         XlVw==
X-Gm-Message-State: AOJu0YyyBcAQ0hNfJu98dVug6wNelGPL+q4Otuf00tUQQO6PVzmmqz+v
	rqKIk0fr6EjWoU/xqn/sRGMWBInOiFibbwVKdovAkmmMU7fJIm6xrzf0BaeFHgYkHusaHp3Exay
	NBTF4Z5mUWPzJ/kqUhhxdIijVv9pN0dyFwA0=
X-Google-Smtp-Source: AGHT+IFOh6NkCtTU4kj4xzSmIqmk1ugzKR9PgqwbVBrL1UaPLPLt7uRqEZjyHZiBr8PyRmbFqvPGc1drLN+Ys4zkj1k=
X-Received: by 2002:a05:6a00:928a:b0:714:2dc9:fbaf with SMTP id
 d2e1a72fcca58-718d5efa3b2mr13945192b3a.18.1725867484773; Mon, 09 Sep 2024
 00:38:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240908101110.1028931-1-sayyad.abid16@gmail.com>
 <20240908101110.1028931-7-sayyad.abid16@gmail.com> <CACVUEBnU-XYn0b4WZ5qbeKEgfEbHoM3jAkOvAgLQtcpYDJEfnQ@mail.gmail.com>
In-Reply-To: <CACVUEBnU-XYn0b4WZ5qbeKEgfEbHoM3jAkOvAgLQtcpYDJEfnQ@mail.gmail.com>
From: Sayyad Abid <sayyad.abid16@gmail.com>
Date: Mon, 9 Sep 2024 13:07:29 +0530
Message-ID: <CACVUEBnO1zjyuYNtai_F4J+fd_TMNSpXEjLw5QH_2Xeo_48Yxw@mail.gmail.com>
Subject: Re: [PATCH 6/6] staging: rtl8723bs: fix no space before tab and
 statement start on tabstop
To: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 1:05=E2=80=AFPM Sayyad Abid <sayyad.abid16@gmail.com=
> wrote:
>
> it this working?
>
> On Sun, Sep 8, 2024 at 3:41=E2=80=AFPM Sayyad Abid <sayyad.abid16@gmail.c=
om> wrote:
> >
> > This patch fixes the space before tabs and also makes the sentences
> > start on a tabstop instead of spaces.
> >
> > Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>
> >
> > ---
> >  drivers/staging/rtl8723bs/include/rtw_security.h | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers=
/staging/rtl8723bs/include/rtw_security.h
> > index 740c8504cba7..f005ec88d00a 100644
> > --- a/drivers/staging/rtl8723bs/include/rtw_security.h
> > +++ b/drivers/staging/rtl8723bs/include/rtw_security.h
> > @@ -162,7 +162,7 @@ struct security_priv {
> >
> >         /*  For WPA2 Pre-Authentication. */
> >         struct rt_pmkid_list            PMKIDList[NUM_PMKID_CACHE];    =
 /*  Renamed from PreAuthKey[NUM_PRE_AUTH_KEY]. Annie, 2006-10-13. */
> > -       u8              PMKIDIndex;
> > +       u8              PMKIDIndex;
> >
> >         u8 bWepDefaultKeyIdxSet;
> >
> > @@ -183,8 +183,8 @@ do {\
> >                         encry_algo =3D (u8)psta->dot118021XPrivacy;\
> >                 break;\
> >         case dot11AuthAlgrthm_WAPI:\
> > -            encry_algo =3D (u8)psecuritypriv->dot11PrivacyAlgrthm;\
> > -            break;\
> > +               encry_algo =3D (u8)psecuritypriv->dot11PrivacyAlgrthm;\
> > +               break;\
> >         } \
> >  } while (0)
> >
> > --
> > 2.39.2
> >
>
Does this work now?
>
> --
> Abid



--=20
Abid
