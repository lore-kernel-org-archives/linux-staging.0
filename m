Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8623F39E0
	for <linux-staging@lists.linux.dev>; Thu, 16 Jul 2026 08:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784191520; cv=pass; b=fxYeubvIgQzuxmHwglKFi7EkwEVJP//3QeR0bFHNBrnHkv25s+xGpyin7VDiLnzJtvWydvhRMsUaI9THF0fUtQUM6Sck/Pdp3Uop4IuPelNYwWc9+GKxXOL/bhW3ZKed4u2oPAUmrLyYxaLTbVdcKl60UvL40UDOY8hRDcuIeVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784191520; c=relaxed/simple;
	bh=DfJUAo6icvmVU83zEknJGx+B+/vzZo92AavuZPVKJpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DDLzU0gpThpW0jF93kENt8CFN0XIa0Z8VNfdUYaMpFKXIvlMfG0ccNgRjVVZ2wt9idkKtsAC8KXzp+w1X7f6P0XCmq0WX3JGeh3cBxlVhXC+YIxUvPsUUSD+KG4WwRupto8xpgtjn7DKEejlGIPzFQriNRnyvGTgGcrZPoW/1yI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVN0vves; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVN0vves"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b0f19bea2fso2830732e87.1
        for <linux-staging@lists.linux.dev>; Thu, 16 Jul 2026 01:45:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784191517; cv=none;
        d=google.com; s=arc-20260327;
        b=qmRb187hb5Y3/gUI+pw+oAopx1wzF4dtD1zRBdTyt8R4bfr1+mBITan9tubd6x6uKS
         sLJrimk6kfHjNXnNAccR1S3rn0C/NG/I4yGz+4pHsyGDf4X5Dfgb9AltagU6jxo5Ritr
         lceX8tOqbR8V6Y+U3ZYPexDU5a2nyBIBdLyCLKmSsPQUL6YuN5RVoq9mdzHAcc1uFhwo
         98XXLnlecKx/VvsVN9Qc75OTGMnW+jREGOF1Z0EgVJNJpWzZSXBj10Fp9z8uacZsxhsa
         4yLIY6B1YWWAzCMDwFQgXkq85we3c3UTKXI233kpAMOoGly3tAA1jnsRB2KgIZIEXtcR
         bjKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=THUDjVPT3gdsHuSnwWgyBS0LPkMltQV9C4RZYbVHZ2s=;
        fh=qLt+z0GVvkZMdmavACI2jIDUrOORA8KJ94EnOjHxLIQ=;
        b=oBP+4vp1oBeAqgzOWQlcBEJY9ok6IlcmWy1BVjfz3+c1wT+J7nMKdKPvnMKwH3ZDCt
         0meY0a+K/M28dmIPgwctpsPnzOFn7KHY52keWRdO/ZVA4gP2QJQimbWN+OxPwJZCLZ88
         5DMYzuZoRL9NHeMqbUppEMmvCjuYh3Fs8Npz5djrCC1pJqhh0uCtfFqbyuZkAxPv9SMV
         FatF7gR3EnwuvuWs3SW+LkqApZ6KVhfLKd/3A4WaLPXUPvJMLpEo/WU7v3/+omJqJ8im
         PxV53cReOrkbP4WSKHOh9Q07RM0MX+Z0WkRppXW9s1RRMvUCB21dn+e32sLfA1Deg2lL
         SCXw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784191517; x=1784796317; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=THUDjVPT3gdsHuSnwWgyBS0LPkMltQV9C4RZYbVHZ2s=;
        b=SVN0vveso5DcvMGXlUP25XWSMclR+dAAy1ZJARh7kBEIzTuKpuk5t5eBfnsxC167e2
         tuvSE6ly9klUwr9l+4fF3XK4QMxUXdTNJwA6/kB1Y82hH9Xu+jjEb+CoX4pOOCGM/Ya/
         bHb3jotQec99K4jIv+KYrz8tYzguIwXWzhslNCQYFD0VmMehLTBBHCEN7JnZQ4jP/OS1
         tL0l7xt5sX/GgtRhy0Mu7adOsDvrFNMHib7MEgpR60yx66NiZc5rVm0nT9823moQ5/AH
         iTYi+ZVolgVEETAbmWjvV2sUIU7hMDnXPym8MxTsOm+nXqjkLVhDFjKa/7/ddurT84Ch
         t8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784191517; x=1784796317;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=THUDjVPT3gdsHuSnwWgyBS0LPkMltQV9C4RZYbVHZ2s=;
        b=WoMVhrFg0TpsojJxhus0FEJn9s6oX+3QMVRVJCPtd8CVKTetaTcipK5EbiJlcRxI9e
         pPtOULV7Cy5toYDY5rhQGAK4xcVnl4ny46rMuDvPBSQvbCH8Qu5XoxU3DOFRj6ai6VWA
         +5zUNWW9y/SoKpOoqP4P8oqv6RVfYFSuZGiOVj808RbxIW5+k/CjMsqBKnBuaKaF6SBZ
         V8Ip7IqhW7ISNbrSUgzKKfUU9WfJLLn78K+iFXxQakIjl7/fZS1keTL6RXrDF3BkQs1y
         BE9Aa4QwmAt4rpHJ08b0TE30v/a/m8xsQfWnrJan18Kh73IuHb0fjp782AGRGpj44fLW
         lGnA==
