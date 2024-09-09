Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C24C4A1D
	for <linux-staging@lists.linux.dev>; Mon,  9 Sep 2024 08:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725868815; cv=none; b=CtKf/MaB1iJACMRgNIXADJcvdDmLh4cbswEQcDvwqAkWfiJdT3dNNatx42S4AjULYVOpbDntk6z9wSvNKrz2ofoVqX0Vjrs0v9sGhE01/qi9bCOsnnrUpZ2ChHKJm5MDmT2FmENPfS3pZFHDv+VfNh9YBaGcQvurqUro2nt6EJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725868815; c=relaxed/simple;
	bh=DCY7no0mv2jCQtkrDrEVtkKE4sUg4xh36za+NR/Bv2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hGUQIIDti6I9U7syA6m5n6x5r9ruWhNymuogR2eCZAGt1EOFclgRWGGej39uuWTLBLSlXctLpnqy8GqI7NQ3fAHjibZsLBVqsJlCF3AJFeBd9rfuiY7hiqZWX0NxgKGRqjklaS5mkRFUJT1DOJBJTG4vyFvH51n5ui8g6dFhtoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SGplA1r4; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SGplA1r4"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-718d704704aso2330585b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Sep 2024 01:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725868813; x=1726473613; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6hWMpBb44cMivpgFiSL2Yqa6TbfWk2CxNFS7WDJW1Q=;
        b=SGplA1r4evbTnf3z3v96xkkxViBechLAoa1/R7OFrdPXKNafLgSoe3as26ajxPmI60
         8hcw1SG7uHr3bm8QCupiEQBt7Iv/UJ3Qx5lrXbffJpL4fZEys6hjnJ7wsU8MTyv8W+vQ
         QfjGbkDKQXSp+V/YlC2o8vziVc6p3KR0XN/o1CO/sIRb6naJ4yQmJpMrI+YnnQ4mvOEM
         8dlwgrKyvYw5Z558B8Z/6W8Y+FZoAHFjDkZrVrpimzJVvy/yjg4pqqnxaATruDmAvkOP
         sCc3oCpk1+9jka6M8fAaEiw0dxTMid2LfQPTivOhR4/f6CThd0VLDdDha7FUXqoTw4X/
         Kowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725868813; x=1726473613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q6hWMpBb44cMivpgFiSL2Yqa6TbfWk2CxNFS7WDJW1Q=;
        b=BqV4ER9UkgdlaHe+xQ8PJ7g/t11EsXTDd6c4tqfQfFdoZs+hOT0ar4FOFbYhpG6pzR
         H8wAu1G/1AQ3BFpWz+y0lOyN7kkeUg+Bh9e5j46xsB+RML0jM8c9jN07BRbuhGjHJrSb
         3OddBd/1xzCM4ckg6D5D3dISPzTwmaZ+TvpCCEnfyarp4hSerMs/kwDxc0FEPPg30lFx
         tEYy+GCK+27xxFOPBl7IksRQGC3l1lb7N2ykfC0JTYHhuj+N4S+PK+TnOF8pJLlK8gVP
         aqtiHlDQ96aR0ODq/OyBuEXMXNkA+hvvpi3fFhPwec+8UGAAILPXw4bwxsf5oZVRr8XL
         YBeQ==
X-Gm-Message-State: AOJu0YymkABSC526gnn5Hl/gBabPfBpeY8DTlepIeWj8M67NiLdXxJ2d
	zATujY1/MOl4HsNmQO1pGjgszTHpODO92ouIBYIs/pvARMwTegOinNarvKTkymH9/YpYVCPAnxy
	MNTeu4eUsObwo/qqPtPMEnqbbQs4=
X-Google-Smtp-Source: AGHT+IEzvol2Cx1dncYrA7xViTbl8c5+gva0/9Gk+m54uyYkqTTwTct8kdYp+1zW6Nb+LPWf9GHM9oEx66uWXchYKVE=
X-Received: by 2002:a05:6a00:1825:b0:714:2198:26a1 with SMTP id
 d2e1a72fcca58-718e349294bmr8282235b3a.27.1725868813456; Mon, 09 Sep 2024
 01:00:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240908101110.1028931-1-sayyad.abid16@gmail.com>
 <20240908101110.1028931-3-sayyad.abid16@gmail.com> <b335b3dc-61b4-4e39-8627-76bd4acc82c2@gmail.com>
In-Reply-To: <b335b3dc-61b4-4e39-8627-76bd4acc82c2@gmail.com>
From: Sayyad Abid <sayyad.abid16@gmail.com>
Date: Mon, 9 Sep 2024 13:29:38 +0530
Message-ID: <CACVUEBneRuc=n9aHFoBZW7QJ6NsYP5txN7Kx-mc8hay115fHzQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] staging: rtl8723bs: fix position of opening braces
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 2:03=E2=80=AFAM Philipp Hortmann
<philipp.g.hortmann@gmail.com> wrote:
>
> On 9/8/24 12:11, Sayyad Abid wrote:
> > This patch fixes the coding style issue of opening bracket "{" being on
> > the next line.
> >
> > Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>
> >
> > ---
> >   drivers/staging/rtl8723bs/include/rtw_security.h | 6 ++----
> >   1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers=
/staging/rtl8723bs/include/rtw_security.h
> > index 487d69460cec..3ccbccf92417 100644
> > --- a/drivers/staging/rtl8723bs/include/rtw_security.h
> > +++ b/drivers/staging/rtl8723bs/include/rtw_security.h
> > @@ -170,8 +170,7 @@ struct security_priv {
> >
> >   #define GET_ENCRY_ALGO(psecuritypriv, psta, encry_algo, bmcst)\
> >   do {\
> > -     switch (psecuritypriv->dot11AuthAlgrthm)\
> > -     {\
> > +     switch (psecuritypriv->dot11AuthAlgrthm) {\
> >               case dot11AuthAlgrthm_Open:\
> >               case dot11AuthAlgrthm_Shared:\
> >               case dot11AuthAlgrthm_Auto:\
> > @@ -191,8 +190,7 @@ do {\
> >
> >   #define SET_ICE_IV_LEN(iv_len, icv_len, encrypt)\
> >   do {\
> > -     switch (encrypt)\
> > -     {\
> > +     switch (encrypt) {\
> >               case _WEP40_:\
> >               case _WEP104_:\
> >                       iv_len =3D 4;\
>
>
> Hi Sayyad,
>
> I cannot apply this patch. Please rebase.
>
Okay, will do this.
> Thanks for your support.
>
> Bye Philipp
Thank You!


--=20
Abid
