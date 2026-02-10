Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745B930E82D
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 16:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770741512; cv=pass; b=etGVrM2sGIVrpxkIJVP2WNHkiHCukroiOGXJIdYgEhjnV+xiKN6pI/Dk4b0QC22B9bWeealMae/4S+TdEInFYzNE8FfQXDhspl3R1hxpFQ/aQGYPpqcQBNMTslICMpKpeUuDX/4r7k1UsvQKo+nlxkNVx7DmtGEQZqbLFsAPAwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770741512; c=relaxed/simple;
	bh=eiW918Uxyf4CM6jYTBzupowet0Uybiz1T//MEVS+h50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lXsel+pmLw5vCMhlpIpYlAuehwkrlgld6SzeOhN+yR8YYX+7U2i11W5JBnOjVGLLlD1xK2NmwO/F4qegBLd70DV2V6peTfD+0/HXoBO/IzSWrwBUwUhs2xG5a0sg3wrLxYZutJi0JbM8Xg3mKr0r2KQG1179dYr4POWJTMpWuZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3TKtuGc; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3TKtuGc"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b86671f87eso2897635eec.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 08:38:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770741509; cv=none;
        d=google.com; s=arc-20240605;
        b=PxGZEFyO4ZPoLPLTVC43XPBzZ8r6SAu/ETqsngJZjKLbiVL22XbVJ5mp1ROoxftX2j
         ENwmOkh63dhTgbzUCc0ltz51wlgUbfJj9CAXaxsVjrf198QMwyaCLFW5lVjn9IWlz7FX
         KhDGQajDCFWfGmJCFtfbyk1NxK7dLFLA7OxXRwyYXMVoap33u0W60Q75W4wBgORP2rDZ
         g3xVEKFtHyN7RY0zvP8zcSJaLw3vqBTCxc4c+vfL5h0wL1WGjnKSzXZfZawXXWmA0Uta
         v9vNOidFbRFjEPJxFv8SS16uIsFjObQ1FiA4ThY7BfmGlBjnLHHj7mvxMeWgcKRP8c7l
         WvhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/AUG/P+tkOF/dMSUsia1E9jPdwLFoQoDozMKGRDuGWk=;
        fh=2CVTIkVPhg0KPB0MXJsQlUHJYqJp0iJnPh+zOrgPQrI=;
        b=CSyzJtbn1EElgezRhxxZNx1pCssKDb3AcY6OsZ7qMdJ8ou1ZCnEiLtiJo+4MUJFpof
         WT0fsgRD8k1DbbnPL/5/zI+xa2Sg6zeyPuhi/Gu3cozHNpDS1tbLdirdwl27raeIgn7i
         vI/R7+rsQcQaGaAjZ7FtqP+lXpwvUOLoH0o1ghSwzlujoEDXr+/hCfKOhYwVJEfQ3xs4
         ++8gfThddMaOKreikRYtQySbgpfoL2e8lBWiJbsTCchICiQpNqOJIsj5clZbzN/Dwu3U
         55Wg1I6j/j+zaKipRKUCv+oUZhf3C3Aah3hA+ucqZPtb1tJ4Z7HSCeUcaGzVh3RWYNva
         zrtQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770741509; x=1771346309; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/AUG/P+tkOF/dMSUsia1E9jPdwLFoQoDozMKGRDuGWk=;
        b=I3TKtuGcPYfHRUi7OSKox6jnibGBHFryCyzbX5XeXx0gji61AZNyH+Uvx3V4D6D2Og
         +AANFAKmNpfbS1qPV27Pu2dEuEV7I0wOIEM6z+t44Q/Q+6/mol1OyPCF3lqwBi/HSJQS
         +4urrajugexBGx7lhwgrsRqe3hrrVq06I38XR0m/BdYDezAjrC9pEVuS+ODid7LcpgY3
         IgDuOBATOOKwYW/eOvLh132vTKdiGm26VdS2DeFp3IS8mvvXD/iLmDaiW9yHBqAzjban
         /RCq5KgtK+xd42nlsMSHIFUiL258REM6Uc9+5Uml5F7dO4h6n5V+8g90gx3bFm7VoG1c
         bpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770741509; x=1771346309;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AUG/P+tkOF/dMSUsia1E9jPdwLFoQoDozMKGRDuGWk=;
        b=JQ/KaEHEHf/uAxUpoCN2K/aOroN72KIkI75ghmDuMRH1+PNRT9Ygvndk0EcOC0aG3c
         bJ5/J55neiiG229TrEzScHRMGF2m1zIBBQUHVa06bNiZwsc51sal3/ywtFBs9bt4tr/Z
         39qqgXHCVfttoXcCqkSZnYUCb1p3HSR4IS5NZl2kzx8Pd6jfkCVwFdLQoDPumxDUW4zZ
         EXBlcSG6u0j2P28o7hgkHgk40EIB7Y1WsvPSQJb2giaJOf7OwruCRAfPl1Om1dAB44z6
         NssQpHwzp8VudsItiNYuilh5i6U8ox95oPobFm2WBv1N2qWoIxCXNdc4HFjVnHIK5J1A
         P6dQ==
