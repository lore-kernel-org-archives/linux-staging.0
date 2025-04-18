Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA70E20897F
	for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 09:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744969568; cv=none; b=VtKO2rCmq+8AmW3F0Qnct0923/naUM/b7UIzGWxTkP668WU7qiMEU6t+QK6KBGDVoDNM4LVGCyBnSPvD2PBpRGIi23vBSjJrUm27Pj8ashkIitSt5uSzN+pCzav804+9B9yhVo87YuIelxUXgF3dgtURLvr89iq5iOlrm7XukyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744969568; c=relaxed/simple;
	bh=kZYbgKw3ukUo4QCzVMR5VmYsOncMtGLSf1fdEUi9EUE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GpFW94Jz2ez5woEhaBz526M6k4D/8JMJrIvIT3mRUqwH5s11O+lOF8oGXnOIbZ/XAwC4pW6h5CRqBcG2dCp8FrHiRnHwTgE5EGUbqixZYAxe44+ABD7OHzv53KqCZoEswuYSXg+5updIuq15hmG83IKvHKxPBn8lbQShJ+tDbwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XkMIBxiu; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XkMIBxiu"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so14346415e9.1
        for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 02:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744969563; x=1745574363; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kZYbgKw3ukUo4QCzVMR5VmYsOncMtGLSf1fdEUi9EUE=;
        b=XkMIBxiukmkrL9gKNDWuB05tJrW2D2N2VQJBM70IArSv8EE4WcWLVpjixCX4bnny9l
         3hdr9QzXZmpm8HpkrPup68jZX/QDs6FGTkIPrq+Se/tOwlmyS/dXRsilB/0ySxsCKfrW
         3ydqow+fB87SUIAIyYoCuHKv+++pr66fWihz91OTjRHYmDgErvSZjcwrEMflyI/W2Q5W
         i/HncD+2HRzT2qU6CNnQeNPozRkMfjOuURqSfEn7p7ykxoBSqxFKupOASd/H4ncH6hpW
         KGZUclugmcRDIYUpNgIFjz/Zxu4paLiIG6888RewvGvSFjTcfdb202T4fkDePjETNYii
         Ps5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744969563; x=1745574363;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kZYbgKw3ukUo4QCzVMR5VmYsOncMtGLSf1fdEUi9EUE=;
        b=YzLVyTzto7nCi4+dstPlz27OKTpkm5F+Q5wSg0K+10rmdtJtFhuH60+FTlNbgt8SDE
         esWqnw1itGS3dUXwWoB8ZipUbCwcnBhULjJUPxJkO5EMhD+24y9+ph2+hb8rOuJResh8
         s+gcSwvCxOnGeF5S8t+uUjw0Q0H4k3cmpHv/JJSXT9WK7HBSf3WDFQru1q1ZMl8gbGSQ
         fHyLXetPVj95jxYHrkzxqZEcOKfb2kHVstx3CvL51ardtTNx112YGq7Bo4xoJXMiRkJm
         IOqGhxJlfS8PNqNYLuOJZqe9CZNMm+BHP/A+DH3RjbivDYtsaiD9DbrtDXh42poMtymN
         xaTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxdmbcglrWPZMwUaetqteaFfi4RXswStuuK13/VAP98aBBm7B2INF8tPgR0WejgFudfFyWVGVQhc9b5t0a@lists.linux.dev
X-Gm-Message-State: AOJu0YzWgQYSrrIQMfV/EsdbJQSeUsK87Ru+xHid3AwmZhGNQSz43zn7
	D4fzBUjTvn1EaBzngD9bgcBSHVZdtPiT7PgyrUkQXxOazOMjuEmg
X-Gm-Gg: ASbGncuVED47c/TEEqSk93NsvJaiWBdEPObnj1CidtG0nfG2FLAALHqCLwYlYt09iYm
	2ZFDuZtKadA/sJ12il4eNlv7eCvMiekJ4hfLjkGo+DUtWVMYnhiFcnNKpUdObeqroI+ac+YY0pN
	mdBMnefM2KGjvKodYgJvRSCqz5zHe6TNxzlyuadix+0vwnDpljQtwxGLiVfQCPkmCqmUFzi+neP
	z9w48Q+2SkLDA1PLORG6ZMIYOQ88qRwIOnzwelh0+zI8Tzmz94efPouNn9hChlbKBc+lOIIHSE2
	vfFU3HfR+jBthiXu4/mYBPZaKVsnu+GgL41ued1XZ0DIY/zYMzlAWGzShboyS33dG0bSduKoxo6
	MxPvjLI6YVCM5XznRumdjGbiPKA==
X-Google-Smtp-Source: AGHT+IGdwQHN41vKDt7TdqZdCPUhvA/CvukjpsYuLQYJQHGAPy/n5hOLeTb7Ch9Qr25KePDhjhw/MQ==
X-Received: by 2002:a05:600c:4e4c:b0:43c:f470:7605 with SMTP id 5b1f17b1804b1-4406ab99615mr20004245e9.12.1744969562833;
        Fri, 18 Apr 2025 02:46:02 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:56e0:ceba:7da4:6673? ([2001:818:ea56:d000:56e0:ceba:7da4:6673])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa3a1685sm2285627f8f.0.2025.04.18.02.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 02:46:02 -0700 (PDT)
Message-ID: <a32503d98ffe162f48de019fab1a37f86af1666e.camel@gmail.com>
Subject: Re: [PATCH] iio: adc: Revoke valid channel for error path
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com, 
	sonic.zhang@analog.com, vapier@gentoo.org, skhan@linuxfoundation.org, 
	kernelmentees@lists.linuxfoundation.org, stable@vger.kernel.org
