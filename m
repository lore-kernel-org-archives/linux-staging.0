Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2801E220686;
	Mon,  7 Apr 2025 08:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013280; cv=none; b=GdTuE7AjOha56mGegJrw7uzjAn4oqguPTYNsZE+auZHQkmxllF6gMnduULcVj+XU/7Cr3GaQ3bHxBbhAO0XPkdMMSqhuN7iQQ+KhaUywuStC9g7cvlo07opdIr7dXMDhgqXsioDuDGQITcVIfR3pPXUyxsC1UP1AAZGmC+01LnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013280; c=relaxed/simple;
	bh=gogz4PVRzPA20Uqf+sKIQQE8c5zFtGKlv/D2k+58jaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jTIIWmq/I2usamHiMs/GTVBgkD8xFsoqz9LudppALG2M0aymhEulppnl84kjeHVMCKG2q0pViToB/u8l1OkRCfjlrrh51806FmmPab6x5QZFjaLrubPmdP7w/jHf9t3palbFMFHYh+YTzbbR2JpWkB7SAjWtJ2bZx9HwwKbm4U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djHYr3Xe; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djHYr3Xe"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-52410fb2afeso3557376e0c.3;
        Mon, 07 Apr 2025 01:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744013278; x=1744618078; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZtx3ksAyUS8ikBqruwfd9ba9TI50uTqddTgH9ayLyM=;
        b=djHYr3XeOySwsSYHnaMhk2b8RBTACpm4Vb3qBEjq8esbWQAK5yVIGUeTgifqmrF6Z8
         2qli8eW3PYaPfyAsxRGGm0vhwaioi9bGBxWjvM3JrshO/DnFbX5K60adlSSYECODiqLw
         cg/fyV9AJJm30KJJV7ww7OTdPnpefObaVOtg9pUteciQ0Nihcb5TeIugjHTJlFBee1qC
         QplPe7yhk/ainMl0D4wDXa8plLB/tck0WPvrmVP0kyY/yRPms0latJr8Wo6Xq7yVx7YY
         a+Oxd8Fq7aeZ9Uphq/F7vPM761uQBFf5zvLR/yV30152MOpWpo03lqD7HyN5o2MqRV1z
         sahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744013278; x=1744618078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZtx3ksAyUS8ikBqruwfd9ba9TI50uTqddTgH9ayLyM=;
        b=fg3OIGOBm1w+W8XsEr9SNYeECtmtkq6Zuhi4O+Q7K/+QcnEDjt/d58WVlBV7l+BZTT
         0EuJv6WIael0mbTD5iLv/SJpBOFPOlcHB3nqaus94xEf4Cbf59qJO+7wNm5a3yzRcFsq
         W3ez47sc/zb/Cl+Iu3zSESFVzyoENiCWusKh/Jr54Yk81bg8ON/3ZySdbfpVSz/hmp3V
         WITMUjPxmJUrAFbCM/4TgelXGcRsAaE8CFOn0Ds1uD2PnfTuUeqy/GObuK0ek4mjroha
         bS7MDOcpSQNvXglxquDGsrh+fUZwgPdFFSIl7HO1Cr8DYmS6ZKOtjn91duQy5ZNwbB6j
         AgWA==
X-Forwarded-Encrypted: i=1; AJvYcCU61XlavKtCETBVilEFrtTae9Q0VO3TXKT44B7rHMfYWzO9dC9IlE5zH5uRwFCmrnvc2+s9fVvouu+aAn0S@lists.linux.dev, AJvYcCUOjjbiz3Y1whZdS5Y6rslTDsjP5sMvvUdSKQOO8iEbcEtFrb2oV2+lcEL3fyM3rMhUDc55RSYiyGDO@lists.linux.dev
X-Gm-Message-State: AOJu0YzuyZNtgjAcojTUtXhSiP5KLtS9TlcXklRD0q5WT9u12l3guRIc
	Jkp79i3j4G1XodjguXjqRlSkILIbiveSREFwQfX7o2R+SU2YexcC40biJiTKStrKlVevoz8robF
	+ih8Uplhts3V9gOFpRmMIEkeHa7A=