X-Gm-Message-State: AOJu0YxBcC12fx2ES1Vj901jLSOsHnLtyu4DOS0K7pVa2JATTX5DbIuw
	22eie0H7O3+UA5ewrx2eMUS6NzIbVOYcJIuDR5z6uM4As9pU9noyIXNEhG+yCytQGyohFfHxLWR
	VAyfE0UBo/hIDpxjPrqJ1MquLGd/bJnZj51jabo0=
X-Gm-Gg: AZuq6aIvw1LgQ3PnoVLS3RWjw4VXswThn7bCfeSLoWrK7K/Z4mmiTYZwbwMkPkyn4G4
	QrXHOgTipw/74+p36/pyYHZW+sn5xz9ncgkr0dODVbAlk/OUBGNQjez+zgypQWwvI60xyZeiOOC
	MEoo7DnYgLfzJOELNUCOzumQFrg4fvV1Xh7vgu5UA3FtyaXheBmHZgRr2x4SvFlifG3OjE5WLMd
	o91cu/e9xird8bWyuxOb4BHZeYOx0NEBNzFZ/s0hGLVMWJZ6QPXwFEGCSZcgmzde4T6Sr4m/TJu
	z7THhQov
X-Received: by 2002:a05:7300:2150:b0:2ab:ca55:b762 with SMTP id
 5a478bee46e88-2ba8a8ba47bmr1252782eec.41.1770741509188; Tue, 10 Feb 2026
 08:38:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260210163236.46341-1-tmimiharoen@gmail.com> <2026021031-dosage-outplayed-6d36@gregkh>
In-Reply-To: <2026021031-dosage-outplayed-6d36@gregkh>
From: Haroen Tmimi <tmimiharoen@gmail.com>
Date: Tue, 10 Feb 2026 17:38:16 +0100
X-Gm-Features: AZwV_QiTmuEud4QgYPoFp-qiSeagxFXkMGr14tXjHMGp3cc8Jq8GwWnP649IxVU
Message-ID: <CAH+Y0=2wq7PiAwhtEjV2W5BE1UuoAh7ajzp9g0ZCW2XyjwV8Lg@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: remove redundant 'Adapter' variable
 in HalPhyRf_8723B
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

My apologies, I should have been more careful before sending the patch.

With kind regards,

Haroen Tmimi

Op di 10 feb 2026 om 17:35 schreef Greg KH <gregkh@linuxfoundation.org>:
>
> On Tue, Feb 10, 2026 at 05:32:36PM +0100, Haroen Tmimi wrote:
> > The variable Adapter was declared and initialized locally in
> > an if-statement, but it shadowed a variable of the same name and
> > value declared in the function scope (line 169).
> >
> > Removing the inner declaration allows the code to use the existing
> > outer variable, resolving a -Wshadow warning.
> >
> > Signed-off-by: Haroen Tmimi <tmimiharoen@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> > index 9df3274c1048..f712d0345b99 100644
> > --- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> > +++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> > @@ -208,7 +208,6 @@ void ODM_TxPwrTrackSetPwr_8723B(
> >       }
> >
> >       if (Method == TXAGC) {
> > -             struct adapter *Adapter = pDM_Odm->Adapter;
> >
> >               pDM_Odm->Remnant_OFDMSwingIdx[RFPath] = pDM_Odm->Absolute_OFDMSwingIdx[RFPath];
> >
> > --
> > 2.53.0
> >
>
> And now you have another coding style warning :(
>
> Please be more careful when doing code cleanups so as to not add
> additional problems.
>
> thanks,
>
> greg k-h
