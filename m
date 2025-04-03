Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B2E2CA6;
	Thu,  3 Apr 2025 09:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743672841; cv=none; b=kavG92Rz7Bw2bi3Y1l4mdEfLpHja/2jLHKo9HXtxcPOowDKQxsblwnjsI7xBQQHwda+7JFH37xV/QLdKWZBKUq4/x9ki1fFsppXxPpYk23dKDxtFuZpHIl1w/78yJmPOQJMLLdqafUXJfCJhQoIcQb98QFFhljL+1l4elolAOF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743672841; c=relaxed/simple;
	bh=b3qLvJ7aKUXqqTaHHPmb6zuSn6dJEibuG/A+uCPCHrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h2Ks4XLA9WplWsV0rf1Cw2WbKwppVTZ4T4jYOZVmTDwuf3i6on/JZbtZqbjGbxzRMZvakUaLm/f3AUKP08XMDYPRQrhl4IYZjwnXPxJcu9AbtHKnaTTPx+VWK5irs3n4Ubq+G6WaSVZZ0yJZX6vm+C+cSoB5buybkrdWnOsWe94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gIPUKHJa; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIPUKHJa"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-520847ad493so731532e0c.1;
        Thu, 03 Apr 2025 02:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743672838; x=1744277638; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WyHNwKmWPYx/oZJ6Nfv44olqkcbVDVp9NWhhY5rFfyY=;
        b=gIPUKHJai+iaSEy5Wtt8XtOIw1OjKwmxy6ObZDQm1AmSPNigjeRGH2gN0x89LIL9J0
         RaqZFD6XjpfX5KolM/oaGJU/GMx5qNEhLLB5cvI31XLiqf6+YMHbTkJ08xDnk81fBYT0
         pPiykiAdTBkb/Uhz5IE22xmrrVtH+BT4A+XtYtBlOj832UpHK0h1j3CTVOZyB+GyVfvd
         ne37rZVdCg38SWAlcED6Of/RZCpX0ZNvDPhf9Ozhponjbo4/pEruJ8A1aDu5zIdVCcHi
         KelA+f5rBf6vSBRMTa44yFN1Itnmj5WFsXqiBBgGdzm1DMANamYC2EWQMB3LZpx/B5rM
         PtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743672838; x=1744277638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WyHNwKmWPYx/oZJ6Nfv44olqkcbVDVp9NWhhY5rFfyY=;
        b=opyBR+MxJ19D0V3fefjPhn5DXnYbBAP0X7xeXbwnODGXTKJolN9fBDqKbe7LwaAWnv
         6jkxp/golsgKBHWliwem5LpAyJoqA8Z4XfXLjoRG4tWNVldnaNA/RoA/kPFnfMTEnGv8
         1H++T6aYi/fWkNXardQurUpE1us0/OJLsAfbqOtRiRCFXRUo2792cf5pBiMon+lAgrVC
         iWXgoM1XGNB+GJLwU1xOyVJVhrwliqOBmoB4DE7/2VdUzvLVIH+wbzBR6iv6Gq8Jf9Ly
         96OM5+SxIU7TEDGM1CDuIanmUQRKVrTRHJ+yZbOmm1RXg/NL0J7HSZVrbO3FxWn9xL5Q
         B5FA==
X-Forwarded-Encrypted: i=1; AJvYcCVGYkPVmT+gmOKcGdDWgx1BOVqGFjB6v/pxsbeIh7rZavSF7iN0LlD7D+LsHIJBUPh7FYOOTSM7E0P/Le+2@lists.linux.dev, AJvYcCWBur2HGpCIGo+ueeld+Zdh4cnhHvpjkOkkyDvsYqyqsZ742I3dV/ATDYtlnH1poVoLV352j1eshBcO@lists.linux.dev
X-Gm-Message-State: AOJu0Yxgv0XSn7oYJ8hZ+qSe4gsf12iHjcPlrW9P71iqiSKCt2doApKl
	CDut6y91AEWuoqWRFQMTReVL+6XXZFCOnrMiuekFt3biz7CWBYlDI+NJp3mwtF1Jr57AFYLApFd
	hP1BuZh9nsOSri+NBya/8/o77t3k=
