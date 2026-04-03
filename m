Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com [209.85.221.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831F629BD91
	for <linux-staging@lists.linux.dev>; Fri,  3 Apr 2026 18:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.195
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775240466; cv=pass; b=LWvmmdcWLFlw0dBTBxbE14C+A2l68LzjLGp/kL+mu9OME4+6EP0gG1LsQ25HQmpRErEC+Gjrof/sf60R/L7o5LqH9mQS2UR99Fo6yLpKsMIhRsaajpy5O6SGvoyeQPxRt3r63fNvssOjJHBO62mY2nGnVKVLcZm/2WtqCMQw108=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775240466; c=relaxed/simple;
	bh=j1tDFVJm4Y/sNE8B3QpEZnwxVjo38qpXu1Ocn1rJmj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g61CfXug1fZZWTTfWpX9fAdT8gRvX4TveYIj4tWG2BPvx5c6BRoxJVBU2YKwXL2VSwq6ZZeoA2Jb3BrttJ07PAFZ9OLB7FluJplMeGEQn+Ed//PHHcni7fRo1ihNpMzoV9l253N2NbyYPqYphBnRli7He3T2x6zMkH5rBOmvD6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fkdC6kkx; arc=pass smtp.client-ip=209.85.221.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fkdC6kkx"
Received: by mail-vk1-f195.google.com with SMTP id 71dfb90a1353d-56daad0fdbaso338734e0c.3
        for <linux-staging@lists.linux.dev>; Fri, 03 Apr 2026 11:21:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775240464; cv=none;
        d=google.com; s=arc-20240605;
        b=E7/C5jDM37F5CChAY6D4k77axkFxMH+RNDoLjhty/ThDTLCEz5iIxa9lWNqyhwCHvF
         m7l4tKNZWzjcCPiDUWyQ/cAz3CXppszKq3Y3xm78ix2bOBMMXYYSSDBD5WXTIAADkis6
         wNlC0PdJqaOEXBg9WDHt2x+2NHpYK7m/SnLjxMGu4STNoW2UtmZQxTfx1JxB653aQ+Y8
         0ns7J5Gg3jLlihzs5ohxbM342zbxKjLjFYRFhOE8lixW3ARzGIIkFIyL+5qkU2MDVhpk
         rF1z2EcWTfonxQV8+u11SJ+Fh5mSJN7WQ8ZEkZXoyLA50hw8Ne5MaSavu1/5bpumCMr+
         kqZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JooH8nhAruN2j5mR8fGWO9HnIa7o7YLZTe7XGutkgX8=;
        fh=VoAAw3eSCqAzI9dXYkq9DJOG+lTXY0ScpwuyYcA8iDQ=;
        b=fjoeNSIMcGKDpMCOaNjURPp64J1u7yBC+EUljkVvy++fRzCeiYq4OnTw8x30NatEKZ
         bV98Nk+vtgwffYyUJz9C2PlkaQnTCXStu6gif9cWCOuamQr51fEFfVODHm9BtchrIqro
         ShKRMIb+tFJkoUDENII32TOxw21DhZF4LpsRXM99fvO4LRsll8NeUd+v/mGFk+SZkfap
         QuY0nQbc/dvBNSVBeGrcVe+nZdJxitZg5TA2CLN5IaS448Vp3GXEPmAKH1TFydbNz4iL
         ajdfnKNltiA3H0Pjs8klzfn2f3yE93W8jc6O9onqfAN+65YkZDAYBnE5M0qadsWmT9Ls
         Pb3A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775240464; x=1775845264; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JooH8nhAruN2j5mR8fGWO9HnIa7o7YLZTe7XGutkgX8=;
        b=fkdC6kkx3JoqERs/qWgM6XFVRjF7PPfZjTHbBdywmmzLsY2CEQN6+liyhV+i8vdajN
         KkOY07KvmHtxAblYsasPHYnvH30vAS8ZC7lbPGOac7tWdZonmt1ySUnoWkjVgftvyut8
         nstL6uBYU6K3IBa7c7ZXyuJJ0nc4E05fSFjIxkGpwS59Tg4LSt2l/YuBBqYEcByZZPRg
         uSl1yLF58sqn1f7iLpc5lyUUK61vlk6mvZi9hwu21ri0/WFNuyH+w1sTkAncFccc2iLt
         12xZVktyOjp+D3McMJfVRsFHjdABI+oTdbS54GNBIl7a9n2JxqPIWGw2/C0lmkEKIhpu
         fi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775240464; x=1775845264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JooH8nhAruN2j5mR8fGWO9HnIa7o7YLZTe7XGutkgX8=;
        b=W/peM3tyzSy52J6dxZN6dnqRARbLvKMCZBD1o0klzRbtGuAqiBMaVF3atiWu+srO+s
         ZnjyxlouXAWoebYk+WCRdH60VxAZkQA6Kv0e9G/tKF5pFVmhUbdGVYQauza0VKzAeN19
         J6/t7oyEDAJJVCSNrj0L2+2D0SZI2aj6mX2vNPqYEoO18A2uToQxMRPLzu50RgXOvvrW
         jqNOFaNYac+1suS2M5jtNVN1zR1qyYLOx+HKHUIgiKURzEx7rTauZkqNZvqSc3xzgHcI
         xve+4F/Y8njlFYTCEIF+e5zPmaiaJPaG2PgUOecL2N3F+PUlsrpNbpBq9UhhCuVVf3q4
         /6ew==
X-Gm-Message-State: AOJu0YwkBXna3v0P3QKEzhiZttXk0Sz+gATdz40/bhKh2s5AGNv4QN7O
	1JY9QwTyxb/dLoy9LOZyzou2SRM43iTXkjIIQk3NiAqOEouHFI7lSoB+26iqIU5h5+x64rpfl1d
	bi8GoA3XEqncclFQEdyaIrbAQ5RdXOko=
X-Gm-Gg: AeBDietHXb3nQ5eNxy5dRyq2NWEDif9916nvGbhjgYl1Rj4sxjo5Li7Z1GBNjjYrs0M
	asMadDb58YpW2TUGvJtdrWdhs9i+AcS8hv3JHSRQCyk1UXavukItP74R9itpy+DP5mQ657OGLry
	llCLdmVKme0iqSKwxw8ZQOJIrxxhtHKfpEnuPqRaznlv3Li22QT16G8gHjTHE/aO/tj+Vr76cKZ
	11hxmyTRTzP13r681KXOI1PphUMKoMpwYdZgFvmXGY929FWBltV8M19tXsZeQxr+/PV3p1jKIvr
	DtQKm1tVLIvsnYJLbWipXwbtNOsB/i5J7AlpONBV4g==
X-Received: by 2002:a67:e718:0:b0:605:6089:6745 with SMTP id
 ada2fe7eead31-605a4e54dabmr1494282137.9.1775240464358; Fri, 03 Apr 2026
 11:21:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2026040340-impish-bootlace-9b42@gregkh> <20260403175427.415-1-dennylin0707@gmail.com>
 <2026040344-headsman-reveler-3786@gregkh>
In-Reply-To: <2026040344-headsman-reveler-3786@gregkh>
From: Denny Lin <dennylin0707@gmail.com>
Date: Fri, 3 Apr 2026 11:20:50 -0700
X-Gm-Features: AQROBzCjSvu3O6QkVK9SuVGH3opWnmGfMetnc-L9dHcKaptkjBY5KKhpcqpZR-8
Message-ID: <CAGEkeHdbMRu-xF5rnQymW1RduhervWnHXZ_JZoiUoUOevfevLg@mail.gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: use single-line initialization for pframe
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	straube.linux@gmail.com, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 03, 2026 at 11:00:00AM +0000, Greg Kroah-Hartman wrote:
> But why?
> ...
> I don't see what is wrong with the original code, do you?

You are right, there is no real improvement over the original code.

I will drop this patch.

Thanks,
Hungyu

On Fri, Apr 3, 2026 at 11:00=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Fri, Apr 03, 2026 at 05:54:27PM +0000, Hungyu Lin wrote:
> > Combine declaration and assignment of pframe into a single line.
>
> But why?
>
> >
> > No functional change.
> >
> > v2: adjust formatting based on review feedback.
>
> This goes below the --- line.
>
> > Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/s=
taging/rtl8723bs/hal/rtl8723bs_xmit.c
> > index a1f2cbf2cf55..c79df13b67a8 100644
> > --- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> > +++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> > @@ -239,8 +239,8 @@ static s32 xmit_xmitframes(struct adapter *padapter=
, struct xmit_priv *pxmitpriv
> >                                               /* pxmitbuf->priv_data wi=
ll be NULL, and will crash here */
> >                                               if (pxmitbuf->len > 0 &&
> >                                                   pxmitbuf->priv_data) =
{
> > -                                                     struct xmit_frame=
 *pframe;
> > -                                                     pframe =3D (struc=
t xmit_frame *)pxmitbuf->priv_data;
> > +                                                     struct xmit_frame=
 *pframe =3D pxmitbuf->priv_data;
> > +
>
> If the cast is not needed, that can be dropped, but really, I don't see
> what is wrong with the original code, do you?
>
> What tool is asking you to make this change?
>
> thanks,
>
> greg k-h