X-Gm-Gg: ASbGncu5phGA6MEOhxLCDeZFYrBQPYX7bOBFKf5uAlRJaVe+zUAItmlR/HJ/EAVkT0Q
	uVZ4b4Y8QuPOah88mz3yZXtThqtvZQkXw0n7muSDkYUvBWK/CiZIgwnOSNevKdDlQri7iIIzGCU
	Ve3yD8SISmN/j/Tk7RNOaDPZ3QQzE=
X-Google-Smtp-Source: AGHT+IFjWZtJ1uBJ14jW6/1HkSWpM3zygwta8fDHCLQZuIpcJxqqJLqW1sc6Q5WxBvke0mvi1Gfk7C43RJNGvDU7ffU=
X-Received: by 2002:a05:6122:2516:b0:520:6773:e5ba with SMTP id
 71dfb90a1353d-52765c03cd1mr8651372e0c.2.1744013277984; Mon, 07 Apr 2025
 01:07:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z/NxGilPLPy7KSQ3@ubuntu> <0d62aab3-bd51-4739-88a4-9419cca7159a@stanley.mountain>
In-Reply-To: <0d62aab3-bd51-4739-88a4-9419cca7159a@stanley.mountain>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Mon, 7 Apr 2025 09:07:49 +0100
X-Gm-Features: ATxdqUGWQwlFY26Wg3APhFZxKAYxTulMaapf6T8cGRl19pfw5zez2KaKE7FTPOo
Message-ID: <CADYq+fZ0uDxZg2SjqLJfjSY1EG9E16gHRouknqt8k-1HZqfh=A@mail.gmail.com>
Subject: Re: [PATCH v4] staging: rtl8723bs: Use % 4096u instead of & 0xfff
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, julia.lawall@inria.fr, 
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, andy@kernel.org, david.laight.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 8:20=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> On Mon, Apr 07, 2025 at 06:30:50AM +0000, Abraham Samuel Adekunle wrote:
> > The sequence number is constrained to a range of [0, 4095], which
> > is a total of 4096 values. The bitmask operation using `0xfff` is
> > used to perform this wrap-around. While this is functionally correct,
> > it obscures the intended semantic of a 4096-based wrap.
> >
> > Using a modulo operation with `4096u` makes the wrap-around logic
> > explicit and easier to understand. It clearly signals that the sequence
> > number cycles though a range of 4096 values.
> > It also makes the code robust against potential changes of the 4096
> > upper limit, especially when it becomes a non power of 2 value while
> > the AND(&) works solely for power of 2 values.
> >
> > The use of `4096u` also guarantees that the modulo operation is perform=
ed
> > with unsigned arithmetic, preventing potential issues with signed types=
.
> >
> > Suggested-by: Andy Shevchenko <andy@kernel.org>
> > Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
> > ---
> > Changes in v3:
> >       - Added more description to the commit message
> >       - Removed blank line in tag block.
> >       -  Added more patch recipients.
> > Changes in v2:
> >       - Changed the commit message to a more descriptive message which
> >       makes it clear why the patch does the change.
> >       - Changed the subject title to include `4096u` to show that an un=
signed
> >       module is used.
> > Changes in v1:
> >       - Added more patch recipients.
> >
> >  drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/stagin=
g/rtl8723bs/core/rtw_xmit.c
> > index 297c93d65315..f534bf2448c3 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> > @@ -943,7 +943,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *=
hdr, struct pkt_attrib *pattr
> >
> >                       if (psta) {
> >                               psta->sta_xmitpriv.txseq_tid[pattrib->pri=
ority]++;
> > -                             psta->sta_xmitpriv.txseq_tid[pattrib->pri=
ority] &=3D 0xFFF;
> > +                             psta->sta_xmitpriv.txseq_tid[pattrib->pri=
ority] &=3D 4096u;
>
> You forgot to change the & to %.

Thank you very much, Dan. I will correct and resend the patch.

Adekunle
