Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDBC146D42
	for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 20:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724357262; cv=none; b=UdynhyY1Kvi5KshklzkrCwLMCcXvmcmSKPkmVZCrb76C0wt6WpmiAQtkZBRoY3wRmaCUWFLgcPIiN6oV85QLRQVjxzC+9z+qV3f+Qvx3J1yahtlaBWbSN/Gcstpu9G150NGkvuVIEAFGFbY4xUwJY+Xs8zAli7t0KrPl6ZHdVdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724357262; c=relaxed/simple;
	bh=peKlo7gpl4NYnwe2qqFXVS4BwQ8f7eb+mFo0rLnk9KM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KIaUxzJXKAYr4+iZtHFofJyZkzwXw0iOdLmOuycYX8cKZSigiXwDycRzCLmufLdRj/EXEqPYgg8AkE0jAwZei6I2rq+Y2I9fb1WizasJEAmmnuxl22/LJxNU7eKAdTHVzdBx7f0rBzis8vDSD0jwsj/bBnFhl7VWlWHWGyxkbyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJzL7qCx; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJzL7qCx"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a8657900fc1so198449366b.1
        for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 13:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724357259; x=1724962059; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hj/ZdRQ/J0SSt5Cm7vp1LinY2Js02ustAamTE4OUfqM=;
        b=OJzL7qCxtvhQikZZEO5sacT+HkrSSxq8nr0f084tzLIGp+ZC98vafP1rnWrtdUkDqt
         1lVrYkaKFcWWpOjAsfhYQ+rh+6IPGr3t2xUDGSdUiF6UTz4mee3BFqwXQPNAxoIWPJ2M
         5kHKRE7+ii7M8y1xCbwHocgLrEFhyecEFbCDGzdzM/rtwfoN4OPFY8raf11EOsF4elom
         O/opvTtQ4nHzsbDGJN8jGeICREMVDrJAI3rVc4l21FK272wL8EssKxja5OnCqZvCJi5v
         zxmoxZhArWLAzT2BU+/bJRcOvlv+A9zfAZHl5eheco1NI//lpUUQk/bLXCDnuc1G2SLw
         sNwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724357259; x=1724962059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hj/ZdRQ/J0SSt5Cm7vp1LinY2Js02ustAamTE4OUfqM=;
        b=QwlCQmVchn/h1Vpb8+mbnyg9q3+RVrGcA3nuWNaoCj+VZA3In17AwvGmEIKArD+JfR
         ORxwixzmx6kcPyQ/2CZkXj4uZbyXwFvgcyDtMdLBQGdZ/TajfC4zVv2bMbtzmQL5SVQn
         +sNoRgWDFWfZw+IEbKxWJ1db6usj2GhCef/Sy28Di6tH8BKDUAfZSQ3XnKqpUxJZAF4W
         8OL6jBrejAbkIZAAttC8Hi6i5uX5tLk3JP4ud6X6g92AcxhReB1YSLk3tPJyZFInGr2y
         gLFhnfm8GW8ZbIgolVEyU4HSZG5AyzXuHEklWfHoHpvtx/63rvFsu6pWosS4a4UCVqWE
         cJdA==
X-Gm-Message-State: AOJu0YwQVHGcBzTdUwrgJw9EBrfQhXl6it7+iwXHky7dV7erLOsBbRjx
	uYxGHzscqhyLNsxo2qmFdwNYCb95+RkdreeT+oJeFtrZeQOZ3W/deH5msMAhoeLA2Y/28LIuPT5
	ZO8ubxuGpJfnIFkVG8U8fcAS/4N4=
X-Google-Smtp-Source: AGHT+IEtd+J6UD1t+3RLE4kEBCangLZO8xgacqf05I1XcVlXh5AXH2uUcxNbMB8IOUoFhdWW11jGIgN/N6BcTLy45iY=
X-Received: by 2002:a17:906:c10a:b0:a86:7199:af37 with SMTP id
 a640c23a62f3a-a8691cb9768mr182051766b.58.1724357258405; Thu, 22 Aug 2024
 13:07:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240822003043.10865-1-anachan.01h@gmail.com> <2024082207-enunciate-whacky-e1c4@gregkh>
In-Reply-To: <2024082207-enunciate-whacky-e1c4@gregkh>
From: "Ana Carolina H." <anachan.01h@gmail.com>
Date: Thu, 22 Aug 2024 17:07:27 -0300
Message-ID: <CACRD3dDMVn+WoeKV20PCi4ebwY07u4gv=ULKMSrB6eTWAgupHQ@mail.gmail.com>
Subject: Re: [PATCH] Staging: rtl8192e: Fix arguments alignment
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 4:53=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Aug 21, 2024 at 09:30:43PM -0300, Ana Carolina Hernandes wrote:
> > Fix the alignment of arguments in function _rtl92e_query_rxphystatus in
> > order to silence the following checkpatch warning:
> >
> > CHECK: Lines should not end with a '('
> >
> > Signed-off-by: Ana Carolina Hernandes <anachan.01h@gmail.com>
> > ---
> >  .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 19 +++++++++----------
> >  1 file changed, 9 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/s=
taging/rtl8192e/rtl8192e/r8192E_dev.c
> > index b3d4b3394284..bca6e4f57bf2 100644
> > --- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> > +++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> > @@ -1145,16 +1145,15 @@ static long _rtl92e_signal_scale_mapping(struct=
 r8192_priv *priv, long currsig)
> >                       _pdrvinfo->RxRate =3D=3D DESC90_RATE11M) &&\
> >                       !_pdrvinfo->RxHT)
> >
> > -static void _rtl92e_query_rxphystatus(
> > -     struct r8192_priv *priv,
> > -     struct rtllib_rx_stats *pstats,
> > -     struct rx_desc  *pdesc,
> > -     struct rx_fwinfo   *pdrvinfo,
> > -     struct rtllib_rx_stats *precord_stats,
> > -     bool bpacket_match_bssid,
> > -     bool bpacket_toself,
> > -     bool bPacketBeacon,
> > -     bool bToSelfBA
> > +static void _rtl92e_query_rxphystatus(struct r8192_priv *priv,
> > +                                   struct rtllib_rx_stats *pstats,
> > +                                   struct rx_desc  *pdesc,
> > +                                   struct rx_fwinfo   *pdrvinfo,
> > +                                   struct rtllib_rx_stats *precord_sta=
ts,
> > +                                   bool bpacket_match_bssid,
> > +                                   bool bpacket_toself,
> > +                                   bool bPacketBeacon,
> > +                                   bool bToSelfBA
> >       )
>
> So close, why leave the ")" on the line all by itself there?  It needs
> to go up one line, didn't checkpatch tell you that when you ran it on
> this change?
>
> thanks,
>
> greg k-h

Checkpatch didn't warn me about the ")", but I will fix it too.

Thanks,
Ana Carolina Hernandes
