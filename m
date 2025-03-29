Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AAC1BFE00;
	Sat, 29 Mar 2025 14:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743257401; cv=none; b=KLoUXfWO2YV4tqKfPvVFzyEeqyJ/lHn343zKk6gCJCKRA9f9Q/LpgY5O93ye23dFqF2ELdw9XyI7+iSxbO+CzVyx1pITTI69IGSi5rgY2D/Qt+6vw5sKiNr/Xy4ud7YSXhvJ3cyJINaC0k3Ay+Aj/ihv3PrgWZa4O8F0LbNlxuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743257401; c=relaxed/simple;
	bh=8DNXuriryviUYkCuwI114J6F32sIvMmR3rYQl7tnHHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cyiMUsfAjYX6eAxiqWD1SOC9UnnmZ1H7KQQB72Ez8+yaTz/sEPqNPU+ingLEtzYmjMlvx0wmFrtgk3heoEKMfqSzkOFtipEgIgsxci9teqDz5GVoZjoKa8AV666gcXLHaYRRgZvlZiHFmcbypRsjqTHt9Y0wtM6deUeHKJKedz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3rt6o7q; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3rt6o7q"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c5e2fe5f17so303800485a.3;
        Sat, 29 Mar 2025 07:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743257398; x=1743862198; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLupDByQlOIZkjLN6KvumJEoZRkf2lxrlQMOafN8FXA=;
        b=m3rt6o7qSjzPNbql6tP5mgfbtYBGP5XrwpP7cz05HIScnSjcUyPOenrTKDe4tVzoPf
         aU9RlwVEdbRn76kIREL4rH/+NS6ah4EYHGpEnvy5WcB4PhMVoKPSzFlCmZ4G18rcxCP2
         5ajc03lGG8roMOLiWZoaEViOVCPr3UMbF2xIYxdt7l0/OkPMpM1/6PaMwJXBS47CMknS
         3aL0fSiftuD5AzNNuhLPqlgNr39Akxu98UtB/3pqGmonKqz+kNH0nsZOYeOnpZ4Phe/g
         XPXnLcH0pV2vVWisToTzwfkM4YWqHCxXeC2pnUkkM/Ko5Jhl38GTktub5Vb2TDf1P++B
         O5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743257398; x=1743862198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cLupDByQlOIZkjLN6KvumJEoZRkf2lxrlQMOafN8FXA=;
        b=FCB8gyXLubOJb7AJWu++X8nbmOUj++q1HU1bCDgA/PoHA8f7SWd/KS8Iw7C9uMjufA
         nA5j/Nu72fE45/drKpF7S7G3+byf4iAaeVO9rAnTQKjk1aZCPVyZygLZ8M1y3h0ZkLbZ
         pb4VctFs8j2GF/zxp78EO6bQzucBM4q36PXU4PqHyArMgLwQtdjjKLI7d5kyOhLf3+sI
         FgRHxdjktg0dUiuQikdCVflfPU8TwFuGiny0raBDGurw+pRy6n3wsog75tsyyRRE21Dd
         AYM0r3A813siENvg3aEodQ1ajtDeqmayFCaqD46Pyru2zlY7sXGXfEcNBmmBiIW1fXx3
         RIJA==
X-Forwarded-Encrypted: i=1; AJvYcCXtMmW5OYy4IdecY6ryzdbruOzEXpvBCytckQzel5Igt0kjh+Q1JfZ6lhd07wgObM802qqExBWscF3iNvAo@lists.linux.dev
X-Gm-Message-State: AOJu0YwiLXTPJLF+hy60u0FUEUgjd2ZbYdR9evQ1QlTrj0D1TtVljtsB
	nm5/oGBQ/1xb4P4yI9U5gmN6PhlA0VTeTxQWnEVGZNzlQXs/DEmo4UAm0FVZlYNgVPN6TH8Dd0d
	G7o6S8Z3NHa4xJMIc67jkyIm9MNA=
