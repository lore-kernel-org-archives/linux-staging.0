Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34776146588
	for <linux-staging@lists.linux.dev>; Mon,  7 Apr 2025 12:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744028807; cv=none; b=miCAPLdPc2TVFs52RdpDiknQFnc0g3RAwoAGxoncMgE/6czPvZ7pb861gIF9tzJjd9Hfe3Gb+4MuSw1MTPIuORfK0OkKHDDbaC2baYsG4Dd5C8MTxggbOMii1lrFN8Pke3icYMH6HysfIXz+SyQ1zymcR2AWqx2JRbC3vtXKNFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744028807; c=relaxed/simple;
	bh=suWDlZjE6ctcOExI78i3ePT+xHDpOdW3uvb+MflX828=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NG28Q2+At/SYeRtONXIb7dyaNM6rJGci9+lQusGkA5KZ2UjNTwqv9JysYPLxLaajKnbZd0R1tmkVLyUL6MFDDD5LETDVgMevI9i6yKWDhve/B+Ntf8C31F3FhRvcZiTg4/9V8y7tsFnXwh+bFyzgijlshIo7MClnwc2O77rKUEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NavMjvck; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NavMjvck"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c08f9d0ef3so244683085a.2
        for <linux-staging@lists.linux.dev>; Mon, 07 Apr 2025 05:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744028805; x=1744633605; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4u5RYrNZsh+9smymDd4urY0c2xmRwtoKbTHADTmKzY=;
        b=NavMjvckwW8ob157/EweS5FJmBXQI4KiCvwS28+Zqr3681JELANd95SWYILqGQdaPZ
         JOED2wA2E4dI/O2CQFt1J4dMuW6ylF3rMUwBEajK3C5wKhM1vbAxfDr8KyJxhtqEh9/P
         mLy/G9xjZupZ6ldZU7jWs8K5H5f2ZSJ+wiO4UVUHyYlhj66M/0ifqhTs0cVFklYp13RD
         rc6wZs8qj0g9xJMCib3UomvXI/foxu2Bar9UCRbXrs3DNN4hKdX6HzPIXaKmA7BDf9GK
         Moh7F9virwVe2c8ID6fhq9DO4vruHt+5IsVFa/q8LJ4sIrWGyP58ryUPjGYRueL/jvrq
         vMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744028805; x=1744633605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4u5RYrNZsh+9smymDd4urY0c2xmRwtoKbTHADTmKzY=;
        b=BwAaglepJyT232pHJ7ff6e556WhiwQUJDkViUwzhvW3ZcqOPYUz5yUKonW2s5ItZDT
         IFJR0F1CdyOidF2nrFF9im9pdocDP5QLoFD4FLR/jQjPy0quhp3ZPrEAPWiWbDSkeVFA
         j9cJUd+ElQQSauWdMXUo/SDcEO0G7AobTKtePTK5vWIYzXKBKsXm3EL2+IyQ3d2++4FU
         1V20ywLjR5YuRl2vo2GP2V4/F3jzk78zHNcwKWLTC7PHTBzq+WV7A0kP4g9mrggWUOTa
         cHawmsBgzYcfjbVRV71a0qovGOOagmxkWKgM7iKd0AmPWRS0hO8XI4p2maqqSk0D0I+S
         JCxw==
X-Forwarded-Encrypted: i=1; AJvYcCV9GcYAFMU9wAxj1Yut7LoIY6fGeaXu8UQ64G9A6prbdFmoATm/3VvUYRqqMl+esNyq/ja53xtQom2fMfRE@lists.linux.dev
X-Gm-Message-State: AOJu0YwvzdqElMpl8BEzr6jgASrTFXuBCgzUEETIZcS3OsBpDCYQLGM7
	8OU+Wrbdp51EbkEKACByz83NlOkpbmdtVsaiY7hfJqXDRlupzPLOol6v+mQIKsowHvcqWmK96p9
	AsI1cebWP1kMyKs3qSY5o1fGUGxw=
X-Gm-Gg: ASbGncvocCwUMr1tamMLqCctTDo2Ru1wkM3zgmb99R0EwwcQ5oSVCZVyP8BqCPpxlH1
	uPgkjmklaChMGFLmMCa77/iHkhBW9yoMR2AZHuvQPtwvBFKRRB4OrW6CPndNKd3GVNBBqg/KO2P
	iSElTcjtABxsrN2A0NzK/Oq0HEUQ93Zs/+ktJyj28nQOi8PwnHe3LzOxeemOpYieeHxvGm
X-Google-Smtp-Source: AGHT+IEGrSORxMMHd21/PqXfGT0C/JWcELX6SedAIkTUNLGAxpmWvnIlmh2k5wd7lyxAyTp7UKt/Cpe5OgEoByWcw44=
X-Received: by 2002:ac8:5743:0:b0:476:8d3d:adb6 with SMTP id
 d75a77b69052e-4792598c12emr164828761cf.23.1744028804904; Mon, 07 Apr 2025
 05:26:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250402135851.13627-1-gshahrouzi@gmail.com> <1a973afd-0ac7-4ba6-8b00-818d1405ebac@xs4all.nl>
In-Reply-To: <1a973afd-0ac7-4ba6-8b00-818d1405ebac@xs4all.nl>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Mon, 7 Apr 2025 08:26:00 -0400
X-Gm-Features: ATxdqUG8RliFIZGd21dQ15vb3wgr08edfBbspy_ARY5Wf9Xx4cPBZE_HIvj4CFY
Message-ID: <CAKUZ0zLoLbM3aN6VC+2kot9YxgHTMf4YuFjNSfL08ydL_+Bz0w@mail.gmail.com>
Subject: Re: [PATCH v4] staging: media: Remove unnecessary braces for single
 statement block
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org, 
	gregkh@linuxfoundation.org, skhan@linuxfoundation.org, 
	kernelmentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 7:23=E2=80=AFAM Hans Verkuil <hverkuil@xs4all.nl> wr=
ote:
>
> On 02/04/2025 15:58, Gabriel Shahrouzi wrote:
> > Remove unnecessary braces in single statement block to comply with kern=
el
> > coding style.
>
> Please add the driver in the subject line. So:
>
> [PATCH v4] staging: media: imx: Remove unnecessary braces for single stat=
ement block
>
> That way it is clear that this is a patch for a specific driver.
Got it. Will send revision.
>
> Regards,
>
>         Hans
>
> >
> > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > ---
> >
> > Changes in v2:
> >       - Add missing author.
> >       - Fix title of email.
> > Changes in v3:
> >         - Resend using git send-email to fix formatting issues in email=
 body.
> > Changes in v4:
> >       - Use correct patch version.
> > ---
> >  drivers/staging/media/imx/imx-media-of.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging=
/media/imx/imx-media-of.c
> > index bb28daa4d713..7413551052ae 100644
> > --- a/drivers/staging/media/imx/imx-media-of.c
> > +++ b/drivers/staging/media/imx/imx-media-of.c
> > @@ -57,9 +57,8 @@ int imx_media_add_of_subdevs(struct imx_media_dev *im=
xmd,
> >               of_node_put(csi_np);
> >               if (ret) {
> >                       /* unavailable or already added is not an error *=
/
> > -                     if (ret =3D=3D -ENODEV || ret =3D=3D -EEXIST) {
> > +                     if (ret =3D=3D -ENODEV || ret =3D=3D -EEXIST)
> >                               continue;
> > -                     }
> >
> >                       /* other error, can't continue */
> >                       return ret;
>