Date: Fri, 18 Apr 2025 09:46:23 +0100
In-Reply-To: <CAKUZ0z+FKxHcYTYiGvrZ3RLiMKT1P4gtTdq8d7=+ZFC0RMQzqA@mail.gmail.com>
References: <20250415182038.523186-1-gshahrouzi@gmail.com>
	 <fb712c034eda0d5d711a90a00b6382315fb5f929.camel@gmail.com>
	 <CAKUZ0zL88AyuRxzhoAv2iZO7N7qOMy1G3yKscqG3rQiiOS0gog@mail.gmail.com>
	 <e8b24cf22c87e5b5ce0cc8919eca79f6e60ab6e3.camel@gmail.com>
	 <CAKUZ0z+FKxHcYTYiGvrZ3RLiMKT1P4gtTdq8d7=+ZFC0RMQzqA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2025-04-17 at 13:08 -0400, Gabriel Shahrouzi wrote:
> On Thu, Apr 17, 2025 at 10:02=E2=80=AFAM Nuno S=C3=A1 <noname.nuno@gmail.=
com> wrote:
> >=20
> > On Thu, 2025-04-17 at 08:53 -0400, Gabriel Shahrouzi wrote:
> > > On Thu, Apr 17, 2025 at 6:06=E2=80=AFAM Nuno S=C3=A1 <noname.nuno@gma=
il.com> wrote:
> > > >=20
> > > > On Tue, 2025-04-15 at 14:20 -0400, Gabriel Shahrouzi wrote:
> > > > > According to the datasheet on page 9 under the channel selection =
table,
> > > > > all devices (AD7816/7/8) are able to use the channel marked as 7.=
 This
> > > > > channel is used for diagnostic purposes by routing the internal 1=
.23V
> > > > > bandgap source through the MUX to the input of the ADC.
> > > > >=20
> > > > > Replace checking for string equality with checking for the same c=
hip ID
> > > > > to reduce time complexity.
> > > > >=20
> > > > > Group invalid channels for all devices together because they are
> > > > > processed the same way.
> > > > >=20
> > > > > Fixes: 7924425db04a ("staging: iio: adc: new driver for AD7816 de=
vices")
> > > > > Cc: stable@vger.kernel.org
> > > > > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > > > > ---
> > > > > =C2=A0drivers/staging/iio/adc/ad7816.c | 15 +++++----------
> > > > > =C2=A01 file changed, 5 insertions(+), 10 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/staging/iio/adc/ad7816.c
> > > > > b/drivers/staging/iio/adc/ad7816.c
> > > > > index 6c14d7bcdd675..d880fe0257697 100644
> > > > > --- a/drivers/staging/iio/adc/ad7816.c
> > > > > +++ b/drivers/staging/iio/adc/ad7816.c
> > > > > @@ -186,17 +186,12 @@ static ssize_t ad7816_store_channel(struct =
device
> > > > > *dev,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return ret;
> > > > >=20
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0 if (data > AD7816_CS_MAX && data !=3D A=
D7816_CS_MASK) {
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 dev_err(&chip->spi_dev->dev, "Invalid channel id %lu for
> > > > > %s.\n",
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data, indio_dev->=
name);
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return -EINVAL;
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0 } else if (strcmp(indio_dev->name, "ad7=
818") =3D=3D 0 && data > 1) {
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 dev_err(&chip->spi_dev->dev,
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid channel =
id %lu for ad7818.\n", data);
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return -EINVAL;
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0 } else if (strcmp(indio_dev->name, "ad7=
816") =3D=3D 0 && data > 0) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 if (data !=3D AD7816_CS_MASK &&
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (data > AD7816_=
CS_MAX ||
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (chip->id =3D=
=3D ID_AD7818 && data > 1) ||
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (chip->id =3D=
=3D ID_AD7816 && data > 0))) {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 dev_err(&chip->spi_dev->dev,
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid channel =
id %lu for ad7816.\n", data);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid channel =
id %lu for %s.\n", data, indio_dev-
> > > > > > name);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return -EINVAL;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > >=20
> > > > Hmm, maybe I'm missing something but the code just looks the same a=
s before
> > > > (from a functionality point of view)? I'm really not seeing any fix=
...
> > > I might have to change it for readability. From my understanding, if
> > > channel 7 is selected (AD7816_CS_MASK), it never enters the error pat=
h
> > > whereas in the old code, if the chip were either ad7816 or ad7818, it=
 would
> > > end up returning an error because it skips all channels above either =
0
> > > or 1.
> >=20
> > Ahh, right!
> >=20
> > One good refactor is to add a chip_info struct (renaming the existing o=
ne) with
> > let's say a name and max_channels. Then, the condition could be reduced=
 to:
> >=20
> > if (data > st->chip->max_channel && data !=3D AD7816_CS_MASK {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(...);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > }
> Makes sense. I sent a V2 with the updates. Also included enum
> ad7816_type as a member for chip_info but not sure if it is necessary.
> Renamed the existing one to ad7816_state.
> >=20
> > Being this in staging, I guess we don't care much about having the fix =
as the
> > first patch to make it easier to backport.
> In other words, combining the refactoring and fix into one patch is
> fine but normally they would be split?

Yes, in theory we want to have the fixes first before any refactor because =
we might
want to backport the fix and we do not want to backport more code than need=
ed. Not
totally sure but being this on staging we might not care that much about th=
is.

- Nuno S=C3=A1
>=20
> >=20
> > - Nuno S=C3=A1
> >=20
> > >=20
> > > >=20
> > > > Having said the above, not sure if grouping helps with readability.=
 But I do
> > > > agree with moving from string comparison to use chip->id. And we al=
so have
> > > > redundants 'else'
> > > >=20
> > > > - Nuno S=C3=A1
> > > >=20