X-Gm-Gg: ASbGncsYJjLUYMB826Ynqyde62CNC7RJTLZYNntg9k41vvb4wKOk3AhUIzrK3SAHR03
	WQ/0RG3SeNEUkIYKTNCfvUTF3O1S9orszx/QL6+kMh3rmTa7taqsLgODmgmnRVAuDl8AhBDFUuu
	LeMtfJkTbkDH1f3cD7Sxz3Qvct6ETmiOV/ta2QJGM=
X-Google-Smtp-Source: AGHT+IHiBV1iV4PKMC1ZMhEAyiFTBS7TU37wn1t1Fvc53PoREVRcm+1339Zxp6rKgDE1U0dx2ZKUSAa/QKA8UXFNFWY=
X-Received: by 2002:a05:620a:4384:b0:7c5:5d4b:e635 with SMTP id
 af79cd13be357-7c69087dcfamr463442985a.40.1743257397863; Sat, 29 Mar 2025
 07:09:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z+fTJRBOZ+66zmsh@HP-650> <alpine.DEB.2.22.394.2503291210090.58211@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2503291210090.58211@hadrien>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Sat, 29 Mar 2025 15:09:49 +0100
X-Gm-Features: AQ5f1Jpm4caITwijzgimQ8EsoiZ5v867wameF7gf2V278j-wvdcs0k14LhfU3KU
Message-ID: <CADYq+fYizY_eRozZkKYzsD00biQMTGfhOcuqiQ0RzXApXiAF6A@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary type encoding in
 variable names
To: Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 29, 2025 at 12:13=E2=80=AFPM Julia Lawall <julia.lawall@inria.f=
r> wrote:
>
>
>
> On Sat, 29 Mar 2025, Abraham Samuel Adekunle wrote:
>
> > type encoding in variable names are not a standard in Linux kernel codi=
ng
> > style.
> >
> > Remove redundant type prefixes (e.g, `b`, `p`) in variable names,
> > as explicit type encoding is not necessary in Linux kernel code which
> > uses type definitions rather than variable name prefixes
>
> You seem to have also gotten rid of capitalization.

Hello Julia, thank you for your review
Yes, I should have added that to my commit message. Thank you.

> It's also not clear how you have chosen which variables to update.  Mostl=
y
> it seems to be pDM_Odm, but there is also pRFCalibrateInfo in some
> comments.  But you haven't updated eg bMaskDWord.

I chose to update the boolean and pointer variables which have been
declared in the source files
I was working on. pDM_Odm, declared in the source file, is a pointer
of type struct dm_odm_t,
which has been declared in a header file, so altering the pointer name
would have no compiler errors since
it is declared in the source file I modified.
Some function prototypes have been declared in header files, so
altering their names in their definition in the files
I was editing would result in compiler errors too if the headers were
not modified.
I could have modified the variables in those header files too in
drivers/staging/rtl8723bs/include
but I was not sure how many files would be affected by the change and
how long my patch would be,
considering the three files I modified already made my patch over 3000
lines long.

RFCalibrateInfo(without the p) is a pointer that is a member of the
struct dm_odm_t, which has been
declared in the header file, so altering that in the source file would
result in compiler errors too, since the header file
 was not modified in drivers/staging/rtl8723bs/include/
>
> I don't know what the r represents in rOFDM0_XATxIQImbalance.

The bMaskWord is a macro defined in the
drivers/staging/rtl8723bs/include/Hal8192CPhyReg.h
as `#define bMaskDWord 0xffffffff and also rOFDM0_XATxIQImbalance is a
macro defined as
`#define rOFDM0_XATxIQImbalance 0xc80` in the header file; these two
values are not boolean values and are
also declared in the header, so altering them in the source files will
result in compiler errors

However, other Boolean variables declared in the source files were modified=
.

>
> julia
>
> >

> >
> > -     struct odm_rf_cal_t *pRFCalibrateInfo =3D &pDM_Odm->RFCalibrateIn=
fo;
> > +     struct odm_rf_cal_t *rf_calibrate_info =3D &dm_odm->RFCalibrateIn=
fo;

Example of RFCalibrateInfo (with the p ) being declared as a pointer
of type struct odm_rf_cal_t
and also a member of the struct dm_odm_t

So the declared variable(with the p) was modified, but the
member(without the p) was not modified.
With these, please what suggestions do you have?
Thanks

Adekunle
