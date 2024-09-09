Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D1A1B12DC
	for <linux-staging@lists.linux.dev>; Mon,  9 Sep 2024 07:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725868387; cv=none; b=En3Vf9bduUr1Q9uaQxC5BgkIV018Ktb4HWA8ygiAbPF52vSfQsnOKH1DEA/3+Eu6vrWUFY15ZAdXx+E1GwkXM20Dom+xU9l+NBwZL4iyroZnR0kxQ6X3y7nUxyzBXDDvr75KV5yW5vpZbJVNPCdpFRXMQY0WgYRBFiwkTNpqrnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725868387; c=relaxed/simple;
	bh=6qd2W8Odl0yFyH98r9xDgkNrg3DqMNaavaYlPrAdjGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=rtP52rEB7jGDwLBjkglRJ4RW7zP9YjFD6+NpdVM5Dk+D7ap4aj7y3TGaMHMAPxez+s1dYdyDc6+6PkJq4GX1PbLejeAc2VvPZHIl1fjKTdLL5C6LcP7FpxNymrwbrkQ9x0pV44ze3LxyhcFn3nFU9AnDsocC8c+wkAL7KNgRG1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/EFZIu9; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/EFZIu9"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5e1b50fea4bso1670518eaf.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Sep 2024 00:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725868384; x=1726473184; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIQ8ogI5HxMs/uTdxfLFgZ02s6k2I9upKsBb3FOzPK4=;
        b=h/EFZIu9Dt4K0XpVY+oIKBlhsPH0aI1yPiqst8jw3n0VjftL4Pl+/YJSW/OUAofR/S
         G642VE+dGvCGOfYE/2+MrxAh+Q7adndfjbATHx6Pq27D/57LFpm8B/3FFEv2JffUd7L6
         xMR1MVni0sekeFON/OxBqFMmpIFFyJCOKts0BH0NTh9/Yu4gD/iswMDJBegVB6pcYWXM
         MZ0JKa5ZGzo2i1X7AuRs72WXTcJaFxo27a1+VrBF1Wgsbtr7GZy1w8/NrlwGx/P3HgRf
         6wj3QkzKZWZ69q4s7QHArxpwhMUQJaD5cH0O8JjnN8tN2KCTmBOv83YTcz7UChPqCo3C
         5YFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725868384; x=1726473184;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AIQ8ogI5HxMs/uTdxfLFgZ02s6k2I9upKsBb3FOzPK4=;
        b=Kk02GU8DxR9lEVtRFrrg4UQl0hUu28RpAa0AncDeICVjZcE41x4h+p0q42lrMxTTfD
         gQ4CmUF7dBzACJyvo2GkB/9FB4dVQ6VVjjrsNTajLxnP705h2YIlEPCo/DtVojlD0tEx
         2tbOFNf8qEYO9Rpcl8JKZOxnz0l+IGlu+SBFkrIUPIE5evz/5hlKVycM2b6kubcKdzjU
         R/Vp0R0TpHaPt9rx4pCQkOnShC/PZa6jFPRnvTzyQKgygCQX2kA1p2evS5zLfIBQl84c
         pL+nczRxaFr36BQ54MpMTWBFoil8P2a+KpqbnhkkgS3lS/huEij6D77QpWFIlz7vlnmN
         NgFw==
X-Gm-Message-State: AOJu0YxGpmrYqXSdJ+caDmxcxtT0N2euEIpIRCguSiUq5/Qvne2fPkai
	hmylHZKKGwPJFMygatmTmUep2NTNo3chOi/jGXsPfWyYHunkPWcGGxwbg2lM8ODT1YpyWGO06S9
	KotZamwepPt73qCbqs2lyB1NDsoMwYQuFW7k=
X-Google-Smtp-Source: AGHT+IF9n/6dG1HmHLRW7UtMby7pCuUORj8M5WquiU9PSmQlnu2GOYNzvdwVHvhA1hm1gzVhXYaP8ZZ2rzEeHuI9hb8=
X-Received: by 2002:a05:6358:724f:b0:1b5:fa48:5983 with SMTP id
 e5c5f4694b2df-1b83810233emr1367556755d.0.1725868384472; Mon, 09 Sep 2024
 00:53:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240908101110.1028931-1-sayyad.abid16@gmail.com>
 <20240908101110.1028931-7-sayyad.abid16@gmail.com> <CACVUEBnU-XYn0b4WZ5qbeKEgfEbHoM3jAkOvAgLQtcpYDJEfnQ@mail.gmail.com>
 <CACVUEBnO1zjyuYNtai_F4J+fd_TMNSpXEjLw5QH_2Xeo_48Yxw@mail.gmail.com>
In-Reply-To: <CACVUEBnO1zjyuYNtai_F4J+fd_TMNSpXEjLw5QH_2Xeo_48Yxw@mail.gmail.com>
From: Sayyad Abid <sayyad.abid16@gmail.com>
Date: Mon, 9 Sep 2024 13:22:28 +0530
Message-ID: <CACVUEB=Y3nQ3ozb847tSCeNx-DV3_Ynrm5-0_syqm+eS8hRX2A@mail.gmail.com>
Subject: Re: [PATCH 6/6] staging: rtl8723bs: fix no space before tab and
 statement start on tabstop
To: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 1:07=E2=80=AFPM Sayyad Abid <sayyad.abid16@gmail.com=
> wrote:
>
> On Mon, Sep 9, 2024 at 1:05=E2=80=AFPM Sayyad Abid <sayyad.abid16@gmail.c=
om> wrote:
> >
> > it this working?
> >
> > On Sun, Sep 8, 2024 at 3:41=E2=80=AFPM Sayyad Abid <sayyad.abid16@gmail=
.com> wrote:
> > >
> > > This patch fixes the space before tabs and also makes the sentences
> > > start on a tabstop instead of spaces.
> > >
> > > Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>
> > >
> > > ---
> > >  drivers/staging/rtl8723bs/include/rtw_security.h | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drive=
rs/staging/rtl8723bs/include/rtw_security.h
> > > index 740c8504cba7..f005ec88d00a 100644
> > > --- a/drivers/staging/rtl8723bs/include/rtw_security.h
> > > +++ b/drivers/staging/rtl8723bs/include/rtw_security.h
> > > @@ -162,7 +162,7 @@ struct security_priv {
> > >
> > >         /*  For WPA2 Pre-Authentication. */
> > >         struct rt_pmkid_list            PMKIDList[NUM_PMKID_CACHE];  =
   /*  Renamed from PreAuthKey[NUM_PRE_AUTH_KEY]. Annie, 2006-10-13. */
> > > -       u8              PMKIDIndex;
> > > +       u8              PMKIDIndex;
> > >
> > >         u8 bWepDefaultKeyIdxSet;
> > >
> > > @@ -183,8 +183,8 @@ do {\
> > >                         encry_algo =3D (u8)psta->dot118021XPrivacy;\
> > >                 break;\
> > >         case dot11AuthAlgrthm_WAPI:\
> > > -            encry_algo =3D (u8)psecuritypriv->dot11PrivacyAlgrthm;\
> > > -            break;\
> > > +               encry_algo =3D (u8)psecuritypriv->dot11PrivacyAlgrthm=
;\
> > > +               break;\
> > >         } \
> > >  } while (0)
> > >
> > > --
> > > 2.39.2
> > >
> >
> Does this work now?

I am sorry for these last to replies, please ignore them, I was trying
to test my email client, definitely chose the wrong email, my bad.
> >
> > --
> > Abid
>
>
>
> --
> Abid



--=20
Abid