X-Gm-Gg: ASbGncsg7K4ldeyeluSEnFdfllpUYlzX3GmcVX/eZgVQUNUnFK8sI5bp+xNOZAruOeC
	rrW506F3udhdH87wkrgaRYd3EqsEv7ikj4dIzGruzTOKZSHk9XaroKdgOjpoNtWnxOThoUPZZRL
	p0ZrMNfV1SqokjCodKx9Xq49ph+zg=
X-Google-Smtp-Source: AGHT+IFKeGVeNNklz5bYiUxd3ChgxF5PeXNx9MawJNiYFhmrAEI5lZGGi1tJUaEmG4k7AmalZlCWdvAxD0uTdZluzOk=
X-Received: by 2002:a05:6122:1820:b0:526:2210:5b68 with SMTP id
 71dfb90a1353d-5274ced08b8mr4069039e0c.4.1743672838364; Thu, 03 Apr 2025
 02:33:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z+05IEjV3pczMLNQ@HP-650> <4c35ae41-c834-e25a-ccab-5cdd34aa4680@inria.fr>
In-Reply-To: <4c35ae41-c834-e25a-ccab-5cdd34aa4680@inria.fr>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Thu, 3 Apr 2025 10:33:49 +0100
X-Gm-Features: AQ5f1JoYltK67UO5VC8QqBH_de_-LKwsb5TX3KxWxyuXzokl4ZiRRavqztgotbk
Message-ID: <CADYq+faUTmNcUgk5jB3YHT4UCQZhf=Wsah1WUcPHqky6kp_cUA@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: modify struct field to use standard
 bool type
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, outreachy@lists.linux.dev, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 6:06=E2=80=AFAM Julia Lawall <julia.lawall@inria.fr>=
 wrote:
>
>
>
> On Wed, 2 Apr 2025, Abraham Samuel Adekunle wrote:
>
> > The struct field uses the uint values 0 and 1 to represent false and
> > true values respectively.
> >
> > Convert cases to use the bool type instead to conform to Linux
> > coding styles and ensure consistency.
>
> This is vague.  Ensure consistency with what?  You can point out that tru=
e
> or false was already being used elsewhere in the code.
>
> >
> > reported by Coccinelle:
> >
> > Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_ap.c      | 2 +-
> >  drivers/staging/rtl8723bs/include/sta_info.h | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/=
rtl8723bs/core/rtw_ap.c
> > index ed6942e289a5..82f54f769ed1 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> > @@ -389,7 +389,7 @@ void update_bmc_sta(struct adapter *padapter)
> >               psta->qos_option =3D 0;
> >               psta->htpriv.ht_option =3D false;
> >
> > -             psta->ieee8021x_blocked =3D 0;
> > +             psta->ieee8021x_blocked =3D false;
> >
> >               memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo=
_stats));
> >
> > diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/sta=
ging/rtl8723bs/include/sta_info.h
> > index b3535fed3de7..63343998266a 100644
> > --- a/drivers/staging/rtl8723bs/include/sta_info.h
> > +++ b/drivers/staging/rtl8723bs/include/sta_info.h
> > @@ -86,7 +86,7 @@ struct sta_info {
> >       uint qos_option;
> >       u8 hwaddr[ETH_ALEN];
> >
> > -     uint    ieee8021x_blocked;      /* 0: allowed, 1:blocked */
> > +     bool ieee8021x_blocked;

> You should also check whether this is a structure that is read from the
> hardware.  In that case, it would be a concern if the bool field does not
> have the same size as the uint one.
Hello Julia
So following the conversation here,
https://lore.kernel.org/outreachy/bf8994cc-b812-f628-ff43-5dae8426e266@inri=
a.fr/T/#u
I was able to compare the assembly code of the file before and after
my patch and this were my findings

Original assembly code for
# drivers/staging/rtl8723bs/core/rtw_ap.c:392    psta->ieee8021x_blocked =
=3D 0;
movl  $0, 436(%r12)    #,  psta->ieee8021x_blocked

Assembly Code After Patch
# drivers/staging/rtl8723bs/core/rtw_ap.c:392
psta->ieee8021x_blocked =3D false;
movb  $0, 434(%r12)    #,  psta->ieee8021x_blocked

Adekunle
