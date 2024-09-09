Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74341B013F
	for <linux-staging@lists.linux.dev>; Mon,  9 Sep 2024 07:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725868774; cv=none; b=aRW2LsIdfeKUs44IH/gpq6rJWkktbeOso/3LvatjjbAAFhjnaOG1ykqdXFam+75ELBXH7/+lc3HfwlPxZMoyzk7QM+/T6W/A0oEh343dPfkraghVxpNTRWExYBNmHTvUzBaANSrOGlcaNigV9QhK6ihP8Ghx5eA3LlMOJ7GNu8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725868774; c=relaxed/simple;
	bh=4wsk85TBpy5BbtUqTzPL/QeUfy4tD/VA5ngs7D4xXkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uNeQEQY57OrO/gok+I4xIxNmOvE2juddyqc5uCFz0o2lhm89gqTDjJgN0bVwMf2szI2mrYcrJvWgt45F4ydho8You2aK9sS7RWBkjl8oI81ehAW0YsVur92mczPsYP8FtHDqc6Sb3DDaAkmN9WCMOHo8UWTnsG/4lNetOcMRMpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OFRrRVwC; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OFRrRVwC"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2780827dbafso2255599fac.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Sep 2024 00:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725868771; x=1726473571; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMzKeyE28KgaABYxV90qLu2+vknssj4YYRJcYPydeZU=;
        b=OFRrRVwCGB83sRodQxRRHk63FLx2pUb3vZzCrPJxO5XAUBGZ8oAaM8YUio55NHAzxD
         1ZYQein1gWsSx9pPHWQdCaHsyAfrp/lI1nnE2r9+w2Pz7cwlqWalwKFmTVFKzg8TMTWx
         vH7V9ZF7wf2ehftAA7nQqAn1JvYt85/Pye8MCA/fHf5SC7PxK++VxxIYk95sr1islpec
         kjro1l63GXVmbUkKy6RaTB2ANBchTPsLeqFzfOMJdrl9wiHSK3kkk8FxQWGCivIU6gK9
         GH313Ye+81RKi1whiqwCf66vTSXh5zK36e+YA1lpoce7Dr/18GjUbJPy+N5BtS/WZpIy
         hvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725868771; x=1726473571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMzKeyE28KgaABYxV90qLu2+vknssj4YYRJcYPydeZU=;
        b=KjcdEoKFJvt5C9h2t2ZZn1/bKIW8rhBcD/2fe+fk7O9DpUzruOfUxPcAKi+/AoeI4I
         uRvWBhI7imRqCuAIio9PkChdZnnG11v68VYu6sMoGeMnY6/qMWn4hM2Brei7+CnDMKHs
         4tuqhl/LceEw8fbmT2Pqf0rzMkpbXNXGWBCIJm9aQ9k4E6HLp6pEsW3d0yypbFNRLaZL
         ZwX4JjUNKJM9nRqnha5kezsXr9Hr7UK4WUHkPSQ9XzTcxwi6gwNdjLXsQyVS82no79Kr
         p2nTcOvGjOxTncQSiaVkC2T5MVf4vfq/Vfe4grmEI8XpMltdhsLBZawFWf3DFrqdbPhL
         Z5ZA==
X-Gm-Message-State: AOJu0YwfiDTVO2JlK5I0Lbpr5ba7b9bIymskjh6vYK9Q/i0hnAyBANUN
	MPTfwBuYLDcrIHXzlNdB55PdvmTQqwL4FP99zm+hEYBF4yDepcg5UNfnLlsYNKDbotZkj1S9IUI
	NZxy+upUAYcjBVNbZufs7Dsu8Sw+DzwmkAAM=
X-Google-Smtp-Source: AGHT+IHsaq8RNSsCYrWFo71sF14XOuhx/NDs7XQwGzWq5ZwbYLuDAvZetCA/zvlME2UZ2SDrIqdIW+IlgwJLXt8EmTY=
X-Received: by 2002:a05:6358:3426:b0:1b5:fde1:d00c with SMTP id
 e5c5f4694b2df-1b8386fd0d8mr1217821055d.25.1725868771331; Mon, 09 Sep 2024
 00:59:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240908101110.1028931-1-sayyad.abid16@gmail.com>
 <20240908101110.1028931-5-sayyad.abid16@gmail.com> <4bc6cfea-ecf4-40ad-a3f6-c32bb411949a@gmail.com>
In-Reply-To: <4bc6cfea-ecf4-40ad-a3f6-c32bb411949a@gmail.com>
From: Sayyad Abid <sayyad.abid16@gmail.com>
Date: Mon, 9 Sep 2024 13:28:56 +0530
Message-ID: <CACVUEBnsHZT_Csmqak3ecg=jBMhAUDvODTF8YiCi6C_8seGJRA@mail.gmail.com>
Subject: Re: [PATCH 4/6] staging: rtl8723bs: fix comment with a trailing */ on
 a separate line
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 1:56=E2=80=AFAM Philipp Hortmann
<philipp.g.hortmann@gmail.com> wrote:
>
> On 9/8/24 12:11, Sayyad Abid wrote:
> > This patch fixes the trailing "*/" on a comment block.
>
> Hi Sayyad,
>
> important is to describe why this patch makes the code better. You
> described in the description just what you did. But that can be seen in
> the changed lines blow.
>
Note, I'll add a descriptive summary of the "why" for the patches.
> Thanks
>
> Bye Philipp
>
> >
> > Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>
> >
> > ---
> >   drivers/staging/rtl8723bs/include/rtw_security.h | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers=
/staging/rtl8723bs/include/rtw_security.h
> > index 4efa2d258ebf..1e5e7f52f8da 100644
> > --- a/drivers/staging/rtl8723bs/include/rtw_security.h
> > +++ b/drivers/staging/rtl8723bs/include/rtw_security.h
> > @@ -240,7 +240,8 @@ struct mic_data {
> >   /* =3D=3D=3D=3D=3D start - public domain SHA256 implementation =3D=3D=
=3D=3D=3D */
> >
> >   /* This is based on SHA256 implementation in LibTomCrypt that was rel=
eased into
> > - * public domain by Tom St Denis. */
> > + * public domain by Tom St Denis.
> > + */
> >
> >   int omac1_aes_128(u8 *key, u8 *data, size_t data_len, u8 *mac);
> >   void rtw_secmicsetkey(struct mic_data *pmicdata, u8 *key);
>
Thank you!

--=20
Abid