X-Forwarded-Encrypted: i=1; AHgh+Rq1r3rZdMgaosIELSBjMAxBxo3DbE6BmwZE65Hb+NTg3OcRPqwPftw4cRL5HL1j/uIg6Smzgvaq8hAVsQcU@lists.linux.dev
X-Gm-Message-State: AOJu0YzjXy7zubP//aJPDYZgEVPteCM/4st+IjnMoAivHaVGxwgUS7XW
	V8FC8gtUP1sjCUQqrUOPZv5cbL5SeAXjFr8MYem1TZTPMST873R/b0FzOPHsZpJVfviGXBnAQWF
	rUYa2f9aM9B8IxLIOr+9WgTuc0etga5U=
X-Gm-Gg: AfdE7cniXnEoJoXeog2MbR80sTHGlRfqR555YsMTaxz27+bctsmDUE5bUDn9g07O8yw
	X78fKqMhTZjHu7XZkloAtnEMlGDk2PEnBNr5Wkbu54Sx8odryB1PCQsrP/nOcpsGImbbUJ2Z//U
	dqVjdo5q6CueOZ6RHiaL37ssmJmIQ/UYYxtMZ4lpsQ1auWeVIRC0IpPNppDn9TEhKATFGQZ+TBz
	mLRblDv8i3XgI2A2SU3mD8khL7VPOKoC9psKu7l+ZnToivq3udT1GnjRnB6B+2EdTTNoNCn
X-Received: by 2002:a05:6512:3410:b0:5b0:1a3a:6680 with SMTP id
 2adb3069b0e04-5b023698f1cmr4820112e87.30.1784191516600; Thu, 16 Jul 2026
 01:45:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715170003.94569-1-aminmadani112@gmail.com> <alh6ydMadNsz5x66@stanley.mountain>
In-Reply-To: <alh6ydMadNsz5x66@stanley.mountain>
From: Mohammadamin <aminmadani112@gmail.com>
Date: Thu, 16 Jul 2026 12:15:05 +0330
X-Gm-Features: AUfX_mxLrHAhGzahla7Cd_AZvtwEttbDhGh-i3Cg09PktjImbrmbgeJ_MGGMOsg
Message-ID: <CAAu1+uGATYNG8hrz17ZbuCyBiXYGSw8jABKp04sZNCsJ2vHZwA@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Split multiple assignments in _rtw_open_pktfile
To: Dan Carpenter <error27@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

Thank you for the feedback. I have just submitted a v2 of this patch
with the direct assignments as suggested.

Regards,
Amin


On Thu, Jul 16, 2026 at 10:01=E2=80=AFAM Dan Carpenter <error27@gmail.com> =
wrote:
>
> On Wed, Jul 15, 2026 at 08:30:03PM +0330, Amin Madani wrote:
> > In _rtw_open_pktfile(), multiple variables are assigned on the same
> > line. According to the Linux kernel coding style, multiple assignments
> > on a single line should be avoided. Split them into separate lines to
> > improve readability.
> >
> > Signed-off-by: Amin Madani <aminmadani112@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/st=
aging/rtl8723bs/os_dep/xmit_linux.c
> > index 4260ed5f4..598d94f1c 100644
> > --- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> > +++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> > @@ -15,8 +15,10 @@ uint rtw_remainder_len(struct pkt_file *pfile)
> >  void _rtw_open_pktfile(struct sk_buff *pktptr, struct pkt_file *pfile)
> >  {
> >       pfile->pkt =3D pktptr;
> > -     pfile->cur_addr =3D pfile->buf_start =3D pktptr->data;
> > -     pfile->pkt_len =3D pfile->buf_len =3D pktptr->len;
> > +     pfile->buf_start =3D pktptr->data;
> > +     pfile->cur_addr =3D pfile->buf_start;
> > +     pfile->buf_len =3D pktptr->len;
> > +     pfile->pkt_len =3D pfile->buf_len;
>
> https://lore.kernel.org/all/aZ_0OratIkUBNHmy@stanley.mountain/
>
> regards,
> dan carpenter
>
