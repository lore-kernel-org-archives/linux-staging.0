Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6ED15E5AE;
	Wed, 26 Mar 2025 09:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742979631; cv=none; b=CX3rFrtYCM7ASyd1BTcl/u9pwc1dvN7gJA+0mv2VUQum0KBwf9NdgfhR1AfYv0TMwqCAWR8Sncb9EUB9+hFlg8WWXR5VzyN6TB/+IUIPrmAN/aacGwgEgYKYHBmaeSVETYehAthcpfKzy/wQof5WVuSemS0hzwDgfuHe7n/LRsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742979631; c=relaxed/simple;
	bh=iu8rB5v/TCRB4v8pzcOZy2H1O8+0/VMHCUWpamqLeQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KtBDJ0hVtBbd/K1XOYAvlwlNMRk3u1NLV6hNVyeBykRHCC2+xizyTVNnSxqERjxrQubFJ9Awd+YjNHX1Da1WTmp9dSCN4hndRVPsMiGgo1dEbxp/gqKY3nRxxe2DyMJDHt/qv2m/p6cvHheQXQWvzs7BPrQHiGQWTGyvQi4babg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0PJ4qIN; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0PJ4qIN"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5259331b31eso2997285e0c.0;
        Wed, 26 Mar 2025 02:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742979628; x=1743584428; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tb8OnTjsyP5lh3M6/BjJHvWMp8bxQHXc7AdtZ7j6NMg=;
        b=e0PJ4qIN/gWDo0ylQMid3NqL/sg7O5NH4IgG6J8F6t5e+DrpCOSuVsdbghWRnrOtiL
         C8urABO1n1xaZOI1+Z6PBWAG1pBCmXBS04Oa7+1jrQtWyMekboAY0VdP/kyGVgjZdqUW
         x/G0CRYs8k1/E1RRKbJPOSAzvmdgu8kkMeYJX8uhDAdrg9/sOqu7VTO+TAHLB5StpK1Y
         f15wyLieYNLXHh5XngH/cv2od1aox/jG8C2jm9zQtiP9e22ypGX8We9kZYxaj2At4mZq
         EAS/AS50LiuuWI3yyhlm0epHQQ7jorTRDr80uu+XCrleN5vExk4TlEVhetSolPiIIYWC
         5/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742979628; x=1743584428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tb8OnTjsyP5lh3M6/BjJHvWMp8bxQHXc7AdtZ7j6NMg=;
        b=YBU3FMfWTRbCRQmXOgP+xFL3QQvm9kHjpdKMfy9sBRTAuupTGDhBYul9hReM8cZMyP
         kkUe41zql0tpoIgahdlwjXBVLTu8pKb656pYow8Lnli4Vy4NZR7hFVQ0LRikvHou3g9S
         l/qog0h3tJKUEFwY9QT9W+Pi/F0MDKLzaWR5iSL10Vkd1oJWBDJ145gS+7S/OrZBsCoO
         Ap0Q58aRq0930vo0xjXsLh7phqZwJlZD4oRJOSVILoyLbS7E93e+w0kOz+kwrvt5I4v4
         m6jsZzt2bNTf//BSBoC4wvPms1EDsJwMPiSt9kwyEjjvgjp2VG8igGYUzdtqWjQQXGan
         i6iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvjtE6/WtpjoR2sYK9R0wLAQgd6ynrlhysSXHxT5NnGJWuY2fzLBYsRB+0Ci19UDUD/K59D1M+9vMldLIa@lists.linux.dev, AJvYcCX5H5XLShoRifWVMAZ5uzwOPL0WCmvSda9ql3lthbTREYCzX5QrKR8UOCvDDBi2fbHpSksWGG3zPcWD@lists.linux.dev
X-Gm-Message-State: AOJu0YzTjVL9lT9acNoy/SHzFMc0w0knMAf6h8L3jsunkRZX0nPQPNbX
	qhf9RZr3c4EupcbWkJ9cMLP0F50OdzjYjHH9kfkllpNIeKJCk224yfkrOS8JcZQX6yxcFKX4UMU
	D13Iep2HbgSOAMcjtrDrZ3plzAefiZHhT
X-Gm-Gg: ASbGncutVZmdbr9YHFzh5vojYwqfAGY1Y928OsFAAveVH01gzsBvQeZoiH65NclcbHz
	pgH4mO7B6r65tvTEae34fuSzr9829ib2QBzlgj24W2S5DZkkA2tLyWdYU+m3yF3dfBvHYJfW/Xi
	AssS+/LcM9YGSZi4QKyLa+elQzKXxruhctgHe1R/s=
X-Google-Smtp-Source: AGHT+IFHSfRSsBj9i2zkCxfktnsQWFsQ03tWsCWMByvDO1w6GNceB8t5REdbBbHd3bhanrFpcKVmTxTs39qjKm4xfjg=
X-Received: by 2002:a05:6122:3212:b0:523:9ee7:7f8e with SMTP id
 71dfb90a1353d-525a8342034mr16692642e0c.4.1742979628118; Wed, 26 Mar 2025
 02:00:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z+Lan0xeQd3m5ejY@HP-650> <aa42727-6388-cc8-c6e-b9ebc2a63591@inria.fr>
In-Reply-To: <aa42727-6388-cc8-c6e-b9ebc2a63591@inria.fr>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Wed, 26 Mar 2025 10:00:19 +0100
X-Gm-Features: AQ5f1Jp6t1I8p7pqAGoHINgVUZFmmVaQWKVJULMkrgI5KoJooT163QOlp85Xx_M
Message-ID: <CADYq+fYD3LVvBJCYizjG2DR4SMMC+V0Pff0zXKb8rLw2ej0jdg@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: remove braces around single statements
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, outreachy@lists.linux.dev, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 9:26=E2=80=AFAM Julia Lawall <julia.lawall@inria.fr=
> wrote:
>
>
>
> On Tue, 25 Mar 2025, Abraham Samuel Adekunle wrote:
>
> > The code contains braces around single statements in the if blocks
> > which are unnecessary according to the Linux kernel coding style.
> >
> > Remove the braces to improve readability and maintain consistency.
> >
> > Reported by checkpatch:
> >
> > WARNING: braces {} are not necessary for single statement blocks
> >
> > Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/sta=
ging/rtl8723bs/core/rtw_pwrctrl.c
> > index c60e179bb2e1..b17b295e8d3c 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> > @@ -56,9 +56,9 @@ int _ips_leave(struct adapter *padapter)
> >               pwrpriv->ips_leave_cnts++;
> >
> >               result =3D rtw_ips_pwr_up(padapter);
> > -             if (result =3D=3D _SUCCESS) {
> > +             if (result =3D=3D _SUCCESS)
> >                       pwrpriv->rf_pwrstate =3D rf_on;
> > -             }
> > +
>
> I'm not sure you need to add a blank line here?
>
> julia
>

Thank you for your review. I will effect the change
